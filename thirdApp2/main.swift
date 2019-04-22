//
//  main.swift
//  thirdApp
//
//  Created by Алексей Теликанов on 17/04/2019.
//  Copyright © 2019 Алексей Теликанов. All rights reserved.
//

import Foundation
import Alamofire

print("Hello, World")
request("http://jsonplaceholder.typicode.com/posts").responseJSON { response in
    print(response)
}
print("viewDidLoad ended")
