//
//  AddNoteViewController.swift
//  Notes-App
//
//  Created by Subhronil Saha on 14/11/20.
//

import UIKit
import RealmSwift

class AddNewViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let realm = try! Realm()
    
    @IBOutlet var noteTitle: UITextField?
    @IBOutlet var noteDescription: UITextView?
    @IBOutlet var noteImage : UIImageView?
    var noteImagePath : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        noteTitle?.becomeFirstResponder()
    }
    
    //MARK:- Image Picker
    @IBAction func pickImage() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        self.noteImagePath = imagePath.path
        self.noteImage?.image = UIImage(contentsOfFile: self.noteImagePath)
        print(self.noteImagePath)

        dismiss(animated: true, completion: nil)
    }
    
    func getDocumentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    //MARK:- Save Button
    @IBAction func didTapSave() {
        
        guard let title = noteTitle?.text else {
            print("Title empty")
            return
        }
        
        guard let desc = noteDescription?.text else {
            print("desc empty")
            return
        }
        
        let imagePath = noteImagePath
        
        realm.beginWrite()
        
        let note = Note()
        note.noteTitle = title
        note.noteDesc = desc
        note.noteImagePath = imagePath
        realm.add(note)
        
        try! realm.commitWrite()
        
        navigationController?.popViewController(animated: true)
        
    }
    

}
