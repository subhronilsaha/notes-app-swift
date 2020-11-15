//
//  ViewController.swift
//  Notes-App
//
//  Created by Subhronil Saha on 14/11/20.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    let realm = try! Realm()
    
    @IBOutlet weak var notesTable: UITableView!
    
    var isLoggedIn : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        notesTable.register(NoteCellTableViewCell.nib(), forCellReuseIdentifier: NoteCellTableViewCell.identifier)
        notesTable.delegate = self
        notesTable.dataSource = self
        
        if isLoggedIn == false {
            showLoginScreen()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.notesTable.reloadData()
    }
    
    //MARK:- Go to Login Screen
    func showLoginScreen() {
        let loginVC = storyboard?.instantiateViewController(identifier: "loginViewController") as! LoginViewController
        loginVC.navigationItem.title = "Login"
        loginVC.navigationItem.leftBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil)
        
        loginVC.callback = { loginStatus in
            self.isLoggedIn = loginStatus
        }
        
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    //MARK:- Table View Protocol Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let notesList = realm.objects(Note.self)
        return notesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notesList = realm.objects(Note.self)
        let currentNote = notesList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteCellTableViewCell.identifier, for: indexPath) as! NoteCellTableViewCell
        
        cell.configure(with: currentNote.noteTitle, desc: currentNote.noteDesc, image: currentNote.noteImagePath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let notesList = realm.objects(Note.self)
        let detailsVC = storyboard?.instantiateViewController(identifier: "detailsViewController") as! DetailsViewController
        detailsVC.navigationItem.title = "Details"
        detailsVC.currentNote = notesList[indexPath.row]
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    
    
}

