//
//  Classes.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 2020/5/27.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//

import UIKit

class Classes: NSObject {
    
    var code: String
    var name: String
    var image: String
    var tutor: String
    var address: String
    var time: Date
    
    init(code: String, name: String, image: String, tutor: String, address: String, time: Date) {
        self.code = code
        self.name = name
        self.image = image
        self.tutor = tutor
        self.address = address
        self.time = time
    }
    
    enum CodingKeys: String, CodingKey {
        case code
        case name
        case image
        case tutor
        case address
        case time
    }

}
