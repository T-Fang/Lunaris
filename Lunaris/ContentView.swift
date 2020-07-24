//
//  ContentView.swift
//  Lunaris
//
//  Created by T放 on 12/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(fetchRequest: Module.fetchRequest(.all)) var allModules: FetchedResults<Module>
    
    func resetAllModules() {
        for module in allModules {
            for announcement in module.announcements {
                context.delete(announcement)
            }
            for conference in module.conferences {
                context.delete(conference)
            }
            for fileInfo in module.fileInfos {
                context.delete(fileInfo)
            }
            context.delete(module)
        }
        Module.updateAll(context: context)
    }
    
    var body: some View {
        //        TodoList().onAppear{
        //            Module.updateAll(context: self.context)
        //        }
        //        ModuleList()
        //        Dashboard()
        
        return TabView {
            Dashboard()
                .tabItem {
                    Image(systemName: "house")
                    Text("Dashboard")
            }
            
            ModuleList()
                .tabItem {
                    Image(systemName: "book")
                    Text("Modules")
            }.onAppear{
                Module.updateAll(context: self.context)
            }
            
            DownloadList()
                .tabItem {
                    Image(systemName: "icloud.and.arrow.down")
                    Text("Downloads")
            }
            
            TodoList()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Tasks")
            }
            
            
        }
        .onAppear{
            self.resetAllModules()
            center.setNotificationCategories(notificationCategories)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
