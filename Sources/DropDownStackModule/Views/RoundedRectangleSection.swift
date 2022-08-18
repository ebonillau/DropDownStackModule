//
//  RoundedRectangleSection.swift
//  NexenDev
//
//  Created by Enrique Miguel Bonilla Untiveros on 8/08/22.
//

import SwiftUI

struct RoundedRectangleSection: View {

    let cellHeight: CGFloat
    var fillColor: Color = Color.theme.card
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10.0)
            .fill(fillColor)
            .frame(height: cellHeight)
            .shadow(color: Color.gray.opacity(0.15), radius: 10, x: 0, y: 0)
    }
}
