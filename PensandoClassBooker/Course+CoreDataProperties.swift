//
//  Course+CoreDataProperties.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 2020/5/25.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
//
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var courseName: String?
    @NSManaged public var courseCode: String?
    @NSManaged public var courseIntro: String?
    @NSManaged public var courseImage: String?
    @NSManaged public var courseTutor: NSSet?

}

// MARK: Generated accessors for courseTutor
extension Course {

    @objc(addCourseTutorObject:)
    @NSManaged public func addToCourseTutor(_ value: Tutor)

    @objc(removeCourseTutorObject:)
    @NSManaged public func removeFromCourseTutor(_ value: Tutor)

    @objc(addCourseTutor:)
    @NSManaged public func addToCourseTutor(_ values: NSSet)

    @objc(removeCourseTutor:)
    @NSManaged public func removeFromCourseTutor(_ values: NSSet)

}
