//
//  Announcement.swift
//  Lunaris
//
//  Created by T放 on 16/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI
import CoreData

extension Announcement: Identifiable {
    
    static func withTitle (_ title: String, context: NSManagedObjectContext) -> Announcement {
        let request = fetchRequest(NSPredicate(format: "title_ = %@", title))
        let result = (try? context.fetch(request)) ?? []
        if let announcement = result.first {
            return announcement
        } else {
            let announcement = Announcement(context: context)
            announcement.title = title
            
            // Info will be updated when the corresponding module is being updated
            
            do {
                try context.save()
            } catch(let error) {
                print("couldn't save Announcement to CoreData: \(error.localizedDescription)")
            }
            return announcement
        }
    }
    
    static func update(title: String, body: String, announcedAt: Date, moduleName: String, context: NSManagedObjectContext) {
        let announcement = Announcement.withTitle(title, context: context)
        
        announcement.body = body
        announcement.announcedAt = announcedAt
        announcement.module = Module.withName(moduleName, context: context)
        
        try? context.save()
    }
    
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<Announcement> {
        let request = NSFetchRequest<Announcement>(entityName: "Announcement")
        request.sortDescriptors = [NSSortDescriptor(key: "announcedAt_", ascending: false)]
        request.predicate = predicate
        return request
    }
    
    
    var title: String {
        get{ title_! }
        set{ title_ = newValue}
    }
    
    var body: String {
        get{ body_! }
        set{ body_ = newValue}
    }
    
    var announcedAt: Date {
        get{ announcedAt_!}
        set{ announcedAt_ = newValue}
    }
    
    var module: Module {
        get { module_!}
        set { module_ = newValue}
    }

    
    
}
