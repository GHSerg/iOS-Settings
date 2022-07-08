//
//  SettingsTableViewCell.swift
//  HW15
//
//  Created by Sergey Bodnar on 12.06.2022.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    static let identifier = "SettingsTableViewCell"

    // MARK: - Elements

    private lazy var stackViewHorizontal: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var accessoryTableViewCell: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var switchAirplane: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        return mySwitch
    }()

    private lazy var infoWiFi: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .right
        label.text = "Не подключено"
        label.isEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var infoMainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.layer.cornerRadius = 15
        button.setTitle("1", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var infoBluetoothLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .right
        label.text = "Вкл."
        label.isEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var switchVPN: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        return mySwitch
    }()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stackViewHorizontal)
        stackViewHorizontal.addArrangedSubview(iconImageView)
        stackViewHorizontal.addArrangedSubview(nameLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        accessoryTableViewCell.removeFromSuperview()
    }

    override func layoutSubviews () {
        super.layoutSubviews()

        NSLayoutConstraint.activate([
            stackViewHorizontal.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Metric.stackViewHTopConstraintContentView
            ),
            stackViewHorizontal.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: Metric.stackViewHBottomConstraintContentView
            ),
            stackViewHorizontal.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Metric.stackViewHLeadingConstraintContentView
            ),
            stackViewHorizontal.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Metric.stackViewHTrailingConstraintContentView
            ),
            iconImageView.heightAnchor.constraint(equalToConstant: Metric.iconImageViewSize),
            iconImageView.widthAnchor.constraint(equalToConstant: Metric.iconImageViewSize)
        ])
    }

    // MARK: - Configure

    func configure(with cell: TableCell) {

        iconImageView.image = UIImage(named: cell.imageCell)
        nameLabel.text = cell.textCell

        switch cell.textCell {
        case "Авиарежим":
            accessoryTableViewCell = switchAirplane
        case "Wi-Fi":
            accessoryType = .disclosureIndicator
            accessoryTableViewCell = infoWiFi
        case "Bluetooth":
            accessoryType = .disclosureIndicator
            accessoryTableViewCell = infoBluetoothLabel
        case "VPN":
            accessoryTableViewCell = switchVPN
        case "Основные":
            accessoryType = .disclosureIndicator
            accessoryTableViewCell = infoMainButton
        default:
            accessoryType = .disclosureIndicator
            accessoryTableViewCell = UIView()
        }
        stackViewHorizontal.addArrangedSubview(accessoryTableViewCell)
    }
}

// MARK: - Metrics

extension SettingsTableViewCell {
    enum Metric {
        static let iconImageViewSize: CGFloat = 32
        static let stackViewHTopConstraintContentView: CGFloat = 6
        static let stackViewHBottomConstraintContentView: CGFloat = -6
        static let stackViewHLeadingConstraintContentView: CGFloat = 10
        static let stackViewHTrailingConstraintContentView: CGFloat = -10
    }
}
