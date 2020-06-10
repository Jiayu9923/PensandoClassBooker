//
//  MyClassTableViewController.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 19/5/20.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MyClassTableViewController: UITableViewController {
    
    @IBOutlet weak var classTypeSegmentedControl: UISegmentedControl!
    var classes: Classes?
    var upcomingClass: [Classes] = []
    var pastClass: [Classes] = []
    let SECTION_CLASS = 0
    let CELL_CLASS = "classCell"
    
    let ref = Database.database().reference(withPath: "Classes")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //slef.tabBarController?.tabBar.isHidden = false

        ref.observe(.value, with: { snapshot in
            print(snapshot.value as Any)
        })
        
        //createDefaultClasses()
        
        navigationController?.navigationBar.barTintColor = UIColor.systemTeal
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
//        Auth.auth().addStateDidChangeListener { auth, user in
//            guard let user = user else { return }
//            self.user = User(authData: user)
//        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return currentClasses.count
        if classTypeSegmentedControl.selectedSegmentIndex == 0{
            return upcomingClass.count
        }
        else {
            return pastClass.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"

//        ref.observe(.value, with: { snapshot in
//            var newItems: [Classes] = []
//
//            for child in snapshot.children {
//                if let snapshot = child as? DataSnapshot,
//                    let classes = Classes(snapshot: snapshot) {
//                    newItems.append(classes)
//                }
//            }
//
//            self.upcomingClass = newItems
//            self.tableView.reloadData()
//        } )
        
        
        let classCell =
            tableView.dequeueReusableCell(withIdentifier: CELL_CLASS, for: indexPath) as! ClassTableViewCell
        let classes = upcomingClass[indexPath.row]

        classCell.courseCodeLabel.text = classes.code
        classCell.courseNameLabel.text = classes.name
        classCell.courseImageView.image = UIImage(named: classes.image)!
        classCell.classTimeLabel.text = dateFormatter.string(from: classes.time as Date)

        return classCell
    }
    

    // set height of cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func createDefaultClasses() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        
        upcomingClass.append(Classes(code: "FIT1023", name: "Fundamental of Python", image: "Python", tutor: "Chloe", address: "1 Mallee Court, Mulgrave, VIC3170, Melbourne, Australia", time: dateFormatter.date(from: "30/05/2020 12:00")!))
        upcomingClass.append(Classes(code: "FIT1023", name: "Fundamental of Python", image: "Python", tutor: "Chloe", address: "1 Mallee Court", time: dateFormatter.date(from: "28/05/2020 15:00")!))
    }

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "classSegue" {
            let destination = segue.destination as! ClassDetailViewController
            let selectedIndexPath = tableView.indexPathsForSelectedRows?.first
            destination.classes = upcomingClass[selectedIndexPath!.row]
        }

    }
    

}
