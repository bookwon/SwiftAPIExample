//
//  ArticleListViewModel.swift
//  NewsAPI
//
//  Created by book on 2021/12/18.
//

import Foundation

struct ArticleListViewModel
{
    let articles: [Article]
}
extension ArticleListViewModel
{
    
    func numberOfRowsInSection() -> Int
    {
        return self.articles.count
    }
    
}



