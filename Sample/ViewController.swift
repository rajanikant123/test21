//
//  ViewController.swift
//  Sample
//
//  Created by rajnikant on 16/01/19.
//  Copyright © 2019 rajnikant. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout {

    @IBOutlet var lblTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var model : Model?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.dataSource = self
        if deviceIdiom == .pad  {
            print("iPad")
        }else {
            print("iPhone")
            createCollectionView()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    func createCollectionView() {
       
        
        var cellWidth : CGFloat = 0.0
        var cellheight : CGFloat = 0.0
        
        if deviceIdiom == .pad  {
            cellWidth  = collectionView.frame.size.width - 10
            cellheight = 90
        }else{
           
            cellWidth  = (collectionView.frame.size.width/2)
            cellheight = 290
            
        }
   
        let cellSize = CGSize(width: cellWidth , height:cellheight)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //.horizontal
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        collectionView.reloadData()
        
        var apiClient = ApiClient()
        apiClient.fetApiRequest(url: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") { (result) in
            self.model = result
            self.lblTitle.text = self.model?.title
            self.collectionView.reloadData()
        }
    }
}

