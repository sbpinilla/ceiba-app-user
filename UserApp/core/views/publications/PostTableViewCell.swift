//
//  PostTableViewCell.swift
//  UserApp
//
//  Created by Sergio Pinilla on 13/11/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblPostName: UILabel!
    @IBOutlet weak var lblPostText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
