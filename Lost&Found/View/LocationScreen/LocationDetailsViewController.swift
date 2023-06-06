//
//  LocationViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 23.5.23.
//

import UIKit
import SwiftUI

class LocationDetailsViewController: UIViewController {

    @IBOutlet weak var theContainer: UIView!
    
    private let vm = LocationsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let childView = UIHostingController(rootView: LocationView().environmentObject(vm))
        addChild(childView)
        childView.view.translatesAutoresizingMaskIntoConstraints = false
        theContainer.addSubview(childView.view)
        
        NSLayoutConstraint.activate([
                childView.view.leadingAnchor.constraint(equalTo: theContainer.leadingAnchor),
                childView.view.trailingAnchor.constraint(equalTo: theContainer.trailingAnchor),
                childView.view.topAnchor.constraint(equalTo: theContainer.topAnchor),
                childView.view.bottomAnchor.constraint(equalTo: theContainer.bottomAnchor)
            ])
        
        theContainer.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
              theContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
              theContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
              theContainer.topAnchor.constraint(equalTo: view.topAnchor),
              theContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
          ])
    }
    

    @IBSegueAction func embedSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: LocationView().environmentObject(vm))
    }
    
}
