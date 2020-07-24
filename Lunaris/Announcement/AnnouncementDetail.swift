//
//  AnnouncementDetail.swift
//  Lunaris
//
//  Created by T放 on 18/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct AnnouncementDetail: View {
    @ObservedObject var announcement: Announcement
    @Binding var showDetail: Bool
    
    
    var body: some View {
        ScrollView{
            VStack {
                DetailCard(title: announcement.title, module: announcement.module, showDetail: self.$showDetail)
                
                VStack(alignment: .leading,spacing: 30) {
                    
                    Text(self.announcement.body)
                        .font(.body)
                        .foregroundColor(Color("secondary"))
                    HStack {
                        Spacer()
                        
                        Text("-- " + longDateFormatter.string(from: self.announcement.announcedAt))
                            .font(.subheadline)
                        
                        
                    }
                    .foregroundColor(Color("todoItemSubTitle"))
                
                }
                .padding(30)
                .padding(.bottom, 20)
                .frame(maxWidth: 712)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct AnnouncementDetail_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementDetail(announcement: sampleAnnouncement1, showDetail: .constant(true))
    }
}
