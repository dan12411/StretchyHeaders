//
//  NewsItemCell.swift
//  StretchyHeaders
//
//  Created by 洪德晟 on 2017/7/27.
//  Copyright © 2017年 洪德晟. All rights reserved.
//

import UIKit

class NewsItemCell: UITableViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var newsItem: NewsItem? {
        didSet {
            if let item = newsItem {
                categoryLabel.text = item.category.toString()
                categoryLabel.textColor = item.category.toColor()
                summaryLabel.text = item.summary
            } else {
                categoryLabel.text = nil
                summaryLabel.text = nil
            }
        }
    }

}
