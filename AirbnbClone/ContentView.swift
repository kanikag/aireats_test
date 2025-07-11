import SwiftUI

struct ContentView: View {
    @StateObject private var propertyViewModel = PropertyViewModel()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Explore")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            WishlistView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Wishlists")
                }
            
            TripsView()
                .tabItem {
                    Image(systemName: "airplane")
                    Text("Trips")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
        .environmentObject(propertyViewModel)
        .accentColor(.pink)
    }
}

#Preview {
    ContentView()
}