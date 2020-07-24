//
//  Module.swift
//  Lunaris
//
//  Created by T放 on 12/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI
import CoreData
import Contentful

//struct Module: Identifiable {
//    var id = UUID()
//    var name: String
//    var prefix: String
//    var digits: String
//}

extension Module: Identifiable {
    
//    static func getAllFiles () -> Void {
//        getEntries(typeID: "module") { entries in
//            entries.forEach { entry in
//                entry.fields["files"]
//            }
//        }
//    }
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<Module> {
        let request = NSFetchRequest<Module>(entityName: "Module")
        request.sortDescriptors = [NSSortDescriptor(key: "name_", ascending: true)]
        request.predicate = predicate
        return request
    }
    
    static func withName (_ name: String, context: NSManagedObjectContext) -> Module {
        let request = fetchRequest(NSPredicate(format: "name_ = %@", name))
        let modules = (try? context.fetch(request)) ?? []
        if let module = modules.first {
            return module
        } else {
            
            let module = Module(context: context)
            module.name = name
            
            //try fetching info and update all modules' info
            
            Module.updateAll(context: context)
            
            do {
                try context.save()
            } catch(let error) {
                print("couldn't save Module to CoreData: \(error.localizedDescription)")
            }
            return module
        }
    }
    
    static func update(name: String, prefix: String, digits: String, overview: String, context: NSManagedObjectContext) {
        let module = Module.withName(name, context: context)
        module.prefix = prefix
        module.digits = digits
        module.overview = overview
        
        try? context.save()
    }

    static func updateAll(context: NSManagedObjectContext) {
        getEntries(typeID: "module") { modules in
            modules.forEach { module in
                let name = module.fields["name"] as! String
                let prefix = module.fields["prefix"] as! String
                let digits = module.fields["digits"] as! String
                let overview = module.fields["overview"] as! String
                let announcementLinks = module.fields["announcements"] as! [Link]
                let conferenceLinks = module.fields["conferences"] as! [Link]
                let fileInfoLinks = module.fields["files"] as! [Link]
                // update with the info
                Module.update(name: name, prefix: prefix, digits: digits, overview: overview, context: context)
                announcementLinks.forEach { announcementLink in
                    let announcement = announcementLink.entry!
                    Announcement.update(title: announcement.fields["title"] as! String, body: announcement.fields["body"] as! String, announcedAt: parseDateString(dateString: announcement.fields["announcedAt"] as! String), moduleName: name, context: context)
                }
                conferenceLinks.forEach { conferenceLink in
                    let conference = conferenceLink.entry!
                    Conference.update(topic: conference.fields["topic"] as! String, link: conference.fields["link"] as! String, meetingDate: parseDateString(dateString: conference.fields["meetingDate"] as! String), moduleName: name, context: context)
                }
                fileInfoLinks.forEach { fileInfoLink in
                    let file = fileInfoLink.asset!
                    let fileNameWithType = getFileType(of: file.title!)
                    let fileUrl = file.urlString!
                    let metadata = file.file!
                    let fileName = fileNameWithType.fileName
                    let fileType = fileNameWithType.fileType
                    let fileDetail = metadata.details!
                    let fileSize = fileDetail.size
                    
//                    print("File Name: \(fileName)")
//                    print("File Type: \(fileType)")
//                    print("File Size: \(fileSizeString(of: fileSize))")
//                    print("File Url: \(fileUrl)")
                    
                    FileInfo.update(name: fileName, type: fileType, size: fileSize, url: fileUrl, moduleName: name, context: context)
                }
                
                
                try? context.save()
            }
        }
    }
    
    
    
    
    var name: String {
        get{ name_! }
        set{ name_ = newValue}
    }
    
    var prefix: String {
        get{ prefix_! }
        set{ prefix_ = newValue}
    }
    
    var digits: String {
        get { digits_! }
        set { digits_ = newValue}
    }
    
    var overview: String {
        get { overview_ ?? ""}
        set { overview_ = newValue}
    }
    
    var announcements: Set<Announcement> {
        get{ (announcements_ as? Set<Announcement>) ?? [] }
        set{ announcements_ =  newValue as NSSet}
    }
    
    var conferences: Set<Conference> {
        get{ (conferences_ as? Set<Conference>) ?? [] }
        set{ conferences_ =  newValue as NSSet}
    }
    
    var fileInfos: Set<FileInfo> {
        get{ (fileInfos_ as? Set<FileInfo>) ?? [] }
        set{ fileInfos_ =  newValue as NSSet}
    }
    
}
