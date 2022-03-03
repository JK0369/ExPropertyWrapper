//
//  Example1.swift
//  ExPropertyWrapper
//
//  Created by Jake.K on 2022/03/03.
//

import Foundation

// ex1) stored-property로 사용하여 didSet 이용
@propertyWrapper
struct TrimmedString {
  var wrappedValue: String {
    didSet { self.wrappedValue = self.wrappedValue.trimmingCharacters(in: .whitespacesAndNewlines) }
  }
  init(wrappedValue: String) {
    // 주의: observer property의 didSet 실행은 초기화가 완료된 이후에만 트리거되므로 주의
    self.wrappedValue = wrappedValue.trimmingCharacters(in: .whitespacesAndNewlines)
  }
}

// ex2) computed-property로 사용하여 get, set 이용
@propertyWrapper
struct AccessToken {
  private enum Key {
    static let accessToken = "accessToken"
  }
  private let storage = UserDefaults.standard
  
  var wrappedValue: String {
    get { self.storage.string(forKey: Key.accessToken) ?? "defaultValue" }
    set { self.storage.set(newValue, forKey: Key.accessToken) }
  }
}

// ex3) projectedValue
@propertyWrapper
struct Flag {
  let name: String
  
  var wrappedValue = false
  var projectedValue: String { self.name }
  
  init(name: String) {
    self.name = name
  }
}
