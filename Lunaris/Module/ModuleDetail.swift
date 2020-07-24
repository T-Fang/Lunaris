//
//  ModuleDetail.swift
//  Lunaris
//
//  Created by T放 on 12/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct ModuleDetail: View {
    @EnvironmentObject var downloads: DownloadsViewModel
    @ObservedObject var module: Module
    @Binding var showDetail: Bool
    @State var showOverview: Bool = false
    @State var showAnnouncements: Bool = false
    @State var showConferences: Bool = false
    @State var showFileInfos: Bool = false
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack {
                DetailCard(title: module.name, module: module, showDetail: self.$showDetail)
                VStack(alignment: .leading,spacing: 30) {
                    TitleLink(title: "Overview")
                        .padding(.top,15)
                        .onTapGesture {
                            self.showOverview.toggle()
                    }
                    
                    Text(module.overview)
                        .font(.body)
                        .foregroundColor(Color("secondary"))
                        .padding(.horizontal,30)
                        .lineLimit(3)
                        .onTapGesture {
                            self.showOverview.toggle()
                    }.sheet(isPresented: self.$showOverview) {
                        OverviewDetail(module: self.module, showDetail: self.$showOverview).environmentObject(self.downloads)
                    }
                    
                    
                    TitleLink(title: "Announcements")
                        .onTapGesture {
                            self.showAnnouncements.toggle()
                    }.sheet(isPresented: self.$showAnnouncements) {
                        AnnouncementList(module: self.module, showDetail: self.$showAnnouncements).environmentObject(self.downloads)
                    }
                    
                    
                    AnnouncementSnippet(module: module)
                        .padding(.horizontal)
                        .offset(y: -15)
                    
                    TitleLink(title: "Conferences")
                        .onTapGesture {
                            self.showConferences.toggle()
                    }.sheet(isPresented: self.$showConferences) {
                        ConferenceList(module: self.module, showDetail: self.$showConferences).environmentObject(self.downloads)
                    }
                    
                    ConferenceSnippet(module: module)
                        .padding(.horizontal)
                        .offset(y: -15)
                    
                    TitleLink(title: "Files")
                        .onTapGesture {
                            self.showFileInfos.toggle()
                    }.sheet(isPresented: self.$showFileInfos) {
                        FileInfoList(module: self.module, showDetail: self.$showFileInfos).environmentObject(self.downloads)
                    }
                    
                    FileInfoSnippet(module: module)
                        .padding(.horizontal)
                        .offset(y: -15)
                    
                }
                    
                .padding(.bottom, 20)
                .frame(maxWidth: 712)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ModuleDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ModuleDetail(module: sampleModule, showDetail: .constant(true)).environment(\.colorScheme, .light)
            ModuleDetail(module: sampleModule, showDetail: .constant(true)).environment(\.colorScheme, .dark)
        }
    }
}
