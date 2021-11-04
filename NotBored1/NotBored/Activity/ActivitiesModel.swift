//
//  ActivitiesModel.swift
//  NotBored
//
//  Created by Joaquin Diego Borsari Marchese on 3/11/21.
//

import Foundation

class ActivitiesModel {
    let activities: [ActivityItem] = [ActivityItem(title: "Education", image: "graduationcap"),
        ActivityItem(title: "Recreational", image: "highlighter"),
        ActivityItem(title: "Social", image: "person.2.fill"),
        ActivityItem(title: "Diy", image: "pencil"),
        ActivityItem(title: "Charity", image: "gift"),
        ActivityItem(title: "Cooking", image: "fork.knife"),
        ActivityItem(title: "Relaxation", image: "gamecontroller"),
        ActivityItem(title: "Music", image: "music.note"),
        ActivityItem(title: "Busywork", image: "desktopcomputer")]
}

struct ActivityItem {
    var title: String
    var image: String
}
