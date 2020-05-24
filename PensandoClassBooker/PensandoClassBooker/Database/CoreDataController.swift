//
//  CoreDataController.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 2020/5/24.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//

import UIKit
import CoreData

class CoreDataController: NSObject, NSFetchedResultsControllerDelegate, DatabaseProtocol {

    var listeners = MulticastDelegate<DatabaseListener>()
    var persistentContainer: NSPersistentContainer
    // Fetched Results Controllers
    var allCoursesFetchedResultsController: NSFetchedResultsController<Course>?
    var allTutorsFetchedResultsController: NSFetchedResultsController<Tutor>?    
    
    override init() {
        // Load the Core Data Stack
        persistentContainer = NSPersistentContainer(name: "CourseTutor")
        persistentContainer.loadPersistentStores() { (description, error) in
            if let error = error {
            fatalError("Failed to load Core Data stack:\(error)")
            }
        }
            
        super.init()
            
            if fetchAllCourses().count == 0 {
                createDefaultCourses()
                print("add successfully")
            }
            
            if fetchAllTutors().count == 0{
                createDefaultTutors()
                print("get successfully")
            }
    }
    
    
    func saveContext() {
        if persistentContainer.viewContext.hasChanges {
            do {
                try persistentContainer.viewContext.save()
            } catch {
                fatalError("Failed to save to CoreData: \(error)")
            }
        }
    }

    
    func cleanup() {
        saveContext()
    }
    
    
    func Course(courseCode: String, courseName: String, courseIntro: String, courseImage: String) -> Course {
        let course = NSEntityDescription.insertNewObject(forEntityName: "Course",
            into: persistentContainer.viewContext) as! Course
        course.courseName = courseName
        course.courseCode = courseCode
        course.courseIntro = courseIntro
        course.courseImage = courseImage
        
        return course
    }
    
    
    func Tutor(tutorName: String, tutorIntro: String, tutorImage: String, gender: String, age: String) -> Tutor {
        let tutor = NSEntityDescription.insertNewObject(forEntityName: "Tutor",
            into: persistentContainer.viewContext) as! Tutor
        tutor.tutorName = tutorName
        tutor.tutorIntro = tutorIntro
        tutor.tutorImage = tutorImage
        tutor.gender = gender
        tutor.age = age
        
        return tutor
    }
    
    
    func addTutorToCourse(course: Course, tutorName: String, tutorIntro: String, tutorImage: String, gender: String, age: String) -> Bool {
            guard let tutor = course.courseTutor, tutor.contains(tutor) == false else {
                return false
            }
            
            course.addToCourseTutor(Tutor(tutorName: tutorName, tutorIntro: tutorIntro, tutorImage: tutorImage, gender: gender, age: age))
            return true
    }
    
    
    func addListener(listener: DatabaseListener) {
        listeners.addDelegate(listener)
        if listener.listenerType == .course || listener.listenerType == .all { listener.onCourseListChange(change: .update, listCourses: fetchAllCourses())
        }
        if listener.listenerType == .tutor || listener.listenerType == .all { listener.onTutorListChange(change: .update, listTutors: fetchAllTutors())
        }
    }

    func removeListener(listener: DatabaseListener) {
        listeners.removeDelegate(listener)
    }
    
    // MARK: - Fetched Results Controller Protocol Functions
    func controllerDidChangeContent(_ controller:
    NSFetchedResultsController<NSFetchRequestResult>) {
        if controller == allCoursesFetchedResultsController { listeners.invoke { (listener) in
            if listener.listenerType == .course || listener.listenerType == .all { listener.onCourseListChange(change: .update, listCourses: fetchAllCourses())
                }
            }
        }
        if controller == allTutorsFetchedResultsController { listeners.invoke { (listener) in
            if listener.listenerType == .tutor || listener.listenerType == .all { listener.onTutorListChange(change: .update, listTutors: fetchAllTutors())
                }
            }
        }
    }
    
    
    // MARK: - Core Data Fetch Requests
    
