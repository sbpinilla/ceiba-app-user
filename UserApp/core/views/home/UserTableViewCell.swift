//
//  UserTableViewCell.swift
//  UserApp
//
//  Created by Sergio Pinilla on 12/11/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblMail: UILabel!
    @IBOutlet weak var containerView: CardView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        // Configure the view for the selected state
    }

}
