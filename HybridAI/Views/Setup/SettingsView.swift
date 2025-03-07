//
//  SettingsView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State var signOutIsLoading = false
    
    @State var presentConfirmSignOut = false
    @State var presentConfirmDeleteAccount = false
    
    var body: some View {
        List {
            Section {
                CoordinatorLink {
                    Text("View current program")
                        .font(Font.FontStyles.body)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                } action: {
                    if let programId = userViewModel.program?.id {
                        navigationController.push(.ProgramDetailView(viewModel: ProgramDetailViewModel(programId: programId)))
                    }
                }
                
                CoordinatorLink {
                    Text("Change program")
                        .font(Font.FontStyles.body)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                } action: {
                    
                }
            }
            
            Section {
                Button {
                    presentConfirmSignOut.toggle()
                } label: {
                    if signOutIsLoading {
                        ProgressView()
                            .tint(Color.ColorSystem.primaryText)
                    } else {
                        Text("Sign out")
                            .font(Font.FontStyles.body)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                    }
                }
            }
            
            Section {
                Button {
                    presentConfirmDeleteAccount.toggle()
                } label: {
                    Text("Delete account")
                        .font(Font.FontStyles.body)
                        .foregroundStyle(Color.ColorSystem.systemRed)
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
        .alert(Text("Are you sure you want to sign out?"), isPresented: $presentConfirmSignOut) {
            Button(role: .destructive) {
                // Sign out
                signOutIsLoading = true
                
                Task {
                    do {
                        try await SupabaseService.shared.supabase.auth.signOut()
                        
                        DispatchQueue.main.async {
                            UserService.currentUser = nil
                            self.userViewModel.isLoggedIn = false
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            } label: {
                Text("Sign out")
            }
        }
        .alert(Text("Are you sure you want to delete your account?"), isPresented: $presentConfirmDeleteAccount) {
            Button(role: .destructive) {
                // Delete account
                Task {
                    do {
                        guard let currentUserId = UserService.currentUser?.id else {
                            return
                        }
                        
                        try await UserService.shared.deleteUser(uid: currentUserId)
                        
                        DispatchQueue.main.async {
                            UserService.currentUser = nil
                            self.userViewModel.isLoggedIn = false
                        }
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Delete")
            }
        }
    }
}

#Preview {
    SettingsView()
}
