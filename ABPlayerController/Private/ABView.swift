// Copyright 2017 Jenghis
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Cocoa

class ABView: NSView, ABTintable {
    /// Loads a nib file with the same name as the view.
    class func fromNib<T : NSView>(owner: Any?) -> T? {
        var topLevelObjects: NSArray? = NSArray()
        Bundle(for: self).loadNibNamed("\(self)", owner: owner,
                                       topLevelObjects: &topLevelObjects)
        for object in topLevelObjects! {
            if object is T { return object as? T }
        }
        return nil
    }

    func updateTint() {
        for view in subviews {
            if let view = view as? ABTintable { view.updateTint() }
        }
    }
}
