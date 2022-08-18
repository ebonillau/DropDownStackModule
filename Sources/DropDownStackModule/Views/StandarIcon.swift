//
//  File.swift
//  
//
//  Created by Enrique Miguel Bonilla Untiveros on 18/08/22.
//

import SwiftUI

struct StandarIcon: View {

    var iconName: String = "cross"
    var backgroundColor: Color = Color.theme.white
    
    var body: some View {
        Image(systemName: iconName)
            .resizable()
            .scaledToFit()
            .frame(width: 26, height: 26)
            .background(
                Rectangle()
                    .cornerRadius(8)
                    .foregroundColor(backgroundColor)
                    .frame(width: 40, height: 40)
            )
    }
}
