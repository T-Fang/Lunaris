//
//  FileInfoList.swift
//  Lunaris
//
//  Created by T放 on 18/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct FileInfoList: View {
    @ObservedObject var module: Module
    @State private var searchText = ""
    
    @Binding var showDetail: Bool
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack {
                SearchListHeader(title: "\(module.prefix + module.digits) Files", searchText: self.$searchText, showDetail: self.$showDetail)
                
                ForEach(self.module.fileInfos.filter({self.searchText.isEmpty ? true: $0.fileName.includes(searchText)}).sorted{$0.fileName < $1.fileName}) { fileInfo in
                    FileInfoView(fileInfo: fileInfo)
                }
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}

struct FileInfoList_Previews: PreviewProvider {
    static var previews: some View {
        FileInfoList(module: sampleModule, showDetail: .constant(true))
    }
}
