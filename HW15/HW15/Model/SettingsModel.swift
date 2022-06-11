//
//  SettingsModel.swift
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

var settingsTable =
SettingsTable(sectionsTable: [
    SectionTable(nameSection: "", tableCell: [
        TableCell(imageCell: "airplane.mode", textCell: "Авиарежим"),
        TableCell(imageCell: "wifi", textCell: "Wi-Fi"),
        TableCell(imageCell: "bluetooth", textCell: "Bluetooth"),
        TableCell(imageCell: "cellular", textCell: "Сотовая связь"),
        TableCell(imageCell: "modem", textCell: "Режим модема"),
        TableCell(imageCell: "vpn", textCell: "VPN")]),
    
    SectionTable(nameSection: "", tableCell: [
        TableCell(imageCell: "notifications", textCell: "Уведомления"),
        TableCell(imageCell: "sounds", textCell: "Звуки, тактильные сигналы"),
        TableCell(imageCell: "focus", textCell: "Фокусирование"),
        TableCell(imageCell: "screen.time", textCell: "Экранное время")]),
    
    SectionTable(nameSection: "", tableCell: [
        TableCell(imageCell: "main", textCell: "Основные"),
        TableCell(imageCell: "command.center", textCell: "Пункт управления"),
        TableCell(imageCell: "screen.and.brightness", textCell: "Экран и яркость"),
        TableCell(imageCell: "screen.home", textCell: "Экран «Домой»"),
        TableCell(imageCell: "universal.access", textCell: "Универсальный доступ"),
        TableCell(imageCell: "wallpaper", textCell: "Обои"),
        TableCell(imageCell: "siri", textCell: "Уведомления"),
        TableCell(imageCell: "faceid", textCell: "Уведомления"),
        TableCell(imageCell: "SOS", textCell: "Звуки, тактильные сигналы"),
        TableCell(imageCell: "contact", textCell: "Фокусирование"),
        TableCell(imageCell: "battery", textCell: "Экранное время"),
        TableCell(imageCell: "confidentiality", textCell: "Звуки, тактильные сигналы")])
])
