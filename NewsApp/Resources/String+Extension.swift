//
//  String+Extension.swift
//  NewsApp
//
//  Created by Navi on 06/07/22.
//

import Foundation

extension String {
    
    /// Formats the selected string to configured date format.
    var formatToDate: Self? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        guard let dateObj = dateFormatterGet.date(from: self) else {
            return nil
        }
        return dateFormatter.string(from: dateObj)
    }
}
