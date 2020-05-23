//
//  TutorDetailViewController.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 2020/5/23.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//

import UIKit

class TutorDetailViewController: UIViewController {
    
    var tutor: Tutor?

    @IBOutlet weak var tutorImageView: UIImageView!
    @IBOutlet weak var tutorNameLabel: UILabel!
    @IBOutlet weak var tutorIntroLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.systemTeal
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        self.navigationItem.title = tutor!.tutorName
        
        guard let tutor = tutor else {
        return
        }
        
        tutorImageView.image = tutor.tutorImage
        tutorNameLabel.text = tutor.tutorName
        tutorIntroLabel.text = "Introduction: \(tutor.tutorIntro)"

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
