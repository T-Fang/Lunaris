//
//  AnnouncementCard.swift
//  Lunaris
//
//  Created by T放 on 18/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct AnnouncementCard: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var announcement: Announcement
    @State var showDetail: Bool = false
    @State var showAlert: Bool = false
    
    var body: some View {
        Button(action: {
            self.showDetail.toggle()
        }) {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text(self.announcement.title)
                                .foregroundColor(.white)
                                .lineLimit(2)
                                .modifier(FontModifier(size: 20, weight: .bold))
                            Spacer()
                            Image(systemName: "plus")
                                .iconify(fontSize: 14, sideLength: 25, backgroundColor: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
                                .onTapGesture {
                                    self.showAlert.toggle()
                                    Todo.addNewTodo(title: self.announcement.title, note: self.announcement.body, context: self.context)
                            }
                            .alert(isPresented: self.$showAlert) {
                                Alert(title: Text("Added to task manager"), message: Text("Please go to the Tasks tab to see the added task"), dismissButton: .cancel(Text("OK")))
                            }
                        }
                        
                        Text(self.announcement.body)
                            .font(.body)
                            .foregroundColor(Color.white.opacity(0.7))
                            .lineLimit(2)
                        HStack {
                            Image(systemName: "clock")
                                .resizable()
                                .frame(width: 12, height: 12)
                            Text(longDateFormatter.string(from: self.announcement.announcedAt))
                                .font(.subheadline)
                            
                            Spacer()
                        }
                        .foregroundColor(Color.white)
                        
                    }
                    .layoutPriority(1)
                    Spacer()
                }
                .padding()
            }
            .background(Color(moduleColorOf(announcement.module.prefix)))
            .cornerRadius(10)
            .padding([.top, .horizontal])
            .frame(maxWidth: listCardWidth)
            .sheet(isPresented: self.$showDetail) {
                AnnouncementDetail(announcement: self.announcement, showDetail: self.$showDetail)
                    .environment(\.managedObjectContext, self.context)
            }
        }
    }
}

struct AnnouncementCard_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementCard(announcement: sampleAnnouncement1)
    }
}
