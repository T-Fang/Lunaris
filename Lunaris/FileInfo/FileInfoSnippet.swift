//
//  FileInfoSnippet.swift
//  Lunaris
//
//  Created by T放 on 18/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct FileInfoSnippet: View {
    @ObservedObject var module: Module
    
    var body: some View {
        VStack {
            ForEach(Array(self.module.fileInfos).sorted{$0.fileName < $1.fileName}.prefix(2)) { fileInfo in
                FileInfoView(fileInfo: fileInfo)
            }
        }
    }
}

struct FileInfoSnippet_Previews: PreviewProvider {
    static var previews: some View {
        FileInfoSnippet(module: sampleModule)
    }
}
