//
//  Tutor.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 2020/5/21.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//

import UIKit

class Tutor: NSObject {
    
    var tutorName: String
    var tutorIntro: String
    var tutorImage: UIImage
    
    init(tutorName: String, tutorIntro: String, tutorImage: UIImage) {
        self.tutorName = tutorName
        self.tutorIntro = tutorIntro
        self.tutorImage = tutorImage
    }

}
