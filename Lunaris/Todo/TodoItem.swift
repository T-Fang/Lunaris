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
    @Environment(\.managedObjectContext) var context
    @ObservedObject var todo: Todo
    @State var showDetail: Bool = false
    
    @State var showAlert = false

    
    
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
                center.getNotificationSettings { settings in
                    if !self.todo.checked{
                        if settings.authorizationStatus == .authorized {
                            Todo.addNotification(for: self.todo)
                        }
                        else {
                            center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                if success {
                                    Todo.addNotification(for: self.todo)
                                } else {
                                    self.showAlert.toggle()
                                    print("Unable to get notification authorization")
                                }
                            }
                        }
                    }
                }
                
            }) {
                TodoDetail(todo: self.todo, isShowing: self.$showDetail)
            }
            
            Button(action: {
                self.todo.toggle()
                if self.todo.checked {
                    Todo.clearPendingNotification(for: self.todo)
                }
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
