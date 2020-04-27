//
//  ViewController.swift
//  WallpaperPlus
//
//  Created by Appendix on 26.04.2020.
//  Copyright © 2020 Appendix. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var typeModel = [TypeModel]()
    var wallpaperModel = [WallPaperModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        getDatabase()
    }
    func getDatabase() {
        let firestore = Firestore.firestore()
        
        firestore.collection("types").order(by: "typeNumber", descending: false).getDocuments { (snapshot, err) in
            if err != nil {
                print(err?.localizedDescription ?? "Error")
            } else {
                self.typeModel.removeAll(keepingCapacity: false)
                for document in snapshot!.documents {
                    if let typeNumber = document.get("typeNumber") as? Int {
                        if let typeName = document.get("typeName") as? String {
                            if let wallpapers = document.get("wallpapers") as? [[String : Any]] {
                                let type = TypeModel(typeName: typeName, typeNumber: typeNumber, wallpapers: wallpapers)
                                self.typeModel.append(type)
                                
                            }
                        }
                    }
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TypeCell
        cell.typeCellView.layer.cornerRadius = 25
        cell.typeCellView.clipsToBounds = true
        let type = typeModel[indexPath.row]
        cell.typeLabel.text = type.typeName
        let wp = type.wallpapers[0]
        for (key, value) in wp {
            if key == "wallpaperUrl" {
                cell.typeCellView.sd_setImage(with: URL(string: "\(value)"))
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
}

