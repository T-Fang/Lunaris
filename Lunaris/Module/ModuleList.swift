//
//  ModuleList.swift
//  Lunaris
//
//  Created by T放 on 12/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI
struct ModuleList: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(fetchRequest: Module.fetchRequest(.all)) var allModules: FetchedResults<Module>
    
    var body: some View {
        RefreshableNavigationView(title: "Modules", action: {
            Module.updateAll(context: self.context)
            
        }) {
            ForEach(self.allModules) { module in
                ModuleCard(module: module, width: listCardWidth, height: listCardHeight)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
            }
        }
    }
}

struct ModuleList_Previews: PreviewProvider {
    static var previews: some View {
        ModuleList()
    }
}
