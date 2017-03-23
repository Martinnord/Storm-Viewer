//
//  ViewController.swift
//  Storm-Viewer
//
//  Created by Martin Nordström on 2017-03-23.
//  Copyright © 2017 Martin Nordström. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]() // () - create one now
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Storm Viewer"
        
        let fm = FileManager.default // Data type that let us work with filesystems
        let path = Bundle.main.resourcePath! // Resourse path of apps bundle. "!" - Implicity unwrapped optional
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailsViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

