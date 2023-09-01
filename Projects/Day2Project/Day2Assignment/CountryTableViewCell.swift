//
//  CountryTableViewCell.swift
//  Day2Assignment
//
//  Created by Amali Krigger on 9/1/23.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
   
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
