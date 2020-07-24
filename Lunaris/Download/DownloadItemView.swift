//
//  DownloadItemView.swift
//  Lunaris
//
//  Created by T放 on 23/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI

struct DownloadItemView: View {
    var item: DownloadItem
    var body: some View {
        HStack {
            Image(item.fileType)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .padding(.trailing, 4)

            VStack(alignment: .leading, spacing: 8) {
                Text(self.item.fileName)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                
                Text(self.item.moduleCode)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            Spacer()
            
            ProgressView(width: 50, height: 50, percent: item.progress)
            
        }
        .frame(maxWidth: listCardWidth)
        .padding(.vertical, 8)
        .padding(.horizontal, 11)
    }
}

struct DownloadItemView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadItemView(item: sampleDownloadItem)
    }
}
