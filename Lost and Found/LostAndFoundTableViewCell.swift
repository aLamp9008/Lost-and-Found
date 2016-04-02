//
//  LostAndFoundTableViewCell.swift
//  Lost and Found
//
//  Created by Jason Chen on 2/4/2016.
//  Copyright © 2016 JasonAldenVincent. All rights reserved.
//

import UIKit

class LostAndFoundTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDescription: UITextView!
    @IBOutlet weak var callOwner: UIButton!
    @IBOutlet weak var textOwner: UIButton!
    @IBOutlet weak var connectOwner: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
