//
//  ViewController.swift
//  New Final Project
//
//  Created by Moyo Ososami on 2019-06-05.
//  Copyright © 2019 Moyo. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let list = ["Watch Big Brother", "Buy father's day gift", "Finish High School", "Pass finals", "Pass Summer School"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(list.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return(cell)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnAddEventTapped(_ sender: Any) {
        let eventStore:EKEventStore = EKEventStore()
        
        eventStore.requestAccess(to: .event) { (granted, error) in
            
            if (granted) && (error == nil)
            {
                print("granted \(granted)")
                print("error \(error)")
                
                let event:EKEvent = EKEvent(eventStore: eventStore)
                event.title = "Watch Big Brother"
                event.startDate = Date()
                event.endDate = Date()
                event.notes = "Big Brother 21 Premieres June 25"
                event.title = "Buy Father's Day gift"
                event.notes = "Father's day is next week"
                event.title = "Pass finals"
                event.notes = "Exams are next week"
                event.title = "Finish High School"
                event.notes = "I want to get out of here"
                event.title = "Pass Summer School"
                event.title = "Buy Father's Day gift"
                event.notes = "Father's day is next week"
                event.title = "Get more involved"
                event.notes = "I want to put myself out there"
                event.title = "Play TS3 Island Paradise"
                event.notes = "I plan to fully explore this expansion pack this summer"
                event.calendar = eventStore.defaultCalendarForNewEvents
                do {
                    try eventStore.save(event, span: .thisEvent)
                }catch let error as NSError{
                    print("error : \(error)")
                }
                print("Save Event")
                
                
            }else{
                print("error : \(error)")
            }
            
        
        }
        
    }
    
}

