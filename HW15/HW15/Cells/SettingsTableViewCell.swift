//
//  SettingsTableViewCell.swift
//  HW15
//
//  Created by Sergey Bodnar on 12.06.2022.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    @IBOutlet weak var imageTableViewCell: UIImageView!
    @IBOutlet weak var textTableViewCell: UILabel!
    @IBOutlet weak var viewTableViewCell: UIView!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        viewTableViewCell.subviews.forEach { $0.removeFromSuperview() }
    }
        
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
    
    
    func configure(with cell: TableCell) {
        var accessoryCell: UIView!
        
        imageTableViewCell.image = UIImage(named: cell.imageCell)
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
        
        guard let accessoryCell = accessoryCell else { return }
        viewTableViewCell.addSubview(accessoryCell)
        accessoryCell.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            accessoryCell.centerYAnchor.constraint(equalTo: viewTableViewCell.centerYAnchor),
            accessoryCell.heightAnchor.constraint(equalTo: viewTableViewCell.heightAnchor),
            accessoryCell.trailingAnchor.constraint(equalTo: viewTableViewCell.trailingAnchor)
        ])
    }
}
/*
class SettingsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
*/
