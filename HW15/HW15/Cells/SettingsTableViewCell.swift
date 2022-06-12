//
//  SettingsTableViewCell.swift
//  HW15
//
//  Created by Sergey Bodnar on 12.06.2022.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    static let identifier = "SettingsTableViewCell"
    
    // MARK: - Views

    private lazy var viewContainerTableViewCell: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var textTableViewCell: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    private lazy var iconContainerTableViewCell: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
       // view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var iconTableViewCell: UIImageView = {
        let image = UIImageView()
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
        
    private lazy var switchAirplane: UISwitch = {
        var switchAirplane = UISwitch()
        
        return switchAirplane
    }()
    
    private lazy var infoWiFi: UILabel = {
        var infoWiFi = UILabel()
        
        infoWiFi.font = .systemFont(ofSize: 16)
        infoWiFi.textAlignment = .right
        infoWiFi.text = "Не подключено"
        infoWiFi.isEnabled = false
        
        return infoWiFi
    }()
    
    
    private lazy var infoMain: UIButton = {
        var infoMain = UIButton(frame: .zero)

//        infoMain.backgroundColor = .red
//        infoMain.layer.cornerRadius = infoMain.frame.height/2
//        infoMain.setTitle("1", for: .normal)
        
        return infoMain
    }()
    
    
    private lazy var infoBluetooth: UILabel = {
        var infoBluetooth = UILabel()
        
        infoBluetooth.font = .systemFont(ofSize: 16)
        infoBluetooth.textAlignment = .right
        infoBluetooth.text = "Вкл."
        infoBluetooth.isEnabled = false
        
        return infoBluetooth
    }()
    
    private lazy var switchVPN: UISwitch = {
        var switchVPN = UISwitch()
        return switchVPN
    }()
  
    // MARK: - Initial
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(viewContainerTableViewCell)
        iconContainerTableViewCell.addSubview(iconTableViewCell)
        viewContainerTableViewCell.addSubview(iconContainerTableViewCell)
        viewContainerTableViewCell.addSubview(textTableViewCell)
        
        
        contentView.clipsToBounds = true
        //accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews () {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        viewContainerTableViewCell.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
        iconContainerTableViewCell.frame = CGRect(x: 10, y: 6, width: size, height: size)
        
        //let iconSize: CGFloat = size/1.5
        iconTableViewCell.frame = CGRect (x: 0, y: 0, width: iconContainerTableViewCell.frame.width, height: iconContainerTableViewCell.frame.height)
        //iconTableViewCell.center = iconContainerTableViewCell.center
        
        textTableViewCell.frame = CGRect (
            x: 15 + iconContainerTableViewCell.frame.size.width,
            y: 0,
            width: viewContainerTableViewCell.frame.size.width - 15 - iconContainerTableViewCell.frame.size.width,
            height: viewContainerTableViewCell.frame.size.height
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewContainerTableViewCell.backgroundColor = nil
        iconContainerTableViewCell.backgroundColor = nil
        iconTableViewCell.image = nil
        textTableViewCell.text = nil
    }
    
    
    func configure(with cell: TableCell) {
        var accessoryCell: UIView!
        
        iconTableViewCell.image = UIImage(named: cell.imageCell)
        textTableViewCell.text = cell.textCell
        
        switch cell.textCell  {
        case "Авиарежим":
            accessoryCell = switchAirplane
        case "Wi-Fi":
            accessoryType = .disclosureIndicator
            accessoryCell = infoWiFi
        case "Bluetooth":
            accessoryType = .disclosureIndicator
            accessoryCell = infoBluetooth
        case "VPN":
            accessoryCell = switchVPN
        case "Основные":
            accessoryType = .disclosureIndicator
            accessoryCell = infoMain
        default:
            accessoryType = .disclosureIndicator
            accessoryCell = nil
        }
        
//        guard let accessoryCell = accessoryCell else { return }
//        iconTableViewCell.addSubview(accessoryCell)
//        accessoryCell.translatesAutoresizingMaskIntoConstraints = false

//        NSLayoutConstraint.activate([
//            accessoryCell.centerYAnchor.constraint(equalTo: iconTableViewCell.centerYAnchor),
//            accessoryCell.heightAnchor.constraint(equalTo: iconTableViewCell.heightAnchor),
//            accessoryCell.trailingAnchor.constraint(equalTo: iconTableViewCell.trailingAnchor)
//        ])
    }
}
//MARK: - Constants

extension SettingsTableViewCell {
    enum Metric {
        
    }
    
    enum Strings {
        
    }
}
