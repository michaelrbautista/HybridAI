//
//  HybridAIApp.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI
import Supabase
import RevenueCat

@main
struct HybridAIApp: App {
    
    @StateObject var userViewModel = UserViewModel()
    
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
        
        Purchases.logLevel = .debug
        Purchases.configure(withAPIKey: "appl_TiLqyOFybDZSeFcUaHdcpnoEIiS")
    }
    
    var body: some Scene {
        WindowGroup {
            CheckAuthentication()
                .environmentObject(userViewModel)
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
    
    var body: some View {
        if userViewModel.isBusy {
            VStack(spacing: 20) {
                Spacer()
                
                Image("hybridIconLandingPage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                
                Text("Hybrid AI")
                    .font(Font.FontStyles.largeTitle)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                
                Spacer()
            }
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

class UserViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var isBusy = false
    
    @Published var event: AuthChangeEvent? = nil
    @Published var session: Session? = nil
    
    @Published var program: Program? = nil
    @Published var isStarted = false
    
    init() {
        self.isBusy = true
        
        Task {
            await checkAuth()
        }
    }
    
    @MainActor
    public func checkAuth() async {
        self.isBusy = true
        
        do {
            let _ = try await SupabaseService.shared.supabase.auth.session
            
            let authUser = try await SupabaseService.shared.supabase.auth.session.user
            
            // MARK: Get user
            let user: User = try await SupabaseService.shared.supabase
                .from("users")
                .select()
                .eq("id", value: authUser.id)
                .single()
                .execute()
                .value
            
            UserService.currentUser = user
            
            // MARK: Get program
            let program = try await ProgramService.shared.getProgram(uid: authUser.id.uuidString)
            
            self.program = program
            
            // Check is user started the program
            if let startedProgramId = UserDefaults.standard.value(forKey: "startedProgram") as? String {
                if startedProgramId == program.id {
                    self.isStarted = true
                }
            }
            
            self.isLoggedIn = true
            self.isBusy = false
        } catch {
            self.isLoggedIn = false
            self.isBusy = false
        }
    }
}

// Extension to hide keyboard
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
