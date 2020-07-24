//
//  HomeView.swift
//  Lunaris
//
//  Created by T放 on 16/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) var context
    @Binding var showPreference: Bool
    @Binding var showTasks: Bool
    @Binding var showAnnouncements: Bool
    @Binding var showConferences: Bool
    @FetchRequest(fetchRequest: Module.fetchRequest(.all)) var allModules: FetchedResults<Module>
    @FetchRequest(fetchRequest: Conference.fetchRequest(.all)) var allConferences: FetchedResults<Conference>
    
    var body: some View {
        ZStack{
            
            ScrollView(showsIndicators: false){
                VStack {
                    // Navigation Title and Buttons
                    HStack(spacing: 12) {
                        Text("Modules")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("secondary"))
                        
                        Spacer()
                        
                        Button(action: {
                            Module.updateAll(context: self.context)
                        }) {
                            Image(systemName: "arrow.2.circlepath").iconify()
                        }
                        
                        Button(action: {
                            self.showPreference.toggle()
                        }) {
                            Image(systemName: "gear").iconify()
                        }
                        Button(action: {
                            self.showTasks.toggle()
                        }) {
                            Image(systemName: "checkmark.circle").iconify()
                        }
                        .sheet(isPresented: self.$showTasks) {
                            TodoList().environment(\.managedObjectContext, self.context)
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.leading, 14)
                    .padding(.top, 30)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(allModules) { module in
                                GeometryReader { geometry in
                                    ModuleCard(module: module)
                                        .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX) - 30) / -AngleMultiplier, axis: (x: 0, y: 10, z: 0))
                                }
                            }
                            .frame(width: moduleCardWidth, height: moduleCardHeight)
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 10)
                        .padding(.bottom, 30)
                    }
                    
                    TitleLink(title: "Conferences")
                        .onTapGesture {
                            self.showConferences.toggle()
                    }
                    .sheet(isPresented: self.$showConferences) {
                        AllConferenceList( showDetail: self.$showConferences).environment(\.managedObjectContext, self.context)
                    }
                    
                    AllConferenceSnippet().padding(.bottom, 15)
                    
                    TitleLink(title: "Announcements")
                        .onTapGesture {
                            self.showAnnouncements.toggle()
                    }
                    .sheet(isPresented: self.$showAnnouncements) {
                        AllAnnouncementList( showDetail: self.$showAnnouncements).environment(\.managedObjectContext, self.context)
                    }
                    AllAnnouncementSnippet()
                    
                }
                .padding(.bottom, 130)
            }
            .frame(width: screen.width)
            .frame(maxHeight: screen.height)
            .animation(nil)
            
            
        }
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showPreference: .constant(false), showTasks: .constant(false), showAnnouncements: .constant(false), showConferences: .constant(false))
    }
}
