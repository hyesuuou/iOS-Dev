//
//  Article.swift
//  MVVM-Prac01
//
//  Created by κΉνμ on 2022/01/30.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let description: String?
}
