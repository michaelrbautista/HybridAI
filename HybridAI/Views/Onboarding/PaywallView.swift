//
//  PaywallView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/20/25.
//

import SwiftUI
import RevenueCat

struct PaywallView: View {
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel: OnboardingViewModel
    
    var onDismiss: (() -> Void)
    
    var body: some View {
        VStack {
            Text("We want you to try out Hybrid AI for free.")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 40) {
                VStack(alignment: .leading) {
                    BulletPoint(text: "Try free for 7 days.")
                    BulletPoint(text: "We'll remind you when your trial is ending soon.")
                    BulletPoint(text: "After 7 days, billing starts.")
                }
                
                if let offering = viewModel.offering, let yearlyMonthlyPrice = offering.availablePackages[1].storeProduct.localizedPricePerMonth {
                    VStack {
                        SelectPriceRow(
                            text: offering.availablePackages[0].storeProduct.localizedTitle,
                            subtext: "\(offering.availablePackages[0].storeProduct.localizedPriceString)/month",
                            package: offering.availablePackages[0],
                            selection: $viewModel.selectedPackage) {
                                viewModel.selectedPackage = offering.availablePackages[0]
                            }
                        
                        SelectPriceRow(
                            text: offering.availablePackages[1].storeProduct.localizedTitle,
                            subtext: "\(offering.availablePackages[1].storeProduct.localizedPriceString)/year (\(yearlyMonthlyPrice)/month)",
                            package: offering.availablePackages[1],
                            selection: $viewModel.selectedPackage) {
                                viewModel.selectedPackage = offering.availablePackages[1]
                            }
                    }
                }
            }
            
            Spacer()
            
            VStack {
                StyledButton(
                    variant: viewModel.selectedPackage != nil ? .primary : .disabled,
                    text: "Try for $0.00",
                    isLoading: .constant(false)
                ) {
#if DEBUG
                    // Create program
                    if let packageForPurchase = viewModel.selectedPackage {
                        Purchases.shared.purchase(package: packageForPurchase) { transaction, customerInfo, error, userCancelled in
                            
                            if customerInfo?.entitlements.all["pro"]?.isActive == true {
                                
                            }
                        }
                    }
#else
                    // Create program
                    
                    navigationController.push(.CreateAccountView(viewModel: viewModel))
#endif
                }
                
                Text("Only $49.99 a year ($4.17 per month)")
            }
            
        }
        .padding(EdgeInsets(top: 40, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    PaywallView(
        viewModel: OnboardingViewModel(),
        onDismiss: {}
    )
}
