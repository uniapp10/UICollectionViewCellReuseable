//
//  ViewController.swift
//  UICollectionViewCell不销毁
//
//  Created by zhudong on 2016/12/4.
//  Copyright © 2016年 zhudong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        
        collectionView.register(ZDOneCell.self, forCellWithReuseIdentifier: "ZDOneCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ZDOtherCell")
    }

    @IBAction func btnClick(_ sender: UIButton) {
        var index: Int = 0
        switch sender.tag {
        case 10:
                index = 0
        case 20:
                index = 1
        case 30:
                index = 2
        default:
                index = 3
        }
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell?
        if indexPath.row == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZDOneCell", for: indexPath)
            cell!.contentView.backgroundColor = UIColor.red
        }else{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZDOneCell", for: indexPath)
            let colorParam: CGFloat = CGFloat(arc4random_uniform(10)) / 10.0
            cell!.contentView.backgroundColor = UIColor(white: colorParam, alpha: colorParam)
        }
        print("\(indexPath)\(cell!)")
        return cell!;
    }
}

