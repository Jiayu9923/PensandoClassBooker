//
//  Tutor+CoreDataProperties.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 2020/5/25.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//
//

import Foundation
import CoreData


extension Tutor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tutor> {
        return NSFetchRequest<Tutor>(entityName: "Tutor")
    }

    @NSManaged public var tutorName: String?
    @NSManaged public var tutorIntro: String?
    @NSManaged public var gender: String?
    @NSManaged public var age: String?
    @NSManaged public var tutorImage: String?
    @NSManaged public var tutorCourse: NSSet?

}

// MARK: Generated accessors for tutorCourse
extension Tutor {

    @objc(addTutorCourseObject:)
    @NSManaged public func addToTutorCourse(_ value: Course)

    @objc(removeTutorCourseObject:)
    @NSManaged public func removeFromTutorCourse(_ value: Course)

    @objc(addTutorCourse:)
    @NSManaged public func addToTutorCourse(_ values: NSSet)

    @objc(removeTutorCourse:)
    @NSManaged public func removeFromTutorCourse(_ values: NSSet)

}
