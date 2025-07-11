import SwiftUI

struct PropertyCard: View {
    let property: Property
    @State private var currentImageIndex = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Property Images
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .aspectRatio(1, contentMode: .fit)
                    .cornerRadius(12)
                
                // Placeholder for images
                Image(systemName: "photo")
                    .font(.system(size: 40))
                    .foregroundColor(.gray)
                
                // Favorite Button
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            // Toggle favorite
                        }) {
                            Image(systemName: "heart")
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.black.opacity(0.6))
                                .clipShape(Circle())
                        }
                    }
                    Spacer()
                }
                .padding(8)
            }
            
            // Property Details
            VStack(alignment: .leading, spacing: 4) {
                Text(property.location)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text(property.title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .lineLimit(2)
                
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
                
                HStack {
                    Text("$\(property.price)")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text("night")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct FeaturedPropertyCard: View {
    let property: Property
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Property Image
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 280, height: 200)
                    .cornerRadius(12)
                
                // Placeholder for image
                Image(systemName: "photo")
                    .font(.system(size: 50))
                    .foregroundColor(.gray)
            }
            
            // Property Details
            VStack(alignment: .leading, spacing: 4) {
                Text(property.location)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text(property.title)
                    .font(.headline)
                    .fontWeight(.medium)
                    .lineLimit(2)
                
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
                    
                    Spacer()
                    
                    Text("$\(property.price)/night")
                        .font(.headline)
                        .fontWeight(.bold)
                }
            }
            .frame(width: 280, alignment: .leading)
        }
    }
}

#Preview {
    PropertyCard(property: MockData.properties[0])
        .frame(width: 180)
}