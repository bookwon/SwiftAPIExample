//
//  NewsReceiver.swift
//  NewsAPI
//
//  Created by book on 2021/12/17.
//

import Alamofire
import Foundation

class ArticleReceiver
{
    // get article through url and execute completion when AF.request is done
    func getArticles (url : URL , completion : @escaping ([Article]) -> Void )
    {
        
        var articles : [Article] = []
        
        let request = AF.request(url)
        
            request.responseDecodable(of: ArticleList.self) { response in
                completion((response.value?.articles)!)
                
        }
        
        
    }
    
}
