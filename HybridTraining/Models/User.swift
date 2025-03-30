//
//  User.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI

struct User: Codable, Identifiable, Hashable {
    var id: String
    var createdAt: String?
    
    var email: String
    
    enum CodingKeys: String, CodingKey {
        case id, email
        case createdAt = "created_at"
    }
}
