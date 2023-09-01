//
//  SettingsTableViewCell.swift
//  Day2Assignment
//
//  Created by Amali Krigger on 8/31/23.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var settingsState: UILabel!
    @IBOutlet weak var settingsName: UILabel!
    @IBOutlet weak var settingsIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
