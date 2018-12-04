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
    let user: Dictionary<String, Any>
    let upvotes: Array<Any>
    
    init() {
        id = ""
        text = ""
        user = Dictionary<String, Any>()
        upvotes = []
    }
}

