//
//  TripsViewController.swift
//   
//
//  Created by iOS on 28/05/16.
//  Copyright © 2016 . All rights reserved.
//

import UIKit


public class TripsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var whiteView:UIView! = nil
    var blueView:UIView! = nil
    
   public var arrTrips = [TripModel]()
    
   var tripsTable:UITableView = UITableView()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        tripsTable = UITableView()
        tripsTable.translatesAutoresizingMaskIntoConstraints = false
        tripsTable.delegate = self
        tripsTable.dataSource = self
        tripsTable.registerClass(TripCell.self, forCellReuseIdentifier:NSStringFromClass(TripCell))
        tripsTable.rowHeight = UITableViewAutomaticDimension
        tripsTable.estimatedRowHeight = 100
        self.view.addSubview(self.tripsTable)
       /// retirveCustomer()
        createChildViews()
        // Do any additional setup after loading the view.
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Tableview Delegate
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrTrips.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(TripCell), forIndexPath: indexPath) as! TripCell
        cell.tripModel = self.arrTrips[indexPath.row]
        return cell
    }
    
   public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
    
   public func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableView.frame.size.height - 50;
    }
    
    // MARK: - CreateView
    func createChildViews() {
        whiteView = UIView()
        whiteView.backgroundColor = UIColor.whiteColor()
        // whiteView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        self.view.addSubview(whiteView)
        
        blueView = UIView()
        blueView.backgroundColor = UIColor.blueColor()
        //blueView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        self.view.addSubview(blueView)
        
        blueView.translatesAutoresizingMaskIntoConstraints = false;
        whiteView.translatesAutoresizingMaskIntoConstraints = false;
        setiPadConstraints()
    }
    
    
    func setiPadConstraints() {
        
        let tableViewLeftConstraint = NSLayoutConstraint(item: tripsTable, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0)
        
        let tableViewRightConstraint = NSLayoutConstraint(item: tripsTable, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0)
        
        let tableViewTopConstraint = NSLayoutConstraint(item: tripsTable, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
        
        let tableViewBottomConstraint = NSLayoutConstraint(item: tripsTable, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
        
        /*
         /// WhiteView
         // Left Edge
         let whiteViewLeftConstraint = NSLayoutConstraint(item: whiteView, attribute: NSLayoutAttribute.LeftMargin, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.LeftMargin, multiplier: 1.0, constant: 30)
         //Width
         let whiteViewWidthConstraint = NSLayoutConstraint(item: whiteView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 0.66, constant: 0)
         //Top
         let whiteViewHeightConstraint = NSLayoutConstraint(item: whiteView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 0.66, constant: 100)
         // Bottom
         let whiteViewBottomConstraint = NSLayoutConstraint(item: whiteView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -40)
         /// BlueView
         //Top Edge
         let blueViewTopConstraint = NSLayoutConstraint(item: blueView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: whiteView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
         //Leading Edge
         let blueViewLeadingConstraint = NSLayoutConstraint(item: blueView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: whiteView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0)
         //Width
         let blueViewWidthConstraint = NSLayoutConstraint(item: blueView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: whiteView, attribute: NSLayoutAttribute.Width, multiplier: 0.5, constant: 0)
         //Trailing Edge
         let blueViewTrailingConstraint = NSLayoutConstraint(item: blueView, attribute: NSLayoutAttribute.TrailingMargin, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.TrailingMargin, multiplier: 1.0, constant: -30)
         //Bottom
         let blueViewBottomConstraint = NSLayoutConstraint(item: blueView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: whiteView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
         */
        // Add Constraints
        //      self.view.addConstraints([tableViewLeftConstraint,tableViewRightConstraint,tableViewTopConstraint,tableViewBottomConstraint,whiteViewLeftConstraint,whiteViewWidthConstraint, whiteViewHeightConstraint,whiteViewBottomConstraint,blueViewLeadingConstraint,blueViewTopConstraint,blueViewWidthConstraint,blueViewBottomConstraint,blueViewTrailingConstraint])
        
        self.view.addConstraints([tableViewLeftConstraint,tableViewRightConstraint,tableViewTopConstraint,tableViewBottomConstraint])
    }
    
 
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
