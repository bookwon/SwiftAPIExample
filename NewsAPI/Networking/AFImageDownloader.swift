//
//  ImageReceiver.swift
//  NewsAPI
//
//  Created by book on 2021/12/17.
//

import Alamofire
import AlamofireImage

class AFImageDownloader
{
    
    // download an image through url and execute completion when AF.request.responseImage is done
    func DownloadFromURL(url : URL , completion : @escaping (Image?) -> Void )
    {
    
        AF.request(url).responseImage { response in
            
            let image = response.value  
            completion(image)
            
        }
                                                  
            
        
    }
}
