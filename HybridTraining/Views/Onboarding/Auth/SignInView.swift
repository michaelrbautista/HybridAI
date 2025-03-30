//
//  SignInView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/19/25.
//

import SwiftUI
import Supabase

struct SignInView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var viewModel = OnboardingViewModel()
    
    @State var email = ""
    @State var isValidEmail = false
    
    @State var isLoading = false
    
    @State var returnedError = false
    @State var errorMessage = ""
    
    var body: some View {
        VStack {
            Text("Sign in")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            VStack(spacing: 10) {
                HStack {
                    TextField("Email", text: $email)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .textInputAutocapitalization(.never)
                        .onChange(of: email, {
                            isValidEmail = validateEmail(email)
                        })
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
                
                if !isValidEmail {
                    Text("Please enter a valid email.")
                        .font(Font.FontStyles.body)
                        .foregroundStyle(Color.ColorSystem.systemGray)
                }
            }
            Spacer()
            StyledButton(
                variant: !isValidEmail ? .disabled : .primary,
                text: "Next",
                isLoading: $isLoading
            ) {
                // Send and get one time code
                Task {
                    do {
                        isLoading = true
                        
                        try await SupabaseService.shared.supabase.auth.signInWithOTP(email: email, shouldCreateUser: false)
                        
                        // Go to next page
                        navigationController.push(.OneTimeCodeView(viewModel: viewModel, isSignIn: true, email: email))
                    } catch {
                        isLoading = false
                        errorMessage = "There was an error signing you in. Please try again."
                        print(error.localizedDescription)
                        returnedError.toggle()
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        .alert(isPresented: $returnedError, content: {
            Alert(title: Text(errorMessage))
        })
    }
    
    func validateEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}

#Preview {
    SignInView()
}
