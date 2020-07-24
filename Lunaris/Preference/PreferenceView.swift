//
//  PreferenceView.swift
//  Lunaris
//
//  Created by T放 on 16/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct PreferenceView: View {
    @Binding var showPreference: Bool
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                PreferenceRow(title: "Language", icon: "globe")
                PreferenceRow(title: "Appearance", icon: "moon")
                PreferenceRow(title: "Sign out", icon: "person.crop.circle")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color("background3"), Color("background2")]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color("shadow1"), radius: 20, x: 0, y: 20)
            .padding(.horizontal, 30)
            
        }
        .padding(.bottom, 30)
    }
}

struct PreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PreferenceView(showPreference: .constant(true)).environment(\.colorScheme, .light)
            PreferenceView(showPreference: .constant(true)).environment(\.colorScheme, .dark)
        }
    }
}

