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
        
        conference.id = UUID()
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
    
    static func clearPendingNotification(for conference: Conference) {
        center.removePendingNotificationRequests(withIdentifiers: [conference.id!.uuidString])
    }
    
    static func addNotification(for conference: Conference) {
        Conference.clearPendingNotification(for: conference)
        let content = UNMutableNotificationContent()
        content.title = conference.topic
        content.subtitle = conference.link
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "Conference Action"
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: conference.meetingDate)
        
        //            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: conference.id!.uuidString, content: content, trigger: trigger)
        center.add(request)
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
