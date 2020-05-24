//
//  CoursesTableViewController.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 19/5/20.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//  https://www.tutlane.com/tutorial/ios/ios-uitableview-custom-cell-with-image

import UIKit

class CoursesTableViewController: UITableViewController, UISearchBarDelegate, DatabaseListener{
    
    weak var databaseController: DatabaseProtocol?
    var listenerType: ListenerType = .all
    
    let SECTION_COURSE = 0
    let CELL_COURSE = "courseCell"
    
    var currentCourses: [Course] = []
    var filteredCourses: [Course] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        databaseController = appDelegate.databaseController
        
        navigationController?.navigationBar.barTintColor = UIColor.systemTeal
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search courses..."
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
            filteredCourses = currentCourses.filter({ (course: Course) -> Bool in
                guard let courseName = course.courseName else {
                    return false
                 }
                  return courseName.lowercased().contains(searchText)
            })
        } else {
            filteredCourses = currentCourses
        }

        tableView.reloadData()
    }
    
    func onCourseListChange(change: DatabaseChange, listCourses: [Course]) {
        currentCourses = listCourses
        tableView.reloadData()
        //updateSearchResults(for: navigationItem.searchController!)
    }
    
    func onTutorListChange(change: DatabaseChange, listTutors: [Tutor]) {

    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currentCourses.count
    }
    
    // set height of cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let courseCell =
            tableView.dequeueReusableCell(withIdentifier: CELL_COURSE, for: indexPath) as! CourseTableViewCell
        let course = currentCourses[indexPath.row]
        
        courseCell.courseCodeLabel.text = course.courseCode
        courseCell.courseNameLabel.text = course.courseName
        courseCell.courseImageView.image = UIImage(named: course.courseImage!)
        
        return courseCell
    }
    


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "courseSegue" {
            let destination = segue.destination as! CourseDetailViewController
            let selectedIndexPath = tableView.indexPathsForSelectedRows?.first
            destination.course = currentCourses[selectedIndexPath!.row]
        }
    }

}
