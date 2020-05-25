//
//  TutorsTableViewController.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 19/5/20.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//  https://www.tutlane.com/tutorial/ios/ios-uitableview-custom-cell-with-image

import UIKit

class TutorsTableViewController: UITableViewController, UISearchResultsUpdating, DatabaseListener {
    
    weak var databaseController: DatabaseProtocol?
    var listenerType: ListenerType = .all
    
    let SECTION_TUTOR = 0
    let CELL_TUTOR = "tutorCell"
    
    var currentTutors: [Tutor] = []
    var filteredTutors: [Tutor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        databaseController = appDelegate.databaseController
        
        filteredTutors = currentTutors
        
        navigationController?.navigationBar.barTintColor = UIColor.systemTeal
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search tutors by name..."
        searchController.searchBar.backgroundColor = UIColor.white
        navigationItem.searchController = searchController
        
        // Make sure search bar is always visible.
        navigationItem.hidesSearchBarWhenScrolling = false
        
        definesPresentationContext = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // add/remove the VC as a listener of the database controller
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        databaseController?.addListener(listener: self)
        
    }
    
    // add/remove the VC as a listener of the database controller
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        databaseController?.removeListener(listener: self)
        
    }
    
    // MARK: - Search Controller Delegate
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else {
            return
        }

        if searchText.count > 0 {
            filteredTutors = currentTutors.filter({ (tutor: Tutor) -> Bool in
                guard let tutorName = tutor.tutorName else {
                    return false
                 }
                  return tutorName.lowercased().contains(searchText)
            })
        } else {
            filteredTutors = currentTutors
        }

        tableView.reloadData()
    }
    
    func onCourseListChange(change: DatabaseChange, listCourses: [Course]) {
        
    }
    
    func onTutorListChange(change: DatabaseChange, listTutors: [Tutor]) {
        currentTutors = listTutors
        updateSearchResults(for: navigationItem.searchController!)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredTutors.count
    }
    
    // set height of cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tutorCell =
            tableView.dequeueReusableCell(withIdentifier: CELL_TUTOR, for: indexPath)
            as! TutorTableViewCell
        let tutor = filteredTutors[indexPath.row]
        
        tutorCell.tutorNameLabel.text = tutor.tutorName
        tutorCell.tutorIntroLabel.text = tutor.tutorIntro
        tutorCell.tutorImageView.image = UIImage(named: tutor.tutorImage!)
        
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
     // Override to support editing the table velete the row from the data source
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tutorSegue" {
            let destination = segue.destination as! TutorDetailViewController
            let selectedIndexPath = tableView.indexPathsForSelectedRows?.first
            destination.tutor = currentTutors[selectedIndexPath!.row]
        }
    }
}
