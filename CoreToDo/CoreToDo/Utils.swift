//
//  Utils.swift
//  Kinder
//
//  Created by Roxana Stan on 09/03/16.
//  Copyright © 2016 Roxana Stan. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    //check whether the device is iphone or ipad
    static let isIphone: Bool = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone)
    static let isIpad: Bool = !(UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone)
    
    static let appDelegate : UIApplicationDelegate = (UIApplication.shared.delegate)!
    
    /// Shared instance
    static let sharedInstance = Utils()
    
    fileprivate override init() {
        super.init()
    }
    
    let LOADING_TAG = 1000230
//    var activityIndicator = UIActivityIndicatorView()
//    var strLabel = UILabel()
//    
//    func showLoadingMessage(msg:String, _ indicator:Bool, view:UIView) {
//        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 200, height: 50))
//        strLabel.text = msg
//        strLabel.textColor = UIColor.whiteColor()
//        messageFrame = UIView(frame: CGRect(x: view.frame.midX - 90, y: view.frame.midY - 25 , width: 180, height: 50))
//        messageFrame.layer.cornerRadius = 15
//        messageFrame.backgroundColor = UIColor(white: 0, alpha: 0.7)
//        if indicator {
//            activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
//            activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//            activityIndicator.startAnimating()
//            messageFrame.addSubview(activityIndicator)
//        }
//        messageFrame.addSubview(strLabel)
//        view.addSubview(messageFrame)
//    }
    
    func showLoading(){
        if let view = Utils.appDelegate.window {
            self.showLoadingInView(view!)
        }
    }
    
    //this is a small spanning loading animation
    func showLoadingInView(_ view:UIView) {
        
        let existingLoadingView = view.viewWithTag(LOADING_TAG)
        
        if let nnLoadingView = existingLoadingView {
            view.bringSubview(toFront: nnLoadingView)
            return
        }
        
        let loadingView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        loadingView.tag = LOADING_TAG
        loadingView.layer.cornerRadius = 10
        loadingView.backgroundColor = UIColor(white: 0, alpha: 0.7)
    
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.startAnimating()
        loadingView.addSubview(activityIndicator)
        
        loadingView.center = CGPoint(x: view.bounds.size.width/2, y: view.bounds.size.height/2)
        
        view.addSubview(loadingView)

    }
    
    func hideLoading(){
        if let view = Utils.appDelegate.window {
            self.hideLoadingInView(view!)
        }
    }
    
    func hideLoadingInView(_ view :UIView) {
        let existingLoadingView = view.viewWithTag(LOADING_TAG)
        
        if let nnLoadingView = existingLoadingView {
            nnLoadingView.removeFromSuperview()        
        }
    }
    
}

class Color {
    class func imageWithColor(_ color: UIColor, size: CGSize = CGSize(width: 60, height: 60)) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor);
        context?.fill(rect);
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext();
        
        return image!;
    }
}


/// Device check
private struct DeviceCheck {
    static let iPad      = UIDevice.current.userInterfaceIdiom == .pad && maxLength == 1024.0
    static let iPadPro   = UIDevice.current.userInterfaceIdiom == .pad && maxLength == 1366.0
    
    static let width     = UIScreen.main.bounds.size.width
    static let height    = UIScreen.main.bounds.size.height
    static let maxLength = max(width, height)
}
