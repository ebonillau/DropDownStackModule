//
//  DropDownItem.swift
//  NexenDev
//
//  Created by Enrique Miguel Bonilla Untiveros on 18/08/22.
//

import Foundation

public struct DropDownItem: Equatable, Hashable {
    let title: String
    let subtitle: String
    let scheduleItems: [ScheduleItem]
    
    public init(title: String, subtitle: String, scheduleItems: [ScheduleItem]) {
        self.title = title
        self.subtitle = subtitle
        self.scheduleItems = scheduleItems
    }
}
