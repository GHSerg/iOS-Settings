//
//  SettingsView.swift
//  HW15
//
//  Created by Sergey Bodnar on 11.06.2022.
//

import UIKit

final class SettingsView: UIView {

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .red
    }
}
