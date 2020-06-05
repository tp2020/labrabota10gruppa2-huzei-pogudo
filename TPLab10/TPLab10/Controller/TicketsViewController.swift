//
//  TicketsViewController.swift
//  TPLab10
//
//  Created by Ilya Huzei on 03.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import UIKit

class TicketsViewController: UIViewController {

    private var tickets:[Reception]!
    var polyclinic:Hospital!
    @IBOutlet var ticketsList: UICollectionView!
     {
         didSet {
           // 1
           ticketsList.delegate = self
           ticketsList.dataSource = self
           // 2
           ticketsList.register(UINib.init(nibName: "TicketCell", bundle: nil), forCellWithReuseIdentifier: "TicketCell")
           ticketsList.backgroundColor = .clear
         }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tickets = ViewController.dbConnector.getPatReceptions(patient: AccountViewController.patient,polyclinic: polyclinic)
        ticketsList.reloadData()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        tickets = ViewController.dbConnector.getPatReceptions(patient: AccountViewController.patient,polyclinic: polyclinic)
                ticketsList.reloadData()
        
    }
    

    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension TicketsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tickets.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let grettViewC = storyBoard.instantiateViewController(withIdentifier: "TicketProfileViewController") as! TicketProfileViewController
        grettViewC.modalPresentationStyle = .fullScreen
        grettViewC.ticket = tickets[indexPath.row]
        grettViewC.polyclinic = polyclinic
        self.present(grettViewC, animated: true, completion: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TicketCell", for: indexPath) as! TicketCell
        cell.configure(date: tickets[indexPath.row].getDate(), polyclinic: polyclinic.getName(), doctor: tickets[indexPath.row].getDoctor())
     
    return cell
  }
}

extension TicketsViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: ticketsList.bounds.width, height: 190)
  }
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
                      return 0
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
                      return 0
   }
}
