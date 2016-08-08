//
//  ViewController.swift
//  CloudStorageS3Simple
//
//  Demo app for the "Cloud Storage for iOS Apps with AWS S3" Blog
//  Demonstrating a simple image download from an S3 bucket
//
//  Created by Alistair Cooper on 7/25/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // link for your object on S3
    let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/blogpoststorage07242016/acPiano.jpg")!
    
    var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize an image view
        let ivFrame = CGRect(x: 0, y: 0, width: 300, height: 200)
        imageView = UIImageView(frame: ivFrame)
        
        // download image from s3
        let session = NSURLSession.sharedSession()
        
        let downloadTask = session.dataTaskWithURL(url) { data, response, error in
            if data == nil {
                print("\(error)")
                
            } else {
                // update the UI on the main queue
                dispatch_async(dispatch_get_main_queue()) { [unowned self] in
                    self.imageView!.image = UIImage(data: data!)
                    self.imageView!.contentMode = UIViewContentMode.ScaleAspectFit
                    self.view.addSubview(self.imageView!)
                }
            }
        }
        
        downloadTask.resume()
    }
}

