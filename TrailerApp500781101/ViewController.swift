//
//  ViewController.swift
//  TrailerApp500781101
//
//  Created by Jamal Aartsen on 4/14/19.
//  Copyright © 2019 HvA. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var trailerObject: [TrailerObject]? = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Trailers"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TrailerCell", bundle: nil), forCellReuseIdentifier: "TrailerCell")
        tableView.delegate = self
        
        Alamofire.request("https://appstubs.triple-it.nl/trailers/")
            .responseData(completionHandler: { [weak self] (response) in
                guard let jsonData = response.data else { return }
                
                let decoder = JSONDecoder()
                let testObjectsFromBackend = try? decoder.decode([TrailerObject].self, from: jsonData)
                
                self?.trailerObject = testObjectsFromBackend
                self?.tableView.reloadData()
                
            })
        
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trailerObject?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trailerCell = tableView.dequeueReusableCell(withIdentifier: "TrailerCell", for: indexPath) as! TrailerCell
        
        trailerCell.titleTrailer?.text = trailerObject?[indexPath.row].title
        let url = URL(string: (trailerObject?[indexPath.row].posterImage)!)
        trailerCell.imageTrailer?.kf.setImage(with: url)
        trailerCell.DescriptionTrailer?.text = trailerObject?[indexPath.row].description
        
        
        return trailerCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailController") as! DetailController
        detailVC.stillImage = trailerObject?[indexPath.row].stillImage
        detailVC.posterImage = trailerObject?[indexPath.row].posterImage
        detailVC.trailerTitle = trailerObject?[indexPath.row].title
        detailVC.trailerDes = trailerObject?[indexPath.row].description
        detailVC.trailerWatch = trailerObject?[indexPath.row].url
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
}

