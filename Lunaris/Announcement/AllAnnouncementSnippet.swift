//
//  AllAnnouncementSnippet.swift
//  Lunaris
//
//  Created by T放 on 18/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct AllAnnouncementSnippet: View {
    @FetchRequest(fetchRequest: Announcement.fetchRequest(.all)) var allAnnouncements: FetchedResults<Announcement>
    
    var body: some View {
        VStack {
            ForEach(Array(self.allAnnouncements.prefix(2))) { announcement in
                AnnouncementCard(announcement: announcement)
            }
        }
    }
}

struct AllAnnouncementSnippet_Previews: PreviewProvider {
    static var previews: some View {
        AllAnnouncementSnippet()
    }
}

