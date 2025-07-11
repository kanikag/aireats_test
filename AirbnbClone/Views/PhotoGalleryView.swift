import SwiftUI

struct PhotoGalleryView: View {
    let property: Property
    @Environment(\.dismiss) private var dismiss
    @State private var currentIndex = 0
    
    var body: some View {
        NavigationView {
            TabView(selection: $currentIndex) {
                ForEach(0..<property.images.count, id: \.self) { index in
                    ZStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        Image(systemName: "photo")
                            .font(.system(size: 100))
                            .foregroundColor(.gray)
                        
                        VStack {
                            Spacer()
                            
                            // Image description placeholder
                            Text("Image \(index + 1) of \(property.images.count)")
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color.black.opacity(0.7))
                                .cornerRadius(8)
                                .padding(.bottom, 20)
                        }
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .navigationTitle("\(currentIndex + 1) / \(property.images.count)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Share photo
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }
                }
            }
        }
    }
}

#Preview {
    PhotoGalleryView(property: MockData.properties[0])
}