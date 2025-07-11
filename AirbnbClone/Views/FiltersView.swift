import SwiftUI

struct FiltersView: View {
    @EnvironmentObject var propertyViewModel: PropertyViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Price Range
                    priceRangeSection
                    
                    Divider()
                    
                    // Property Type
                    propertyTypeSection
                    
                    Divider()
                    
                    // Rating
                    ratingSection
                    
                    Divider()
                    
                    // Amenities
                    amenitiesSection
                }
                .padding()
            }
            .navigationTitle("Filters")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Clear All") {
                        propertyViewModel.resetFilters()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private var priceRangeSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Price Range")
                .font(.title3)
                .fontWeight(.bold)
            
            VStack(spacing: 8) {
                HStack {
                    Text("$\(Int(propertyViewModel.priceRange.lowerBound))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("$\(Int(propertyViewModel.priceRange.upperBound))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                // Custom range slider would go here
                // For now, using a simple slider
                VStack {
                    Slider(value: Binding(
                        get: { propertyViewModel.priceRange.upperBound },
                        set: { newValue in
                            propertyViewModel.priceRange = propertyViewModel.priceRange.lowerBound...newValue
                        }
                    ), in: 0...1000, step: 10)
                    .accentColor(.pink)
                }
            }
        }
    }
    
    private var propertyTypeSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Property Type")
                .font(.title3)
                .fontWeight(.bold)
            
            VStack(spacing: 8) {
                ForEach(Property.PropertyType.allCases, id: \.self) { type in
                    Button(action: {
                        if propertyViewModel.selectedPropertyType == type {
                            propertyViewModel.selectedPropertyType = nil
                        } else {
                            propertyViewModel.selectedPropertyType = type
                        }
                    }) {
                        HStack {
                            Image(systemName: propertyViewModel.selectedPropertyType == type ? 
                                  "checkmark.circle.fill" : "circle")
                                .foregroundColor(propertyViewModel.selectedPropertyType == type ? 
                                               .pink : .gray)
                            
                            Text(type.rawValue)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                            
                            Spacer()
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
        }
    }
    
    private var ratingSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Minimum Rating")
                .font(.title3)
                .fontWeight(.bold)
            
            VStack(spacing: 8) {
                HStack {
                    Text("Any")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    HStack {
                        ForEach(0..<5) { index in
                            Image(systemName: index < Int(propertyViewModel.minRating) ? 
                                  "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .font(.caption)
                        }
                    }
                }
                
                Slider(value: $propertyViewModel.minRating, in: 0...5, step: 0.5)
                    .accentColor(.pink)
            }
        }
    }
    
    private var amenitiesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Amenities")
                .font(.title3)
                .fontWeight(.bold)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 12) {
                ForEach(MockData.commonAmenities, id: \.self) { amenity in
                    Button(action: {
                        if propertyViewModel.selectedAmenities.contains(amenity) {
                            propertyViewModel.selectedAmenities.remove(amenity)
                        } else {
                            propertyViewModel.selectedAmenities.insert(amenity)
                        }
                    }) {
                        HStack {
                            Image(systemName: propertyViewModel.selectedAmenities.contains(amenity) ? 
                                  "checkmark.square.fill" : "square")
                                .foregroundColor(propertyViewModel.selectedAmenities.contains(amenity) ? 
                                               .pink : .gray)
                            
                            Text(amenity)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                            
                            Spacer()
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
        }
    }
}

#Preview {
    FiltersView()
        .environmentObject(PropertyViewModel())
}