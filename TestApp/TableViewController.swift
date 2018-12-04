//
//  TableViewController.swift
//  TestApp
//
//  Created by Antol Peshkov on 04/12/2018.
//  Copyright © 2018 Mad Brains. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var facts = Array<Fact>() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://cat-fact.herokuapp.com/facts")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: handleResponse)
        task.resume()
    }
    
    func handleResponse(data: Data?, response: URLResponse?, error: Error?) {
        do {
            let values = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, Any>
            let jsonFacts = values["all"] as! Array<Any>
            let newFacts = mapFacts(jsonFacts: jsonFacts)
            
            DispatchQueue.main.async {
                self.facts = newFacts
            }
        } catch {
            print("Что-то пошло не так")
        }
    }
    
    func mapFacts(jsonFacts: Array<Any>) -> [Fact] {
        var facts = Array<Fact>()
        for jsonFact in jsonFacts {
            let fact = Fact(dictionary: jsonFact as! Dictionary<String, Any>)
            facts.append(fact)
        }
        return facts
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return facts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FactCell", for: indexPath)

        cell.textLabel?.text = facts[indexPath.row].text

        return cell
    }

}
