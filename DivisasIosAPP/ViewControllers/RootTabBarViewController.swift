//
//  RootTabBarViewController.swift
//  DivisasIosAPP
//
//  Created by Mañanas on 19/9/24.
//

import UIKit

class RootTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    

    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          // Hide navigation bar
          self.navigationController?.isNavigationBarHidden = true
      }
      
      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          // Show navigation bar
          self.navigationController?.isNavigationBarHidden = false
      }
}
