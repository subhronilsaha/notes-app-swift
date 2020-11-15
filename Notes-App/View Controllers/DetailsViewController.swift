//
//  DetailsViewController.swift
//  Notes-App
//
//  Created by Subhronil Saha on 15/11/20.
//

import UIKit
import RealmSwift

class DetailsViewController: UIViewController {

    var currentNote = Note()
    
    @IBOutlet var noteTitle : UILabel?
    @IBOutlet var noteDesc : UILabel?
    @IBOutlet var noteImage : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        noteTitle?.text = currentNote.noteTitle
        noteDesc?.text = currentNote.noteDesc
        noteImage?.image = UIImage(contentsOfFile: currentNote.noteImagePath)
    }
    
    
}
