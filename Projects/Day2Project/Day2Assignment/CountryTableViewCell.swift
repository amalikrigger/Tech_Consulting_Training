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
    var viewModel = CountryViewModel()
    var index:Int?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        viewModel.deleteCountry(index: index ?? 0)
    }

}
