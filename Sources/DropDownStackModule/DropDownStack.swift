//
//  DropDownStack.swift
//  NexenDev
//
//  Created by Enrique Miguel Bonilla Untiveros on 18/08/22.
//

import SwiftUI

public struct DropDownStack: View {

    @Binding var dropDownItems: [DropDownItem]
    @Binding var selectedScheduleItem: ScheduleItem?
    @State var selectedDropDownItem: DropDownItem?
    
    public init(dropDownItems: Binding<[DropDownItem]>,
                selectedScheduleItem: Binding<ScheduleItem?>,
                selectedDropDownItem: DropDownItem?) {
        self._dropDownItems = dropDownItems
        self._selectedScheduleItem = selectedScheduleItem
        self.selectedDropDownItem = selectedDropDownItem
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach($dropDownItems, id: \.self) { item in
                VStack(alignment: .leading, spacing: 20) {
                    DropDownSection(dropDownItem: item,
                                    selectedScheduleItem: $selectedScheduleItem,
                                    selectedDropDownItem: $selectedDropDownItem)
                    Divider()
                }
            }
            Spacer(minLength: 0)
        }
    }
}

struct DropDownStack_Previews: PreviewProvider {

    static private func getMedicalAppointmentsDropDownItem() -> DropDownItem {
        DropDownItem(title: "Title 1",
                     subtitle: "Subtitle 1",
                     scheduleItems: getMedicalAppointments())
    }

    static private func getMedicalAppointments() -> [ScheduleItem] {
        var scheduleTypes: [ScheduleItem] = []
        scheduleTypes.append(contentsOf: [
            ScheduleItem(name: "Agendar 1", iconName: "note.text"),
            ScheduleItem(name: "Agendar 2", iconName: "person")
        ])
        return scheduleTypes
    }

    static private func getClinicServicesDropDownItem() -> DropDownItem {
        DropDownItem(title: "Title 2",
                     subtitle: "Subtitle 2",
                     scheduleItems: getClinicServices())
    }

    static private func getClinicServices() -> [ScheduleItem] {
        var scheduleTypes: [ScheduleItem] = []
        scheduleTypes.append(contentsOf: [
            ScheduleItem(name: "Agendar 3", iconName: "person"),
            ScheduleItem(name: "Agendar 4", iconName: "note.text"),
            ScheduleItem(name: "Agendar 4", iconName: "person")
        ])
        return scheduleTypes
    }

    static var previews: some View {
        DropDownStack(dropDownItems: .constant([getMedicalAppointmentsDropDownItem(),
                                     getClinicServicesDropDownItem()]),
                      selectedScheduleItem: .constant(nil),
                      selectedDropDownItem: nil)
    }
}
