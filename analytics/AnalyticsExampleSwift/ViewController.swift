//
//  Copyright (c) 2015 Google Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import UIKit
import Firebase

@objc(ViewController)  // match the ObjC symbol name inside Storyboard
class ViewController: UIViewController {

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    recordScreenView()

    // [START custom_event_swift]
    FIRAnalytics.logEvent(withName: kFIREventSelectContent, parameters: [
      kFIRParameterItemID: "id-\(title!)" as NSObject,
      kFIRParameterItemName: title! as NSObject,
      kFIRParameterContentType: "cont" as NSObject
      ])
    // [END custom_event_swift]
  }

  func recordScreenView() {
    // These strings must be <= 36 characters long in order for setScreenName:screenClass: to succeed.
    guard let screenName = title else {
      return
    }
    let screenClass = classForCoder.description()

    // [START set_current_screen]
    FIRAnalytics.setScreenName(screenName, screenClass: screenClass)
    // [END set_current_screen]
  }
}
