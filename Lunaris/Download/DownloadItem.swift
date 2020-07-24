//
//  DownloadItem.swift
//  Lunaris
//
//  Created by Zhu Xiaochen on 19/7/20.
//  Copyright © 2020 Zhu Xiaochen. All rights reserved.
//

import Foundation

struct DownloadItem: Hashable, Identifiable {
    var id = UUID() // file ID
    var fileName: String // file name
    var fileType: String //file Type
    var moduleCode: String // module code
    var url: URL // file download url
    var progress: Float = 0 // progress percentage
    var hasStarted: Bool = false
}
