//
//  FirstViewController.swift
//  Lost and Found
//
//  Created by alden lamp on 4/2/16.
//  Copyright © 2016 JasonAldenVincent. All rights reserved.
//

import UIKit
import Firebase

var ref = Firebase(url: "https://incandescent-fire-6594.firebaseio.com/web/saving-data/fireblog")

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var itemsTableView: UITableView!
    let cellIdentifier = "cell"
    var itemNames = ["Test1","Test2","Test3"]
    var itemDescriptions = ["Testing...","Testing...","Testing..."]
    var itemImages = ["sampleImage","sampleImage","sampleImage"]
    var datesLost = ["1/1/11","2/2/22","3/3/33"]
    var phoneNumbers = ["999","9999","99999"]
    var images = ["sampleImage","sampleImage","sampleImage"]
    

    var refreshController: UIRefreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshController.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        self.itemsTableView.addSubview(refreshController)
        self.itemsTableView.rowHeight = 350
        self.itemsTableView.allowsSelection = false
        self.itemsTableView.registerNib(UINib(nibName: "LostAndFoundTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        // Attach a closure to read the data at our posts reference

        
    }
    
    func refresh() {
        
        self.itemsTableView.reloadData()
        
        ref.observeEventType(.ChildAdded, withBlock: { snapshot in
            let personsName = snapshot.value.objectForKey("name")
            let dateLost = snapshot.value.objectForKey("dateLost")
            let personsNumber = snapshot.value.objectForKey("phoneNumber")
            let image = snapshot.value.objectForKey("image")
            let description = snapshot.value.objectForKey("description")
            
            self.itemNames.append(String(personsName))
            self.itemDescriptions.append(String(description))
            self.datesLost.append(String(dateLost))
            self.phoneNumbers.append(String(personsNumber))
            self.images.append(String(image))
            
            print(self.itemNames)
            print(self.itemDescriptions)
            
        })
        
        
    }

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
        cell?.itemImage.image = UIImage(named: itemImages[indexPath.row])
        return cell!
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue)
    {
        // unwind
    }
}

