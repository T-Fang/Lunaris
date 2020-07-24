//
//  ProgressView.swift
//  Lunaris
//
//  Created by Zhu Xiaochen on 19/7/20.
//  Copyright © 2020 Zhu Xiaochen. All rights reserved.
//

import SwiftUI

struct ProgressView : View {
    
    var color1 = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var color2 = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    var width: CGFloat = 300
    var height: CGFloat = 300
    var percent: Float = 88
    
    var body: some View {
        let multiplier = width / 44
        let progress = 1 - CGFloat(percent)
        
        return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: progress , to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: Color(color2).opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
                
                
            Text("\(Int(percent * 100))%")
                .font(.system(size: 10 * multiplier))
                .fontWeight(.bold)
            .animation(nil)
                
        }
        .animation(.linear)
    }
}

struct ProgessView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(percent: 0.3)
    }
}
