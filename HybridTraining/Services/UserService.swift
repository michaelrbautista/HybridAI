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
    
    // MARK: Get user
    public func getUser(uid: String) async throws -> User {
        do {
            let user: User = try await SupabaseService.shared.supabase
                .from("users")
                .select(
                    """
                        id,
                        created_at,
                        email
                    """
                )
                .eq("id", value: uid)
                .single()
                .execute()
                .value
            
            return user
        } catch {
            print("Couldn't get user")
            throw error
        }
    }
    
    // MARK: Create user
    public func createUser(user: User) async throws -> User {
        do {
            let user: User = try await SupabaseService.shared.supabase
                .from("users")
                .insert(user)
                .select(
                    """
                        id,
                        created_at,
                        email
                    """
                )
                .single()
                .execute()
                .value
            
            return user
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
