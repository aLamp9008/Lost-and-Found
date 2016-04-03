//
//  FirstViewController.swift
//  Lost and Found
//
//  Created by alden lamp on 4/2/16.
//  Copyright © 2016 JasonAldenVincent. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var itemsTableView: UITableView!
    let cellIdentifier = "cell"
    var itemNames = ["Test1","Test2","Test3"]
    var itemDescriptions = ["Testing...","Testing...","Testing..."]
    var itemImages = ["sampleImage","sampleImage","sampleImage"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("nothgin")
        // Do any additional setup after loading the view, typically from a nib.
        
        print("asdfasdfasdfasdf")
        self.itemsTableView.rowHeight = 350
        self.itemsTableView.allowsSelection = false
        self.itemsTableView.registerNib(UINib(nibName: "LostAndFoundTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
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
}

