//
//  DownloadsViewModel.swift
//  Lunaris
//
//  Created by Zhu Xiaochen on 19/7/20.
//  Copyright © 2020 Zhu Xiaochen. All rights reserved.
//

import Foundation

class DownloadsViewModel: ObservableObject {

    @Published var downloadingItems = [DownloadItem]()
    
    func addToQueue(fileName: String, fileType: String, moduleCode: String, url: String) {
        let newDownloadItem = DownloadItem(fileName: fileName, fileType: fileType, moduleCode: moduleCode, url: URL(string: url)!)
        startTask(downloadItem: newDownloadItem)
    }
    
    func startTask(downloadItem: DownloadItem) {
        self.downloadingItems.append(downloadItem)
        let url = downloadItem.url
        let request = URLRequest(url: url)
        let downloadTask = DownloadManager.shared.session.downloadTask(with: request)
        downloadTask.resume()
        DownloadManager.shared.onProgress = { (progress) in
            if let i = self.downloadingItems.firstIndex(where: {$0.id == downloadItem.id}) {
                DispatchQueue.main.async {
                    self.downloadingItems[i].progress = progress
                }
                
            }
        }
    }

//    func deleteFromDownloadable(at offsets: IndexSet) {
//        results.remove(atOffsets: offsets)
//    }
}
