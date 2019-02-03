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
import SwiftGoogleTranslate

class HomeController: UIViewController {

    // MARK: - Properties
    
    var delegate: HomeControllerDelegate?
    var postBtnStackView: UIStackView!
    var newPostBtn: UIButton!
    var pastPostBtn: UIButton!
    var tableview: UITableView!
    var searchBar: UISearchBar!
    var langInd: Int!
    
    
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
                                "Latino Dessert Places",
                                "Tacos al pastor",
                                "Electrician needed",
                                "Babysitter needed",
                                "Pick up soccer match",
                                "Grand opening of the Gomez Boxing Academy",
                                "Truck drivers needed",
                                "Indian Cuisine",
                                "Car issue",
                                "Day in the swamps",
                                "Museum recommendation",
                                "Private school recommendations?",
                                "Argentinian Steakhouse",
                                "Wings and Beer",
                                "Community Bike Ride",
                                "Haitian food recomendation?",
                                "Harry Potter Fans"]
    
    var bodyeArr: [String] = ["Looking for an authentic Chinese resturant in the FIU Area",
                              "Where is your favorite Burger place in Miami?!",
                              "Looking for a Spanish to Chinese Translator, will pay $25 hr",
                              "Looking for anyone that is willing to go to the Nicklebacks Concert with me this weekend",
                              "Need a recommendation for a cheap but good Dentist in the Miami area",
                              "Need help moving some heavy furniture, will pay $100 a day",
                              "Looking for a place that sells Chilean Empanadas",
                              "Any car enthusiasts that want to drive out to the South West Florida car meet this weekend?",
                              "Looking for people to play PokemonGo with in the FIU area",
                              "I am teaching a free yoga class on Miami beach this Saturday if anyone is interested in attending, everyone is welcomed",
                              "Does anyone know the locations of the Taco Yummy Food truck?",
                              "What are the best latino dessert places in town?",
                              "What is the best al pastor taco near FIU",
                              "Electrician needed in the Kendall area",
                              "Babysitter needed for Saturday night ASAP will pay 20$/hr.",
                              "Anyone interested in playing 5 v 5 in the Homestead area",
                              "Enroll by January 31st and receive a discount on the first month",
                              "Minimum 2 years experience and a class C licence, call 305-123-3423",
                              "Craving some chicken tiki masala, any recommendatins in West Palm?",
                              "Looking for help in replacing the radiator, any takers?",
                              "Anyone interested in joining me on a airboat ride in the Everglades",
                              "What are some good museums in Miami?",
                              "New to Miami, I would like recommendations fot privae schools for my kids",
                              "Best Argentinian steakhouse in Pembroke Pines area?",
                              "Anyone interested in joining for a cold one and some wings near FAU?",
                              "Join us Monday for a bike ride around the town!",
                              "Any recomendations in the Broward area?",
                              "Looking to meet new Witches and Wizards in the area"]
    
    var categoryArr: [String] = [ "Food",
                                  "Food",
                                  "Help",
                                  "ToDo",
                                  "Help",
                                  "Help",
                                  "Food",
                                  "ToDo",
                                  "ToDo",
                                  "ToDo",
                                  "Food",
                                  "Food",
                                  "Food",
                                  "Help",
                                  "Help",
                                  "ToDo",
                                  "ToDo",
                                  "Help",
                                  "Food",
                                  "Help",
                                  "ToDo",
                                  "Help",
                                  "Help",
                                  "Food",
                                  "Food",
                                  "ToDo",
                                  "Food",
                                  "ToDo"]
    
    var testArr1: [String] = []
    
    var testArr2: [String] = []
    
    var languages: [String] = ["en", "zh-CN", "hi", "es", "fr", "de", "it", "pt", "ja", "ar", "ro"]

    var colors: [UIColor] = [UIColor(red:0.00, green:0.65, blue:1.00, alpha:1.0),
                             UIColor(red:1.00, green:0.56, blue:0.32, alpha:1.0),
                             UIColor(red:0.07, green:0.81, blue:0.40, alpha:1.0),
                             UIColor(red:0.00, green:0.65, blue:1.00, alpha:1.0),
                             UIColor(red:0.00, green:0.65, blue:1.00, alpha:1.0),
                             UIColor(red:0.98, green:0.37, blue:0.38, alpha:1.0),
                             UIColor(red:1.00, green:0.56, blue:0.32, alpha:1.0),
                             UIColor(red:0.07, green:0.81, blue:0.40, alpha:1.0),
                             UIColor(red:1.00, green:0.56, blue:0.32, alpha:1.0),
                             UIColor(red:0.07, green:0.81, blue:0.40, alpha:1.0),
                             UIColor(red:0.07, green:0.81, blue:0.40, alpha:1.0),
                             UIColor(red:0.00, green:0.65, blue:1.00, alpha:1.0),
                             UIColor(red:1.00, green:0.56, blue:0.32, alpha:1.0),
                             UIColor(red:0.00, green:0.65, blue:1.00, alpha:1.0),
                             UIColor(red:1.00, green:0.56, blue:0.32, alpha:1.0),
                             UIColor(red:0.07, green:0.81, blue:0.40, alpha:1.0),
                             UIColor(red:0.00, green:0.65, blue:1.00, alpha:1.0),
                             UIColor(red:0.00, green:0.65, blue:1.00, alpha:1.0),
                             UIColor(red:0.98, green:0.37, blue:0.38, alpha:1.0),
                             UIColor(red:1.00, green:0.56, blue:0.32, alpha:1.0),
                             UIColor(red:0.07, green:0.81, blue:0.40, alpha:1.0),
                             UIColor(red:1.00, green:0.56, blue:0.32, alpha:1.0),
                             UIColor(red:0.07, green:0.81, blue:0.40, alpha:1.0),
                             UIColor(red:0.07, green:0.81, blue:0.40, alpha:1.0),
                             UIColor(red:0.00, green:0.65, blue:1.00, alpha:1.0),
                             UIColor(red:1.00, green:0.56, blue:0.32, alpha:1.0),
                             UIColor(red:0.00, green:0.65, blue:1.00, alpha:1.0),
                             UIColor(red:1.00, green:0.56, blue:0.32, alpha:1.0),
                             UIColor(red:0.07, green:0.81, blue:0.40, alpha:1.0),
                             UIColor(red:0.00, green:0.65, blue:1.00, alpha:1.0),
                             UIColor(red:0.00, green:0.65, blue:1.00, alpha:1.0),
                             UIColor(red:0.98, green:0.37, blue:0.38, alpha:1.0),
                             UIColor(red:1.00, green:0.56, blue:0.32, alpha:1.0),
                             UIColor(red:0.07, green:0.81, blue:0.40, alpha:1.0),
                             UIColor(red:1.00, green:0.56, blue:0.32, alpha:1.0),
                             UIColor(red:0.07, green:0.81, blue:0.40, alpha:1.0),
                             UIColor(red:0.07, green:0.81, blue:0.40, alpha:1.0),
                             UIColor(red:0.00, green:0.65, blue:1.00, alpha:1.0),
                             UIColor(red:1.00, green:0.56, blue:0.32, alpha:1.0),]
    private let reuseIdentifer = "cell"
    
    
    @objc func injected() {
        viewDidLoad()
        viewWillAppear(true)
        viewDidAppear(true)
    }
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        
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
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! PostTVCell
//        cell.postTitle.text = titleArr[indexPath.item]
//        cell.postBody.text = bodyeArr[indexPath.item]
        cell.logo.backgroundColor = colors[indexPath.item]
        
        SwiftGoogleTranslate.shared.start(with: "AIzaSyAk5wxlSkdNIBX2LHGSgM0OXGE_alrT3vg")
        
        var dictionary: [String: String] = [:]
        
        for (index, element) in titleArr.enumerated()
        {
            dictionary[element] = bodyeArr[index]
        }
        
        
        for (key,value) in dictionary{
            SwiftGoogleTranslate.shared.translate(key, self.languages[self.langInd], "en") { (text1, error) in
                if let t1 = text1 {
                    SwiftGoogleTranslate.shared.translate(value, self.languages[self.langInd], "en") { (text2, error) in
                        if let t2 = text2 {
                            cell.postTitle.text = t1
                            cell.postBody.text = t2
                        }
                        
                    }
                }
            }
        }
        
        
        
        for i in testArr1{
            print(i)
        }
        
        
        return cell
    }
}

extension HomeController: UITableViewDelegate{
    
    
}

extension HomeController: UISearchBarDelegate{
    
    
}
