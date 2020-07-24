//
//  PreferenceRow.swift
//  Lunaris
//
//  Created by T放 on 24/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct PreferenceRow: View {
    var title: String
    var icon: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
            
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
        }
    }
}


struct PreferenceRow_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceRow(title: "Language", icon: "globe")
    }
}
