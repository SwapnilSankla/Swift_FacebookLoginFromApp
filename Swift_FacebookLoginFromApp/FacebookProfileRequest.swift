//
//  FacebookProfileRequest.swift
//  FBLogin
//
//  Created by Swapnil Sankla on 05/08/17.
//  Copyright © 2017 Swapnil Sankla. All rights reserved.
//

import Foundation
import FacebookCore

struct FacebookProfileRequest: GraphRequestProtocol {
    struct Response: GraphResponseProtocol {
        public var dictionaryValue:[String:AnyObject]?
        init(rawResponse: Any?) {
            if let dict = rawResponse as? [String : AnyObject] {
                dictionaryValue = dict
            }
        }
    }

    init() {
        
    }

    var graphPath = "/me"
    var parameters: [String : Any]? = ["fields": "name,email"]
    var accessToken = AccessToken.current
    var httpMethod: GraphRequestHTTPMethod = .GET
    var apiVersion: GraphAPIVersion = .defaultVersion
}
