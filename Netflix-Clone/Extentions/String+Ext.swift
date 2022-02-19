//
//  String+Ext.swift
//  Netflix-Clone
//
//  Created by Abdirizak Hassan on 2/19/22.
//

import Foundation

//extension String {
////    func capitalizeFirstLater() -> String {
////        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
////    }
//
//    func capitalizingFirstLetter() -> String {
//        return prefix(1).capitalized + dropFirst()
//    }
//
//    mutating func capitalizeFirstLetter() {
//        self = self.capitalizingFirstLetter()
//    }
//}

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
