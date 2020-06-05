//
//  AccountViewController.swift
//  TPLab10
//
//  Created by Ilya Huzei on 02.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet var imgUser: UIImageView!
    
    @IBOutlet var nameText: UILabel!
    static var patient:Patient!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.text = AccountViewController.patient.getName()
        imgUser.image = UIImage(named: "User")
    }
    
    @IBAction func backTapped(_ sender: Any) {
        UserDefaults.standard.set(nil, forKey: "login")
        UserDefaults.standard.set(nil, forKey: "password")
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func hospitalsTapped(_ sender: Any) {
        
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
        }
            let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let grettViewC = storyBoard.instantiateViewController(withIdentifier: "Hospital") as! HospitalViewController3
        grettViewC.modalPresentationStyle = .fullScreen
        self.present(grettViewC, animated: true, completion: nil)
        
        
    }
    @IBAction func polyclinicsTapped(_ sender: Any) {
        
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let grettViewC = storyBoard.instantiateViewController(withIdentifier: "PolyclinicsViewController") as! PolyclinicsViewController
        grettViewC.modalPresentationStyle = .fullScreen
        self.present(grettViewC, animated: true, completion: nil)
        
    }
    
    
   /*  // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
