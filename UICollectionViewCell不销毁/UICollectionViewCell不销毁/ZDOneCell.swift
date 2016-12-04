//
//  ZDOneCell.swift
//  UICollectionViewCell不销毁
//
//  Created by zhudong on 2016/12/4.
//  Copyright © 2016年 zhudong. All rights reserved.
//

import UIKit

class ZDOneCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let label = UILabel(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        label.text = "ZDOneCell"
        label.backgroundColor = UIColor.green
        contentView.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("oneCell deinit")
    }
}
