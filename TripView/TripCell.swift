//
//  TripCell.swift
//   
//
//  Created by iOS on 05/06/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit

class TripCell: UITableViewCell {

    let padding:CGFloat = 10
    
    var fromCity: UILabel!
    var toCity: UILabel!
    var bookingCode: UILabel!
    var startDate: UILabel!
    var returnDate: UILabel!
    var viaCity: UILabel!
    var startTime: UILabel!
    var returnTime: UILabel!
    var bgImageName:String!
    
    var tripModel:TripModel?{
        didSet{
            if let t = tripModel{
               fromCity.text = t.fromCity
                toCity.text = t.toCity
                bookingCode.text = "Booking Code \(t.bookingCode)"
                startDate.text = t.startDate
                returnDate.text = t.returnDate
                viaCity.text = t.viaCity
                startTime.text = t.startTime
                returnTime.text = t.returnTime
                 bgImageName = t.bgImage
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clearColor()
        selectionStyle = .None
        
        let cityView: UIView = UIView()

        cityView.backgroundColor = UIColor.whiteColor()
//        let maskpath = UIBezierPath(roundedRect: cityView.bounds, byRoundingCorners: [.TopLeft,.BottomLeft], cornerRadii: CGSize(width: 10.0, height: 10.0))
//        let maskLayer = CAShapeLayer(layer: maskpath)
//        maskLayer.frame = cityView.bounds
//        maskLayer.path = maskpath.CGPath
//        cityView.layer.mask = maskLayer
//        
        
        let scheduleView: UIView = UIView()
        scheduleView.backgroundColor = UIColor.whiteColor()
       
        let checkinView: UIView = UIView()
        checkinView.backgroundColor = UIColor(red: 100.0/255, green: 168.0/255, blue: 255.0/255, alpha: 1.0)
        
        let checkInText:UILabel = UILabel(frame: CGRectZero)
        checkInText.text = "Check-in is Open"
        let checkInNow:UILabel  = UILabel(frame: CGRectZero)
        checkInNow.text = "Check in now"
        
        checkInText.textAlignment = .Left
        checkInText.textColor = UIColor.whiteColor()
        checkInText.font = UIFont(name: "Helvetica Bold", size: 25.0)
        checkInText.translatesAutoresizingMaskIntoConstraints = false
        
        checkInNow.textAlignment = .Left
        checkInNow.textColor = UIColor.whiteColor()
        checkInNow.font = UIFont(name: "Helvetica", size: 22.0)
        checkInNow.translatesAutoresizingMaskIntoConstraints = false
        checkinView.addSubview(checkInText)
        checkinView.addSubview(checkInNow)
        
        cityView.translatesAutoresizingMaskIntoConstraints = false
        scheduleView.translatesAutoresizingMaskIntoConstraints = false
        checkinView.translatesAutoresizingMaskIntoConstraints = false
        
        if bgImageName == nil {
            bgImageName = "default"
           
        }
        let bgImageView = UIImageView(image: UIImage(named: bgImageName))
        bgImageView.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        self.backgroundView = bgImageView
        
        contentView.addSubview(cityView)
        contentView.addSubview(scheduleView)
        contentView.addSubview(checkinView)
       
        
        fromCity = UILabel(frame: CGRectZero)
        fromCity.textAlignment = .Left
        fromCity.textColor = UIColor.blackColor()
        fromCity.font = UIFont(name: "Helvetica", size: 22.0)
        fromCity.translatesAutoresizingMaskIntoConstraints = false
        cityView.addSubview(fromCity)
        
        toCity = UILabel(frame: CGRectZero)
        toCity.textAlignment = .Left
        toCity.textColor = UIColor.blackColor()
        toCity.font = UIFont(name: "Avenir-Light", size: 32.0)
        toCity.translatesAutoresizingMaskIntoConstraints = false
        cityView.addSubview(toCity)
        
        viaCity = UILabel(frame: CGRectZero)
        viaCity.textAlignment = .Left
        viaCity.textColor = UIColor.blackColor()
        viaCity.translatesAutoresizingMaskIntoConstraints = false
        cityView.addSubview(viaCity)
        
        bookingCode = UILabel()
        bookingCode.textAlignment = .Left
        bookingCode.textColor = UIColor.grayColor()
        bookingCode.translatesAutoresizingMaskIntoConstraints = false
        cityView.addSubview(bookingCode)
        
        startDate = UILabel(frame: CGRectZero)
        startDate.textAlignment = .Left
        startDate.textColor = UIColor.blackColor()
        startDate.translatesAutoresizingMaskIntoConstraints = false
        scheduleView.addSubview(startDate)
        
        returnDate = UILabel(frame: CGRectZero)
        returnDate.textAlignment = .Left
        returnDate.textColor = UIColor.blackColor()
        returnDate.translatesAutoresizingMaskIntoConstraints = false
        scheduleView.addSubview(returnDate)
        
        startTime = UILabel(frame: CGRectZero)
        startTime.textAlignment = .Left
        startTime.textColor = UIColor.blackColor()
        startTime.translatesAutoresizingMaskIntoConstraints = false
        scheduleView.addSubview(startTime)
        
        returnTime = UILabel(frame: CGRectZero)
        returnTime.textAlignment = .Left
        returnTime.textColor = UIColor.blackColor()
        returnTime.translatesAutoresizingMaskIntoConstraints = false
        scheduleView.addSubview(returnTime)
        
        // CityView
        let cityViewTop = NSLayoutConstraint(item: cityView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Bottom, multiplier: 0.75, constant: 0)
        
        let cityViewLeading = NSLayoutConstraint(item: cityView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 10)
        
        let cityViewBottom = NSLayoutConstraint(item: cityView, attribute: NSLayoutAttribute.BottomMargin, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.BottomMargin, multiplier: 1, constant: -20)

        let cityViewWidth = NSLayoutConstraint(item: cityView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Width, multiplier: 0.33, constant: 0)
        
        let cityViewIphoneTrailing = NSLayoutConstraint(item: cityView, attribute: NSLayoutAttribute.TrailingMargin, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.TrailingMargin, multiplier: 1, constant: -20)
        
      
        
        // Schedulded View
        let scheduleViewTop = NSLayoutConstraint(item: scheduleView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Bottom, multiplier: 0.75, constant: 0)
        
        let scheduleViewIphoneTop = NSLayoutConstraint(item: scheduleView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: cityView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        
        let scheduleViewLeading = NSLayoutConstraint(item: scheduleView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: cityView, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        
         let scheduleViewIphoneTrailing = NSLayoutConstraint(item: scheduleView, attribute: NSLayoutAttribute.TrailingMargin, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.TrailingMargin, multiplier: 1, constant: -20)
        
        let scheduleViewBottom = NSLayoutConstraint(item: scheduleView, attribute: NSLayoutAttribute.BottomMargin, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.BottomMargin, multiplier: 1, constant: -20)
        
    
        
        
        /// checkinView
        let checkinViewTop = NSLayoutConstraint(item: checkinView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Bottom, multiplier: 0.75, constant: 0)
        
        let checkinViewIphoneTop = NSLayoutConstraint(item: checkinView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: scheduleView, attribute: NSLayoutAttribute.TopMargin, multiplier: 1, constant: 0)
        
        let checkinViewLeading = NSLayoutConstraint(item: checkinView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: scheduleView, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        
        let checkinViewIphoneLeading = NSLayoutConstraint(item: checkinView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        
        let checkinViewWidth = NSLayoutConstraint(item: checkinView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Width, multiplier:0.33, constant: 0)
        
        let checkinViewTrailing = NSLayoutConstraint(item: checkinView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: -10)
        
         let checkinViewIphoneTrailing = NSLayoutConstraint(item: checkinView, attribute: NSLayoutAttribute.TrailingMargin, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.TrailingMargin, multiplier: 1, constant: -40)
        
        let checkinViewBottom = NSLayoutConstraint(item: checkinView, attribute: NSLayoutAttribute.BottomMargin, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.BottomMargin, multiplier: 1, constant: -20)
        
        // Child Contents
        let fromCityTop = NSLayoutConstraint(item: fromCity, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: cityView, attribute: NSLayoutAttribute.TopMargin, multiplier: 1, constant: 20)
        
        let fromCityLeading = NSLayoutConstraint(item: fromCity, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: cityView, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 20)
        
        let toCityTop = NSLayoutConstraint(item: toCity, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: fromCity, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: -5)
        
        let toCityLeading = NSLayoutConstraint(item: toCity, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: fromCity, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        
        let viaCityTop = NSLayoutConstraint(item: viaCity, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: toCity, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: -5)
        
        let viaCityLeading = NSLayoutConstraint(item: viaCity, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: toCity, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        
        let bookingCodeTop = NSLayoutConstraint(item: bookingCode, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: viaCity, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        
        let bookingCodeLeading = NSLayoutConstraint(item: bookingCode, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: viaCity, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        
        let bookingCodeBottom = NSLayoutConstraint(item: bookingCode, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: cityView, attribute: NSLayoutAttribute.BottomMargin, multiplier: 1, constant: -20)
        
        let startDateTop = NSLayoutConstraint(item: startDate, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: scheduleView, attribute: NSLayoutAttribute.TopMargin, multiplier: 1, constant: 20)
        
        let startDateLeading = NSLayoutConstraint(item: startDate, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: scheduleView, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 10)
        
        let startTimeTop = NSLayoutConstraint(item: startTime, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: startDate, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        
        let startTimeLeading = NSLayoutConstraint(item: startTime, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: startDate, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 10)
        
        let returnDateTop = NSLayoutConstraint(item: returnDate, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: startDate, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 10)
        
        let returnDateLeading = NSLayoutConstraint(item: returnDate, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: startDate, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        
        let returnTimeTop = NSLayoutConstraint(item: returnTime, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: returnDate, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        
        let returnTimeLeading = NSLayoutConstraint(item: returnTime, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: returnDate, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 10)
        
        
        let cityViewCenterY = NSLayoutConstraint(item: checkInText, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: checkinView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        
         let cityViewCenterX = NSLayoutConstraint(item: checkInText, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: checkinView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        
        
        let scheduleViewCenterY = NSLayoutConstraint(item: checkInNow, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: checkInText, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        
        let scheduleViewCenterX = NSLayoutConstraint(item: checkInNow, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: checkInText, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        
        // handle the constraints specific for ipad and iPhone
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
             self.contentView.addConstraints([cityViewTop,cityViewWidth,cityViewLeading,cityViewBottom,scheduleViewTop,scheduleViewLeading,scheduleViewBottom,checkinViewTop,checkinViewWidth,checkinViewLeading,checkinViewTrailing,checkinViewBottom,fromCityTop,fromCityLeading,toCityTop,toCityLeading,viaCityTop,viaCityLeading,bookingCodeTop,bookingCodeLeading,startDateTop,startDateLeading,startTimeTop,startTimeLeading,returnDateTop,returnDateLeading,returnTimeTop,returnTimeLeading, cityViewCenterY, scheduleViewCenterY, cityViewCenterX, scheduleViewCenterX])
        }else{
             self.contentView.addConstraints([cityViewTop,cityViewLeading,cityViewIphoneTrailing,scheduleViewIphoneTop,scheduleViewLeading,scheduleViewIphoneTrailing,checkinViewIphoneTop,checkinViewIphoneLeading,checkinViewBottom,fromCityTop,fromCityLeading,toCityTop,toCityLeading,viaCityTop,viaCityLeading,bookingCodeTop,bookingCodeLeading,bookingCodeBottom,startDateTop,startDateLeading,startTimeTop,startTimeLeading,returnDateTop,returnDateLeading,returnTimeTop,returnTimeLeading])
        }
        
       //bookingCodeBottom,
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
      
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