    func fetchAllCourses() -> [Course] {
    // If results controller not currently initialized
        if allCoursesFetchedResultsController == nil {
            let fetchRequest: NSFetchRequest<Course> = Course.fetchRequest()
            // Sort by name
            let nameSortDescriptor = NSSortDescriptor(key: "courseName", ascending: true)
            fetchRequest.sortDescriptors = [nameSortDescriptor]
    // Initialize Results Controller
            allCoursesFetchedResultsController =
                NSFetchedResultsController<Course>(fetchRequest:
                fetchRequest, managedObjectContext: persistentContainer.viewContext,
                sectionNameKeyPath: nil, cacheName: nil)
    // Set this class to be the results delegate
            allCoursesFetchedResultsController?.delegate = self
            
            do {
                try allCoursesFetchedResultsController?.performFetch()
            } catch {
                print("Fetch Request Failed: \(error)")
            }
        }
        var courses = [Course]()
            
        if allCoursesFetchedResultsController?.fetchedObjects != nil {
            courses = (allCoursesFetchedResultsController?.fetchedObjects)!
        }
        return courses
    }
        
    func fetchAllTutors() -> [Tutor] {
    // If results controller not currently initialized
        if allTutorsFetchedResultsController == nil {
            let fetchRequest: NSFetchRequest<Tutor> = Tutor.fetchRequest()
            // Sort by name
            let nameSortDescriptor = NSSortDescriptor(key: "tutorName", ascending: true)
            fetchRequest.sortDescriptors = [nameSortDescriptor]
    // Initialize Results Controller
            allTutorsFetchedResultsController =
                NSFetchedResultsController<Tutor>(fetchRequest:
                fetchRequest, managedObjectContext: persistentContainer.viewContext,
                sectionNameKeyPath: nil, cacheName: nil)
    // Set this class to be the results delegate
            allTutorsFetchedResultsController?.delegate = self
            
            do {
                try allTutorsFetchedResultsController?.performFetch()
            } catch {
                print("Fetch Request Failed: \(error)")
            }
        }
        var tutors = [Tutor]()
            
        if allTutorsFetchedResultsController?.fetchedObjects != nil {
            tutors = (allTutorsFetchedResultsController?.fetchedObjects)!
        }
        return tutors
    }
    

    func createDefaultCourses() {
        let a = Course(courseCode: "FIT1023", courseName: "Fundamental of Python", courseIntro: "This course will teach you how to user Python.", courseImage: "Python")
        _ = addTutorToCourse(course: a, tutorName: "Chloe", tutorIntro: "1111", tutorImage: "11", gender: "Female", age: "21")
        
        let b = Course(courseCode: "FIT3133", courseName: "iOS Development", courseIntro: "This course will teach you how to develop an iOS application.", courseImage: "2100")
        _ = addTutorToCourse(course: b, tutorName: "Emma", tutorIntro: "1111", tutorImage: "11", gender: "Female", age: "21")
        
        let c = Course(courseCode: "FIT2100", courseName: "iOS Development", courseIntro: "This course will teach you how to develop an iOS application.", courseImage: "3155")
        _ = addTutorToCourse(course: c, tutorName: "Emma", tutorIntro: "1111", tutorImage: "11", gender: "Female", age: "21")
    }
    
    func createDefaultTutors() {
        _ = Tutor(tutorName: "Chloe", tutorIntro: "This units will teach you how to use pythong. And qwe ssdd ssd sddf sdw ffef dvdve wfef.", tutorImage: "Emma", gender: "Female", age: "21")
        
        _ = Tutor(tutorName: "Anna", tutorIntro: "This units will teach you how to develop an iOS application. And qwe ssdd ssd sddf sdw ffef dvdve wfef.", tutorImage: "ChloeBrown", gender: "Male", age: "26")
    }
}
