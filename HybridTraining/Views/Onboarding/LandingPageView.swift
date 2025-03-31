//
//  LandingPageView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/19/25.
//

import SwiftUI

struct LandingPageView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack(spacing: 40) {
            Image("croppedMockup")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            
            Image("htcFullTitle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            
            VStack(spacing: 10) {
                StyledButton(
                    variant: .primary,
                    text: "Get Started",
                    isLoading: .constant(false)
                ) {
                    navigationController.push(.GoalView)
                }
                
                StyledButton(
                    variant: .secondary,
                    text: "Sign In",
                    isLoading: .constant(false)
                ) {
                    navigationController.push(.SignInView)
                }
            }
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
    }
}

#Preview {
    LandingPageView()
}
