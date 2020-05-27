//
//  SelectDateViewController.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 2020/5/23.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class AddClassViewController: UIViewController {
    
    var course: Course?

    @IBOutlet weak var courseCodeLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var classImageView: UIImageView!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var tutorTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.systemTeal
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        guard let course = course else {
        return
        }
        
        courseCodeLabel.text = course.courseCode
        courseNameLabel.text = course.courseName
        classImageView.image = UIImage(named: course.courseImage!)
        
        //self.tabBarController?.tabBar.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveClasses(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
//
//        let timeText = timeTextField.text
//        let tutorText = tutorTextField.text
//        let addressText = addressTextField.text

//        if timeText != nil && tutorText != nil && addressText != nil {
//            let classes = Classes(code: (course?.courseCode)!, name: (course?.courseName)!, image: (course?.courseImage)!, tutor: tutorText!, address: addressText!, time: dateFormatter.date(from: timeText!)!)
//
//            let classesRef = self.ref.child(timeText!.lowercased(), tutorText!.lowercased(), addressText!.lowercased())
//            classesRef.setValue(classes.toAnyObject())
//        }
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
