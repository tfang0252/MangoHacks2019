//
//  HomeController.swift
//  MangoHacks2019
//
//  Created by Zachary Frederick on 2/2/19.
//  Copyright © 2019 Tony Fang. All rights reserved.
//

import UIKit
import Stevia
import EightBase
import Apollo


class HomeController: UIViewController {

    // MARK: - Properties
    
    var delegate: HomeControllerDelegate?
    var postBtnStackView: UIStackView!
    var newPostBtn: UIButton!
    var pastPostBtn: UIButton!
    var tableview: UITableView!
    var searchBar: UISearchBar!
    
    
    
    private let reuseIdentifer = "cell"
    
    
    @objc func injected() {
        viewDidLoad()
        viewWillAppear(true)
        viewDidAppear(true)
    }
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EightBase.auth(with: "https://api.8base.com/cjrnngvv3000001r018xof97r", apiToken: "f073e470-8be7-40cf-8f77-614c8b8846bc") { result in
            switch(result) {
            case .success():
                print("Successfully authentificated")
                break
            case .failure(let error):
                print("Failed with \(error)")
                break
            }
            
            
        }
        
        view.backgroundColor = .white
        configureNavigationBar()
        configurePostBtnStackView()
    }
    
    // MARK: - Handlers
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor(red:0.26, green:0.52, blue:0.96, alpha:1.0)
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "OMNI"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 28.0)!]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x-1").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    func configurePostBtnStackView() {
        postBtnStackView = UIStackView()
        newPostBtn = PostButtons()
        pastPostBtn = PostButtons()
        
        newPostBtn.setTitle("New Post", for: .normal)
        pastPostBtn.setTitle("View Past Posts", for: .normal)
        //newPostBtn.addTarget(self, action: #selector(newPostButtonPushed), for: .touchUpInside)
        //pastPostBtn.addTarget(self, action: #selector(viewPastPostButtonPushed), for: .touchUpInside)
        postBtnStackView.addArrangedSubview(newPostBtn)
        postBtnStackView.addArrangedSubview(pastPostBtn)
        postBtnStackView.distribution = .fillEqually
        postBtnStackView.alignment = .fill
        postBtnStackView.spacing = 10
        
        tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(PostTVCell.self, forCellReuseIdentifier: reuseIdentifer)
        tableview.separatorStyle = .none
        searchBarSetup()

        let linebreak = UIView()
        linebreak.backgroundColor = UIColor(red:0.90, green:0.91, blue:0.95, alpha:1.0)
        self.view.sv(
            postBtnStackView,
            searchBar,
            linebreak,
            tableview
        )
        
        self.view.layout(
        80,
        |-25-postBtnStackView-25-| ~ 45,
        7,
        |-searchBar-| ~ 40,
        10,
        |linebreak|,
        10,
        |tableview| ~ 700
        )
        

        linebreak.fillHorizontally().height(1)
 
        
 }
    
    func searchBarSetup(){
        searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = true
        searchBar.backgroundImage = UIImage()
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.backgroundColor = UIColor(red:0.90, green:0.91, blue:0.95, alpha:1.0)
        searchBar.delegate = self
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange textSearched: String)
    {
        
    }
    
   @objc func newPostButtonPushed() {
        print("New Post Button Pushed")
    }
    
    @objc func viewPastPostButtonPushed() {
        print("View Past Post Button Pushed")
    }
}

extension HomeController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! PostTVCell
        
        return cell
    }
}

extension HomeController: UITableViewDelegate{
    
    
}

extension HomeController: UISearchBarDelegate{
    
    
}
