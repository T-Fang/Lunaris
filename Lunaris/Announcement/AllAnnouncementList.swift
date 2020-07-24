//
//  AllAnnouncementList.swift
//  Lunaris
//
//  Created by T放 on 18/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct AllAnnouncementList: View {
    @FetchRequest(fetchRequest: Announcement.fetchRequest(.all)) var allAnnouncements: FetchedResults<Announcement>
    @State private var searchText = ""
    @Binding var showDetail: Bool
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack {
                
                SearchListHeader(title: "All Announcements", searchText: self.$searchText, showDetail: self.$showDetail)
                
                ForEach(self.allAnnouncements.filter({self.searchText.isEmpty ? true: $0.title.includes(searchText) || ($0.module.prefix + $0.module.digits).includes(searchText)})) { announcement in
                    AnnouncementCard(announcement: announcement)
                }
                Spacer()
            }
        }
        
    }
}

struct AllAnnouncementList_Previews: PreviewProvider {
    static var previews: some View {
        AllAnnouncementList(showDetail: .constant(true))
    }
}
