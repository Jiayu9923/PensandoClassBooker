//
//  ClassDetailViewController.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 2020/5/23.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//

import UIKit

class ClassDetailViewController: UIViewController {

    @IBOutlet weak var courseImageView: UIImageView!
    @IBOutlet weak var courseCodeLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var classTimeLabel: UILabel!
    @IBOutlet weak var classTutorLabel: UILabel!
    @IBOutlet weak var mapButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.systemTeal
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

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
