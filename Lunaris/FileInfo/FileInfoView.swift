//
//  FileInfoView.swift
//  Lunaris
//
//  Created by T放 on 18/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct FileInfoView: View {
    @EnvironmentObject var downloads: DownloadsViewModel

    @ObservedObject var fileInfo: FileInfo
    @State var showAlert: Bool = false
    var body: some View {
        HStack {
            Image(fileInfo.fileType)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .padding(4)
                .background(Color("iconifyColor"))
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 8) {
                Text(self.fileInfo.fileName)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                
                Text(fileSizeString(of: self.fileInfo.fileSize))
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
            }
            Spacer()
            
            Button(action: {
                self.showAlert.toggle()
                self.downloads.addToQueue(fileName: self.fileInfo.fileName, fileType: self.fileInfo.fileType, moduleCode: self.fileInfo.module.prefix + self.fileInfo.module.digits, url: self.fileInfo.fileUrl)
            }) {
                Image(systemName: "square.and.arrow.down")
                .iconify(fontSize: 25, sideLength: 50)
            }
            .alert(isPresented: self.$showAlert) {
                Alert(title: Text("Added to download queue"), message: Text("Please go to the Download tab to see the file"), dismissButton: .cancel(Text("OK")))
            }
            
            
            
        }
        .frame(maxWidth: listCardWidth)
        .padding(.vertical, 8)
        .padding(.horizontal, 11)
    }
}

struct FileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FileInfoView(fileInfo: sampleFileInfo1)
    }
}


