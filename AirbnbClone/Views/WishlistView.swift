import SwiftUI

struct WishlistView: View {
    @State private var savedProperties: [Property] = []
    @State private var showingCreateList = false
    
    var body: some View {
        NavigationView {
            if savedProperties.isEmpty {
                emptyState
            } else {
                wishlistContent
            }
        }
    }
    
    private var emptyState: some View {
        VStack(spacing: 24) {
            Image(systemName: "heart")
                .font(.system(size: 80))
                .foregroundColor(.gray)
            
            VStack(spacing: 16) {
                Text("No wishlists yet")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Create your first wishlist to save your favorite places")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
            
            Button("Create your first wishlist") {
                showingCreateList = true
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(Color.pink)
            .cornerRadius(8)
        }
        .padding()
        .navigationTitle("Wishlists")
        .sheet(isPresented: $showingCreateList) {
            CreateWishlistView()
        }
    }
    
    private var wishlistContent: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(savedProperties) { property in
                    NavigationLink(destination: PropertyDetailView(property: property)) {
                        WishlistPropertyCard(property: property)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
        .navigationTitle("Wishlists")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Add") {
                    showingCreateList = true
                }
            }
        }
        .sheet(isPresented: $showingCreateList) {
            CreateWishlistView()
        }
    }
}

struct WishlistPropertyCard: View {
    let property: Property
    
    var body: some View {
        HStack(spacing: 12) {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 120, height: 120)
                .cornerRadius(8)
                .overlay(
                    Image(systemName: "photo")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                )
            
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
                    
                    Button(action: {
                        // Remove from wishlist
                    }) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.pink)
                    }
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

struct CreateWishlistView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var listName = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                VStack(spacing: 16) {
                    Text("Create Wishlist")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Give your wishlist a name that will help you remember the places you want to visit.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Name")
                        .font(.headline)
                    
                    TextField("My Wishlist", text: $listName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Spacer()
                
                Button("Create") {
                    // Create wishlist logic
                    dismiss()
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(listName.isEmpty ? Color.gray : Color.pink)
                .cornerRadius(8)
                .disabled(listName.isEmpty)
            }
            .padding()
            .navigationTitle("New Wishlist")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    WishlistView()
}