//
//  FirstViewController.swift
//  Lost and Found
//
//  Created by alden lamp on 4/2/16.
//  Copyright © 2016 JasonAldenVincent. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON

var ref = Firebase(url: "https://incandescent-fire-6594.firebaseio.com/web/saving-data/fireblog")

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var testImageData = UIImage(named: "sampleImage")
    @IBOutlet weak var itemsTableView: UITableView!
    let cellIdentifier = "cell"
    var itemNames = ["Test1","Test2","Test3"]
    var itemDescriptions = ["Testing...","Testing...","Testing..."]
    var itemImages = ["sampleImage","sampleImage","sampleImage"]
    var datesLost = ["1/1/11","2/2/22","3/3/33"]
    var phoneNumbers = ["999","9999","99999"]
    var images:[UIImage]?
    

   // var refreshController: UIRefreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = [testImageData!, testImageData!, testImageData!]
        // Do any additional setup after loading the view, typically from a nib.
       // refreshController.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
       // self.itemsTableView.addSubview(refreshController)
        self.itemsTableView.rowHeight = 350
        self.itemsTableView.allowsSelection = false
        self.itemsTableView.registerNib(UINib(nibName: "LostAndFoundTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        // Attach a closure to read the data at our posts reference

        // Get a reference to our posts
        var count:UInt = 0
        var name: String?
        var date: String?
        var number: String?
        var description: String?
        var image: UIImage?
        
        
        
        // Retrieve new posts as they are added to the database
        ref.observeEventType(.ChildAdded, withBlock: { snapshot in
            count++
            
            let stuff = JSON(snapshot.value)
            
            name = stuff["value"]["name"].string
            date = stuff["value"]["dateLost"].string
            number = stuff["value"]["phoneNumber"].string
            description = stuff["value"]["description"].string
            print(stuff["value"]["image"])
            do{
                    image = try UIImage(data: stuff["value"]["image"].rawData())
            }catch{
                print("failed")
            }
            
            
            
            self.itemNames.append(name!)
            self.itemDescriptions.append(description!)
            self.datesLost.append(date!)
            self.phoneNumbers.append(number!)
            self.images?.append(image!)
            
            print(self.itemNames)
            self.itemsTableView.reloadData()
        })
        
        
        // snapshot.childrenCount will always equal count since snapshot.value will include every FEventTypeChildAdded event
        // triggered before this point.
        ref.observeEventType(.Value, withBlock: { snapshot in
            print("initial data loaded! \(count == snapshot.childrenCount)")
            self.itemsTableView.reloadData()
        })
        
        self.itemsTableView.reloadData()
    }
  
    /*
    func refresh() {

        
        // Get a reference to our posts
        var count:UInt = 0
        var name: String?
        var date: String?
        var number: String?
        var description: String?
        var image: NSData?
        
        
        
        // Retrieve new posts as they are added to the database
        ref.observeEventType(.ChildAdded, withBlock: { snapshot in
            count++

            let stuff = JSON(snapshot.value)
            
            name = stuff["value"]["name"].string
            date = stuff["value"]["dateLost"].string
            number = stuff["value"]["phoneNumber"].string
            description = stuff["value"]["description"].string
            image = try? stuff["value"]["image"].rawData()
            
            self.itemNames.append(name!)
            self.itemDescriptions.append(description!)
            self.datesLost.append(date!)
            self.phoneNumbers.append(number!)
            self.images?.append(image!)
        })
        
        
        

        
        // snapshot.childrenCount will always equal count since snapshot.value will include every FEventTypeChildAdded event
        // triggered before this point.
        ref.observeEventType(.Value, withBlock: { snapshot in
            print("initial data loaded! \(count == snapshot.childrenCount)")
        })
        
        self.itemsTableView.reloadData()

        
    }
 */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemNames.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 450
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:LostAndFoundTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? LostAndFoundTableViewCell
        cell?.itemName.text = itemNames[indexPath.row]
        cell?.itemDescription.text = itemDescriptions[indexPath.row]
        cell?.itemImage.image = images![indexPath.row]
        return cell!
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue)
    {
        // unwind
    }
}

