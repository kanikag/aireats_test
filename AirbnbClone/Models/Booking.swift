import Foundation

struct Booking: Identifiable, Codable {
    let id = UUID()
    let propertyId: UUID
    let userId: UUID
    let checkIn: Date
    let checkOut: Date
    let guests: Int
    let totalPrice: Int
    let status: BookingStatus
    let createdAt: Date
    let property: Property
    
    enum BookingStatus: String, Codable, CaseIterable {
        case pending = "Pending"
        case confirmed = "Confirmed"
        case cancelled = "Cancelled"
        case completed = "Completed"
    }
    
    var nights: Int {
        Calendar.current.dateComponents([.day], from: checkIn, to: checkOut).day ?? 0
    }
}