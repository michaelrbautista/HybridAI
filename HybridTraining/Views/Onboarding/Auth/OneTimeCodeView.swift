//
//  OneTimeCodeView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI
import Supabase

struct OneTimeCodeView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var viewModel: OnboardingViewModel
    
    var isSignIn: Bool
    var email: String
    @State var code = ""
    
    @State var isLoading = false
    
    @State var returnedError = false
    @State var errorMessage = ""
    
    var body: some View {
        VStack {
            Text("Enter the code that was sent to the email:")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Text(email)
                .font(Font.FontStyles.body)
                .foregroundStyle(Color.ColorSystem.systemGray)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            Spacer()
            VStack(spacing: 10) {
                HStack {
                    TextField("Enter code", text: $code)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .keyboardType(.numberPad)
                        .toolbar {
                            ToolbarItem(placement: .keyboard) {
                                HStack {
                                    Spacer()
                                    Button("Done") {
                                        hideKeyboard()
                                    }
                                }
                            }
                        }
                }
                .background(Color.ColorSystem.systemGray6)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            Spacer()
            StyledButton(
                variant: code == "" ? .disabled : .primary,
                text: "Next",
                isLoading: $isLoading
            ) {
                Task {
                    // Validate code is correct
                    do {
                        isLoading = true
                        
                        if isSignIn {
                            let session = try await SupabaseService.shared.supabase.auth.verifyOTP(email: email, token: code, type: .email)
                            
                            let currentUserId = session.user.id.description
                            
                            // Get user from db
                            let user = try await UserService.shared.getUser(uid: currentUserId)
                            
                            UserService.currentUser = user
                        } else {
                            let session = try await SupabaseService.shared.supabase.auth.verifyOTP(email: email, token: code, type: .email)
                            
                            // Set user to logged in and redirect
                            let currentUserId = session.user.id.description
                            
                            let newUser = User(
                                id: currentUserId,
                                email: email
                            )
                            
                            // Create user row
                            let user = try await UserService.shared.createUser(user: newUser)
                            
                            
                            UserService.currentUser = user
                            
                            // Save program
                            await viewModel.saveNewProgram(currentProgramId: nil)
                            
                            if viewModel.returnedError == false {
                                userViewModel.program = viewModel.newProgram
                            }
                            
                            userViewModel.isLoggedIn = true
                        }
                    } catch {
                        isLoading = false
                        errorMessage = "There was an issue signing you in. Please try again later."
                        print(error)
                        returnedError = true
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        .alert(isPresented: $returnedError, content: {
            Alert(title: Text(errorMessage))
        })
    }
}

#Preview {
    OneTimeCodeView(viewModel: OnboardingViewModel(), isSignIn: true, email: "email@email.com", code: "")
}
