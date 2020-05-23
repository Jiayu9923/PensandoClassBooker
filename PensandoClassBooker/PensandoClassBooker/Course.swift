//
//  Course.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 2020/5/21.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//

import UIKit

class Course: NSObject {
    
    var courseCode: String
    var courseName: String
    var courseIntro: String
    var courseImage: UIImage
    var courseTutors: [Tutor]
    
    init(courseCode: String, courseName: String, courseIntro: String, courseImage: UIImage, courseTutors: [Tutor]) {
        self.courseCode = courseCode
        self.courseName = courseName
        self.courseIntro = courseIntro
        self.courseImage = courseImage
        self.courseTutors = courseTutors
    }

}
