//
//  AllConferenceSnippet.swift
//  Lunaris
//
//  Created by T放 on 18/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct AllConferenceSnippet: View {
    @FetchRequest(fetchRequest: Conference.fetchRequest(.all)) var allConferences: FetchedResults<Conference>
    
    var body: some View {
        
        VStack {
            ForEach(Array(self.allConferences.prefix(2))) { conference in
                ConferenceCard(conference: conference)
            }
        }
        
        
    }
}

struct AllConferenceSnippet_Previews: PreviewProvider {
    static var previews: some View {
        AllConferenceSnippet()
    }
}
