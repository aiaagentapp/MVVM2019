//
//  AppInfo.swift
//  MVVM2019June20
//
//  Created by Yee Chuan Lee on 02/08/2019.
//  Copyright © 2019 Yee Chuan Lee. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import SemanticVersioning

extension BO.EndPoint {
    class AppInfo: BO.BaseTarget<BO.RequestAppInfo, BO.ResponseAppInfo> {
        override var path: String { return "setting/appinfo" }
    }
}

extension BO {
    class RequestAppInfo : BaseRequest {
        var version: String?
        var platform: BO.EnumPlatform?
        
        enum CodingKeys: String, CodingKey {
            case version = "version"
            case platform = "platform"
        }
        
        override func encode(to encoder: Encoder) throws {
          var container = encoder.container(keyedBy: CodingKeys.self)
          try? container.encode(version, forKey: .version)
          try? container.encode(platform, forKey: .platform)
        }
    }
    
    class ResponseAppInfo : BaseResponse {
        var forceUpdate: Bool?
        
        enum CodingKeys: String, CodingKey {
            case forceUpdate = "forceUpdate"
        }
        required init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            forceUpdate = try? values.decodeIfPresent(Bool.self, forKey: .forceUpdate)
            try super.init(from: decoder)
        }
        
        override init() {
            super.init()
        }
    }
}
