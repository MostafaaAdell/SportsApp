//
//  ActivityIndicatorView.swift
//  SportsApp
//
//  Created by Mustafa on 07/10/2023.
//

import UIKit


class ActivityIndicatorView{
    
    let overlayView = UIView()
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    
    
    //Set attrbuites for the indicator and the View
    func setConfigrationForIndicator(view:UIView){
        overlayView.frame = view.bounds
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        overlayView.isUserInteractionEnabled = true
        activityIndicator.color = .white
        activityIndicator.center = overlayView.center
        overlayView.addSubview(activityIndicator)
        view.addSubview(overlayView)
    }
    
    func startLoading(view:UIView) {
           // Disable user interaction on the main view
           view.isUserInteractionEnabled = false

           // Start animating the indicator
           activityIndicator.startAnimating()
       }

    func stopLoading(view:UIView) {
           // Stop animating the indicator
           activityIndicator.stopAnimating()

           // Remove the overlay view
           overlayView.removeFromSuperview()

           // Enable user interaction on the main view
           view.isUserInteractionEnabled = true
       }
    
    
}
