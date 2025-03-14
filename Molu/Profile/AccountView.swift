import SwiftUI

struct AccountView: View {
    @State private var username = "[User Name]"
    @State private var email = "username@example.com"
    @State private var totalEarned = 5000.0
    @State private var ongoingDeals = 3
    @State private var showingSettings = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    profileHeader
                    
                    financialOverview
                    
                    dealsSummary
                    
                    accountSettings
                }
                .padding()
            }
//            .navigationTitle("Profile")
            .navigationBarItems(trailing: settingsButton)
        }
        .sheet(isPresented: $showingSettings) {
            SettingsView()
        }
    }
    
    private var profileHeader: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .background(Circle().fill(Color.blue.opacity(0.1)))
                .overlay(
                    Circle()
                        .stroke(Color.blue, lineWidth: 2)
                )
            
            Text(username)
                .font(Font.custom("OPTIDanley-Medium", size: 32))
                .fontWeight(.bold)
            
            Text(email)
                .font(Font.custom("OPTIDanley-Medium", size: 16))
                .foregroundColor(.secondary)
        }
    }
    
    private var financialOverview: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Financial Overview")
                .font(Font.custom("OPTIDanley-Medium", size: 16))
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Total Earned")
                        .font(Font.custom("OPTIDanley-Medium", size: 16))
                        .foregroundColor(.secondary)
                    Text("$\(totalEarned, specifier: "%.2f")")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Ongoing Deals")
                        .font(Font.custom("OPTIDanley-Medium", size: 14))
                        .foregroundColor(.secondary)
                    Text("\(ongoingDeals)")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.blue.opacity(0.1)))
        }
    }
    
    private var dealsSummary: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Recent Deals")
                .font(Font.custom("OPTIDanley-Medium", size: 16))
            
            ForEach(1...3, id: \.self) { index in
                HStack {
                    Text("Deal \(index)")
                    Spacer()
                    Text("$\(Double.random(in: 100...1000), specifier: "%.2f")")
                        .fontWeight(.semibold)
                }
                .padding(.vertical, 5)
            }
            
            Button(action: {
                // Action to view all deals
            }) {
                Text("View All Deals")
                    .font(Font.custom("OPTIDanley-Medium", size: 14))
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.gray.opacity(0.1)))
    }
    
    private var accountSettings: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Account Settings")
                .font(Font.custom("OPTIDanley-Medium", size: 16))
            
            Button(action: {
                // Action to edit profile
            }) {
                HStack {
                    Text("Edit Profile")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
            
            Button(action: {
                // Action to change password
            }) {
                HStack {
                    Text("Change Password")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
            
            Button(action: {
                // Action to manage notifications
            }) {
                HStack {
                    Text("Manage Notifications")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.gray.opacity(0.1)))
    }
    
    private var settingsButton: some View {
        Button(action: {
            showingSettings = true
        }) {
            Image(systemName: "gearshape.fill")
        }
    }
}

struct SettingsView: View {
    
    @ObservedObject var authViewModel = AuthViewModel.shared
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("App Settings")) {
                    Toggle("Dark Mode", isOn: .constant(false))
                    Toggle("Notifications", isOn: .constant(true))
                }
                
                Section(header: Text("Privacy")) {
                    Button("Privacy Policy") {
                        // Action to show privacy policy
                    }
                    Button("Terms of Service") {
                        // Action to show terms of service
                    }
                }
                
                Section {
                    Button("Log Out") {
                        // Action to log out
                        authViewModel.signOut()
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

