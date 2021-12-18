//
//  NewsListViewController.swift
//  NewsAPI
//
//  Created by book on 2021/12/17.
//

//
//  NewsArticleViewController.swift
//  NewsAPI
//
//  Created by book on 2021/12/17.
//

import UIKit
import AlamofireImage

class NewsListViewController: UITableViewController {

    
    var articleListVM : ArticleListViewModel!
    var image : UIImage!
    @IBOutlet weak var newsSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        newsSearchBar.delegate = self
        
    }

}


// TableView

extension NewsListViewController
{
    
    
    // number of rows in table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM == nil ?  0 : self.articleListVM!.numberOfRowsInSection()
    }
    
    
    // return each cell on each TableViewCell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Const.newsListCellIdentifier, for: indexPath) as? NewsListTableViewCell
        else
        {
            fatalError("Failed to Dequeue tableView in NewsListTableViewController")
        }
        
        cell.newsLabel.text = articleListVM.articles[indexPath.row].title
        
        return cell
    }
    
    // event occurs when users select an article at index
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        

        guard let url  = ( URL(string : articleListVM.articles[indexPath.row].urlToImage!)) else { return }
           
    
            AFImageDownloader().DownloadFromURL(url : url) { img in
                self.image = img
            }
 
        
        self.performSegue(withIdentifier: Const.articleVCSegueIdentifier, sender: articleListVM.articles[indexPath.row])
            
    
    }



}


// SearchBarDelegate

extension NewsListViewController : UISearchBarDelegate
{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
       
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
    }
       
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
    }
       
    // event occurs when user click searchBarButton
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
        
        
        if let url = URL(string: "https://newsapi.org/v2/everything?q=\(searchBar.searchTextField.text!)&from=\(YesterdayTime.getDate())&sortBy=publishedAt&apiKey=\(Const.API_Key)")
        {
            
        
        ArticleReceiver().getArticles(url: url){
            result in
            self.articleListVM = ArticleListViewModel(articles: result)
            
            if self.articleListVM != nil
            {
                self.tableView.reloadData()
            }
            
        }
        }

        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    }
}



// prepare

extension NewsListViewController
{
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let NewsArticleVM = segue.destination as?
            ArticleViewController, let article = sender as? Article
        {
            
            
            NewsArticleVM._title = article.title
            NewsArticleVM._content = article.content
            NewsArticleVM._description = article.description
            NewsArticleVM._urlToImage = image
            NewsArticleVM._publishAt = article.publishedAt
            
            
            
        }
        else
        {
            return
        }
        

        
        
    }
    
}
