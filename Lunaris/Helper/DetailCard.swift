//
//  DetailCard.swift
//  Lunaris
//
//  Created by T放 on 18/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct DetailCard: View {
    var title: String
    @ObservedObject var module: Module
    @Binding var showDetail: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.system(size: 27, weight: .bold))
                    .lineLimit(3)
                    .foregroundColor(.white)
                Text(module.prefix + module.digits)
                    .foregroundColor(Color.white.opacity(0.7))
            }
            Spacer()
            
            CloseButtion(showDetail: self.$showDetail)
        }
        .padding(.horizontal, 25)
        .frame(height: detailCardHeight)
        .frame(maxWidth: 712)
        .background(Color(moduleColorOf( module.prefix)))
        .clipShape(RoundedCorners(tl: 0, tr: 0, bl: 15, br: 15))
        .shadow(color: Color(moduleColorOf(module.prefix)).opacity(0.3), radius: 20, x: 0, y: 20)
        
    }
}

struct DetailCard_Previews: PreviewProvider {
    static var previews: some View {
        DetailCard(title: sampleModule.name, module: sampleModule, showDetail: .constant(true))
    }
}
