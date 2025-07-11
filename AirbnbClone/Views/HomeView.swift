import SwiftUI

struct HomeView: View {
    @EnvironmentObject var propertyViewModel: PropertyViewModel
    @State private var showingFilters = false
    @State private var selectedDestination = ""
    @State private var checkInDate = Date()
    @State private var checkOutDate = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    @State private var guests = 1
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Search Header
                    searchHeader
                    
                    // Featured Properties
                    featuredSection
                    
                    // All Properties
                    allPropertiesSection
                }
                .padding(.horizontal)
            }
            .navigationTitle("Airbnb")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingFilters = true
                    }) {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .sheet(isPresented: $showingFilters) {
            FiltersView()
        }
    }
    
    private var searchHeader: some View {
        VStack(spacing: 16) {
            // Destination Search
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Where to?", text: $selectedDestination)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            // Date and Guest Selection
            HStack {
                // Check-in
                VStack(alignment: .leading) {
                    Text("Check-in")
                        .font(.caption)
                        .foregroundColor(.gray)
                    DatePicker("", selection: $checkInDate, displayedComponents: .date)
                        .labelsHidden()
                        .datePickerStyle(CompactDatePickerStyle())
                }
                
                Spacer()
                
                // Check-out
                VStack(alignment: .leading) {
                    Text("Check-out")
                        .font(.caption)
                        .foregroundColor(.gray)
                    DatePicker("", selection: $checkOutDate, displayedComponents: .date)
                        .labelsHidden()
                        .datePickerStyle(CompactDatePickerStyle())
                }
                
                Spacer()
                
                // Guests
                VStack(alignment: .leading) {
                    Text("Guests")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Stepper(value: $guests, in: 1...16) {
                        Text("\(guests)")
                    }
                    .labelsHidden()
                }
            }
            
            // Search Button
            Button(action: {
                // Implement search logic
            }) {
                Text("Search")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
    }
    
    private var featuredSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Featured")
                .font(.title2)
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(propertyViewModel.properties.prefix(3)) { property in
                        NavigationLink(destination: PropertyDetailView(property: property)) {
                            FeaturedPropertyCard(property: property)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    private var allPropertiesSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("All Properties")
                .font(.title2)
                .fontWeight(.bold)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 15) {
                ForEach(propertyViewModel.filteredProperties) { property in
                    NavigationLink(destination: PropertyDetailView(property: property)) {
                        PropertyCard(property: property)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}