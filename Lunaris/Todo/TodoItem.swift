//
//  TodoItem.swift
//  Lunaris
//
//  Created by T放 on 13/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI
import UserNotifications

struct TodoItem: View {
    @ObservedObject var todo: Todo
    @State var showDetail: Bool = false
    
    @State var authorized = true
    @State var showAlert = false
    
    let center = UNUserNotificationCenter.current()
    
    
    func clearPendingNotification(for todo: Todo) {
        center.removePendingNotificationRequests(withIdentifiers: [todo.id!.uuidString])
    }
    
    func addNotification(for todo: Todo) {
        center.setNotificationCategories([notificationCategory])
        
        func send() {
            
        }
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = todo.title
            content.subtitle = todo.note
            content.sound = UNNotificationSound.default
            content.categoryIdentifier = "action"
            
            let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: todo.dueDate)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: todo.id!.uuidString, content: content, trigger: trigger)
            self.center.add(request)
        }
        
        self.clearPendingNotification(for: todo)
        
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            }
            else {
                self.center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        self.showAlert.toggle()
                        self.authorized = false
                        print("Unable to get notification authorization")
                    }
                }
            }
        }
        
        
    }
    
    var body: some View {
        HStack {
            HStack(spacing: 10.0) {
                Rectangle()
                    .fill(Color("theme"))
                    .frame(width: 8)
                
                VStack(spacing: 4.0) {
                    HStack {
                        Text(todo.title)
                            .font(.headline)
                            .lineLimit(1)
                            .alert(isPresented: self.$showAlert) {
                                Alert(title: Text("Plase enable notifications"), message: Text("Please go to Settings -> Notifications -> Lunaris -> Allow Notification and enable the option"), dismissButton: .cancel(Text("OK")))
                            }
                        Spacer()
                    }
                    
                    .foregroundColor(Color("todoItemTitle"))
                    
                    HStack {
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text(shortDateFormatterWithHours.string(from: todo.dueDate))
                            .font(.subheadline)
                        
                        Spacer()
                    }
                    .foregroundColor(Color("todoItemSubTitle"))
                }
                
            }
            .onTapGesture {
                self.showDetail.toggle()
            }
            .sheet(isPresented: $showDetail, onDismiss: {
                self.addNotification(for: self.todo)
            }) {
                TodoDetail(todo: self.todo, isShowing: self.$showDetail)
            }
            
            Button(action: {
                self.todo.check()
            }) {
                HStack {
                    VStack {
                        Image(systemName: self.todo.checked ? "checkmark.square.fill" : "square")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                        .frame(width: 14)
                }
            }
        }
        .onAppear{
            NotificationCenter.default.addObserver(forName: NSNotification.Name("completeTask"), object: nil, queue: .main) { _ in
                self.todo.check()
            }
        }
        .background(Color(self.todo.checked ? "todoItem-bg-checked" : "todoItem-bg"))
        .animation(.spring())
        .frame(width: 350, height: 90)
        .cornerRadius(8)
        .shadow(radius: 5, x: 5, y: 5)
        .padding(.vertical, 5)
    }
    
}

struct TodoItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TodoItem(todo: sampleTodo).environment(\.colorScheme, .light)
            TodoItem(todo: sampleTodo).environment(\.colorScheme, .dark)
        }
        
    }
}
