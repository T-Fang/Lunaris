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
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(self.conference.topic)
                        .foregroundColor(.black)
                        .lineLimit(2)
                        .modifier(FontModifier(size: 20, weight: .semibold))
                    
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
