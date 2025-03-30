//
//  NutritionPlanCells.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/11/25.
//

import SwiftUI

struct NutritionPlanCells: View {
    
    var nutritionPlan: NutritionPlan
    
    var body: some View {
        VStack(spacing: 10) {
            // Calories
            VStack {
                Text("\(nutritionPlan.bmr) calories")
                    .font(Font.FontStyles.title3)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                
                Text("Estimated calorie expenditure")
                    .font(Font.FontStyles.callout)
                    .foregroundStyle(Color.ColorSystem.systemGray)
            }
            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(Color.ColorSystem.systemGray6)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack(spacing: 20) {
                Text("🥩")
                
                VStack(alignment: .leading) {
                    Text("\(nutritionPlan.protein) grams of protein")
                        .font(Font.FontStyles.headline)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                    
                    Text("Recommendation")
                        .font(Font.FontStyles.callout)
                        .foregroundStyle(Color.ColorSystem.systemGray)
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(Color.ColorSystem.systemGray6)
            .clipShape(RoundedRectangle(cornerRadius: 10))
             
            HStack(spacing: 20) {
                Text("🥑")
                
                VStack(alignment: .leading) {
                    Text("\(nutritionPlan.fat) grams of fat")
                        .font(Font.FontStyles.headline)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                    
                    Text("Recommendation")
                        .font(Font.FontStyles.callout)
                        .foregroundStyle(Color.ColorSystem.systemGray)
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(Color.ColorSystem.systemGray6)
            .clipShape(RoundedRectangle(cornerRadius: 10))
                
            HStack(spacing: 20) {
                Text("🍎")
                
                VStack(alignment: .leading) {
                    Text("\(nutritionPlan.carbs) grams of carbs")
                        .font(Font.FontStyles.headline)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                    
                    Text("Recommendation")
                        .font(Font.FontStyles.callout)
                        .foregroundStyle(Color.ColorSystem.systemGray)
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(Color.ColorSystem.systemGray6)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    NutritionPlanCells(nutritionPlan: NutritionPlan(bmr: 1651, protein: 150, fat: 81, carbs: 78))
}
