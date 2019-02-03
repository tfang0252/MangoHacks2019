//
//  SignupController.swift
//  MangoHacks2019
//
//  Created by Tony Fang on 2/2/19.
//  Copyright © 2019 Tony Fang. All rights reserved.
//

import UIKit
import Stevia
import CoreLocation

class SignupController: UIViewController, CLLocationManagerDelegate {
    
    var tableview: UITableView?
    var locChoices: UITableView?
    var locationManager:CLLocationManager!
    let geocoder = CLGeocoder()
    var placemark: CLPlacemark?
    var cityNameStr: String = ""
    var rowSelected = 0
    
    var languageArray = ["English", "Chinese", "Hindi", "Spanish", "French", "German", "Italian", "Portuguese", "Japanese", "Arabic", "Romanian"]
    
    
    var city: String?
    var country: String?
    var countryShortName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        determineMyCurrentLocation()
        setupViews()
    }
    
    func setupViews(){
        self.view.backgroundColor = .white
        
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red:0.90, green:0.91, blue:0.95, alpha:1.0)
        bgView.layer.cornerRadius = 8
        bgView.layer.masksToBounds = true
        
        let nextButton = UIButton()
        nextButton.text("Continue")
        nextButton.layer.cornerRadius = 5
        nextButton.layer.masksToBounds = true
        nextButton.backgroundColor = UIColor(red:0.98, green:0.37, blue:0.38, alpha:1.0)
        nextButton.width(100).height(40)
        self.view.sv(
            bgView,
            nextButton
        )
        
        self.view.layout(
            650,
            |nextButton-35-|)
        
        let langSelect = UIPickerView()
        let locSelect = UITextView()
        
        let langImage = UIImageView(image: #imageLiteral(resourceName: "worldwide"))
        let locImage = UIImageView(image: #imageLiteral(resourceName: "maps-and-flags"))
        langImage.width(60).height(60)
        locImage.width(60).height(60)
        
        langSelect.width(280).height(180)
        locSelect.width(280).height(120)
        
        
        langSelect.dataSource = self
        langSelect.delegate = self
        
        
//        langSelect.backgroundColor = .white
//        langSelect.layer.cornerRadius = 5
//        langSelect.layer.masksToBounds = true
        
        locSelect.text = cityNameStr
        locSelect.textColor = .black
        locSelect.layer.cornerRadius = 5
        locSelect.layer.masksToBounds = true
        
        //langSelect.addTarget(self, action: #selector(langBtnClicked), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextBtnClicked), for: .touchUpInside)
        bgView.sv([
            langSelect,
            langImage
            ])
        langImage.centerVertically(-140).centerHorizontally()
        langSelect.centerVertically(10).centerHorizontally()
        locImage.centerVertically(30).centerHorizontally()
        locSelect.centerVertically(100).centerHorizontally()
        
        
        bgView.width(350).height(400)
        bgView.centerInContainer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let authStatus = CLLocationManager.authorizationStatus()
        if authStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        
        if authStatus == .denied || authStatus == .restricted {
            print("denied")
        }
        
        // here you can call the start location function
        determineMyCurrentLocation()
    }
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    @objc func langBtnClicked(sender: UIButton!) {
//        print("SignUp Button Pushed")
//        let popover = SignupDropDown()
//        popover.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//
//        self.present(popover, animated: true) {
//            // The popover is visible.
//        }
    }
    
    @objc func nextBtnClicked(sender: UIButton!) {
        let containerViewController: ContainerController = ContainerController()
        containerViewController.homeController.langInd = rowSelected
        self.present(containerViewController, animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        // manager.stopUpdatingLocation()
        
        let latitude: CLLocationDegrees = (userLocation.coordinate.latitude)
        let longitude: CLLocationDegrees = (userLocation.coordinate.longitude)
        let location = CLLocation(latitude: latitude, longitude: longitude) //changed!!!
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            if error != nil {
                return
            }else if let country = placemarks?.first?.country,
                let city = placemarks?.first?.locality {
                print(country)
                self.cityNameStr = city
                print(city)
            }
            else {
            }
        })
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
}

extension SignupController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languageArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languageArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rowSelected = row
    }
    
}
