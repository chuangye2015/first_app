//
//  NSITEM.swift
//  firstapp
//
//  Created by ww on 15/8/9.
//  Copyright (c) 2015年 ww. All rights reserved.
//

import Foundation
// MARK: - NSCoding
extension cnsitem: NSCoding {
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.name, forKey: "name")
        coder.encodeObject(self.date, forKey: "date")
        coder.encodeObject(self.img, forKey: "img")
    }
}

class cnsitem: NSObject {
    
    var name: String
    
    var date: String
    var img: String
    
    override init() {
        
        self.name = String()
        
      self.date = String()
              self.img = String()
    }
    init(name:String,date:String,img:String) {
        
self.name = name
        self.date = date
        self.img = img
        
    }
    required convenience init(coder decoder: NSCoder) {
        self.init()
        self.name = decoder.decodeObjectForKey("name") as! String
        self.date = decoder.decodeObjectForKey("date")as! String
        self.img = decoder.decodeObjectForKey("img")as! String
    }

}
