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
    @IBOutlet weak var courseTutorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //slef.tabBarController?.tabBar.isHidden = true
        
        navigationController?.navigationBar.barTintColor = UIColor.systemTeal
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        //self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.title = course!.courseCode
        
        guard let course = course else {
        return
        }
        
        
        courseImageView.image = UIImage(named: course.courseImage!)
        courseCodeLabel.text = course.courseCode
        courseNameLabel.text = course.courseName
        courseIntroLabel.text = "Introduction: \(String(describing: course.courseIntro!))"
        courseTutorLabel.text = "Tutors: "
        //courseTutorLabel.text = "Tutors: \(String(describing: course.courseTutor.tutorName!))"

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
    

}
