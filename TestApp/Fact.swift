//
//  Fact.swift
//  TestApp
//
//  Created by Antol Peshkov on 04/12/2018.
//  Copyright © 2018 Mad Brains. All rights reserved.
//

import Foundation
import RealmSwift

class Fact: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var text: String = ""

    func decode(from dictionary: Dictionary<String, Any>) {
        id = dictionary["_id"]! as! String
        text = dictionary["text"]! as! String
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}


