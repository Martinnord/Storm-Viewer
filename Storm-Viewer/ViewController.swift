//
//  ViewController.swift
//  Storm-Viewer
//
//  Created by Martin Nordström on 2017-03-23.
//  Copyright © 2017 Martin Nordström. All rights reserved.
//

import UIKit

var solutions = [String]()

class ViewController: UITableViewController {
    
    var level: levelNames!
    var _levelNames = levelNames()
    
    var currentTitlee: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "xxxxxx"
        
        let fm = FileManager.default // Data type that let us work with filesystems
        let path = Bundle.main.resourcePath! // Resourse path of apps bundle. "!" - Implicity unwrapped optional
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("Level") {
                solutions.append(item)
            }
        }
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _levelNames.levels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = _levelNames.levels[indexPath.row]

        
        _ = _levelNames.levels[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailsViewController {
            // 2: success! Set its selectedImage property
            vc.selectedSolution = solutions[indexPath.row]
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    

    
}

