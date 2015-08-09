//
//  cllist.swift
//  firstapp
//
//  Created by ww on 15/8/6.
//  Copyright (c) 2015年 ww. All rights reserved.
//

import UIKit


class cllist: UITableViewController {
    var items:[Titem] = itemdata
    var itemlist = [cnsitem]()
    
    var frist:Bool!
    var item:Titem?
  
    func saveitemlist(item:Titem){
        let sitem = cnsitem(name: item.name, date: item.date, img: item.img)
        self.itemlist.append(sitem)
        println("append\(self.itemlist.count)")
    }
    
    func saveBugs(item:Titem) {
        saveitemlist(item)
           println("savebug\(self.itemlist.count)")
        let data = NSKeyedArchiver.archivedDataWithRootObject(self.itemlist)
        NSUserDefaults.standardUserDefaults().setObject(data, forKey: "items")
        NSUserDefaults.standardUserDefaults().synchronize()
         println("save?????")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func imageForRating(img:String) -> UIImage? {
        switch img {
        case "1":
            return UIImage(named: "11.jpg")
  //      case 2:
    //        return UIImage(named: "2StarsSmall")
    //    case 3:
    //        return UIImage(named: "3StarsSmall")
     //   case 4:
      //      return UIImage(named: "4StarsSmall")
      //  case 5:
      //      return UIImage(named: "5StarsSmall")
        default:
            return nil
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    var run = false
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        println("table1")
       
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("items") as? NSData
        {
            
            itemlist = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [cnsitem]
             println("itemsconut=\(items.count)")
            println("itemslistconut=\(itemlist.count)")
            if items.count != itemlist.count
            {
            self.items.removeAll(keepCapacity: true)
            println("bbb\(itemlist.count)")
            println("bbb\(itemlist[itemlist.count-1].name)")
            for var i = 0;i < itemlist.count;i++ {
                let litem = Titem(name: itemlist[i].name, date: itemlist[i].date, img: "1")
                
                self.items.append(litem)
                run = true
            }
            }
            
        } else {
            println("aaa")
            
        }
        return items.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("itemcell", forIndexPath: indexPath)
    as! cuicell
println("xccc")
        /*
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("items") as? NSData {
           itemlist = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [cnsitem]
             println("bbb\(itemlist.count)")
            println("bbb\(itemlist[itemlist.count-1].name)")
            for var i = 0;i < itemlist.count;i++ {
                 let litem = Titem(name: itemlist[i].name, date: itemlist[i].date, img: "1")

                self.items.append(litem)
            }
            
        } else {
             println("aaa")
         
        }
*/
         println("count")
        println(items.count)
        println(indexPath.row)
    let item = items[indexPath.row] as Titem
       // let item = items[indexPath.row] as cnsitem
    /*cell.textLabel?.text = item.name
    cell.detailTextLabel?.text = item.date
*/
        cell.name.text = item.name
        cell.date.text = item.date
        cell.img.image  = self.imageForRating("1")
        /*
        if let nameLabel = cell.viewWithTag(100) as? UILabel { //3
            nameLabel.text = item.name
        }
        if let dateLabel = cell.viewWithTag(101) as? UILabel { //3
            dateLabel.text = item.date
        }
        if let ratingImageView = cell.viewWithTag(102) as? UIImageView {
            ratingImageView.image = self.imageForRating("1")
        }
*/
    return cell
    }

    @IBAction func cancelitem(segue:UIStoryboardSegue) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveitem(segue:UIStoryboardSegue) {
        
        
        let itemc = segue.sourceViewController as! clitem
        
        //add the new player to the players array
       // saveitemlist(itemc.item)
        items.append(itemc.item)
        self.saveBugs(itemc.item)
       // items.append(newitem)
        //update the tableView
        let indexPath = NSIndexPath(forRow: items.count-1, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
