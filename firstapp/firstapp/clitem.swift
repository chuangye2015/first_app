//
//  clitem.swift
//  firstapp
//
//  Created by ww on 15/8/9.
//  Copyright (c) 2015年 ww. All rights reserved.
//

import UIKit

class clitem: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var date: UITextField!
    var item:Titem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "saveitem" {
            item = Titem(name: self.name.text, date: self.date.text, img:"1")
        }
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
