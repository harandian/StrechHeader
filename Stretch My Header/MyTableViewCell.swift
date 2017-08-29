//
//  MyTableViewCell.swift
//  Stretch My Header
//
//  Created by Hirad on 2017-08-29.
//  Copyright © 2017 Hirad. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
   
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var body: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        header.text = "World"
        body.text = "Climate change protests, divestments meet fossil fuels realitie"
        
        self.body?.numberOfLines = 0
        self.body?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
