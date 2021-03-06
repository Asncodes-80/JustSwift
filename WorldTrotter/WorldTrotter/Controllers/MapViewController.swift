//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Alireza Soltani Neshan on 4/21/1400 AP.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    let mapView: MKMapView = MKMapView()
    let location = CLLocationManager()
    
    public var pointsOfInterestStatus: String = "Disable"
    // Public Create a label
    let switchLabelPointOfInterest = UILabel()
    
    // When loadView() called?
    // When our view property is equal to nil in storyboard or in this doc
    // loadView() method will call
    override func loadView() {
        view = mapView
        // Set MapView to all (res, airport) filter in point of interest
        mapView.pointOfInterestFilter = .none
        
        
        // Create new UIView
        let segmentedItems = ["Standard", "Hybrid", "Satellite"]
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        segmentedControl.backgroundColor = .systemBackground
        segmentedControl.selectedSegmentIndex = 0
        
        // Create SwitchView
        let switchController = UISwitch()
        switchController.onTintColor = .systemBlue
        switchController.isOn = true
        
        // Bydefault
        switchLabelPointOfInterest.text = "\(pointsOfInterestStatus) Points of Interest"
         
        
        // Adding Event to Segmented Control
        segmentedControl.addTarget(self, action: #selector(mapChangedState(_:)), for: .valueChanged)
        switchController.addTarget(self, action: #selector(pointOfInterest(_:)), for: .valueChanged)
        
        
        // Add Segemented Control to main View as navigate of mkmap view controller
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        switchController.translatesAutoresizingMaskIntoConstraints = false
        switchLabelPointOfInterest.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        view.addSubview(switchController)
        view.addSubview(switchLabelPointOfInterest)
       
        // Editing margin and add constrains
        segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        let margin = view.layoutMarginsGuide
        segmentedControl.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        
        // Sizing the switch with SegmentedController
        switchController.topAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: 50).isActive = true
        switchController.rightAnchor.constraint(equalTo: margin.rightAnchor).isActive = true
        
        switchLabelPointOfInterest.topAnchor.constraint(equalTo: switchController.topAnchor).isActive = true
        switchLabelPointOfInterest.leftAnchor.constraint(equalTo: margin.leftAnchor).isActive = true
    }
    
    @objc func mapChangedState(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    @objc func pointOfInterest(_ pointSwitch: UISwitch) {
        if pointSwitch.isOn {
//            none filter to show all details
            pointsOfInterestStatus = "Disable"
            switchLabelPointOfInterest.text = "\(pointsOfInterestStatus) Points of Interest"
            mapView.pointOfInterestFilter = .none
        } else {
//            Exclude from all filter such as airport and etc...
            pointsOfInterestStatus = "Enable"
            switchLabelPointOfInterest.text = "\(pointsOfInterestStatus) Points of Interest"
            mapView.pointOfInterestFilter = .excludingAll
        }
                
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        location.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        location.requestWhenInUseAuthorization()
        location.requestLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let longitude = location.coordinate.longitude
            let latitude = location.coordinate.latitude
            print(longitude, latitude)
            let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let region = MKCoordinateRegion(center: center,  span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            mapView.setRegion(region, animated: true)

        } else {
            print("Error in Getting optional binding of locations")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("This is Error from Core Location Manager: \(error)")
    }
    
}
