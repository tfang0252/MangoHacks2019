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
    
    var titleArr: [String] = [  "Authentic Chinese Place",
                                "Favorite Burger Place?",
                                "Spanish to Chinese Translator Needed",
                                "Looking for friends",
                                "Looking for Dentist reccomendations",
                                "Helped wanted for moving, will pay",
                                "Chilean Empanadas",
                                "SWFL meet up",
                                "PokemonGO",
                                "Free yogo class",
                                "Taco Yummy Food Truck",
                                "Latino Dessert Places"]
    
    var bodyeArr: [String] = ["Looking for an authentic Chinese resturant in the FIU Area",
                              "Where is your favorite Burger place in Miami?!",
                              "Looking for a Spanish to Chinese Translator, will pay $25/hr",
                              "Looking for anyone that is willing to go to the Nicklebacks Concert with me this weekend",
                              "Need a recommendation for a cheap but good Dentist in the Miami area",
                              "Need help moving some heavy furniture, will pay $100 a day",
                              "Looking for a place that sells Chilean Empanadas",
                              "Any car enthusiasts that want to drive out to the South West Florida car meet this weekend?",
                              "Looking for people to play PokemonGo with in the FIU area",
                              "I am teaching a free yoga class on Miami beach this Saturday if anyone is interested in attending, everyone is welcomed",
                              "Does anyone know the locations of the Taco Yummy Food truck?",
                              "What are the best latino dessert places in town?"]
    
    var categoryArr: [String] = [ "Food",
                                  "Food",
                                  "Help",
                                  "ToDo",
                                  "Help",
                                  "Help",
                                  "Food",
                                  "Todo",
                                  "Todo",
                                  "Todo",
                                  "Food",
                                  "Food"]
    
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
    
    @objc func notificationToggle() {
        //delegate?.handleMenuToggle(forMenuOption: nil)
        print("zach smells")
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor(red:0.26, green:0.52, blue:0.96, alpha:1.0)
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "OMNI"
        
        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
        
        let notificationImage = UIImageView(image: #imageLiteral(resourceName: "bell-2_45x45"))
        
        menuBtn.sv(notificationImage)
        
        let menuBarItem = UIBarButtonItem(customView: menuBtn)
        navigationItem.rightBarButtonItem = menuBarItem
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
        return titleArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! PostTVCell
        cell.postTitle.text = titleArr[indexPath.item]
        cell.postBody.text = bodyeArr[indexPath.item]
        return cell
    }
}

extension HomeController: UITableViewDelegate{
    
    
}

extension HomeController: UISearchBarDelegate{
    
    
}
