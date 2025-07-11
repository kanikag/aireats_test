import SwiftUI

struct TripsView: View {
    @State private var selectedTab = 0
    @State private var upcomingTrips: [Booking] = []
    @State private var pastTrips: [Booking] = []
    
    var body: some View {
        NavigationView {
            VStack {
                // Tab Selection
                Picker("Trip Type", selection: $selectedTab) {
                    Text("Upcoming").tag(0)
                    Text("Past").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // Content
                if selectedTab == 0 {
                    upcomingTripsView
                } else {
                    pastTripsView
                }
            }
            .navigationTitle("Trips")
        }
    }
    
    private var upcomingTripsView: some View {
        Group {
            if upcomingTrips.isEmpty {
                emptyUpcomingState
            } else {
                tripsList(trips: upcomingTrips, isUpcoming: true)
            }
        }
    }
    
    private var pastTripsView: some View {
        Group {
            if pastTrips.isEmpty {
                emptyPastState
            } else {
                tripsList(trips: pastTrips, isUpcoming: false)
            }
        }
    }
    
    private var emptyUpcomingState: some View {
        VStack(spacing: 24) {
            Image(systemName: "airplane")
                .font(.system(size: 80))
                .foregroundColor(.gray)
            
            VStack(spacing: 16) {
                Text("No trips booked...yet!")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Time to dust off your bags and start planning your next adventure")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
            
            Button("Start searching") {
                // Switch to search tab
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(Color.pink)
            .cornerRadius(8)
        }
        .padding()
    }
    
    private var emptyPastState: some View {
        VStack(spacing: 24) {
            Image(systemName: "clock")
                .font(.system(size: 80))
                .foregroundColor(.gray)
            
            VStack(spacing: 16) {
                Text("No past trips")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Your completed trips will appear here")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
    
    private func tripsList(trips: [Booking], isUpcoming: Bool) -> some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(trips) { booking in
                    TripCard(booking: booking, isUpcoming: isUpcoming)
                }
            }
            .padding()
        }
    }
}

struct TripCard: View {
    let booking: Booking
    let isUpcoming: Bool
    @State private var showingDetails = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
                    .overlay(
                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(booking.property.title)
                        .font(.headline)
                        .lineLimit(2)
                    
                    Text(booking.property.location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("\(booking.checkIn, style: .date) - \(booking.checkOut, style: .date)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("$\(booking.totalPrice)")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(booking.status.rawValue)
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(statusColor(for: booking.status))
                        .foregroundColor(.white)
                        .cornerRadius(4)
                }
            }
            
            Divider()
            
            HStack {
                if isUpcoming {
                    Button("View Details") {
                        showingDetails = true
                    }
                    .font(.subheadline)
                    .foregroundColor(.pink)
                    
                    Spacer()
                    
                    Button("Cancel Trip") {
                        // Cancel trip logic
                    }
                    .font(.subheadline)
                    .foregroundColor(.red)
                } else {
                    Button("View Details") {
                        showingDetails = true
                    }
                    .font(.subheadline)
                    .foregroundColor(.pink)
                    
                    Spacer()
                    
                    Button("Write Review") {
                        // Write review logic
                    }
                    .font(.subheadline)
                    .foregroundColor(.pink)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
        .sheet(isPresented: $showingDetails) {
            TripDetailView(booking: booking)
        }
    }
    
    private func statusColor(for status: Booking.BookingStatus) -> Color {
        switch status {
        case .pending:
            return .orange
        case .confirmed:
            return .green
        case .cancelled:
            return .red
        case .completed:
            return .blue
        }
    }
}

struct TripDetailView: View {
    let booking: Booking
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Property Info
                    VStack(alignment: .leading, spacing: 12) {
                        Text(booking.property.title)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(booking.property.location)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 200)
                            .cornerRadius(12)
                            .overlay(
                                Image(systemName: "photo")
                                    .font(.system(size: 40))
                                    .foregroundColor(.gray)
                            )
                    }
                    
                    Divider()
                    
                    // Booking Details
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Booking Details")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        VStack(spacing: 8) {
                            HStack {
                                Text("Check-in:")
                                Spacer()
                                Text(booking.checkIn, style: .date)
                                    .fontWeight(.medium)
                            }
                            
                            HStack {
                                Text("Check-out:")
                                Spacer()
                                Text(booking.checkOut, style: .date)
                                    .fontWeight(.medium)
                            }
                            
                            HStack {
                                Text("Guests:")
                                Spacer()
                                Text("\(booking.guests)")
                                    .fontWeight(.medium)
                            }
                            
                            HStack {
                                Text("Nights:")
                                Spacer()
                                Text("\(booking.nights)")
                                    .fontWeight(.medium)
                            }
                            
                            HStack {
                                Text("Status:")
                                Spacer()
                                Text(booking.status.rawValue)
                                    .fontWeight(.medium)
                            }
                        }
                    }
                    
                    Divider()
                    
                    // Host Info
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Host")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        HStack {
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 50, height: 50)
                                .overlay(
                                    Image(systemName: "person")
                                        .foregroundColor(.gray)
                                )
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(booking.property.host.name)
                                    .font(.headline)
                                
                                if booking.property.host.isSuperhost {
                                    Text("Superhost")
                                        .font(.caption)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.pink.opacity(0.2))
                                        .cornerRadius(4)
                                }
                            }
                            
                            Spacer()
                            
                            Button("Message Host") {
                                // Message host logic
                            }
                            .font(.subheadline)
                            .foregroundColor(.pink)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Trip Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    TripsView()
}