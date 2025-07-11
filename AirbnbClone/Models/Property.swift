import Foundation

struct Property: Identifiable, Codable {
    let id = UUID()
    let title: String
    let location: String
    let price: Int
    let rating: Double
    let reviewCount: Int
    let images: [String]
    let description: String
    let amenities: [String]
    let host: Host
    let coordinates: Coordinates
    let propertyType: PropertyType
    let maxGuests: Int
    let bedrooms: Int
    let bathrooms: Int
    let availableDates: [Date]
    
    enum PropertyType: String, CaseIterable, Codable {
        case entire = "Entire place"
        case private = "Private room"
        case shared = "Shared room"
        case hotel = "Hotel room"
    }
}

struct Host: Codable {
    let name: String
    let profileImage: String
    let isSuperhost: Bool
    let joinDate: Date
    let responseRate: Int
    let responseTime: String
}

struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
}