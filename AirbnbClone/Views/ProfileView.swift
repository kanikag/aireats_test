import SwiftUI

struct ProfileView: View {
    @State private var showingSettings = false
    @State private var showingEditProfile = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Profile Header
                    profileHeader
                    
                    // Quick Actions
                    quickActions
                    
                    // Settings
                    settingsSection
                    
                    // Support
                    supportSection
                    
                    // Legal
                    legalSection
                }
                .padding()
            }
            .navigationTitle("Profile")
        }
        .sheet(isPresented: $showingEditProfile) {
            EditProfileView()
        }
        .sheet(isPresented: $showingSettings) {
            SettingsView()
        }
    }
    
    private var profileHeader: some View {
        VStack(spacing: 16) {
            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 100, height: 100)
                .overlay(
                    Image(systemName: "person")
                        .font(.system(size: 40))
                        .foregroundColor(.gray)
                )
            
            VStack(spacing: 8) {
                Text("John Doe")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Show profile")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        showingEditProfile = true
                    }
            }
        }
    }
    
    private var quickActions: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                ProfileActionCard(
                    icon: "person.badge.shield.checkmark",
                    title: "Get verified",
                    subtitle: "Add your ID to get verified"
                )
                
                ProfileActionCard(
                    icon: "star",
                    title: "Reviews",
                    subtitle: "View your reviews"
                )
            }
            
            HStack(spacing: 16) {
                ProfileActionCard(
                    icon: "house",
                    title: "Become a Host",
                    subtitle: "List your space"
                )
                
                ProfileActionCard(
                    icon: "gift",
                    title: "Refer friends",
                    subtitle: "Earn travel credits"
                )
            }
        }
    }
    
    private var settingsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Settings")
                .font(.title3)
                .fontWeight(.bold)
            
            VStack(spacing: 12) {
                ProfileMenuItem(
                    icon: "person.circle",
                    title: "Personal information",
                    action: { showingEditProfile = true }
                )
                
                ProfileMenuItem(
                    icon: "creditcard",
                    title: "Payments and payouts",
                    action: { }
                )
                
                ProfileMenuItem(
                    icon: "bell",
                    title: "Notifications",
                    action: { }
                )
                
                ProfileMenuItem(
                    icon: "lock",
                    title: "Privacy and sharing",
                    action: { }
                )
                
                ProfileMenuItem(
                    icon: "globe",
                    title: "Translation",
                    action: { }
                )
            }
        }
    }
    
    private var supportSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Support")
                .font(.title3)
                .fontWeight(.bold)
            
            VStack(spacing: 12) {
                ProfileMenuItem(
                    icon: "questionmark.circle",
                    title: "Get help",
                    action: { }
                )
                
                ProfileMenuItem(
                    icon: "exclamationmark.shield",
                    title: "Safety Center",
                    action: { }
                )
                
                ProfileMenuItem(
                    icon: "phone.bubble",
                    title: "Contact us",
                    action: { }
                )
            }
        }
    }
    
    private var legalSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Legal")
                .font(.title3)
                .fontWeight(.bold)
            
            VStack(spacing: 12) {
                ProfileMenuItem(
                    icon: "doc.text",
                    title: "Terms of Service",
                    action: { }
                )
                
                ProfileMenuItem(
                    icon: "hand.raised",
                    title: "Privacy Policy",
                    action: { }
                )
                
                ProfileMenuItem(
                    icon: "building.2",
                    title: "Your privacy choices",
                    action: { }
                )
            }
        }
    }
}

struct ProfileActionCard: View {
    let icon: String
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(.pink)
            
            VStack(spacing: 4) {
                Text(title)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}

struct ProfileMenuItem: View {
    let icon: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                    .frame(width: 24)
                
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 8)
        }
    }
}

struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var firstName = "John"
    @State private var lastName = "Doe"
    @State private var email = "john.doe@example.com"
    @State private var phoneNumber = "+1 (555) 123-4567"
    @State private var bio = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section("Personal Information") {
                    HStack {
                        Text("First Name")
                        Spacer()
                        TextField("First Name", text: $firstName)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack {
                        Text("Last Name")
                        Spacer()
                        TextField("Last Name", text: $lastName)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack {
                        Text("Email")
                        Spacer()
                        TextField("Email", text: $email)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack {
                        Text("Phone")
                        Spacer()
                        TextField("Phone", text: $phoneNumber)
                            .multilineTextAlignment(.trailing)
                    }
                }
                
                Section("About You") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Bio")
                            .font(.headline)
                        
                        TextEditor(text: $bio)
                            .frame(minHeight: 100)
                    }
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // Save profile changes
                        dismiss()
                    }
                }
            }
        }
    }
}

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var notificationsEnabled = true
    @State private var locationEnabled = true
    @State private var marketingEmails = false
    
    var body: some View {
        NavigationView {
            Form {
                Section("Notifications") {
                    Toggle("Push Notifications", isOn: $notificationsEnabled)
                    Toggle("Marketing Emails", isOn: $marketingEmails)
                }
                
                Section("Privacy") {
                    Toggle("Location Services", isOn: $locationEnabled)
                }
                
                Section("Account") {
                    Button("Sign Out") {
                        // Sign out logic
                    }
                    .foregroundColor(.red)
                    
                    Button("Delete Account") {
                        // Delete account logic
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("Settings")
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
    ProfileView()
}