//
//  Settings.swift
//  HW15
//
//  Created by Sergey Bodnar on 11.06.2022.
//

import Foundation

struct SettingsTable {
    var sectionsTable: [SectionTable]
}

struct SectionTable {
    var nameSection: String
    var tableCell: [TableCell]
}

struct TableCell {
    var imageCell: String
    var textCell: String
}
