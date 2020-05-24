//
//  DatabaseProtocol.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 2020/5/24.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//

import Foundation

enum DatabaseChange {
    case add
    case remove
    case update
    
}

enum ListenerType {
    case course
    case tutor
    case image
    case all
}

protocol DatabaseListener: AnyObject {
    var listenerType: ListenerType {get set}
    func onCourseListChange(change: DatabaseChange, listCourses: [Course])
    func onTutorListChange(change: DatabaseChange, listTutors: [Tutor])
}

protocol DatabaseProtocol: AnyObject {
    //var defaultTeam: Team {get}
    
    func cleanup()
    func Course(courseCode: String, courseName: String, courseIntro: String, courseImage: String) -> Course
    func Tutor(tutorName: String, tutorIntro: String, tutorImage: String, gender: String, age: String) -> Tutor
    func addTutorToCourse(course: Course, tutorName: String, tutorIntro: String, tutorImage: String, gender: String, age: String) -> Bool
    func addListener(listener: DatabaseListener)
    func removeListener(listener: DatabaseListener)
}
