//
//  ConfiguringView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI
import SuperwallKit

struct ConfiguringView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Spacer()
            if viewModel.isConfiguring {
                Text("Creating your program...")
                    .font(Font.FontStyles.title2)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .multilineTextAlignment(.center)
                ProgressView()
                    .frame(maxWidth: UIScreen.main.bounds.size.width)
                    .frame(height: 17)
                    .tint(Color.ColorSystem.primaryText)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            } else {
                Text("Your program is good to go!")
                    .font(Font.FontStyles.title2)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .multilineTextAlignment(.center)
                Text("✅")
                    .frame(width: 40)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .multilineTextAlignment(.center)
                    .onAppear {
                        viewModel.createGeneralProgram()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            Superwall.shared.register(placement: "campaign_trigger")
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                viewModel.isWaitingForPaywall = false
                            }
                        }
                    }
            }
            Spacer()
            StyledButton(
                variant: viewModel.isWaitingForPaywall ? .disabled : .primary,
                text: "Next",
                isLoading: .constant(false)) {
                    navigationController.push(.CreateAccountView(viewModel: viewModel))
                }
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                Task {
                    await viewModel.getOfferings()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    viewModel.isConfiguring = false
                }
            }
        }
    }
}

#Preview {
    ConfiguringView(viewModel: OnboardingViewModel())
}
