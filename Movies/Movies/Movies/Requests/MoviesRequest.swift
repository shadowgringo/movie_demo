//
//  MoviesRequest.swift
//  Movies
//
//  Created by Mathieu Villeneuve on 2019-03-19.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation

class MoviesRequest: APIRequest {
    
    // MARK: - Properties
    var method = RequestType.GET
    var path = "3/discover/movie"
    var parameters = [String: String]()
    
    init() {
        parameters["api_key"] = "cb98638effb7da53ef355c0683c26dca"
        parameters["language"] = "en-US"
        parameters["sort_by"] = "popularity.desc"
        parameters["include_video"] = "false"
        parameters["include_adult"] = "false"
        parameters["page"]="1"
    }
}
