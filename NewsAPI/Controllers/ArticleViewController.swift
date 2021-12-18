//
//  NewsArticleViewController.swift
//  NewsAPI
//
//  Created by book on 2021/12/18.
//

import UIKit

class ArticleViewController: UIViewController {

    var _title : String?
    var _description : String?
    var _content : String?
    var _urlToImage : UIImage?
    var _publishAt : String?
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var urlToImageView: UIImageView!
    
    @IBOutlet weak var publishedAtLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = _title
        descriptionLabel.text = _description
        contentLabel.text = _content
        urlToImageView.image = _urlToImage
        publishedAtLabel.text = _publishAt
       
    }
    

  

    

}
