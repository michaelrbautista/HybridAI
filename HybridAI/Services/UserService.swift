//
//  UserService.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI
import Supabase

class UserService {
    
    public static let shared = UserService()
    public static var currentUser: User? = nil
    
    // MARK: Create user
    public func createUser(user: User) async throws {
        do {
            try await SupabaseService.shared.supabase
                .from("users")
                .insert(user)
                .execute()
        } catch {
            print("Error creating user in database")
            throw error
        }
    }
    
    // MARK: Delete user
    public func deleteUser(uid: String) async throws {
        do {
            try await SupabaseService.shared.supabase.rpc("delete_user")
            .execute()
        } catch {
            throw error
        }
    }
    
}
