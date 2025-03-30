//
//  SegmentCell.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/17/25.
//

import SwiftUI

struct SegmentCell: View {
    
    var segment: RunSegment
    
    var body: some View {
        HStack(alignment: .top, spacing: 4) {
            VStack(alignment: .leading, spacing: 4) {
                Text("\(segment.segmentType.asString)")
                    .frame(alignment: .topLeading)
                    .font(Font.FontStyles.headline)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                
                if let reps = segment.reps {
                    Text("\(reps) \(reps == 1 ? "rep" : "reps") of:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(Font.FontStyles.body)
                        .foregroundStyle(Color.ColorSystem.systemGray)
                }
                
                Text(segment.description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.FontStyles.body)
                    .foregroundStyle(Color.ColorSystem.systemGray)
            }
            
            Spacer()
        }
        .padding(0)
        .listRowBackground(Color.ColorSystem.systemGray6)
    }
}

#Preview {
    List {
        SegmentCell(segment: RunSegment(segmentType: .Warmup, distance: 2, description: "2 miles in zone 2."))
    }
    .listStyle(.insetGrouped)
}
