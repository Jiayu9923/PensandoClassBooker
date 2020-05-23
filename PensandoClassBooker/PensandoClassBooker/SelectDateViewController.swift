//
//  SelectDateViewController.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 2020/5/23.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//

import UIKit

class SelectDateViewController: UIViewController {
    
    var course: Course?

    @IBOutlet weak var courseCodeLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.systemTeal
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        guard let course = course else {
        return
        }
        
        courseCodeLabel.text = course.courseCode
        courseNameLabel.text = course.courseName
        
        //self.tabBarController?.tabBar.isHidden = true

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
