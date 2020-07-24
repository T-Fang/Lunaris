//
//  AnnouncementSnippet.swift
//  Lunaris
//
//  Created by T放 on 18/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct AnnouncementSnippet: View {
    @ObservedObject var module: Module
    
    var body: some View {
        VStack {
            ForEach(Array(self.module.announcements.prefix(2))) { announcement in
                AnnouncementCard(announcement: announcement)
            }
        }
    }
}

struct AnnouncementSnippet_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementSnippet(module: sampleModule)
    }
}
