//
//  ProgramService.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/3/25.
//

import SwiftUI
import Supabase

class ProgramService {
    
    public static let shared = ProgramService()
    
    // MARK: Save program
    public func saveProgram(program: CreateProgramRequest) async throws {
        do {
            try await SupabaseService.shared.supabase
                .from("programs")
                .upsert(program)
                .execute()
                .value
        } catch {
            print("Couldn't save new program.")
            print(error)
            throw error
        }
    }
    
    // MARK: Get user's program
    public func getProgram(uid: String) async throws -> Program {
        do {
            let program: Program = try await SupabaseService.shared.supabase
                .from("programs")
                .select(
                    """
                        id,
                        title,
                        content
                    """
                )
                .eq("user_id", value: uid)
                .single()
                .execute()
                .value
            
            return program
        } catch {
            print("Couldn't get user's program.")
            print(error)
            throw error
        }
    }
}
