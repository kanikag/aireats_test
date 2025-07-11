import SwiftUI

struct SearchView: View {
    @EnvironmentObject var propertyViewModel: PropertyViewModel
    @State private var showingFilters = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Search Bar
                searchBar
                
                // Quick Filters
                quickFilters
                
                // Results
                resultsList
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Filters") {
                        showingFilters = true
                    }
                }
            }
        }
        .sheet(isPresented: $showingFilters) {
            FiltersView()
        }
    }
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search destinations", text: $propertyViewModel.searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if !propertyViewModel.searchText.isEmpty {
                Button(action: {
                    propertyViewModel.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
    }
    
    private var quickFilters: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(Property.PropertyType.allCases, id: \.self) { type in
                    Button(action: {
                        if propertyViewModel.selectedPropertyType == type {
                            propertyViewModel.selectedPropertyType = nil
                        } else {
                            propertyViewModel.selectedPropertyType = type
                        }
                    }) {
                        Text(type.rawValue)
                            .font(.subheadline)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                propertyViewModel.selectedPropertyType == type ? 
                                Color.pink : Color.gray.opacity(0.2)
                            )
                            .foregroundColor(
                                propertyViewModel.selectedPropertyType == type ? 
                                .white : .black
                            )
                            .cornerRadius(20)
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 8)
    }
    
    private var resultsList: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(propertyViewModel.filteredProperties) { property in
                    NavigationLink(destination: PropertyDetailView(property: property)) {
                        SearchResultCard(property: property)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
    }
}

struct SearchResultCard: View {
    let property: Property
    
    var body: some View {
        HStack(spacing: 12) {
            // Property Image
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 120, height: 120)
                .cornerRadius(8)
                .overlay(
                    Image(systemName: "photo")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                )
            
            // Property Details
            VStack(alignment: .leading, spacing: 8) {
                Text(property.title)
                    .font(.headline)
                    .lineLimit(2)
                
                Text(property.location)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    
                    Text("\(property.rating, specifier: "%.1f")")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text("(\(property.reviewCount))")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                HStack {
                    Text("$\(property.price)")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text("night")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
            }
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    SearchView()
        .environmentObject(PropertyViewModel())
}