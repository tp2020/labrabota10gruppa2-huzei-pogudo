//
//  RegistrationViewController.swift
//  TPLab10
//
//  Created by Ilya Huzei on 02.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet var loginText: UITextField!
    @IBOutlet var nameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet var passwordText: UITextField!
    
    @IBAction func registerTapped(_ sender: Any) {
        if(loginText.text == "" || passwordText.text == "" || nameText.text == ""){
            
             DispatchQueue.main.async {
                           let alert = UIAlertController(title: "Error", message: "Incorrect data!", preferredStyle: .alert)
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
            
            return
        }
        let log:String = loginText.text!
        let pass:String = passwordText.text!
        let name:String = nameText.text!
        UserDefaults.standard.set(loginText.text, forKey: "login")
        UserDefaults.standard.set(passwordText.text, forKey: "password")
        let pat:Patient = Patient(name: name, login: log, password: pass)
        ViewController.dbConnector.addPatient(pat: pat)
        AccountViewController.patient = pat
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let grettViewC = storyBoard.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
        grettViewC.modalPresentationStyle = .fullScreen
        self.present(grettViewC, animated: true, completion: nil)
        
    }
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
