//
//  Dashboard.swift
//  Lunaris
//
//  Created by T放 on 12/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct Dashboard: View {
    @State var showPreference: Bool = false
    @State var showTasks: Bool = false
    @State var showAnnouncements: Bool = false
    @State var showConferences: Bool = false
    
    @State var dragTranslation = CGSize.zero
    var body: some View {
        ZStack {
            
            Color("background2")
                .edgesIgnoringSafeArea(.all)
                .animation(nil)
            
            HomeView(showPreference: self.$showPreference, showTasks: self.$showTasks, showAnnouncements: self.$showAnnouncements, showConferences: self.$showConferences)
                .padding(.top, 44)
                .background(
                    VStack {
                        LinearGradient(gradient: Gradient(colors: [Color("background2"), Color("background3")]), startPoint: .top, endPoint: .bottom)
                            .frame(height: 200)
                        Spacer()
                    }
                    .background(Color("background3"))
                )
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color("shadow1"), radius: 20, x: 0, y: 20)
                .offset(y: showPreference ? -450 : 0)
                .rotation3DEffect(Angle(degrees: showPreference ? Double(dragTranslation.height / 10) - 10 : 0), axis: (x: 10.0, y: 0, z: 0))
                .scaleEffect(showPreference ? 0.9 : 1)
                .edgesIgnoringSafeArea(.all)
            
            PreferenceView(showPreference: self.$showPreference)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    self.showPreference.toggle()
            }
            .offset(y: self.showPreference ? 0 : screen.height)
            .offset(y: dragTranslation.height)
            .gesture(
                DragGesture().onChanged { value in
                    self.dragTranslation = value.translation
                }
                .onEnded { value in
                    if self.dragTranslation.height > 50 {
                        self.showPreference = false
                    }
                    self.dragTranslation = .zero
                }
            )
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
