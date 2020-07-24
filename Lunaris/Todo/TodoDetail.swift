//
//  TodoDetail.swift
//  Lunaris
//
//  Created by T放 on 13/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct TodoDetail: View {
    @ObservedObject var todo: Todo
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Text("Palette Editor").font(.headline).padding()
                HStack {
                    Spacer()
                    Button(action: {
                        self.isShowing = false
                    }, label: { Text("Done") }).padding()
                }
            }
            Divider()
            Form{
                TextField("Title", text: self.$todo.title)
                DatePicker("Due Date:", selection: self.$todo.dueDate, displayedComponents: [.date, .hourAndMinute])
                Section(header: Text("Note")) {
                    MultilineTextField(text: self.$todo.note)
                }
                
            }
        }
        
    }
}

struct TodoDetail_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetail(todo: sampleTodo, isShowing: .constant(true))
    }
}

