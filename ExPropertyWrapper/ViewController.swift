//
//  ViewController.swift
//  ExPropertyWrapper
//
//  Created by Jake.K on 2022/03/03.
//

import UIKit

class ViewController: UIViewController {
  @AccessToken var accessToken
  @Flag(name: "isSignIn") var isSignIn
  
  override func viewDidLoad() {
    super.viewDidLoad()

    @TrimmedString var string = "   trimmined string? \n"
    print(string) // "trimmined string?"
    
    print(self.accessToken) // "defaultValue"
    print(self.isSignIn) // false
    print(self.$isSignIn) // "isSignIn"
  }
}
