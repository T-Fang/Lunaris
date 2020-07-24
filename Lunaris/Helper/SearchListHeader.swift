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
                Text(title)
                    .lineLimit(2)
                    .modifier(FontModifier(size:30, weight: .bold))
                Spacer()
                VStack {
                    Spacer()
                    CloseButtion(showDetail: self.$showDetail).padding(.trailing,30)
                    Spacer()
                }
            }
            .frame(height: 72)
            .padding(.leading, 32)
            .padding(.top, 20)
            .padding(.bottom, -20)
            
            SearchBar(text: self.$searchText)
                .padding()
                .padding(.leading, 6)
        }
        .padding(.top, 20)
    }
}

struct SearchListHeader_Previews: PreviewProvider {
    static var previews: some View {
        SearchListHeader(title: "All\nAnnouncements", searchText: .constant(""), showDetail: .constant(true))
    }
}
