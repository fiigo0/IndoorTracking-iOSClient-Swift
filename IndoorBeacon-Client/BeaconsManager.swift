//
//  BeaconsManager.swift
//  IndoorBeacon-Client
//
//  Created by Diaz Orona, Jesus A. on 7/19/16.
//  Copyright © 2016 Diaz Orona, Jesus A. All rights reserved.
//

import UIKit

class BeaconsManager: NSObject, EILIndoorLocationManagerDelegate {

    static let sharedInstance:BeaconsManager = BeaconsManager()
    
    //TODO: change the location id
    let kLOCATION_ID = "<your location id>"    
    
    let manager:EILIndoorLocationManager = EILIndoorLocationManager()
    var location:EILLocation?
    
    private override init() {
        super.init()
        manager.delegate = self
    }
    
    func startSharingPositionUpdates() {
        stopSharingPositionUpdates()
        fetchLocation()
    }
    
    func stopSharingPositionUpdates() {
        manager.stopPositionUpdates()
    }
    
    /**
     FetchLocation is needed before start tracking any position with the beacons
     */
    private func fetchLocation() {        
        let fetchLocationRequest = EILRequestFetchLocation(locationIdentifier: kLOCATION_ID)
        fetchLocationRequest.sendRequest { (location, error) in
            if location != nil {
                self.location = location!
                self.manager.startPositionUpdates(for: location!)
            } else {
                print("Can't ferch location \(error)")
            }
        }
    }
    
    //MARK: Indoor Location Manager Delegate Methods
    
    func indoorLocationManager(_ manager: EILIndoorLocationManager, didFailToUpdatePositionWithError error: NSError) {
        print("Did fail to update location \(manager)")
        print("Error : \(error)")
    }
    
    func indoorLocationManager(_ manager: EILIndoorLocationManager, didUpdatePosition position: EILOrientedPoint, with positionAccuracy: EILPositionAccuracy, in location: EILLocation) {
    
        print("Updating position- X: \(position.x) Y: \(position.y) Orientation: \(position.orientation) Accuracy: \(positionAccuracy.rawValue)")
    }
    
    
}
