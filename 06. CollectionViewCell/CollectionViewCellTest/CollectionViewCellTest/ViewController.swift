//
//  ViewController.swift
//  CollectionViewCellTest
//
//  Created by Ashis Laha on 25/01/18.
//  Copyright © 2018 Ashis Laha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var isPlaying: Bool = false
    private var isPlayingModel = [false, false, false, false, false] // initially all are stop, not playing
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet{
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isPlayingModel.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mediaItemCell", for: indexPath) as! MediaItemCollectionViewCell
        cell.imageVw.image = isPlayingModel[indexPath.row] ? #imageLiteral(resourceName: "start") : #imageLiteral(resourceName: "stop")
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        isPlayingModel[indexPath.row] = !isPlayingModel[indexPath.row]
        let cell = collectionView.cellForItem(at: indexPath) as! MediaItemCollectionViewCell
        cell.imageVw.image = isPlayingModel[indexPath.row] ? #imageLiteral(resourceName: "start") : #imageLiteral(resourceName: "stop")
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 60)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}

class MediaItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageVw: UIImageView!
}

