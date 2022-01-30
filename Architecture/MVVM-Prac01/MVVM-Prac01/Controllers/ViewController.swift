//
//  ViewController.swift
//  MVVM-Prac01
//
//  Created by 김혜수 on 2022/01/30.
//

import UIKit

/* ViewModel에서 전달하는 데이터를 화면에 전달만 한다. */
class ViewController: UIViewController {
    
    private var articleListViewModel: ArticleListViewModel!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setTableView()
    }
    
    private func setUp() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=e9b514c39c5f456db8ed4ecb693b0040")!
        WebService().getArticles(url: url) { (articles) in
            if let articles = articles {
                self.articleListViewModel = ArticleListViewModel(articles: articles)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         
        return UITableView.automaticDimension
        //return 500
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as? ArticleTableViewCell else { return UITableViewCell() }
        let articleViewModel = self.articleListViewModel.articleAtIndex(indexPath.row)
        cell.setData(title: articleViewModel.title ?? "", description: articleViewModel.description ?? "")
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSections
    }
    
    
}

