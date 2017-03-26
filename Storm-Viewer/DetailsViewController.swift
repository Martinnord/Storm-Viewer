//
//  DetailsViewController.swift
//  Storm-Viewer
//
//  Created by Martin Nordström on 2017-03-23.
//  Copyright © 2017 Martin Nordström. All rights reserved.
//

import UIKit
import Social

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedImage
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    // Let's the user share a image on Facebook
    func shareTapped() {
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
            vc.setInitialText("Look at this picture!")
            vc.add(imageView.image!)
            vc.add(URL(string: "http://www.photolib.noaa.gov/nssl"))
            present(vc, animated: true)
        }
        
        
        /*let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)*/
    }
    
    // Makes the navigationbar disappear on tap
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    // Makes the navigationbar appear on tap
    override func viewWillDisappear(_ animated: Bool) {

        
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
