//
//  LoadingVC.swift
//  CoreToDo
//
//  Created by Roxana Stan on 14/11/2016.
//  Copyright © 2016 Roxana Stan. All rights reserved.
//

import UIKit

class LoadingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Here you can customize the Loading Screen - add animation, visual loader, etc
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(goNext), userInfo: nil, repeats: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //this function will take you to the next controller after the timer finished
    func goNext(){
        
        let navC = UINavigationController.init(rootViewController: MainVC())
        Utils.appDelegate.window??.rootViewController = navC
        
    }


}
