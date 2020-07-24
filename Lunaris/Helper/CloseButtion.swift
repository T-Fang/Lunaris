//
//  CloseButtion.swift
//  Lunaris
//
//  Created by T放 on 24/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct CloseButtion: View {
    @Binding var showDetail: Bool
    var body: some View {
        Image(systemName: "xmark")
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)
            
            .frame(width: 36, height: 36)
            .background(Color.black)
            .clipShape(Circle())
            .onTapGesture {
                self.showDetail.toggle()
        }
    }
}

struct CloseButtion_Previews: PreviewProvider {
    static var previews: some View {
        CloseButtion(showDetail: .constant(true))
    }
}
