//
//  ClassTableViewCell.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 2020/5/23.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//

import UIKit

class ClassTableViewCell: UITableViewCell {

    @IBOutlet weak var courseImageView: UIImageView!
    @IBOutlet weak var courseCodeLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var classTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
