//
//  Fact.swift
//  TestApp
//
//  Created by Antol Peshkov on 04/12/2018.
//  Copyright © 2018 Mad Brains. All rights reserved.
//

import Foundation

class Fact {
    let id: String
    let text: String
    let upvotes: Array<Any>

    init(dictionary: Dictionary<String, Any>) {
        id = dictionary["_id"]! as! String
        text = dictionary["text"]! as! String
        upvotes = dictionary["upvotes"]! as! Array<Any>
    }
}

//class Fact {
//    let id: String
//    let text: String
//    let upvotes: Array<Any>
//
//    init() {
//        id = ""
//        text = ""
//        upvotes = []
//    }
//}

