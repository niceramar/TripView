//
//  TripModel.swift
//
//
//  Created by iOS on 30/05/16.
//  Copyright © 2016 . All rights reserved.
//

import Foundation

public class TripModel: NSObject{

    var fromCity: String!
    var toCity: String!
    var bookingCode: String!
    var isTwoWayJourney: NSNumber!
    var startDate: String!
    var returnDate: String!
    var viaCity: String!
    var startTime: String!
    var returnTime: String!
    var bgImage:String?

   public init(fromcity:String, tocity:String, bookingcode:String, istwowayjourney:NSNumber, startdate:String, returndate:String,viacity:String) {
        super.init()
        self.fromCity = fromcity + " to"
        self.toCity = tocity
        self.bookingCode = bookingcode
        self.isTwoWayJourney = istwowayjourney
        self.startDate = self.fetchDate(startdate)
        self.returnDate = self.fetchDate(returndate)
        print(startDate)
        if viacity == "" {
            self.viaCity = viacity
        }else{
            self.viaCity = "via " + viacity
        }
               
        self.startTime = self.fetchTime(startdate)
        self.returnTime = self.fetchTime(returndate)
    }
    
    func fetchTime(date:String) -> String {
     let range = date.startIndex.advancedBy(11)..<date.endIndex.advancedBy(-8)
        return date.substringWithRange(range)
    }
    
    func fetchDate(date:String) -> String {
        let range = date.startIndex.advancedBy(0)..<date.endIndex.advancedBy(-14)
        return date.substringWithRange(range)
    }
}