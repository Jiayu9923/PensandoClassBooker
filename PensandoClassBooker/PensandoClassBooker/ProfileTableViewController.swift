//
//  ProfileTableViewController.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 19/5/20.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
    let SECTION_USER = 0
    let CELL_USER = "userCell"

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //slef.tabBarController?.tabBar.isHidden = false
        
        navigationController?.navigationBar.barTintColor = UIColor.systemTeal
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        // Set the wallpage if UserDefaults(forKey: "backgroundPicture") is not nil.
        let photo = UserDefaults.init(suiteName: "group.Jiayu.Pensando")?.value(forKey: "photoImage")
        if photo != nil{
            self.photoImageView.image = UIImage(data: photo as! Data)?.alpha(0.8)
            let mainImageView = UIImageView(image:self.photoImageView.image)
            mainImageView.contentMode = .scaleAspectFit
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 1
        }
        else if section == 1{
            return 5
        }
        else {
            return 3
        }
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

extension UIImage {
    
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
