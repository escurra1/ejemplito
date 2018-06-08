//
//  ViewController.swift
//  ejemplito
//
//  Created by mescurra on 4/11/18.
//  Copyright © 2018 mescurra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var buttonEdit: UIButton!
    
    
    
    var dataModel = ["Google","Microsoft","Android","Apple","Everis","Mas ñee", "Firebase", "Cloud DB", "Cerda"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        buttonEdit.layer.cornerRadius = buttonEdit.frame.height / 2.0
        
        myTableView.layer.cornerRadius = 25
        
        myTableView.showsVerticalScrollIndicator = false
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
    }
    
    
    @IBAction func pressButton(_ sender: UIButton) {
        
        myTableView.isEditing = !myTableView.isEditing
        let title = (myTableView.isEditing) ? "Done" : "Edit"
        buttonEdit.setTitle(title, for: .normal)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = dataModel[indexPath.row]
        return cell
    }
    
    
    //para mover el order
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = dataModel[sourceIndexPath.row]
        dataModel.remove(at: sourceIndexPath.row)
        dataModel.insert(temp, at: destinationIndexPath.row)
//        print(dataModel)
    }
    
    
    //para eliminar
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataModel.remove(at: indexPath.row)
            myTableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    
}

