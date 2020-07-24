//
//  ConferenceList.swift
//  Lunaris
//
//  Created by T放 on 18/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct ConferenceList: View {
    @ObservedObject var module: Module
    @State private var searchText = ""
    
    @Binding var showDetail: Bool
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack {
                SearchListHeader(title: "\(module.prefix + module.digits) Conferences", searchText: self.$searchText, showDetail: self.$showDetail)
                
                ForEach(self.module.conferences.filter({self.searchText.isEmpty ? true: $0.topic.includes(searchText) || ($0.module.prefix + $0.module.digits).includes(searchText)})) { conference in
                    ConferenceCard(conference: conference)
                }
                Spacer()
            }
        }
    }
}

struct ConferenceList_Previews: PreviewProvider {
    static var previews: some View {
        ConferenceList(module: sampleModule, showDetail: .constant(true))
    }
}
