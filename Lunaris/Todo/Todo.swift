//
//  Todo.swift
//  Lunaris
//
//  Created by T放 on 13/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import CoreData
import Combine
import UserNotifications
extension Todo: Identifiable {
    static func withTitle (_ title: String, context: NSManagedObjectContext) -> Todo {
        let request = fetchRequest(NSPredicate(format: "title_ = %@", title))
        let todos = (try? context.fetch(request)) ?? []
        if let todo = todos.first {
            return todo
        } else {
            let todo = Todo(context: context)
            todo.title = title
            todo.id = UUID()
            todo.dueDate = Date()
            todo.checked = false
            do {
                try context.save()
            } catch(let error) {
                print("couldn't save Todo to CoreData: \(error.localizedDescription)")
            }
            return todo
        }
    }
    
    static func addNewTodo (title: String = "", note: String = "", context: NSManagedObjectContext) -> Void {
        let todo = Todo(context: context)
        todo.title = title
        todo.dueDate = Date()
        todo.id = UUID()
        todo.checked = false
        todo.note = note
        do {
            try context.save()
        } catch(let error) {
            print("couldn't save Todo to CoreData: \(error.localizedDescription)")
        }
    }
    
    static func removeTodoWithTitle (_ title: String, context: NSManagedObjectContext) -> Void{
        let todo = withTitle(title, context: context)
        context.delete(todo)
        try? context.save()
    }
    
    static func getTodoWithTitle (title: String) -> NSFetchRequest<Todo> {
        let request = fetchRequest(NSPredicate(format: "title_ = %@", title))
        return request
    }
    
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<Todo> {
        let request = NSFetchRequest<Todo>(entityName: "Todo")
        request.sortDescriptors = [NSSortDescriptor(key: "dueDate_", ascending: true)]
        request.predicate = predicate
        return request
    }
    
    static func getAllTodosRequest () -> NSFetchRequest<Todo> {
        let request = NSFetchRequest<Todo>(entityName: "Todo")
        request.sortDescriptors = [NSSortDescriptor(key: "dueDate_", ascending: true)]
        return request
    }
    
    static func getAllUncheckedTodosRequest() -> NSFetchRequest<Todo> {
        let predicate = NSPredicate(format: "checked = false")
        return fetchRequest(predicate)
    }
    
    static func getAllCheckedTodosRequest() -> NSFetchRequest<Todo> {
        let predicate = NSPredicate(format: "checked = true")
        return fetchRequest(predicate)
    }
    
    static func completeTask(title: String, context: NSManagedObjectContext) {
        let todo = self.withTitle(title, context: context)
        todo.check()
    }
    
    static func clearPendingNotification(for todo: Todo) {
        center.removePendingNotificationRequests(withIdentifiers: [todo.id!.uuidString])
    }
    
    static func addNotification(for todo: Todo){
        self.clearPendingNotification(for: todo)
        let content = UNMutableNotificationContent()
        content.title = todo.title
        content.subtitle = todo.note
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "Task Action"
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: todo.dueDate)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: todo.id!.uuidString, content: content, trigger: trigger)
        
        center.add(request)
    }
    
    func check () -> Void {
        self.checked = true
        try? managedObjectContext!.save()
    }
    
    func toggle() {
        self.checked.toggle()
        try? managedObjectContext!.save()
    }
    
    func changeInfo(title: String, dueDate: Date, note: String) {
        self.title = title
        self.dueDate = dueDate
        self.note = note
        try? managedObjectContext!.save()
    }
    
    
    var title: String {
        get{ title_ ?? "" }
        set{ title_ = newValue}
    }
    
    var dueDate: Date {
        get{ dueDate_ ?? Date()}
        set{ dueDate_ = newValue}
    }
    
    var note: String {
        get{ note_ ?? ""}
        set{ note_ = newValue}
    }
    
}
