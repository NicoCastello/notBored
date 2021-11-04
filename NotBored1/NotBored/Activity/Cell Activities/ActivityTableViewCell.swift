//
//  ActivityTableViewCell.swift
//  NotBored
//
//  Created by Joaquin Diego Borsari Marchese on 3/11/21.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var activityNameLabel: UILabel!
    @IBOutlet weak var activityImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func populate(activityImageName: String, activityTitle: String) {
        activityNameLabel?.text = activityTitle
        activityImage?.image = UIImage(systemName: activityImageName)
    }
    
}
