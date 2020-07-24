//
//  TitleLink.swift
//  Lunaris
//
//  Created by T放 on 18/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct TitleLink: View {
    var title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("secondary"))
                .padding(.leading,30)
            
            Image(systemName: "chevron.right").foregroundColor(.gray)
                .font(.headline)
                .padding(.top, 5)
            
            Spacer()
        }
    }
}

struct TitleLink_Previews: PreviewProvider {
    static var previews: some View {
        TitleLink(title: "Overview")
    }
}
