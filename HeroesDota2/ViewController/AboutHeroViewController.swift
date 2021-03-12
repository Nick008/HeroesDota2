//
//  AboutHeroViewController.swift
//  HeroesDota2
//
//  Created by Thipawan Penmoon on 12/3/2564 BE.
//

import UIKit

class AboutHeroViewController: UIViewController {
    
    var name = ""
    var localized_name = ""
    var primary_attr = ""
    var arrRole:[String] = []
    var attack_type = ""
    
    @IBOutlet weak var lbRole: UILabel!
    @IBOutlet weak var lbAttack: UILabel!
    @IBOutlet weak var lbPrimary: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        lbName.text = localized_name
        lbPrimary.text = "Primary : \(primary_attr)"
        lbAttack.text = "Attack Type : \(attack_type)"
        
        let arrRoles = arrRole
        let strRoles = arrRoles.joined(separator: ", ")
        
        lbRole.text = "Roles : \(strRoles)"
        let replaced = localized_name.replacingOccurrences(of: " ", with: "_")
        if let url = URL(string: "\(RequestURL.urlHeroImage)\(replaced.lowercased()).jpg") {
            imgProfile.setImage(with: url)
        }
        
    }
    
    
    
}
