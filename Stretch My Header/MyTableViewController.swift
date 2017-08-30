//
//  MyTableViewController.swift
//  Stretch My Header
//
//  Created by Hirad on 2017-08-29.
//  Copyright © 2017 Hirad. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
   
 //   @IBOutlet weak var headerView: UIView!
    //@IBOutlet var myTable: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    private let headerHeight:CGFloat = 300.0
    private let headerCutOff:CGFloat = 80.0
    var newsItems: [NewsItem] = []
    var headerView: UIView!
    var headerMaskLayer: CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        let effectiveHeight = headerHeight-headerCutOff/2
        tableView.contentInset = UIEdgeInsets(top: effectiveHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -effectiveHeight)
       

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.black.cgColor
        headerView.layer.mask = headerMaskLayer
        
        headerSetup()
        updateHeaderView()
        setUpNewsItems()
        

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
        return newsItems.count
    }

    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        
//       
//        if let tempCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as? myHeader {
//          
//            let headerSize = UIImage nam
//            return headerSize
//        }
//        
//
//        return 300
//    }
//    
//    
//    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as? myHeader {
//            
//            return headerCell
//        }
//        
//        return UITableViewCell()
//    }
    
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
    
    func headerSetup()  {
        
        let dateStyle = DateFormatter()
        dateStyle.dateStyle = .medium
        let timeString = "\(dateStyle.string(from: Date () as Date))"
        dateLabel.text = timeString
      
    }
    
    func updateHeaderView() {
        
        let effectiveHeight = headerHeight-headerCutOff/2

        var headerRect = CGRect(x: 0, y: -effectiveHeight, width: tableView.frame.width, height: headerHeight)
        
        if tableView.contentOffset.y < -effectiveHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
        
        let path = UIBezierPath()
        path.move(to: CGPoint (x: 0, y: 0))
        path.addLine(to: CGPoint(x: headerView.frame.width, y:0))
        path.addLine(to: CGPoint(x: headerView.frame.width, y: headerView.frame.height))
        path.addLine(to: CGPoint(x: 0, y: headerHeight-headerCutOff))
        headerMaskLayer?.path = path.cgPath
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    func setUpNewsItems() {
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
  
}
