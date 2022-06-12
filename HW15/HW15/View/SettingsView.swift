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
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
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
       // backgroundColor = .red
        
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Settings

    private func setupHierarchy() {
        addSubview(settingsTableView)
     //   addSubview(stackView)
     //   stackView.addArrangedSubview(pageControl)
     //   stackView.addArrangedSubview(buttonView)
    }

    private func setupLayout() {
 //       settingsTableView.frame = superview?.frame ?? CGRect(x: 100, y: 100, width: 100, height: 100)
        
        settingsTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        settingsTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        settingsTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        settingsTableView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true

       // stackView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: Metric.topOffset).isActive = true
       // stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.leftOffset).isActive = true
       // stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Metric.rightOffset).isActive = true
       // stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Metric.bottomOffset).isActive = true

       // buttonView.heightAnchor.constraint(equalToConstant: Metric.buttonHeight).isActive = true
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

     //   print("\(textOutput) - \(settingsTable.sectionsTable[indexPath.section].tableCell[indexPath.row].textCell)")
    }
}
