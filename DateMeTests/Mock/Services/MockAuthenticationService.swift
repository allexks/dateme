//
//  MockAuthenticationService.swift
//  DateMeTests
//
//  Created by Alexander Ignatov on 5.01.21.
//  Copyright © 2021 Alexander Ignatov. All rights reserved.
//

import Combine
@testable import Date_Me

class MockAuthenticationService: AuthenticationService, MockService {
    
    var mockedSignUpWithEmail: AnyPublisher<AppAction.AuthenticationInfo, AuthenticationError>!
    var mockedLoginWithEmail: AnyPublisher<AppAction.AuthenticationInfo, AuthenticationError>!
    
    func signUpWithEmail(email: String, password: String) -> AnyPublisher<AppAction.AuthenticationInfo, AuthenticationError> {
        mockedSignUpWithEmail
    }
    
    func logInWithEmail(email: String, password: String) -> AnyPublisher<AppAction.AuthenticationInfo, AuthenticationError> {
        mockedLoginWithEmail
    }
}
