import Foundation
import Combine

class PropertyViewModel: ObservableObject {
    @Published var properties: [Property] = []
    @Published var filteredProperties: [Property] = []
    @Published var searchText: String = ""
    @Published var selectedLocation: String = ""
    @Published var priceRange: ClosedRange<Double> = 0...1000
    @Published var selectedPropertyType: Property.PropertyType?
    @Published var minRating: Double = 0
    @Published var selectedAmenities: Set<String> = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadMockData()
        setupSearch()
    }
    
    private func setupSearch() {
        $searchText
            .combineLatest($selectedLocation, $priceRange, $selectedPropertyType, $minRating, $selectedAmenities)
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .sink { [weak self] _ in
                self?.filterProperties()
            }
            .store(in: &cancellables)
    }
    
    private func filterProperties() {
        filteredProperties = properties.filter { property in
            let matchesSearch = searchText.isEmpty || 
                property.title.localizedCaseInsensitiveContains(searchText) ||
                property.location.localizedCaseInsensitiveContains(searchText)
            
            let matchesLocation = selectedLocation.isEmpty || 
                property.location.localizedCaseInsensitiveContains(selectedLocation)
            
            let matchesPrice = Double(property.price) >= priceRange.lowerBound && 
                Double(property.price) <= priceRange.upperBound
            
            let matchesType = selectedPropertyType == nil || 
                property.propertyType == selectedPropertyType
            
            let matchesRating = property.rating >= minRating
            
            let matchesAmenities = selectedAmenities.isEmpty || 
                selectedAmenities.allSatisfy { amenity in
                    property.amenities.contains(amenity)
                }
            
            return matchesSearch && matchesLocation && matchesPrice && matchesType && matchesRating && matchesAmenities
        }
    }
    
    private func loadMockData() {
        properties = MockData.properties
        filteredProperties = properties
    }
    
    func resetFilters() {
        searchText = ""
        selectedLocation = ""
        priceRange = 0...1000
        selectedPropertyType = nil
        minRating = 0
        selectedAmenities = []
    }
}