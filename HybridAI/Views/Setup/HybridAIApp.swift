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
        
        Purchases.logLevel = .error
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

class UserViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var isBusy = false
    
    @Published var event: AuthChangeEvent? = nil
    @Published var session: Session? = nil
    
    @Published var isLoading = false
    
    @Published var program: Program? = nil
    @Published var isStarted = false
    @Published var isInProgress = false
    
    #if DEBUG
    @Published var nutritionPlan: NutritionPlan? = NutritionPlan(bmr: 1651, protein: 150, fat: 82, carbs: 78)
    #else
    @Published var nutritionPlan: NutritionPlan? = nil
    #endif
    
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
            
            try await getProgramAndNutritionPlan(userId: authUser.id.uuidString)
            
            self.isLoggedIn = true
            self.isBusy = false
        } catch {
            print(error)
            self.isLoggedIn = false
            self.isBusy = false
        }
    }
    
    @MainActor
    public func getProgramAndNutritionPlan(userId: String) async throws {
        self.isLoading = true
        
        do {
            // MARK: Get program
            let program = try await ProgramService.shared.getProgram(uid: userId)
            
            self.program = program
            
            // Check is user started the program
            if let startDate = UserDefaults.standard.value(forKey: "startDate") as? Date {
                self.isStarted = true
                
                let calendar = Calendar(identifier: .gregorian)
                let daysSinceStarted = calendar.numberOfDaysBetween(startDate, and: Date.now)
                
                if daysSinceStarted >= 0 {
                    self.isInProgress = true
                }
            }
            
            print(self.isStarted)
            
            
            // MARK: Get nutrition plan
            if let usersNutritionPlan = UserDefaults.standard.value(forKey: "nutritionPlan") {
                let decoder = JSONDecoder()
                if let decodedNutritionPlan = try? decoder.decode(NutritionPlan.self, from: usersNutritionPlan as! Data) {
                    self.nutritionPlan = decodedNutritionPlan
                }
            }
            
            self.isLoading = false
        } catch {
            print(error)
            self.isLoading = false
        }
    }
}

// Extension to hide keyboard
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
