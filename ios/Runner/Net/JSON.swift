//
//  JSON.swift
//  NiceLooEducation
//
//  Created by 优路教育  on 2018/2/15.
//  Copyright © 2018年 NiceLoo. All rights reserved.
import UIKit
struct JSON {
    static func parseJSON<T>(type: T.Type, data: Data?) -> T? where T : Decodable {
        var obj: T?
        guard let d = data else { return nil }
        obj = try? JSONDecoder().decode(type, from: d)
        return obj
    }
}
