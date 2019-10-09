//
//  Extensions.swift
//  Songol-E
//
//  Created by 최민섭 on 11/09/2019.
//  Copyright © 2019 최민섭. All rights reserved.
//

import Foundation

extension TimeInterval {
    func formattedStringFromNow(now: NSDate) -> String {
        let date = NSDate(timeIntervalSince1970: self/1000)
        let dateFormatterGet = DateFormatter()
        let timeIntervalFromNow = Int(now.timeIntervalSince(date as Date) / 3600) //86400

        switch timeIntervalFromNow {
        case 0..<1:
            let minuteIntervalFromNow = Int(now.timeIntervalSince(date as Date) / 60)
            if minuteIntervalFromNow < 1 {
                let secondIntervalFromNow = Int(now.timeIntervalSince(date as Date))
                return "\(secondIntervalFromNow)초전"
            }
            return "\(minuteIntervalFromNow)분전"
        case 1..<24:
            return "\(timeIntervalFromNow)시간전"
        case 24:
            return "어제"
        case 25..<8640:
            dateFormatterGet.dateFormat = "M월 d일"

            let calendar = Calendar.current
            let year = calendar.component(.year, from: date as Date)
            let currentYear = calendar.component(.year, from: now as Date)
            if currentYear > year {
                dateFormatterGet.dateFormat = "yy.MM.dd"
            }
            
            return dateFormatterGet.string(from: date as Date)
        default:
            dateFormatterGet.dateFormat = "yy.MM.dd"
            return dateFormatterGet.string(from: date as Date)
        }
    }
}

extension UIView {
    func addAutoLayout(parent: UIView, topConstraint: UIView? = nil, bottomConstraint: UIView? = nil, heightRatio: CGFloat = 1, widthRatio: CGFloat = 1) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: parent.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: parent.rightAnchor).isActive = true
        
        if let topConstraint = topConstraint {
            self.topAnchor.constraint(equalTo: topConstraint.bottomAnchor).isActive = true
        } else {
            self.topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        }
        
        if let bottomConstraint = bottomConstraint {
            self.bottomAnchor.constraint(equalTo: bottomConstraint.topAnchor).isActive = true
        } else {
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
        }
    }
}
