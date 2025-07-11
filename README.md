# Airbnb Clone iOS App

A comprehensive iOS application that replicates the core functionality of Airbnb, built with SwiftUI and following modern iOS development practices.

## Features

### 🏠 Property Browsing
- **Home Screen**: Featured properties and comprehensive property listings
- **Search & Filters**: Advanced search with location, price range, property type, rating, and amenities filters
- **Property Details**: Detailed property information including photos, amenities, host information, and reviews
- **Photo Gallery**: Full-screen photo viewing with swipe navigation

### 🔍 Search & Discovery
- **Smart Search**: Real-time search with debounced input
- **Advanced Filters**: Price range, property type, minimum rating, and amenities filtering
- **Search Results**: Clean, organized display of search results with sorting options

### 📅 Booking System
- **Date Selection**: Intuitive check-in/check-out date picker
- **Guest Management**: Easy guest count selection with property limits
- **Price Breakdown**: Transparent pricing with base cost, fees, and total calculations
- **Booking Confirmation**: Complete booking flow with confirmation screen

### ❤️ Wishlists
- **Save Properties**: Add properties to personal wishlists
- **Organize Favorites**: Create and manage multiple wishlists
- **Quick Access**: Easy access to saved properties

### ✈️ Trip Management
- **Upcoming Trips**: View and manage upcoming reservations
- **Trip History**: Access past trips and completed bookings
- **Trip Details**: Comprehensive trip information and host contact
- **Booking Status**: Real-time booking status updates

### 👤 User Profile
- **Profile Management**: Edit personal information and preferences
- **Settings**: Notification preferences, privacy settings, and account management
- **Quick Actions**: Verification, reviews, hosting options, and referrals
- **Support**: Help center, safety information, and contact options

## Technical Architecture

### 🏗️ Project Structure
```
AirbnbClone/
├── AirbnbCloneApp.swift          # Main app entry point
├── ContentView.swift             # Tab-based navigation
├── Models/                       # Data models
│   ├── Property.swift           # Property data model
│   ├── User.swift               # User data model
│   └── Booking.swift            # Booking data model
├── Views/                        # SwiftUI views
│   ├── HomeView.swift           # Home screen
│   ├── SearchView.swift         # Search functionality
│   ├── PropertyDetailView.swift # Property details
│   ├── BookingView.swift        # Booking flow
│   ├── WishlistView.swift       # Wishlists
│   ├── TripsView.swift          # Trip management
│   ├── ProfileView.swift        # User profile
│   ├── FiltersView.swift        # Search filters
│   ├── PhotoGalleryView.swift   # Photo gallery
│   └── Components/              # Reusable components
│       └── PropertyCard.swift   # Property card component
├── ViewModels/                   # Business logic
│   └── PropertyViewModel.swift  # Property management
└── Data/                        # Data layer
    └── MockData.swift           # Sample data
```

### 🛠️ Technologies Used
- **SwiftUI**: Modern declarative UI framework
- **Combine**: Reactive programming for data flow
- **MVVM Architecture**: Clean separation of concerns
- **ObservableObject**: State management
- **NavigationView**: iOS navigation patterns
- **TabView**: Bottom tab navigation
- **Sheet Presentations**: Modal views
- **DatePicker**: Native date selection
- **Slider**: Custom range selection
- **LazyVGrid/LazyVStack**: Efficient list rendering

### 📱 Core Features Implementation

#### Property Management
- **PropertyViewModel**: Centralized property data management
- **Real-time Filtering**: Combine-based reactive filtering
- **Search Debouncing**: Optimized search performance
- **Mock Data**: Comprehensive sample data for demonstration

#### User Interface
- **Custom Components**: Reusable UI components
- **Responsive Design**: Adaptive layouts for different screen sizes
- **Accessibility**: VoiceOver and accessibility support
- **Modern Design**: Clean, intuitive interface following iOS design guidelines

#### Navigation
- **Tab-based Navigation**: Bottom tab bar for main sections
- **Navigation Stack**: Hierarchical navigation within tabs
- **Sheet Presentations**: Modal presentations for booking and settings
- **Deep Linking**: Support for navigating to specific properties

## Requirements

- **iOS 17.0+**
- **Xcode 15.0+**
- **Swift 5.9+**

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd AirbnbClone
```

2. Open the project in Xcode:
```bash
open AirbnbClone.xcodeproj
```

3. Build and run the project:
   - Select your target device or simulator
   - Press `Cmd+R` to build and run

## Usage

### Home Screen
- Browse featured properties and all available listings
- Use the search bar to find specific destinations
- Apply filters to narrow down results
- Tap on any property to view details

### Search
- Enter destinations in the search bar
- Use quick filters for property types
- Access advanced filters for detailed search criteria
- View results in a clean, organized format

### Property Details
- View high-quality property images
- Read detailed descriptions and amenities
- Check host information and reviews
- Book the property with the Reserve button

### Booking Flow
1. Select check-in and check-out dates
2. Choose number of guests
3. Review price breakdown
4. Complete the reservation
5. Receive booking confirmation

### Profile Management
- Edit personal information
- Manage notification preferences
- Access help and support
- Review booking history

## Customization

### Adding New Properties
Modify the `MockData.swift` file to add new properties:

```swift
Property(
    title: "Your Property Title",
    location: "City, State",
    price: 200,
    rating: 4.8,
    reviewCount: 50,
    // ... other properties
)
```

### Modifying Filters
Update the `FiltersView.swift` to add new filter categories or modify existing ones.

### Custom Styling
Modify color schemes and styling in the respective view files. The app uses a consistent pink accent color throughout.

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Inspired by Airbnb's mobile app design and functionality
- Built with SwiftUI and modern iOS development practices
- Uses SF Symbols for consistent iconography

## Future Enhancements

- **Real Backend Integration**: Connect to actual property and booking APIs
- **Maps Integration**: Add interactive maps for property locations
- **Real Image Loading**: Implement actual image loading and caching
- **Push Notifications**: Booking confirmations and trip reminders
- **Payment Integration**: Real payment processing
- **Chat System**: In-app messaging between guests and hosts
- **Advanced Authentication**: Social login and enhanced security
- **Offline Support**: Core functionality available offline
- **Analytics**: Usage tracking and performance monitoring

## Contact

For questions, suggestions, or contributions, please open an issue or reach out to the development team.

---

*This is a demonstration project showcasing iOS development skills and SwiftUI expertise. It is not affiliated with Airbnb Inc.*