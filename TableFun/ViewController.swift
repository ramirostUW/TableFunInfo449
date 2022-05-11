//
//  ViewController.swift
//  TableFun
//
//  Created by Ted Neward on 4/26/22.
//

import UIKit

class TableDataAndDelegate : NSObject, UITableViewDataSource, UITableViewDelegate {
    weak var vc : ViewController?
    
    let data : [String] = [
        "Dopey", "Sleepy", "Sneezy", "Grumpy", "Thorin Oakenshield",
        "Bombur", "Kali", "Fali", "Mali", "Gimli", "Bimli",
        "Fred", "Barney", "Wilma", "Betty"
    ]

    /*
     UITableViewDataSource methods
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("indexPath.item = \(indexPath.item)", "indexPath.row = \(indexPath.row)")
        
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "dwarf", for: indexPath)
        cell.textLabel!.text = data[indexPath.row]
        return cell
    }
    
    /*
     UITableViewDelegate methods
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let alert = UIAlertController(title: "Selected!", message: "You selected \(data[indexPath.row])!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        vc!.present(alert, animated: true, completion: nil)
    }

}

class ViewController: UIViewController {
    
    var tableDataAndDelegate = TableDataAndDelegate()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableDataAndDelegate.vc = self
        
        tableView.dataSource = tableDataAndDelegate
        tableView.delegate = tableDataAndDelegate
    }

}

