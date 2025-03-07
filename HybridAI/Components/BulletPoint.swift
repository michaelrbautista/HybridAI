//
//  BulletPoint.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/20/25.
//

import SwiftUI

struct BulletPoint: View {
    
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 6)
                .foregroundStyle(Color.ColorSystem.systemGray)
            Text(text)
                .font(Font.FontStyles.body)
                .foregroundStyle(Color.ColorSystem.systemGray)
        }
    }
}

#Preview {
    BulletPoint(text: "Test")
}
