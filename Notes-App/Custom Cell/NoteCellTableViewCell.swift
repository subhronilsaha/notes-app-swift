//
//  NoteCellTableViewCell.swift
//  Notes-App
//
//  Created by Subhronil Saha on 15/11/20.
//

import UIKit

class NoteCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var noteImage: UIImageView!
    @IBOutlet weak var noteTitle: UILabel!
    @IBOutlet weak var noteDesc: UILabel!
    
    static let identifier = "customCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "NoteCellTableViewCell", bundle: nil)
    }
    
    public func configure(with title: String, desc: String, image: String) {
        self.noteImage.image = UIImage(contentsOfFile: image)
        self.noteTitle.text = title
        self.noteDesc.text = desc
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
