//
//  ArticleList.swift
//  NewsAPI
//
//  Created by book on 2021/12/17.
//

import Foundation

struct ArticleList : Decodable
{
    let articles : [Article]
}

struct Article : Decodable
{
    
    let title : String?
    let description : String?
    let publishedAt : String?
    let content : String?
    let urlToImage : String?
}
