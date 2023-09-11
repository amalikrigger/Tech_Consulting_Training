//
//  SchoolTableViewCell.swift
//  nyc_school_code_challenge
//
//  Created by Amali Krigger on 9/10/23.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {

    @IBOutlet weak var schoolName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
