//
//  NewsListTableViewCell.swift
//  NewsTimeApp
//
//  Created by saif on 16/08/2023.
//

import Foundation


import UIKit

// creating of tableView cell here
// this table view has the title and the image to desplay from ws
class NewsListTableViewCell: UITableViewCell {

    private let backView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .white
            view.layer.cornerRadius = 10
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0.2
            view.layer.shadowOffset = CGSize(width: 0, height: 2)
            view.layer.shadowRadius = 4
            return view
        }()
    
    let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0 // Allows multiple lines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
 
   
    
    let detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "more details >"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
       addOutlets()
       addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(article  :  Article?) {
        titleLabel.text = article?.title
        if  var url = article?.urlToImage {
            print("url is here:",url)
            if url == ""{
                    newsImageView.image = UIImage(named: "default")
                
            }else{
                ImageManager.setImage(&url, targetImageView: newsImageView)
            }
        }
    }
    
    func addOutlets(){
        contentView.addSubview(backView)
        backView.addSubview(newsImageView)
        backView.addSubview(detailsLabel)
        backView.addSubview(titleLabel)
        backView.backgroundColor = UIColor.walletColor

    }
    
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            
        backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
        backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
        backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
        backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),

        newsImageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),
        newsImageView.widthAnchor.constraint(equalToConstant: 50),
        newsImageView.heightAnchor.constraint(equalToConstant: 50),
        newsImageView.centerYAnchor.constraint(equalTo: backView.centerYAnchor, constant: 0),
        
        
        detailsLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
        detailsLabel.widthAnchor.constraint(equalToConstant: 75),
        detailsLabel.heightAnchor.constraint(equalToConstant: 20),
        
        detailsLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
        
        titleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 20),
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
        titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -30),
      
        ])
    }
    
    
    
}
