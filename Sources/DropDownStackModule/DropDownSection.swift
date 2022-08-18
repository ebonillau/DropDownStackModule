//
//  DropDownSection.swift
//  NexenDev
//
//  Created by Enrique Miguel Bonilla Untiveros on 18/08/22.
//

import SwiftUI

struct DropDownSection: View {

    @Binding var dropDownItem: DropDownItem
    @Binding var selectedScheduleItem: ScheduleItem?
    @Binding var selectedDropDownItem: DropDownItem?
    @State var isShowing: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    TextMedium(dropDownItem.title)
                    TextMedium(dropDownItem.subtitle)
                        .foregroundColor(Color.theme.accent)
                }
                Spacer(minLength: 0)
                ChevronDownView(show: $isShowing)
                    .padding(.top, 10)
            }
            .onTapGestureForced {
                selectedScheduleItem = nil
                isShowing.toggle()
                selectedDropDownItem = dropDownItem
            }
            if isShowing && (selectedDropDownItem == dropDownItem) {
                VStack(spacing: 13) {
                    ForEach(dropDownItem.scheduleItems, id: \.self) { type in
                        TextSelectedCell(scheduleType: ScheduleItem(name: type.name, iconName: type.iconName), selectedScheduleType: $selectedScheduleItem)
                    }
                }
            }
        }
        .animation(.default)
        .padding(.horizontal, 20)
        .onChange(of: selectedDropDownItem) { newValue in
            if selectedDropDownItem != dropDownItem {
                isShowing = false
            }
        }
    }
}

struct DropDownSection_Previews: PreviewProvider {
    
    static func getClinicServices() -> [ScheduleItem] {
        var scheduleTypes: [ScheduleItem] = []
        scheduleTypes.append(contentsOf: [
            ScheduleItem(name: "Agendar Campo", iconName: "person"),
            ScheduleItem(name: "Agendar Restaurante", iconName: "person")
        ])
        return scheduleTypes
    }
    
    static var dropDownItem: DropDownItem = DropDownItem(title: "Title", subtitle: "Subtitle", scheduleItems: getClinicServices())
    
    static var previews: some View {
        VStack {
            Divider()
            DropDownSection(dropDownItem: .constant(dropDownItem),
                            selectedScheduleItem: .constant(getClinicServices().first!), selectedDropDownItem: .constant(dropDownItem))
            .padding(.vertical)
            Divider()
            Spacer()
        }
        .background(Color.white)
    }
}


