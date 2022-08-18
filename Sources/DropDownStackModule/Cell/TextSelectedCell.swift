//
//  TextSelectedCell.swift
//  NexenDev
//
//  Created by Enrique Miguel Bonilla Untiveros on 18/08/22.
//

import SwiftUI

struct TextSelectedCell: View {
    
    let cellHeight: CGFloat = 65
    var scheduleType: ScheduleItem
         
    @Binding var selectedScheduleType: ScheduleItem?

    var body: some View {
        ZStack {
            RoundedRectangleSection(cellHeight: cellHeight,
                                    fillColor: getFillColor())
            HStack(spacing: 20) {
                StandarIcon(iconName: scheduleType.iconName,
                            backgroundColor: Color.theme.card)
                    .foregroundColor(Color.theme.primary)
                TextMedium(scheduleType.name)
                    .foregroundColor(getTextColor())
                Spacer(minLength: 0)
            }
            .padding(.leading, 25)
            .frame(height: cellHeight)
        }
        .animation(.default, value: selectedScheduleType)
        .onTapGestureForced {
            selectedScheduleType = scheduleType
        }
    }
    
    private func getTextColor() -> Color {
        selectedScheduleType == scheduleType ? Color.theme.white : Color.theme.primary
    }
    
    private func getFillColor() -> Color {
        selectedScheduleType == scheduleType ? Color.theme.accent : Color.theme.white
    }
}

struct TextSelectedCell_Previews: PreviewProvider {
    static var previews: some View {
        TextSelectedCell(scheduleType: ScheduleItem(name: "abc", iconName: "xmark"), selectedScheduleType: .constant(nil))
            .background(Color.blue)
    }
}



struct TextMedium: View {
    
    private var text: String = ""
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .fontWeight(.medium)
            .fixedSize(horizontal: false, vertical: true)
    }

}
