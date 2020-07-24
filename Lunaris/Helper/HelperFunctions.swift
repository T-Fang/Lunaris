//
//  HelperFunctions.swift
//  Lunaris
//
//  Created by T放 on 16/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI
import CoreData
import Contentful

func parseDateString(dateString: String) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mmZZZZZ"
    let date = formatter.date(from: dateString)!
    return date
}

func fileSizeString (of fileSize: Int) -> String {
    if(fileSize >= 1073741824){
        return String(fileSize/1073741824) + "Gb"
    }else if(fileSize >= 1048576) {
        return String(fileSize/1048576) + "Mb"
    } else if(fileSize >= 1024) {
        return String(fileSize/1024) + "Kb"
    } else {
        return String(fileSize) + "byte"
    }
}

func getFileType(of name: String) -> (fileName: String, fileType: String) {
    if let dotIndex = name.lastIndex(of: ".") {
        let fileName = String(name[..<dotIndex])
        let typeStartIndex = name.index(after: dotIndex)
        let fileType = String(name[typeStartIndex...])
        return (fileName, fileType)
    } else {
        return (name, "unknown")
    }
}

func getEntries(typeID: String, completion: @escaping ([Entry]) -> ()) {
    let query = Query.where(contentTypeId: "module")
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        switch result {
        case .success(let array):
            DispatchQueue.main.async {
                completion(array.items)
            }
        case .failure(let error):
            print(error)
        }
        
    }
}

func moduleColorOf (_ prefix: String) -> UIColor{
    switch prefix {
    case "CS", "CP":
        return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    case "MA", "ST":
        return #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    case "ES", "UTW", "UTC", "UTS", "IS", "GER":
        return #colorLiteral(red: 0.9529655576, green: 0.5187426209, blue: 0.3511109948, alpha: 1)
    default:
        return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
    }
}
//extension UIView {
//   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
//        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        layer.mask = mask
//    }
//}
//
//
//override func layoutSubviews() {
//    super.layoutSubviews()
//    roundCorners(corners: [.topLeft, .topRight], radius: 3.0)
//}
//
