//
//  AnnouncementList.swift
//  Lunaris
//
//  Created by T放 on 18/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI
import CoreData

struct AnnouncementList: View {
    @ObservedObject var module: Module
    @State private var searchText = ""
    
    @Binding var showDetail: Bool
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack {
                SearchListHeader(title: "\(module.prefix + module.digits) Announcements", searchText: self.$searchText, showDetail: self.$showDetail)
                ForEach(self.module.announcements.filter({self.searchText.isEmpty ? true: $0.title.includes(searchText) || ($0.module.prefix + $0.module.digits).includes(searchText)})) { announcement in
                    AnnouncementCard(announcement: announcement)
                }
                Spacer()
            }
        }
    }
}

struct AnnouncementList_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementList(module: sampleModule, showDetail: .constant(true))
    }
}
