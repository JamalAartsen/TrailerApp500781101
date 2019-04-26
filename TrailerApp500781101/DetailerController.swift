//
//  DetailerController.swift
//  TrailerApp500781101
//
//  Created by Jamal Aartsen on 4/22/19.
//  Copyright © 2019 HvA. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import AVKit
import AVFoundation

class DetailController: UIViewController {
    
    var stillImage: String?
    var posterImage: String?
    var trailerTitle: String?
    var trailerDes: String?
    var trailerWatch: String?
    
    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var titleTrailer: UILabel!
    @IBOutlet weak var imagePosterr: UIImageView!
    @IBOutlet weak var textViewDes: UITextView!
    @IBOutlet weak var watchTrailerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlStillImage = URL(string: stillImage!)
        imagePoster?.kf.setImage(with: urlStillImage)
        
        let urlPosterImage = URL(string: posterImage!)
        imagePosterr?.kf.setImage(with: urlPosterImage)
        
        titleTrailer.text = trailerTitle
        textViewDes.text = trailerDes
    }
    @IBAction func watchTrailer(_ sender: Any) {
        let urlTrailer = URL(string: trailerWatch!)
        let player = AVPlayer(url: urlTrailer!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
    }
}
