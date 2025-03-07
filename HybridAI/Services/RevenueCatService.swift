//
//  RevenueCatService.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/27/25.
//

import SwiftUI
import RevenueCat

final class RevenueCatService {
    
    public static let shared = RevenueCatService()
    
    init() {
        Purchases.logLevel = .debug
        Purchases.configure(withAPIKey: "appl_TiLqyOFybDZSeFcUaHdcpnoEIiS")
    }
    
}
