//
//  ViewController.swift
//  NewsTimeApp
//
//  Created by saif on 15/08/2023.
//

import UIKit

class NewsListViewController: UIViewController {

    var newsTableView: UITableView!
    var newsViewModel : NewsViewModel!

    var articles : [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addjustTheTableView()
        callToViewModelForUIUpdate()
        self.view.backgroundColor = UIColor.blackColor

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // add the table View here
    func addjustTheTableView(){
        newsTableView  = UITableView(frame: view.bounds , style: .plain)
    
        newsTableView.backgroundColor = UIColor.blackColor
        newsTableView.showsVerticalScrollIndicator = false
        newsTableView.showsHorizontalScrollIndicator = false
        newsTableView.separatorStyle = .none
        view.addSubview(newsTableView)
        newsTableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                newsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
        
    }

    // update the UI of ViewController after run the ViewModel
    func callToViewModelForUIUpdate(){
        let loader =   self.loader()

        self.newsViewModel =  NewsViewModel()
        self.stopLoader(loader: loader)

        self.newsViewModel.bindNewsErrorViewModelToController = {
            
            DispatchQueue.main.async {
                ErrorManger.shared.showAlert(title:"Error" , message: self.newsViewModel.newsErrorData.message ?? "", viewController: self)

            }
        }
        self.newsViewModel.bindNewsViewModelToController = {
            
            self.articles = self.newsViewModel.newsData.articles
           
            DispatchQueue.main.async {
                self.newsTableView.dataSource = self
                self.newsTableView.delegate = self
                
                self.newsTableView.register(NewsListTableViewCell.self, forCellReuseIdentifier: "NewsListTableViewCell")
                self.newsTableView.reloadData()

            }
        }
    }
}




