//
//  NewNutritionPlanViewModel.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/10/25.
//

import StoreKit
import RevenueCat

final class NewNutritionPlanViewModel: ObservableObject {
    
    #if DEBUG
    @Published var gender = "Male"
    @Published var age = "26"
    @Published var height = "69"
    @Published var weight = "150"
    #else
    @Published var gender = ""
    @Published var age = ""
    @Published var height = ""
    @Published var weight = ""
    #endif
    
    @Published var isLoading = true
    @Published var returnedError = false
    @Published var errorMessage = ""
    
    func calculateBMR() {
        guard let ageInt = Int(age), let heightDouble = Double(height), let weightDouble = Double(weight) else {
            self.isLoading = false
            self.returnedError = true
            self.errorMessage = "Please enter numeric values for age, height, and weight."
            return
        }
        
        let heightCm = heightDouble * 2.54
        let weightKg = weightDouble * 0.453592
        
        let bmr: Double
        
        if gender.lowercased() == "male" {
            bmr = 10 * weightKg + 6.25 * heightCm - 5 * Double(ageInt) + 5
        } else if gender.lowercased() == "female" {
            bmr = 10 * weightKg + 6.25 * heightCm - 5 * Double(ageInt) - 161
        } else {
            self.isLoading = false
            self.returnedError = true
            self.errorMessage = "Please specify sex as 'male' or 'female'."
            return
        }
        
        let roundedBMR = Int(round(bmr))
        
        let proteinRec = Int(round(weightDouble))
        let proteinCals = proteinRec * 4
        
        let fatRec = Int(round(weightKg * 1.2))
        let fatCals = fatRec * 9
        
        let carbsCals = Int(bmr) - proteinCals - fatCals
        let carbsRec = Int(round(Double(carbsCals / 4)))
        
        let newNutritionPlan = NutritionPlan(
            bmr: roundedBMR,
            protein: proteinRec,
            fat: fatRec,
            carbs: carbsRec
        )
        
        if let encodedData = try? JSONEncoder().encode(newNutritionPlan) {
            print("SAVING NUTRITION PLAN")
            UserDefaults.standard.set(encodedData, forKey: "nutritionPlan")
        }
    }
}
