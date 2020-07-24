//
//  Image+Iconify.swift
//  Lunaris
//
//  Created by T放 on 12/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

extension Image {
    func iconify (fontSize: CGFloat = 16, sideLength: CGFloat = 36, backgroundColor: Color = Color("iconifyColor")) -> some View{
        self.renderingMode(.original)
            .font(.system(size: fontSize, weight: .medium))
            .frame(width: sideLength, height: sideLength)
            .background(backgroundColor)
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
    }
}
