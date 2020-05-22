//
//  CourseDetailsTableViewController.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 2020/5/21.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//

import UIKit

class CourseDetailsTableViewController: UITableViewController {
    
    var course: Course?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationItem.title = course!.courseName

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == SECTION_NAME {
//            let nameCell = tableView.dequeueReusableCell(withIdentifier: CELL_NAME,for: indexPath) as! DisplayCell
//            nameCell.nameLabel.text = drink!.name
//            nameCell.quantityLabel.text = ""
//            return nameCell
//        }
//        else if indexPath.section == SECTION_INST {
//            let nameCell = tableView.dequeueReusableCell(withIdentifier: CELL_NAME,for: indexPath) as! DisplayCell
//            nameCell.nameLabel.text = drink!.instruction
//            nameCell.quantityLabel.text = ""
//            return nameCell
//        }
//        else if indexPath.section == SECTION_INGS {
//            let nameCell = tableView.dequeueReusableCell(withIdentifier: CELL_NAME,for: indexPath) as! DisplayCell
//            let ing = drink?.ingredients?.allObjects[indexPath.row] as! IngredientMeasurement
//            nameCell.nameLabel.text = ing.name
//            nameCell.quantityLabel.text = ing.quantity
//            nameCell.quantityLabel.textColor = .secondaryLabel
//            nameCell.accessoryType = .none
//            return nameCell
//        }
//        else{
//            let nameCell = tableView.dequeueReusableCell(withIdentifier: CELL_NAME,for: indexPath) as! DisplayCell
//            nameCell.nameLabel.text = "Add ingredient"
//            nameCell.quantityLabel.text = ""
//            nameCell.nameLabel.textColor = .secondaryLabel
//            return nameCell
//        }
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
