//
//  ViewController.swift
//  assignment
//
//  Created by Kittidech Vongsak on 7/8/16.
//  Copyright © 2016 Kittidech Vongsak. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import EZLoadingActivity


class ViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    
    
    var myUsers:[User] = []
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func GetData(sender: AnyObject) {
        
        myUsers = []
        if passValidate() {
            
            EZLoadingActivity.show("Loading...", disableUI: true)
            let username = txtUsername.text!.removeWhitespace()
            
            let url = "https://api.github.com/users/"+username+"/repos"
            
            Alamofire.request(.GET, url)
                .responseJSON { response in
                    switch response.result {
                    case .Success:
                        let json = JSON(data: response.data!)
                        
                        if(json.arrayObject != nil && json.count > 0)
                        {
                            for index in 0...json.count-1 {
                                
                                let myUser:User = User(json: json[index])
                                self.myUsers.append(myUser)
                            }
                        }
                        
                        EZLoadingActivity.hide()
                        if self.myUsers.count == 0 {
                            let alert = UIAlertController(title: "Error!!", message: "Cannot find data", preferredStyle: UIAlertControllerStyle.Alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                            self.presentViewController(alert, animated: true, completion: nil)
                        }else
                        {
                            let myDisplayDataViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DisplayDataViewController") as? DisplayDataViewController
                            myDisplayDataViewController?.myUsers = self.myUsers;
                            self.navigationController?.pushViewController(myDisplayDataViewController!, animated: true)
                            
                        }
                        
                    case .Failure(let error):
                        EZLoadingActivity.hide()
                        let alert = UIAlertController(title: "Error!!", message: error.localizedDescription, preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil)

                    }
                    
            }
        }
        
        
    }
    func passValidate() -> Bool {
        
        switch Reach().connectionStatus() {
        case .Unknown, .Offline:
            let alert = UIAlertController(title: "Error!!", message: "Internet not connected", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return false
        default:
            
            let username = txtUsername.text;
            if username!.isEmpty {
                let alert = UIAlertController(title: "Error!!", message: "Please insert username", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                return false
            }else
            {
                return true
            }
        }
        
    }
}

