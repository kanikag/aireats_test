# 🏠 Airbnb Clone iOS App

A comprehensive iOS application built with SwiftUI that replicates the core functionality of Airbnb, allowing users to browse, search, and book properties.

## 📱 Features

### Core Functionality
- **Property Browsing**: Browse through a curated list of properties with detailed information
- **Advanced Search**: Search properties by location, price, type, and amenities
- **Property Details**: View comprehensive property information including photos, amenities, reviews, and host details
- **Booking System**: Complete booking flow with date selection and guest management
- **User Profiles**: User account management with profile information and trip history
- **Wishlist**: Save favorite properties for later viewing
- **Trip Management**: View and manage current and past bookings

### User Interface
- **Tab Navigation**: Clean tab-based navigation similar to Airbnb
- **Property Cards**: Beautiful property cards with images, ratings, and pricing
- **Search Filters**: Advanced filtering options for refined search results
- **Photo Gallery**: Full-screen photo viewing experience
- **Responsive Design**: Optimized for all iPhone screen sizes

### Technical Features
- **SwiftUI**: Modern declarative UI framework
- **MVVM Architecture**: Clean separation of concerns
- **Combine Framework**: Reactive programming for search and filtering
- **Mock Data**: Comprehensive sample data for testing
- **State Management**: Proper state management with @StateObject and @EnvironmentObject

## 🏗️ Architecture

```
AirbnbClone/
├── Models/
│   ├── Property.swift          # Property data model
│   ├── User.swift             # User data model
│   └── Booking.swift          # Booking data model
├── ViewModels/
│   └── PropertyViewModel.swift # Business logic and state management
├── Views/
│   ├── HomeView.swift         # Main home screen
│   ├── SearchView.swift       # Property search interface
│   ├── PropertyDetailView.swift # Property details screen
│   ├── BookingView.swift      # Booking flow
│   ├── WishlistView.swift     # Saved properties
│   ├── TripsView.swift        # User's trips
│   ├── ProfileView.swift      # User profile
│   ├── FiltersView.swift      # Search filters
│   ├── PhotoGalleryView.swift # Photo gallery
│   └── Components/
│       └── PropertyCard.swift  # Reusable property card component
├── Data/
│   └── MockData.swift         # Sample data for testing
└── Assets.xcassets/           # App icons and images
```

## 🎯 Key Components

### Models
- **Property**: Comprehensive property model with location, pricing, amenities, and host information
- **User**: User model with profile information, verifications, and reviews
- **Booking**: Booking model for reservation management

### Views
- **HomeView**: Features property discovery with search functionality and featured listings
- **SearchView**: Advanced search with filters and real-time results
- **PropertyDetailView**: Detailed property information with booking integration
- **BookingView**: Complete booking flow with date selection and pricing
- **WishlistView**: Saved properties management
- **TripsView**: Trip history and management
- **ProfileView**: User profile and account settings

### ViewModels
- **PropertyViewModel**: Manages property data, search, and filtering logic

## 🚀 Getting Started

### Prerequisites
- Xcode 14.0 or later
- iOS 15.0 or later
- Swift 5.7 or later

### Installation
1. Clone the repository
2. Open `AirbnbClone.xcodeproj` in Xcode
3. Build and run the project

### Usage
1. Launch the app
2. Browse properties on the home screen
3. Use search functionality to find specific properties
4. View detailed property information
5. Make bookings through the booking flow
6. Manage wishlists and trips

## 🎨 Design Features

### UI/UX
- Clean, modern interface inspired by Airbnb
- Intuitive navigation with tab-based structure
- Responsive design for all iOS devices
- Smooth animations and transitions
- Professional color scheme with pink accent colors

### Components
- Reusable property cards with ratings and pricing
- Featured property carousel
- Advanced search filters
- Interactive photo galleries
- Host information displays
- Booking confirmation flows

## 📊 Sample Data

The app includes comprehensive mock data featuring:
- 6 diverse properties across different locations
- Detailed property information including amenities and host details
- Sample user profiles and reviews
- Booking history and trip data
- Realistic pricing and availability

## 🔧 Technical Details

### Architecture Patterns
- **MVVM**: Model-View-ViewModel architecture
- **Reactive Programming**: Combine framework for data flow
- **Dependency Injection**: Environment objects for shared state
- **Modular Design**: Clean separation of concerns

### Data Management
- In-memory data storage with mock data
- Reactive search and filtering
- State management with SwiftUI's property wrappers
- Comprehensive data models with proper relationships

### Performance
- Lazy loading for property lists
- Efficient image placeholder system
- Optimized search with debouncing
- Smooth scrolling and navigation

## 🚀 Future Enhancements

- **Real API Integration**: Connect to actual property data APIs
- **Authentication**: User login and registration
- **Payment Processing**: Stripe or Apple Pay integration
- **Maps Integration**: MapKit for location visualization
- **Push Notifications**: Booking confirmations and updates
- **Photo Upload**: Allow users to upload property photos
- **Chat System**: Host-guest messaging
- **Advanced Filtering**: More sophisticated search options
- **Social Features**: User reviews and ratings
- **Offline Support**: Core data for offline functionality

## 📱 Screenshots

*Note: This app uses system icons and placeholder images. In a production app, you would replace these with actual property photos and custom icons.*

## 🤝 Contributing

This is a demo application showcasing iOS development capabilities. Feel free to fork and enhance with additional features!

## 📄 License

This project is for educational and demonstration purposes.