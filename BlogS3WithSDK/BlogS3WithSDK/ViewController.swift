//
//  ViewController.swift
//  BlogS3WithSDK
//
//  Created by Alistair Cooper on 7/31/16.
//  
//

import UIKit
import AWSS3

class ViewController: UIViewController {
    
    // 1S)
    // AWS constants
    let S3BucketName = "YOUR_BUCKET_NAME"
    let S3Region = AWSRegionType.USWest2
    let credentialsRegion = AWSRegionType.USWest2
    let identityPool = "YOUR_IDENTITY_POOL"
    
    // image view for download image
    var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2S)
        // Initialize the Amazon Cognito credentials provider
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType: credentialsRegion,
                                                                identityPoolId: identityPool)
        
        let configuration = AWSServiceConfiguration(region: S3Region, credentialsProvider:credentialsProvider)
        
        AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration

        // 3S)
        // add button for upload
        let uploadBtn = UIButton(frame: CGRect(x: 100, y: 50, width: 200, height: 50))
        uploadBtn.backgroundColor = .blueColor()
        uploadBtn.setTitle("Upload Image", forState: .Normal)
        uploadBtn.addTarget(self, action: #selector(uploadBtnAction), forControlEvents: .TouchUpInside)
        self.view.addSubview(uploadBtn)
        
        // add button for download
        let downloadBtn = UIButton(frame: CGRect(x: 100, y: 120, width: 200, height: 50))
        downloadBtn.backgroundColor = .blueColor()
        downloadBtn.setTitle("Download Image", forState: .Normal)
        downloadBtn.addTarget(self, action: #selector(downloadBtnAction), forControlEvents: .TouchUpInside)
        self.view.addSubview(downloadBtn)
        
        // initialize image view for downloaded image
        let ivFrame = CGRect(x: 0, y: 250, width: 300, height: 200)
        imageView = UIImageView(frame: ivFrame)
        
    }
    
    func uploadBtnAction(sender: UIButton!) {
        uploadFile()
    }
    
    func downloadBtnAction(sender: UIButton!) {
        downloadFile()
    }
    
    func uploadFile() {
        
        // 1U)
        let ext = "jpg"
        let imageURL = NSBundle.mainBundle().URLForResource("acTaylor", withExtension: ext)!
        
        // 2U)
        let uploadRequest = AWSS3TransferManagerUploadRequest()
        uploadRequest.bucket = S3BucketName
        uploadRequest.key = NSProcessInfo.processInfo().globallyUniqueString + "." + ext
        uploadRequest.body = imageURL
        uploadRequest.contentType = "image/" + ext
        
        // 3U)
        let transferManager = AWSS3TransferManager.defaultS3TransferManager()
        transferManager.upload(uploadRequest).continueWithBlock { (task) -> AnyObject! in
            if let error = task.error {
                print("uploadFile() failed: (\(error))")
            }
            if let exception = task.exception {
                print("uploadFile() failed: (\(exception))")
            }
            if task.result != nil {
                let s3URL = NSURL(string: "http://s3.amazonaws.com/\(self.S3BucketName)/\(uploadRequest.key!)")!
                print("uploadFile() successful to: \(s3URL)")
            }
            else {
                print("Unexpected empty result.")
            }
            return nil
        }
    }
    
    func downloadFile() {
        // 1D)
        let imageName = "YOUR_IMAGE_ON_S3_NAME.jpg"
        let downloadedFilePath = NSTemporaryDirectory().stringByAppendingString("downloaded-\(imageName)")
        let downloadedFileURL = NSURL(fileURLWithPath: downloadedFilePath)
        
        // 2D)
        let downloadRequest = AWSS3TransferManagerDownloadRequest()
        downloadRequest.bucket = S3BucketName
        downloadRequest.key = imageName
        downloadRequest.downloadingFileURL = downloadedFileURL
        
        // 3D)
        let transferManager = AWSS3TransferManager.defaultS3TransferManager()
        transferManager.download(downloadRequest).continueWithBlock { (task) -> AnyObject! in
            if let error = task.error {
                print("downloadFile() failed: (\(error))")
            }
            else if let exception = task.exception {
                print("downloadFile() failed: (\(exception))")
            }
            else if task.result != nil {
                
                if let data = NSData(contentsOfURL: downloadedFileURL) {
                    // update the UI on the main queue
                    dispatch_async(dispatch_get_main_queue()) {
                        self.imageView!.image = UIImage(data: data)
                        self.imageView!.contentMode = UIViewContentMode.ScaleAspectFit
                        self.view.addSubview(self.imageView!)
                    }
                }
            }
            else {
                print("Unexpected empty result")
            }
            return nil
        }
    }
}



