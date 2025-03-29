//
//  HybridAIApp.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI
import Supabase
import RevenueCat
import SuperwallKit

@main
struct HybridAIApp: App {
    
    @StateObject var userViewModel = UserViewModel()
    @StateObject var programViewModel = ProgramViewModel()
    
    init() {
        let navAppearance = UINavigationBarAppearance()
        navAppearance.backgroundColor = UIColor(Color.ColorSystem.systemBackground)
        navAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color.ColorSystem.primaryText)]
        navAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.ColorSystem.primaryText)]
        navAppearance.shadowColor = .clear
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
        UINavigationBar.appearance().standardAppearance = navAppearance
        
        let tabAppearance = UITabBarAppearance()
        tabAppearance.backgroundColor = UIColor(Color.ColorSystem.systemBackground)
        tabAppearance.shadowColor = .clear
        UITabBar.appearance().scrollEdgeAppearance = tabAppearance
        UITabBar.appearance().standardAppearance = tabAppearance
        
        let purchaseController = RCPurchaseController()
        
        Superwall.configure(
            apiKey: "pk_6330fd17890e685efd53e1421a750856d70c40a778515770",
            purchaseController: purchaseController
        )
        
        Purchases.logLevel = .error
        Purchases.configure(with:
            .builder(withAPIKey: "appl_TiLqyOFybDZSeFcUaHdcpnoEIiS")
            .with(purchasesAreCompletedBy: .myApp, storeKitVersion: .storeKit1)
            .build()
        )
    }
    
    var body: some Scene {
        WindowGroup {
            CheckAuthentication()
                .environmentObject(userViewModel)
                .environmentObject(programViewModel)
                .onOpenURL { url in
                    handleIncomingURL(url)
                }
        }
    }
    
    func handleIncomingURL(_ url: URL) {
        SupabaseService.shared.supabase.handle(url)
        print("User signed in with magic link!")
    }
}

struct CheckAuthentication: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var programViewModel: ProgramViewModel
    
    var body: some View {
        if userViewModel.isLoading || programViewModel.isLoading {
            VStack(spacing: 20) {
                Spacer()
                
                Image("hybridIconLandingPage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                
                Text("Hybrid Training Club")
                    .font(Font.FontStyles.title1)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .frame(width: 200)
        } else {
            if userViewModel.isLoggedIn {
                LoggedInView()
                    .environmentObject(userViewModel)
            } else {
                LandingPageCoordinatorView()
                    .environmentObject(userViewModel)
            }
        }
    }
}

// Extension to hide keyboard
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
