//
//  newListTableViewDataSource.swift
//  NewsTimeApp
//
//  Created by saif on 16/08/2023.
//

import Foundation
import UIKit

// extension to create tableView delegate and data source from NewsListViewController
extension NewsListViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       if  let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListTableViewCell", for: indexPath) as? NewsListTableViewCell
        {
          
           cell.configure(article: articles[indexPath.row])
           
           return cell
       }
        
        return UITableViewCell()
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let detailViewModel = NewsDetailViewModel(article: articles[indexPath.row] )

        let detailVC = NewsDetailsViewController()
        detailVC.newDetailsViewModel = detailViewModel
        navigationController?.pushViewController(detailVC, animated: true)

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        headerView.backgroundColor = UIColor.blackColor
        
        let titleLabel = UILabel()
        titleLabel.text = "\(DateManager.getDateOfToday())"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = UIColor.white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        
        headerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant : 0),
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,constant: 0)
        ])
        
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
}

