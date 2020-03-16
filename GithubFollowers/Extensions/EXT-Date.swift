//
//  EXT-Date.swift
//  GithubFollowers
//
//  Created by Travis W. Stanifer on 1/24/20.
//  Copyright © 2020 Travis Stanifer. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
