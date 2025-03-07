//
//  SelectPriceRow.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/20/25.
//

import SwiftUI
import RevenueCat

struct SelectPriceRow: View {
    var text: String
    var subtext: String
    var package: Package
    @Binding var selection: Package?
    var onSelect: (() -> Void)
    
    var body: some View {
        Button {
            onSelect()
        } label: {
            HStack {
                if (selection?.id == package.id) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(Color.ColorSystem.systemBackground)
                } else {
                    Image(systemName: "circle")
                        .foregroundStyle(Color.ColorSystem.primaryText)
                }
                
                VStack(alignment: .leading) {
                    Text(text)
                        .font(Font.FontStyles.title3)
                        .foregroundStyle(selection?.id == package.id ? Color.ColorSystem.systemBackground : Color.ColorSystem.primaryText)
                        .multilineTextAlignment(.leading)
                    
                    Text(subtext)
                        .font(Font.FontStyles.callout)
                        .foregroundStyle(selection?.id == package.id ? Color.ColorSystem.systemBackground : Color.ColorSystem.systemGray)
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
            }
            .buttonStyle(.plain)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(selection?.id == package.id ? Color.ColorSystem.primaryText : Color.ColorSystem.systemGray6)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    VStack {
        SelectPriceRow(
            text: "Test option",
            subtext: "Test",
            package: Package(identifier: "asdf", packageType: .monthly, storeProduct: StoreProduct(sk1Product: SK1Product()), offeringIdentifier: ""),
            selection: .constant(Package(identifier: "", packageType: .monthly, storeProduct: StoreProduct(sk1Product: SK1Product()), offeringIdentifier: "")),
            onSelect: {}
        )
        SelectPriceRow(
            text: "Test option",
            subtext: "Test",
            package: Package(identifier: "asdf", packageType: .monthly, storeProduct: StoreProduct(sk1Product: SK1Product()), offeringIdentifier: ""),
            selection: .constant(Package(identifier: "asdf", packageType: .monthly, storeProduct: StoreProduct(sk1Product: SK1Product()), offeringIdentifier: "")),
            onSelect: {}
        )
    }
}
