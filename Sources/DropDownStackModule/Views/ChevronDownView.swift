//
//  ChevronDownView.swift
//  
//
//  Created by Enrique Miguel Bonilla Untiveros on 18/08/22.
//

import SwiftUI

struct ChevronDownView: View {
    
    @Binding var show: Bool

    var body: some View {
        Image(systemName: "chevron.down")
            .font(.title3)
            .rotationEffect(.degrees(show ? 180 : 0))
    }
    
}
