//
//  LoginSessionRepository.swift
//  ModuleTests
//
//  Created by Yee Chuan Lee on 05/08/2019.
//  Copyright © 2019 Yee Chuan Lee. All rights reserved.
//

import Foundation
@testable import MVVM2019June20

class MockLoginSessionRepository : LoginSessionRepositoryType {
    var previousLoginSession: LoginSession? = nil
    var currentLoginSession: LoginSession? = nil
    var lastLoginSession: LoginSession? = nil
    func add(_ value: LoginSession) { }
    func delete(_ value: LoginSession) { }
}
