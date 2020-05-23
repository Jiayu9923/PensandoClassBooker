//
//  CourseDetailViewController.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 2020/5/23.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//

import UIKit

class CourseDetailViewController: UIViewController {
    
    var course: Course?

    @IBOutlet weak var courseCodeLabel: UILabel!
    @IBOutlet weak var courseImageView: UIImageView!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var courseIntroLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.title = course!.courseCode
        
        guard let course = course else {
        return
        }
        
        courseImageView.image = course.courseImage
        courseCodeLabel.text = "\(course.courseCode)"
        courseNameLabel.text = "\(course.courseName)"
        courseIntroLabel.text = "Introduction: \(course.courseIntro)"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
