//
//  ConferenceCard.swift
//  Lunaris
//
//  Created by T放 on 17/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct ConferenceCard: View {
    @ObservedObject var conference: Conference
    @State var showAlert = false
    
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    HStack{
                        Text(self.conference.topic)
                            .foregroundColor(.black)
                            .lineLimit(2)
                            .modifier(FontModifier(size: 20, weight: .semibold))
                            .alert(isPresented: self.$showAlert) {
                                Alert(title: Text("Plase enable notifications"), message: Text("Please go to Settings -> Notifications -> Lunaris -> Allow Notification and enable the option"), dismissButton: .cancel(Text("OK")))
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            center.getNotificationSettings { settings in
                                if settings.authorizationStatus == .authorized {
                                    Conference.addNotification(for: self.conference)
                                }
                                else {
                                    center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                        if success {
                                            Conference.addNotification(for: self.conference)
                                        } else {
                                            self.showAlert.toggle()
                                            print("Unable to get notification authorization")
                                        }
                                    }
                                }
                            }
                            
                        }) {
                            Image(systemName: "bell").iconify()
                        }
                    }
                    Text(self.conference.link)
                        .font(.footnote)
                        .foregroundColor(Color("todoItemSubTitle"))
                        .lineLimit(2)
                    HStack {
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text(longDateFormatter.string(from: self.conference.meetingDate))
                            .font(.subheadline)
                        
                        Spacer()
                    }
                    .foregroundColor(Color("todoItemSubTitle"))
                    
                }
                .layoutPriority(1)
                Spacer()
            }
            .padding()
        }
        .background(Color(conferenceCardColor))
        .cornerRadius(10)
        .padding([.top, .horizontal])
        .frame(maxWidth: listCardWidth)
        .onTapGesture {
            UIApplication.shared.open(URL(string: self.conference.link)!)
        }
    }
}

struct ConferenceCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ConferenceCard(conference: sampleConference1).environment(\.colorScheme, .light)
            ConferenceCard(conference: sampleConference1).environment(\.colorScheme, .dark)
        }
        
    }
}
