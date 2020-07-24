//
//  FoundationExtension.swift
//  Lunaris
//
//  Created by T放 on 18/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import Foundation

extension NSPredicate {
    static var all = NSPredicate(format: "TRUEPREDICATE")
    static var none = NSPredicate(format: "FALSEPREDICATE")
}


extension String {
    func includes(_ str: String) -> Bool {
        self.lowercased().contains(str.lowercased())
    }
}
