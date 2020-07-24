//
//  SearchListHeader.swift
//  Lunaris
//
//  Created by T放 on 18/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct SearchListHeader: View {
    var title: String
    @Binding var searchText: String
    @Binding var showDetail: Bool
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Text(title)
                        .lineLimit(2)
                        .modifier(FontModifier(size:30, weight: .bold))
                    Spacer()
                }
                CloseButtion(showDetail: self.$showDetail).padding(.trailing,30)
            }
            .padding(.leading, 32)
            .padding(.top, 20)
            .offset(y: 10)
            
            SearchBar(text: self.$searchText)
                .padding()
                .padding(.leading, 6)
        }
        .padding(.top, 20)
    }
}

struct SearchListHeader_Previews: PreviewProvider {
    static var previews: some View {
        SearchListHeader(title: "Announcements", searchText: .constant(""), showDetail: .constant(true))
    }
}
