//
//  ViewController.swift
//  TPLab10
//
//  Created by Ilya Huzei on 02.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var loginText: UITextField!
    @IBOutlet var passwordText: UITextField!
    static let dbConnector = DataBaseHandler()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
     override func viewDidAppear(_ animated: Bool) {
        if(UserDefaults.standard.string(forKey: "login") != nil && UserDefaults.standard.string(forKey: "password") != nil){
            let pat:Patient? = ViewController.dbConnector.checkPatient(login: UserDefaults.standard.string(forKey: "login")!, password: UserDefaults.standard.string(forKey: "password")!)
            let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let grettViewC = storyBoard.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
                grettViewC.modalPresentationStyle = .fullScreen
                AccountViewController.patient = pat!
                self.present(grettViewC, animated: true, completion: nil)
            
        }
       }
    
    @IBAction func exitTapped(_ sender: Any) {
        exit(0)
    }
    @IBAction func LogIn(_ sender: Any) {
        let pat:Patient? = ViewController.dbConnector.checkPatient(login: loginText.text!, password: passwordText.text!)
        if(pat != nil){
            UserDefaults.standard.set(loginText.text, forKey: "login")
            UserDefaults.standard.set(passwordText.text, forKey: "password")
            let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let grettViewC = storyBoard.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
            grettViewC.modalPresentationStyle = .fullScreen
            AccountViewController.patient = pat!
            self.present(grettViewC, animated: true, completion: nil)
            
        }
        else{
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Error", message: "Patient does not exist!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    switch action.style{
                    case .default:
                        print("default")
                    case .cancel:
                        print("cancel")
                    case .destructive:
                        print("destructive")
                        
                    }
                    
                }))
                self.present(alert, animated: true, completion: nil)
                
            }
            
        }
        
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
         let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                      let grettViewC = storyBoard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
                      grettViewC.modalPresentationStyle = .fullScreen
                      self.present(grettViewC, animated: true, completion: nil)
        
    }
}

