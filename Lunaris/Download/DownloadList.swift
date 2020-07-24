//
//  DownloadList.swift
//  Lunaris
//
//  Created by Zhu Xiaochen on 17/7/20.
//  Copyright © 2020 Zhu Xiaochen. All rights reserved.
//

import SwiftUI

struct DownloadList: View {
    
    @EnvironmentObject var downloads: DownloadsViewModel
    var body: some View{
        
        NavigationView {
            List {
                Section(header: Text("Files")) {
                    if (self.downloads.downloadingItems.isEmpty) {
                        HStack {
                            Spacer()
                            Text("Currently no downloading files")
                                .foregroundColor(Color.gray)
                            Spacer()
                        }
                    } else {
                        ForEach(self.downloads.downloadingItems){ item in
                            DownloadItemView(item: item)
                        }
                    }
                }
                Section {
                    Button(action: {
                        let picker = DocumentPickerViewController(
                            supportedTypes: ["log"],
                            onPick: { url in
                                //print("url : \(url)")
                        },
                            onDismiss: {
                                //print("dismiss")
                        }
                        )
                        UIApplication.shared.windows.first?.rootViewController? .present(picker, animated: true)
                    }) {
                        HStack{
                            Spacer()
                            Text("View all in Files App")
                            .font(.headline)
                            .padding(10)
                                .padding(.bottom, 5)
                            Spacer()
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Downloads"))
        }
        .onAppear{
            UITableView.appearance().separatorColor = .clear
        }
    }
}



//
//struct DownloadList_Previews: PreviewProvider {
//    static var previews: some View {
//        DownloadList()
//    }
//}




