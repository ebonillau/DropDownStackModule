//
//  ScheduleItem.swift
//  NexenDev
//
//  Created by Enrique Miguel Bonilla Untiveros on 18/08/22.
//

import Foundation

public struct ScheduleItem: Equatable, Hashable {
    let name: String
    let iconName: String
    
    public init(name: String, iconName: String) {
        self.name = name
        self.iconName = iconName
    }
}
