//
//  ViewController.swift
//  StretchyHeaders
//
//  Created by 洪德晟 on 2017/7/27.
//  Copyright © 2017年 洪德晟. All rights reserved.
//

// Tutorial Source: http://blog.matthewcheok.com/design-teardown-stretchy-headers/

import UIKit

class ViewController: UITableViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
    let items = [
    NewsItem(category: .World, summary: "成功不能只靠1800萬用戶，LINE@地推部隊推出數位行銷新寵兒"),
        NewsItem(category: .Eurpoe, summary: "亞馬遜第二季營收穩定成長，但獲利不如預期，關鍵就在海外虧損的大幅增加。另亞馬遜雲端服務AWS仍是主要獲利支柱，但營收成長率連續幾個..."),
        NewsItem(category: .MiddleEast, summary: "鴻海揭美國投資序幕：3000億台幣打造世界級LCD面板廠"),
        NewsItem(category: .Africa, summary: "緊跟蘋果，亞馬遜成立專門研發健康照護科技的秘密實驗室「1492」"),
        NewsItem(category: .AsiaPacific, summary: "【西雅圖現場】拯救全球100萬條生命！用科技解決醫療問題，台灣學生發光「軟體界奧林匹克」"),
        NewsItem(category: .Americas, summary: "效法杜拜、阿姆斯特丹，台灣首支「特斯拉」計程車隊籌備中"),
        NewsItem(category: .World, summary: "Android O釋出第四版測試預覽 正式版即將來臨"),
        NewsItem(category: .Eurpoe, summary: "歐洲警政署今天發布報告說，全球勒索軟體攻擊事件在截至今年3月的12個月內激增11%，但歐洲警政署合作夥伴研發的專門軟體，已協助解鎖其中約2萬8000個遭鎖碼的裝置。"),
    ]
    
    private let kTableHeaderHeight: CGFloat = 300.0
    private let kTableHeaderCutAway: CGFloat = 80.0
    var headerMaskLayer: CAShapeLayer!
    
    // 原點在tableViewy左上角，下拉時(條件成立)，resize headerView frame by define headerRect
    private func updateHeaderView() {
        let effectiveHeight = kTableHeaderHeight - kTableHeaderCutAway/2
        var headerRect = CGRect(x: 0, y: -effectiveHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        
        if tableView.contentOffset.y < -effectiveHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y + kTableHeaderCutAway/2
        }
        headerView.frame = headerRect
        
        // Cutting the cut-away
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y:0))
        path.addLine(to: CGPoint(x: headerRect.width, y:0))
        path.addLine(to: CGPoint(x: headerRect.width, y:headerRect.height))
        path.addLine(to: CGPoint(x: 0, y:headerRect.height - kTableHeaderCutAway))
        headerMaskLayer?.path = path.cgPath
    }

    fileprivate func updateDateLabel() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        dateLabel.text = formatter.string(from: date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // take ownership of header view
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        let effectiveHeight = kTableHeaderHeight - kTableHeaderCutAway/2
        // scrollview中contentView.frame.origin與scrollview.frame.origin的關係
        tableView.contentInset = UIEdgeInsets(top: effectiveHeight, left: 0, bottom: 0, right: 0)
        // scrollview當前顯示區域頂點相對於frame頂點的偏移量
        tableView.contentOffset = CGPoint(x: 0, y: -effectiveHeight)
        
        // add ShapeMskerLayer
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.black.cgColor
        
        headerView.layer.mask = headerMaskLayer
        
        updateDateLabel()
        
        updateHeaderView()
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - TableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsItemCell
        cell.newsItem = item
        
        return cell
    }
    
    // MARK: - TableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // MARK: - UIScrollViewDelegate
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }

}
