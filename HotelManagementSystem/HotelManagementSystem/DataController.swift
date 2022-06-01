//
//  DataController.swift
//  PageViewer
//
//  Created by 童存善 on 2022/5/28.
//  Copyright © 2022 Grzegorz Przybyła. All rights reserved.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "PageViewer")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}

