//
//  ConferenceSnippet.swift
//  Lunaris
//
//  Created by T放 on 18/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct ConferenceSnippet: View {
    @ObservedObject var module: Module
    
    var body: some View {
        VStack {
            ForEach(Array(self.module.conferences.prefix(2))) { conference in
                ConferenceCard(conference: conference)
            }
        }
    }
}

struct ConferenceSnippet_Previews: PreviewProvider {
    static var previews: some View {
        ConferenceSnippet(module: sampleModule)
    }
}
