//
//  Note.swift
//  Notes-App
//
//  Created by Subhronil Saha on 14/11/20.
//

import RealmSwift

class Note: Object {
    @objc dynamic var noteTitle : String = ""
    @objc dynamic var noteDesc : String = ""
    @objc dynamic var noteImagePath : String = ""
}
