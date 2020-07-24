//
//  FileInfo.swift
//  Lunaris
//
//  Created by T放 on 17/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI
import CoreData

extension FileInfo: Identifiable {
    
    static func withName (_ name: String, context: NSManagedObjectContext) -> FileInfo {
        let request = fetchRequest(NSPredicate(format: "fileName_ = %@", name))
        let result = (try? context.fetch(request)) ?? []
        if let fileInfo = result.first {
            return fileInfo
        } else {
            let fileInfo = FileInfo(context: context)
            fileInfo.fileName = name
            
            // Info will be updated when the corresponding module is being updated
            
            do {
                try context.save()
            } catch(let error) {
                print("couldn't save FileInfo to CoreData: \(error.localizedDescription)")
            }
            return fileInfo
        }
    }
    
    static func update(name: String, type: String, size: Int, url: String, moduleName: String, context: NSManagedObjectContext) {
        let fileInfo = FileInfo.withName(name, context: context)
        
        fileInfo.fileType = type
        fileInfo.fileSize = size
        fileInfo.fileUrl = url
        fileInfo.module = Module.withName(moduleName, context: context)
        
        try? context.save()
    }
    
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<FileInfo> {
        let request = NSFetchRequest<FileInfo>(entityName: "FileInfo")
        request.sortDescriptors = [NSSortDescriptor(key: "fileName_", ascending: true)]
        request.predicate = predicate
        return request
    }
    
    var fileName: String {
        get{ fileName_! }
        set{ fileName_ = newValue}
    }
    
    var fileType: String {
        get{ fileType_! }
        set{ fileType_ = newValue}
    }
    
    var fileSize: Int {
        get{ Int(fileSize_)}
        set{ fileSize_ = Int64(newValue)}
    }
    
    var fileUrl: String {
        get{ fileUrl_!}
        set{ fileUrl_ = newValue}
    }
    
    var module: Module {
        get { module_!}
        set { module_ = newValue}
    }
}
