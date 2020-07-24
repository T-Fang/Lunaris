//
//  OverviewDetail.swift
//  Lunaris
//
//  Created by T放 on 18/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct OverviewDetail: View {
    @ObservedObject var module: Module
    @Binding var showDetail: Bool
    
    
    var body: some View {
        ScrollView{
            VStack {
                DetailCard(title: module.name, module: module, showDetail: self.$showDetail)
                
                Text(self.module.overview)
                    .font(.body)
                    .foregroundColor(Color("secondary"))
                    .padding(30)
                    .padding(.bottom, 20)
                    .frame(maxWidth: 712)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct OverviewDetail_Previews: PreviewProvider {
    static var previews: some View {
        OverviewDetail(module: sampleModule, showDetail: .constant(true))
    }
}
