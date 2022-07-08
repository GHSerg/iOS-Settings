//
//  SettingsView.swift
//  HW15
//
//  Created by Sergey Bodnar on 11.06.2022.
//

import UIKit

final class SettingsView: UIView {

    // MARK: - Views

    private lazy var settingsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 10)
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)

        tableView.delegate = self
        tableView.dataSource = self

        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

    // MARK: - Initial
    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        commonInit()
    }

    private func commonInit() {
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Settings

    private func setupHierarchy() {
        addSubview(settingsTableView)

    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
        settingsTableView.topAnchor.constraint(equalTo: topAnchor),
        settingsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
        settingsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        settingsTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - Extension
extension SettingsView: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsTable.sectionsTable.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsTable.sectionsTable[section].tableCell.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else { return UITableViewCell()}
        cell.configure(with: settingsTable.sectionsTable[indexPath.section].tableCell[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        print("Нажата ячейка - \(settingsTable.sectionsTable[indexPath.section].tableCell[indexPath.row].textCell)")
    }
}
