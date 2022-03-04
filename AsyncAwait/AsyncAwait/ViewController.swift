//
//  ViewController.swift
//  AsyncAwait
//
//  Created by 김혜수 on 2022/03/04.
//

import UIKit

struct User: Codable {
    let name: String
}

class ViewController: UIViewController, UITableViewDataSource {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")
    
    private var users = [User]()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        //        async {
        //            let users = await fetchUsers()
        //            self.users = users
        //            DispatchQueue.main.async {
        //                self.tableView.reloadData()
        //            }
        //        }
        
        Task {
            let result = await fetchUsers()
            switch result {
            case .success(let users):
                self.users = users
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    enum MyError: Error {
        case failedToGetUsers
    }
    
    //    private func fetchUsers() async -> [User] {
    //        guard let url = url else { return [] }
    //        do {
    //            let (data, _) = try await URLSession.shared.data(from: url)
    //            let users = try JSONDecoder().decode([User].self, from: data)
    //            return users
    //        }
    //        catch {
    //            return []
    //        }
    //    }
    
    private func fetchUsers() async -> Result<[User], Error> {
        guard let url = url else { return .failure(MyError.failedToGetUsers) }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let users = try JSONDecoder().decode([User].self, from: data)
            return .success(users)
        }
        catch {
            return .failure(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
    
    
}

