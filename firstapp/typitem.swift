//
//  typitem.swift
//  firstapp
//
//  Created by ww on 15/8/6.
//  Copyright (c) 2015年 ww. All rights reserved.
//

import Foundation

import UIKit

class Titem: NSObject {
    var name: String
    var date: String
    var img: String
    
    init(name: String, date: String, img: String) {
        self.name = name
        self.date = date
        self.img = img
        super.init()
    }
}


