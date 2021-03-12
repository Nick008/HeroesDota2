//
//  HeroViewController.swift
//  HeroesDota2
//
//  Created by Thipawan Penmoon on 11/3/2564 BE.
//

import UIKit
import MapleBacon

class HeroViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let get_Hero = gHero()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHero()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 25, bottom: 0, right: 25)
        layout.itemSize = CGSize(width: 180, height: 155)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(UINib.init(nibName: "HeroCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        self.collectionView.collectionViewLayout = layout
        
    }
    
    //abyssal_underlord
    //natures_prophet
    
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return get_Hero.id.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! HeroCollectionViewCell
        cell.nameLabel.text = get_Hero.localized_name[indexPath.row]

        if let url = URL(string: imgProfile(name: get_Hero.localized_name[indexPath.row])) {
            cell.imageView.setImage(with: url)
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AboutHeroViewController") as! AboutHeroViewController
        vc.localized_name = get_Hero.localized_name[indexPath.row]
        vc.name = get_Hero.name[indexPath.row]
        vc.attack_type = get_Hero.attack_type[indexPath.row]
        vc.arrRole = get_Hero.arrRoles[indexPath.row]
        vc.primary_attr = get_Hero.primary_attr[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func loadHero() {
        get_Hero.getHero({(response) in
            self.get_Hero.getDataObject(response.anyObject as! Data, objectIndex: RequestURL.CLASS.getHero, callback: { (response) in
                print("GET HERO : \(response.description)\n")
                self.collectionView.reloadData()
            })
        })
    }
    
    func imgProfile(name:String) -> String {
        switch name {
        case "Anti-Mage":
            return "\(RequestURL.urlHeroImage)anti_mage.jpg"
        case "Nature's Prophet":
            return "\(RequestURL.urlHeroImage)natures_prophet.jpg"
        case "Underlord":
            return "\(RequestURL.urlHeroImage)abyssal_underlord.jpg"
        case "Outworld Destroyer":
            return "\(RequestURL.urlHeroImage)outworld_devourer.jpg"
        default:
            let replaced = name.replacingOccurrences(of: " ", with: "_")
            return "\(RequestURL.urlHeroImage)\(replaced.lowercased()).jpg"
        }
    }
}
