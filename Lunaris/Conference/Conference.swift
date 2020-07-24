//
//  Conference.swift
//  Lunaris
//
//  Created by T放 on 16/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI
import CoreData

extension Conference: Identifiable {
    
    static func withTopic (_ topic: String, context: NSManagedObjectContext) -> Conference {
        let request = fetchRequest(NSPredicate(format: "topic_ = %@", topic))
        let result = (try? context.fetch(request)) ?? []
        if let conference = result.first {
            return conference
        } else {
            let conference = Conference(context: context)
            conference.topic = topic
            
            // Info will be updated when the corresponding module is being updated
            
            do {
                try context.save()
            } catch(let error) {
                print("couldn't save Conference to CoreData: \(error.localizedDescription)")
            }
            return conference
        }
    }
    
    static func update(topic: String, link: String, meetingDate: Date, moduleName: String, context: NSManagedObjectContext) {
        let conference = Conference.withTopic(topic, context: context)
        
        conference.link = link
        conference.meetingDate = meetingDate
        conference.module = Module.withName(moduleName, context: context)
        
        try? context.save()
    }
    
    
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<Conference> {
        let request = NSFetchRequest<Conference>(entityName: "Conference")
        request.sortDescriptors = [NSSortDescriptor(key: "meetingDate_", ascending: false)]
        request.predicate = predicate
        return request
    }

    
    var topic: String {
        get{ topic_! }
        set{ topic_ = newValue}
    }
    
    var link: String {
        get{ link_! }
        set{ link_ = newValue}
    }
    
    var meetingDate: Date {
        get{ meetingDate_! }
        set{ meetingDate_ = newValue }
    }
    
    var module: Module {
        get { module_!}
        set { module_ = newValue}
    }
}
