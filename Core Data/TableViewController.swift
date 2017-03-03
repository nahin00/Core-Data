//
//  TableViewController.swift
//  Core Data
//
//  Created by Silicon Orchard Ltd on 3/3/17.
//  Copyright © 2017 Silicon Orchard Ltd. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var allContactHistory = [ContactHistory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return allContactHistory.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        let contactHistory = allContactHistory[indexPath.row]
        
        if let name = contactHistory.name{
        
            cell.nameLbl.text = "Name: \(name)"
        }
        
        if let time = contactHistory.time{
            
            cell.timeLbl.text = "Time: \(time)"
        }

        return cell
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    
    func getData(){
        do{
            allContactHistory = try context.fetch(ContactHistory.fetchRequest())
        } catch {
            print("fetching error")
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            let contactHistory = allContactHistory[indexPath.row]
            context.delete(contactHistory)

            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do{
                allContactHistory = try context.fetch(ContactHistory.fetchRequest())
                
            }catch{
                print("fetching error")
            }
        }
        
        tableView.reloadData()
    }

}
