//
//  cuicell.swift
//  firstapp
//
//  Created by ww on 15/8/6.
//  Copyright (c) 2015年 ww. All rights reserved.
//

import UIKit

class cuicell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
