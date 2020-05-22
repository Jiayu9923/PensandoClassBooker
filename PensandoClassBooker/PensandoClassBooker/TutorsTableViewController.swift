//
//  TutorsTableViewController.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 19/5/20.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//  https://www.tutlane.com/tutorial/ios/ios-uitableview-custom-cell-with-image

import UIKit

class TutorsTableViewController: UITableViewController, UISearchBarDelegate {
    
    let SECTION_TUTOR = 0
    let CELL_TUTOR = "tutorCell"
    
    var currentTutors: [Tutor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search tutors..."
        navigationItem.searchController = searchController
        
        // Make sure search bar is always visible.
        navigationItem.hidesSearchBarWhenScrolling = false
        
        definesPresentationContext = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currentTutors.count
    }
    
    // set height of cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tutorCell =
            tableView.dequeueReusableCell(withIdentifier: CELL_TUTOR, for: indexPath)
            as! TutorTableViewCell
        let tutor = currentTutors[indexPath.row]
        
        tutorCell.tutorNameLabel.text = tutor.tutorName
        tutorCell.tutorIntroLabel.text = tutor.tutorIntro
        tutorCell.tutorImageView.image = tutor.tutorImage
        
        return tutorCell
    }
    

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
    
    
    // MARK: - Create Defaults
       
    func createDefaultTutors() {
        currentTutors.append(Tutor(tutorName: "FIT1023 - Fundamental of Python", tutorIntro: "This units will teach you how to use pythong. And qwe ssdd ssd sddf sdw ffef dvdve wfef.", tutorImage: UIImage(named: "ChloeBrown")!))
        currentTutors.append(Tutor(tutorName: "FIT3133 - iOS Development", tutorIntro: "This units will teach you how to develop an iOS application. And qwe ssdd ssd sddf sdw ffef dvdve wfef.", tutorImage: UIImage(named: "ChloeBrown")!))
    }

}
