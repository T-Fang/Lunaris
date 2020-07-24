//
//  AddButton.swift
//  Lunaris
//
//  Created by T放 on 15/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct AddButton: View {
    var size: CGFloat = 65.0
    var body: some View {
        ZStack {
            Group {
                Circle()
                    .fill(Color("btnAdd-bg"))
            }.frame(width: self.size, height: self.size)
                .shadow(color: Color("btnAdd-shadow"), radius: 10)
            Group {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: size, height: size)
                    .foregroundColor(Color("theme"))
            }
        }
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
