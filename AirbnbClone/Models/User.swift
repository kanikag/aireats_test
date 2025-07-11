import Foundation

struct User: Identifiable, Codable {
    let id = UUID()
    let name: String
    let email: String
    let profileImage: String
    let joinDate: Date
    let verifications: [Verification]
    let about: String
    let languages: [String]
    let reviewsReceived: [Review]
    let reviewsGiven: [Review]
    
    enum Verification: String, Codable, CaseIterable {
        case email = "Email"
        case phone = "Phone"
        case identity = "Identity"
        case work = "Work"
        case facebook = "Facebook"
        case google = "Google"
    }
}

struct Review: Identifiable, Codable {
    let id = UUID()
    let userId: UUID
    let propertyId: UUID
    let rating: Int
    let comment: String
    let date: Date
    let userName: String
    let userImage: String
}