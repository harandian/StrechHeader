//
//  MyTableViewController.swift
//  Stretch My Header
//
//  Created by Hirad on 2017-08-29.
//  Copyright © 2017 Hirad. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
   
    @IBOutlet var myTable: UITableView!
    var newsItems: [NewsItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        myTable.rowHeight = UITableViewAutomaticDimension
        myTable.estimatedRowHeight = 100
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
       
        let news1 = NewsItem(withType: .world)
        newsItems.append(news1)
        let news2 = NewsItem(withType: .europe)
        newsItems.append(news2)
        let news3 = NewsItem(withType: .americas)
        newsItems.append(news3)
        let news4 = NewsItem(withType: .middleEast)
        newsItems.append(news4)
        let news5 = NewsItem(withType: .africa)
        newsItems.append(news5)
        let news6 = NewsItem(withType: .asiaPacific)
        newsItems.append(news6)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MyTableViewCell {
            
            let newsForRow = newsItems[indexPath.row]
            cell.header.textColor = newsForRow.newsColor
            cell.body.text = newsForRow.newsBody
            cell.header.text = newsForRow.newsHeadLine
            
            return cell

        }
        
        
        return UITableViewCell()
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
  
}
