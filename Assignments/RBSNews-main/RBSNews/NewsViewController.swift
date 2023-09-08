//
//  NewsViewController.swift
//  RBSNews
//
//  RBS Tests Project on 12/10/20.
//

import UIKit
import SafariServices

class NewsViewController: UIViewController {
    
    var newsViewModel: NewsViewModel?
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News screen"
        newsViewModel = NewsViewModel()
        newsViewModel?.parseJSON({ [weak self] (result) in
            switch result {
            case .success(nil):
                self?.newsTableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            case .success(.some(_)):
                print("")
            }
        })
    }
    
}

extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let articles = newsViewModel?.articles else {
            return 0
        }
        return articles.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        if let article = newsViewModel?.articles?[indexPath.row] {
            if let source = article.source,  let name = source.name, let title = article.title {
              
                cell.setupNewsCell(source: name, title: title)
            }
            if let imageUrl = article.urlToImage {
                cell.setupNewsImage(imageURL: imageUrl)
            }
        }
        return cell
    }
    
    
}

extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let article = newsViewModel?.articles?[indexPath.row], let urlString = article.url, let url = URL(string: urlString) {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
            safariViewController.delegate = self
        }
    }
}

extension NewsViewController: SFSafariViewControllerDelegate {
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
