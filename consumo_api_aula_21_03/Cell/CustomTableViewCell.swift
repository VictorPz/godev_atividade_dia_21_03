//
//  CustomTableViewCell.swift
//  consumo_api_aula_21_03
//
//  Created by Victor Pizetta on 21/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
        
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var cellCompanyName: UILabel!
    
    static let identifier = "CustomTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellImage.layer.cornerRadius = cellImage.frame.size.width / 2
    }
    
    func setupCell(person: Persons) {
        cellName.text = person.name
        cellCompanyName.text = person.company.name
        cellImage.loadImage(from: person.photo)
        
    }
}
