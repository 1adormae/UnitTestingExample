//
//  CollectionTableViewSource.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 12/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import Foundation
import UIKit

class ColletionTableViewSource: NSObject, UITableViewDataSource {
    
    private var artCollection: [ArtPiece]
    
    init(collection:[ArtPiece]) {
        self.artCollection = collection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "artPieceCellIdentifier", for: indexPath)
        
        if let cell = cell as? ArtPieceTableViewCell {
            let artPiece = artCollection[indexPath.row]
            cell.title.text = artPiece.title
            if let imageURL = artPiece.imageURL {
                cell.imagePiece.imageFromUrl(urlString: imageURL)
            }
            else{
                cell.imagePiece?.image = UIImage.init(named: "Placeholder.png")
            }
        }
        return cell
    }
}
