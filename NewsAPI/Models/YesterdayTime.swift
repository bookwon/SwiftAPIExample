//
//  CurrentTime.swift
//  NewsAPI
//
//  Created by book on 2021/12/17.
//


import UIKit

struct YesterdayTime
{
    
    // get the date of yesterday
    static func getDate() -> String
    {
       
            
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
    
            
        let time = dateFormatter.string(from: Calendar.current.date(byAdding: .day, value: -1, to: date)!)
    
        
        return time

    }
    
}
