//
//  NewsDetailsViewController.swift
//  NewsTimeApp
//
//  Created by saif on 16/08/2023.
//

import UIKit

class NewsDetailsViewController: UIViewController {


    var newDetailsViewModel : NewsDetailViewModel!
    var article : Article!
    
    private let titleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.numberOfLines = 0
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let descriptionLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
   
        private let sourceLabel: UILabel = {
            let label = UILabel()
            label.textColor = .gray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        populateUI()
        setNavBar()
        // Do any additional setup after loading the view.
    }

    private func setNavBar(){
        // Create a custom back button
        // Customize navigation bar appearance
//        navigationController?.navigationBar.tintColor = .white // Set the color of the back button icon
//        navigationController?.navigationBar.setBackgroundImage(UIImage(named: ImageManager.custom_back_button_white), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.isTranslucent = true
//
//                // Hide the default back button title
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//
        let backButtonImage = UIImage(named: ImageManager.custom_back_button_white)?.withRenderingMode(.alwaysOriginal)
                navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
                
                // Hide the default back button title
                navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                
        
    }
    
    @objc func backButtonTapped() {
           // Handle back button tap as needed
           navigationController?.popViewController(animated: true)
       }

    private func setupUI() {
        
        setNavigationBar()
        addOutlets()
        addnewsLinkSource()
        addConstraints()
      }
    
    func addOutlets(){
        let safeAreaView = UIView()
            safeAreaView.backgroundColor = UIColor.walletColor
        view.addSubview(safeAreaView)
        safeAreaView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                safeAreaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                safeAreaView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                safeAreaView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                safeAreaView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
        
          view.addSubview(titleLabel)
          view.addSubview(descriptionLabel)
          view.addSubview(sourceLabel)
          view.addSubview(imageView)
    }
    
    @objc func labelTapped(_ gesture: UITapGestureRecognizer) {
            
        guard let text = sourceLabel.attributedText else {
                   return
               }

               let layoutManager = NSLayoutManager()
               let textContainer = NSTextContainer(size: CGSize.zero)
               let textStorage = NSTextStorage(attributedString: text)

               layoutManager.addTextContainer(textContainer)
               textStorage.addLayoutManager(layoutManager)

               let locationOfTouchInLabel = gesture.location(in: sourceLabel)
               let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInLabel, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)

               if let url = text.attribute(.link, at: indexOfCharacter, effectiveRange: nil) as? URL {
                   UIApplication.shared.open(url, options: [:], completionHandler: nil)
               }
           }
        

    
    private func populateUI() {
         titleLabel.text = newDetailsViewModel.title
         descriptionLabel.text = newDetailsViewModel.description + "\n\n Click link for details:"
         sourceLabel.text = newDetailsViewModel.source
         
        if var url = newDetailsViewModel?.imageURL {
            print("url :",url)
            if url == "" {
                imageView.image = UIImage(named: "default")

            }else{
                ImageManager.setImage(&url, targetImageView: imageView)

            }
        }

     }
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            sourceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            sourceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sourceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    func addnewsLinkSource(){
        let attributedString = NSAttributedString(string: "Visit OpenAI website", attributes: [
                   .link: URL(string: "https://www.openai.com")!,
                   .foregroundColor: UIColor.blue,
                   .underlineStyle: NSUnderlineStyle.single.rawValue
               ])

               sourceLabel.attributedText = attributedString
               sourceLabel.numberOfLines = 0
               sourceLabel.isUserInteractionEnabled = true
               sourceLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(labelTapped)))
    }
    
    func setNavigationBar(){
        navigationController?.setNavigationBarHidden(false, animated: true)

       view.backgroundColor = UIColor.blackColor
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
