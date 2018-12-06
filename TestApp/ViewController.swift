//
//  ViewController.swift
//  TestApp
//
//  Created by Antol Peshkov on 28/11/2018.
//  Copyright © 2018 Mad Brains. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "triam"
        label.textColor = UIColor.red
        button.backgroundColor = UIColor.green
    }

    @IBAction func buttonTap(_ sender: Any) {
        let url = URL(string: "https://cat-fact.herokuapp.com/facts")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: handleResponse)
        task.resume()
    }
    
    func handleResponse(data: Data?, response: URLResponse?, error: Error?) {
        do {
            let values = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, Any>
            let jsonFacts = values["all"] as! Array<Any>
            let facts = mapFacts(jsonFacts: jsonFacts)
            
            DispatchQueue.main.async {
                self.label.text = facts.first!.text
            }
            
        } catch {
            print("Что-то пошло не так")
        }
    }
    
    func mapFacts(jsonFacts: Array<Any>) -> [Fact] {
        var facts = Array<Fact>()
        for jsonFact in jsonFacts {
            let fact = Fact()
            fact.decode(from: jsonFact as! Dictionary<String, Any>)
            facts.append(fact)
        }
        return facts
    }
}

