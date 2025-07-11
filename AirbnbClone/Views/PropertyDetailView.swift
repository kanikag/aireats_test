import SwiftUI

struct PropertyDetailView: View {
    let property: Property
    @State private var showingBooking = false
    @State private var currentImageIndex = 0
    @State private var showingAllPhotos = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Property Images
                imageSection
                
                // Property Info
                propertyInfoSection
                
                // Host Info
                hostSection
                
                // Amenities
                amenitiesSection
                
                // Reviews
                reviewsSection
                
                // Location
                locationSection
                
                Spacer(minLength: 100)
            }
            .padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
        .overlay(alignment: .bottom) {
            bookingBar
        }
        .sheet(isPresented: $showingBooking) {
            BookingView(property: property)
        }
        .sheet(isPresented: $showingAllPhotos) {
            PhotoGalleryView(property: property)
        }
    }
    
    private var imageSection: some View {
        VStack(spacing: 12) {
            // Main Image
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 300)
                    .cornerRadius(12)
                
                Image(systemName: "photo")
                    .font(.system(size: 60))
                    .foregroundColor(.gray)
                
                // Show All Photos Button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button("Show all photos") {
                            showingAllPhotos = true
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.black.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
                .padding()
            }
            
            // Thumbnail Images
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(0..<4) { index in
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 80, height: 80)
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    private var propertyInfoSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text(property.title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(property.location)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("\(property.rating, specifier: "%.1f")")
                        .fontWeight(.medium)
                    
                    Text("(\(property.reviewCount) reviews)")
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(property.propertyType.rawValue) hosted by \(property.host.name)")
                    .font(.headline)
                
                Text("\(property.maxGuests) guests · \(property.bedrooms) bedrooms · \(property.bathrooms) bathrooms")
                    .foregroundColor(.gray)
            }
            
            Divider()
            
            Text(property.description)
                .font(.body)
                .lineLimit(4)
        }
    }
    
    private var hostSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 50, height: 50)
                    .overlay(
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(property.host.name)
                            .font(.headline)
                        
                        if property.host.isSuperhost {
                            Text("Superhost")
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.pink.opacity(0.2))
                                .cornerRadius(4)
                        }
                    }
                    
                    Text("Joined \(property.host.joinDate, formatter: DateFormatter.year)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button("Contact Host") {
                    // Contact host action
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("\(property.host.responseRate)% response rate")
                    Spacer()
                    Text("Responds \(property.host.responseTime)")
                }
                .font(.caption)
                .foregroundColor(.gray)
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
                ForEach(property.amenities.prefix(6), id: \.self) { amenity in
                    HStack {
                        Image(systemName: amenityIcon(for: amenity))
                            .foregroundColor(.pink)
                        
                        Text(amenity)
                            .font(.subheadline)
                        
                        Spacer()
                    }
                }
            }
            
            if property.amenities.count > 6 {
                Button("Show all \(property.amenities.count) amenities") {
                    // Show all amenities
                }
                .foregroundColor(.black)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 1)
                )
            }
        }
    }
    
    private var reviewsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Reviews")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("\(property.rating, specifier: "%.1f")")
                        .fontWeight(.medium)
                    
                    Text("(\(property.reviewCount))")
                        .foregroundColor(.gray)
                }
            }
            
            // Sample reviews
            VStack(spacing: 16) {
                ForEach(0..<2) { _ in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 40, height: 40)
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("John Doe")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                
                                Text("December 2023")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            HStack {
                                ForEach(0..<5) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .font(.caption)
                                }
                            }
                        }
                        
                        Text("Amazing place! The view was incredible and the host was very responsive. Would definitely stay again.")
                            .font(.body)
                            .lineLimit(3)
                    }
                    .padding(.bottom, 8)
                }
            }
            
            Button("Show all \(property.reviewCount) reviews") {
                // Show all reviews
            }
            .foregroundColor(.black)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 1)
            )
        }
    }
    
    private var locationSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Location")
                .font(.title3)
                .fontWeight(.bold)
            
            Text(property.location)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            // Map placeholder
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 200)
                .cornerRadius(12)
                .overlay(
                    Image(systemName: "map")
                        .font(.system(size: 40))
                        .foregroundColor(.gray)
                )
        }
    }
    
    private var bookingBar: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 1)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("$\(property.price)")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text("night")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
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
                }
                
                Spacer()
                
                Button("Reserve") {
                    showingBooking = true
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(Color.pink)
                .cornerRadius(8)
            }
            .padding()
            .background(Color.white)
        }
    }
    
    private func amenityIcon(for amenity: String) -> String {
        switch amenity.lowercased() {
        case "wifi": return "wifi"
        case "pool": return "figure.pool.swim"
        case "kitchen": return "cooktop"
        case "parking": return "car"
        case "air conditioning": return "fan"
        case "hot tub": return "drop.fill"
        case "fireplace": return "flame"
        case "gym": return "dumbbell"
        case "balcony": return "building.2"
        case "workspace": return "desktopcomputer"
        case "spa": return "leaf"
        default: return "checkmark.circle"
        }
    }
}

extension DateFormatter {
    static let year: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
}

#Preview {
    NavigationView {
        PropertyDetailView(property: MockData.properties[0])
    }
}