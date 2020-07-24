//
//  AllConferenceList.swift
//  Lunaris
//
//  Created by T放 on 18/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct AllConferenceList: View {
    @FetchRequest(fetchRequest: Conference.fetchRequest(.all)) var allConferences: FetchedResults<Conference>
    @State private var searchText = ""
    
    @Binding var showDetail: Bool
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack {
                SearchListHeader(title: "All Conferences", searchText: self.$searchText, showDetail: self.$showDetail)
                
                ForEach(self.allConferences.filter({self.searchText.isEmpty ? true: $0.topic.lowercased().includes(searchText) || ($0.module.prefix + $0.module.digits).includes(searchText)})) { conference in
                    ConferenceCard(conference: conference)
                }
                Spacer()
            }
        }
    }
}

struct AllConferenceList_Previews: PreviewProvider {
    static var previews: some View {
        AllConferenceList(showDetail: .constant(true))
    }
}
