//
//  TutorTableViewCell.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 2020/5/21.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//

import UIKit

class TutorTableViewCell: UITableViewCell {

    @IBOutlet weak var tutorImageView: UIImageView!
    @IBOutlet weak var tutorNameLabel: UILabel!
    @IBOutlet weak var tutorIntroLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
