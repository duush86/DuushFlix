//
//  String+Ext.swift
//  DuushFlix
//
//  Created by Antonio Orozco on 2/24/21.
//

import Foundation

extension String {
    
    var yearOnTimeStamp: String? {
        
        let formatter = DateFormatter()
        //2019-07-02T21:17:49.833Z
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        guard let toYear = formatter.date(from: self) else {
            print("Problem creating date")
            return nil
        }
        
        formatter.dateFormat = "yyyy"
        
        let yearString = formatter.string(from: toYear)
        return yearString
        
    }
    
//    func getYearfFromString(forString string: String) -> String? {
//
//        let formatter = DateFormatter()
//
//        formatter.dateFormat = "yyyy-MM-dd"
//
//
//        guard let toDate = formatter.date(from: string) else {
//
//            print("Problem converting to date")
//
//            return nil
//        }
//
//        formatter.dateFormat = "yyyy"
//
//        let toString = formatter.string(from: toDate)
//
//        return toString
//    }
    
}
