import Foundation

struct MockData {
    static let properties: [Property] = [
        Property(
            title: "Stunning Oceanfront Villa",
            location: "Malibu, California",
            price: 450,
            rating: 4.9,
            reviewCount: 127,
            images: ["villa1", "villa2", "villa3", "villa4"],
            description: "Wake up to breathtaking ocean views in this luxury villa. Features include a private pool, chef's kitchen, and direct beach access. Perfect for romantic getaways or family vacations.",
            amenities: ["WiFi", "Pool", "Beach Access", "Kitchen", "Parking", "Air Conditioning", "Hot Tub"],
            host: Host(
                name: "Sarah Johnson",
                profileImage: "host1",
                isSuperhost: true,
                joinDate: Calendar.current.date(byAdding: .year, value: -3, to: Date())!,
                responseRate: 98,
                responseTime: "within an hour"
            ),
            coordinates: Coordinates(latitude: 34.0259, longitude: -118.7798),
            propertyType: .entire,
            maxGuests: 8,
            bedrooms: 4,
            bathrooms: 3,
            availableDates: generateAvailableDates()
        ),
        Property(
            title: "Cozy Downtown Loft",
            location: "New York, New York",
            price: 185,
            rating: 4.7,
            reviewCount: 89,
            images: ["loft1", "loft2", "loft3"],
            description: "Modern loft in the heart of Manhattan. Walking distance to subway, restaurants, and attractions. Industrial design meets comfort.",
            amenities: ["WiFi", "Kitchen", "Gym", "Workspace", "Air Conditioning"],
            host: Host(
                name: "Mike Chen",
                profileImage: "host2",
                isSuperhost: false,
                joinDate: Calendar.current.date(byAdding: .year, value: -2, to: Date())!,
                responseRate: 87,
                responseTime: "within a few hours"
            ),
            coordinates: Coordinates(latitude: 40.7128, longitude: -74.0060),
            propertyType: .entire,
            maxGuests: 4,
            bedrooms: 2,
            bathrooms: 1,
            availableDates: generateAvailableDates()
        ),
        Property(
            title: "Mountain Cabin Retreat",
            location: "Aspen, Colorado",
            price: 320,
            rating: 4.8,
            reviewCount: 156,
            images: ["cabin1", "cabin2", "cabin3", "cabin4"],
            description: "Escape to this charming mountain cabin surrounded by nature. Features fireplace, hot tub, and stunning mountain views. Perfect for skiing or summer hiking.",
            amenities: ["WiFi", "Fireplace", "Hot Tub", "Kitchen", "Parking", "Ski Storage", "Mountain Views"],
            host: Host(
                name: "Jessica Williams",
                profileImage: "host3",
                isSuperhost: true,
                joinDate: Calendar.current.date(byAdding: .year, value: -5, to: Date())!,
                responseRate: 99,
                responseTime: "within an hour"
            ),
            coordinates: Coordinates(latitude: 39.1911, longitude: -106.8175),
            propertyType: .entire,
            maxGuests: 6,
            bedrooms: 3,
            bathrooms: 2,
            availableDates: generateAvailableDates()
        ),
        Property(
            title: "Beachfront Apartment",
            location: "Miami Beach, Florida",
            price: 275,
            rating: 4.6,
            reviewCount: 203,
            images: ["beach1", "beach2", "beach3"],
            description: "Stylish beachfront apartment with panoramic ocean views. Steps from South Beach nightlife and restaurants. Modern amenities and luxury finishes.",
            amenities: ["WiFi", "Beach Access", "Pool", "Gym", "Balcony", "Air Conditioning", "Kitchen"],
            host: Host(
                name: "Carlos Rodriguez",
                profileImage: "host4",
                isSuperhost: true,
                joinDate: Calendar.current.date(byAdding: .year, value: -4, to: Date())!,
                responseRate: 95,
                responseTime: "within an hour"
            ),
            coordinates: Coordinates(latitude: 25.7617, longitude: -80.1918),
            propertyType: .entire,
            maxGuests: 5,
            bedrooms: 2,
            bathrooms: 2,
            availableDates: generateAvailableDates()
        ),
        Property(
            title: "Historic Brownstone",
            location: "Boston, Massachusetts",
            price: 195,
            rating: 4.5,
            reviewCount: 67,
            images: ["brownstone1", "brownstone2", "brownstone3"],
            description: "Charming historic brownstone in Back Bay. Original hardwood floors, exposed brick, and modern updates. Walking distance to Common and shopping.",
            amenities: ["WiFi", "Kitchen", "Parking", "Workspace", "Historic Character"],
            host: Host(
                name: "Emily Davis",
                profileImage: "host5",
                isSuperhost: false,
                joinDate: Calendar.current.date(byAdding: .year, value: -1, to: Date())!,
                responseRate: 82,
                responseTime: "within a day"
            ),
            coordinates: Coordinates(latitude: 42.3601, longitude: -71.0589),
            propertyType: .entire,
            maxGuests: 4,
            bedrooms: 2,
            bathrooms: 1,
            availableDates: generateAvailableDates()
        ),
        Property(
            title: "Desert Oasis",
            location: "Scottsdale, Arizona",
            price: 380,
            rating: 4.9,
            reviewCount: 94,
            images: ["desert1", "desert2", "desert3", "desert4"],
            description: "Luxurious desert retreat with infinity pool and spa. Stunning sunset views over the Sonoran Desert. Perfect for relaxation and rejuvenation.",
            amenities: ["WiFi", "Pool", "Spa", "Kitchen", "Parking", "Air Conditioning", "Desert Views", "Outdoor Shower"],
            host: Host(
                name: "David Thompson",
                profileImage: "host6",
                isSuperhost: true,
                joinDate: Calendar.current.date(byAdding: .year, value: -6, to: Date())!,
                responseRate: 99,
                responseTime: "within an hour"
            ),
            coordinates: Coordinates(latitude: 33.4734, longitude: -111.9010),
            propertyType: .entire,
            maxGuests: 6,
            bedrooms: 3,
            bathrooms: 3,
            availableDates: generateAvailableDates()
        )
    ]
    
    static let commonAmenities = [
        "WiFi", "Kitchen", "Parking", "Air Conditioning", "Pool", "Hot Tub", 
        "Gym", "Beach Access", "Fireplace", "Balcony", "Workspace", "Spa"
    ]
    
    private static func generateAvailableDates() -> [Date] {
        var dates: [Date] = []
        let calendar = Calendar.current
        let today = Date()
        
        for i in 0..<365 {
            if let date = calendar.date(byAdding: .day, value: i, to: today) {
                // Randomly make some dates available (70% availability)
                if Int.random(in: 1...10) <= 7 {
                    dates.append(date)
                }
            }
        }
        
        return dates
    }
}