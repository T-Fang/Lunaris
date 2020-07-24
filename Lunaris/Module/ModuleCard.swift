//
//  ModuleCard.swift
//  Lunaris
//
//  Created by T放 on 12/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI
import CoreData

struct ModuleCard: View {
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var downloads: DownloadsViewModel
    @ObservedObject var module: Module
    var width: CGFloat = moduleCardWidth
    var height: CGFloat = moduleCardHeight
    @State var showDetail: Bool = false
    
    var body: some View {
        VStack(spacing: 8.0) {
            HStack(alignment: .top) {
                Text(module.name)
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .lineLimit(3)
                    .frame(alignment: .leading)
                Spacer()
            }
            
            Text(module.prefix + module.digits)
                .foregroundColor(Color.white.opacity(0.7))
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()
            
        }
        .padding(.top, 20)
        .padding(.bottom, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: width, maxHeight: height)
        .background(Color(moduleColorOf( module.prefix)))
        .cornerRadius(30)
        //.shadow(color: Color(moduleColorOf( module.prefix)).opacity(0.3), radius: 10, x: 10, y: 10)
        .onTapGesture {
            self.showDetail.toggle()
        }
        .sheet(isPresented: $showDetail) {
            ModuleDetail(module: self.module, showDetail: self.$showDetail)
                .environment(\.managedObjectContext, self.context)
                .environmentObject(self.downloads)
        }
    }
}

struct ModuleCard_Previews: PreviewProvider {
    static var previews: some View {
        ModuleCard(module: sampleModule)
    }
}
