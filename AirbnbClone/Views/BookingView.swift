import SwiftUI

struct BookingView: View {
    let property: Property
    @Environment(\.dismiss) private var dismiss
    @State private var checkInDate = Date()
    @State private var checkOutDate = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    @State private var guests = 1
    @State private var showingConfirmation = false
    
    private var nights: Int {
        Calendar.current.dateComponents([.day], from: checkInDate, to: checkOutDate).day ?? 0
    }
    
    private var totalPrice: Int {
        nights * property.price
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Property Summary
                    propertyHeader
                    
                    Divider()
                    
                    // Date Selection
                    dateSection
                    
                    Divider()
                    
                    // Guest Selection
                    guestSection
                    
                    Divider()
                    
                    // Price Breakdown
                    priceBreakdown
                    
                    Divider()
                    
                    // Booking Rules
                    bookingRules
                    
                    Spacer(minLength: 80)
                }
                .padding()
            }
            .navigationTitle("Booking")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .overlay(alignment: .bottom) {
                reserveButton
            }
        }
        .sheet(isPresented: $showingConfirmation) {
            BookingConfirmationView(property: property, checkIn: checkInDate, checkOut: checkOutDate, guests: guests, totalPrice: totalPrice)
        }
    }
    
    private var propertyHeader: some View {
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
                Text(property.title)
                    .font(.headline)
                    .lineLimit(2)
                
                Text(property.location)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
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
        }
    }
    
    private var dateSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Your Trip")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Check-in")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    DatePicker("Check-in", selection: $checkInDate, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                        .labelsHidden()
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Check-out")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    DatePicker("Check-out", selection: $checkOutDate, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                        .labelsHidden()
                }
            }
        }
    }
    
    private var guestSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Guests")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack {
                Text("Number of guests")
                    .font(.subheadline)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        if guests > 1 {
                            guests -= 1
                        }
                    }) {
                        Image(systemName: "minus.circle")
                            .foregroundColor(guests > 1 ? .pink : .gray)
                    }
                    .disabled(guests <= 1)
                    
                    Text("\(guests)")
                        .font(.headline)
                        .frame(minWidth: 40)
                    
                    Button(action: {
                        if guests < property.maxGuests {
                            guests += 1
                        }
                    }) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(guests < property.maxGuests ? .pink : .gray)
                    }
                    .disabled(guests >= property.maxGuests)
                }
            }
            
            Text("Maximum \(property.maxGuests) guests")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
    
    private var priceBreakdown: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Price Details")
                .font(.title3)
                .fontWeight(.bold)
            
            VStack(spacing: 8) {
                HStack {
                    Text("$\(property.price) x \(nights) nights")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text("$\(totalPrice)")
                        .font(.subheadline)
                }
                
                HStack {
                    Text("Cleaning fee")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text("$25")
                        .font(.subheadline)
                }
                
                HStack {
                    Text("Service fee")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text("$\(Int(Double(totalPrice) * 0.1))")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack {
                    Text("Total")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("$\(totalPrice + 25 + Int(Double(totalPrice) * 0.1))")
                        .font(.headline)
                        .fontWeight(.bold)
                }
            }
        }
    }
    
    private var bookingRules: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Booking Rules")
                .font(.title3)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("• Free cancellation for 48 hours")
                    .font(.subheadline)
                
                Text("• No smoking allowed")
                    .font(.subheadline)
                
                Text("• No pets allowed")
                    .font(.subheadline)
                
                Text("• No parties or events")
                    .font(.subheadline)
            }
        }
    }
    
    private var reserveButton: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 1)
            
            Button(action: {
                showingConfirmation = true
            }) {
                Text("Reserve")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(8)
            }
            .padding()
            .background(Color.white)
        }
    }
}

struct BookingConfirmationView: View {
    let property: Property
    let checkIn: Date
    let checkOut: Date
    let guests: Int
    let totalPrice: Int
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 32) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.green)
                
                VStack(spacing: 16) {
                    Text("Booking Confirmed!")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Your reservation has been confirmed. You'll receive a confirmation email shortly.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Booking Details")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    HStack {
                        Text("Property:")
                        Spacer()
                        Text(property.title)
                            .fontWeight(.medium)
                    }
                    
                    HStack {
                        Text("Check-in:")
                        Spacer()
                        Text(checkIn, style: .date)
                            .fontWeight(.medium)
                    }
                    
                    HStack {
                        Text("Check-out:")
                        Spacer()
                        Text(checkOut, style: .date)
                            .fontWeight(.medium)
                    }
                    
                    HStack {
                        Text("Guests:")
                        Spacer()
                        Text("\(guests)")
                            .fontWeight(.medium)
                    }
                    
                    HStack {
                        Text("Total:")
                        Spacer()
                        Text("$\(totalPrice)")
                            .fontWeight(.bold)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                
                Spacer()
                
                Button("Done") {
                    dismiss()
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.pink)
                .cornerRadius(8)
            }
            .padding()
            .navigationTitle("Confirmation")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    BookingView(property: MockData.properties[0])
}