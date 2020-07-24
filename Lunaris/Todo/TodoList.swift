//
//  TodoList.swift
//  Lunaris
//
//  Created by T放 on 14/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct TodoList: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(fetchRequest: Todo.getAllUncheckedTodosRequest()) var uncheckedTodos: FetchedResults<Todo>
    @FetchRequest(fetchRequest: Todo.getAllCheckedTodosRequest()) var checkedTodos: FetchedResults<Todo>
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack {
                    SearchBar(text: self.$searchText)
                        .padding()
                        .offset(x: -10)
                    Form {
                        Section(header: Text("Tasks")) {
                            
                            ForEach(self.uncheckedTodos.filter({self.searchText.isEmpty ? true: $0.title.lowercased().contains(searchText.lowercased())})) { todo in
                                TodoItem(todo: todo)
                            }.onDelete { indexSet in
                                indexSet.map { self.uncheckedTodos.filter({self.searchText.isEmpty ? true: $0.title.includes(self.searchText)})[$0] }.forEach { todo in
                                    Todo.removeTodoWithTitle(todo.title, context: self.context)
                                }
                            }
                        }
                        
                        Section(header: Text("Finished Tasks")) {
                            ForEach(self.checkedTodos.filter({searchText.isEmpty ? true: $0.title.lowercased().contains(searchText.lowercased())})) { todo in
                                TodoItem(todo: todo)
                            }.onDelete { indexSet in
                                indexSet.map { self.checkedTodos.filter({self.searchText.isEmpty ? true: $0.title.lowercased().contains(self.searchText.lowercased())})[$0] }.forEach { todo in
                                    Todo.removeTodoWithTitle(todo.title, context: self.context)
                                }
                                
                            }
                        }
                        
                    }
                }
                
                Button(action: {
                    Todo.addNewTodo(context: self.context) 
                }) {
                    AddButton()
                }
                .offset(x: screen.width/2 - 60, y: screen.height/2 - 170)
                .animation(.spring())
                
            }
            .navigationBarTitle(Text("Task Manager"))
        }
        .onAppear{
            UITableView.appearance().separatorColor = .clear
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
    }
}
