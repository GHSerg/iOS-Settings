//
//  SettingsController.swift
//  HW15
//
//  Created by Sergey Bodnar on 11.06.2022.
//

import UIKit


final class SettingsController: UIViewController {

    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view = SettingsView()

    }
}
