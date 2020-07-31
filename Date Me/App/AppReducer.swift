//
//  AppReducer.swift
//  Date Me
//
//  Created by Alexander Ignatov on 26.07.20.
//  Copyright © 2020 Alexander Ignatov. All rights reserved.
//

import Foundation
import Combine

typealias AppStore = Store<AppState, AppAction, ServiceDepdendencies>

enum AppReducer {
    static func reduce(
        state: inout AppState,
        action: AppAction,
        environment: ServiceDepdendencies
    ) -> AnyPublisher<AppAction, Never> {
        switch action {
        
        case .logIn(email: let email, password: let password):
            return environment
                .authenticationService
                .logInWithEmail(email: email, password: password)
                .map { _ in .hideAuthenticationScreen }
                .catch { (error) -> AnyPublisher<AppAction, Never> in
                    return Just(.presentAlert(message: error.localizedErrorMessage)).eraseToAnyPublisher()
                }.eraseToAnyPublisher()
            
        case .signUp(email: let email, password: let password, passwordRepeated: let password2):
            guard password == password2 else {
                return Just(.presentAlert(message: "Passwords should match!".localized)).eraseToAnyPublisher()
            }
            return environment
                .authenticationService
                .signUpWithEmail(email: email, password: password)
                .map { _ in .hideAuthenticationScreen }
                .catch { (error) -> AnyPublisher<AppAction, Never> in
                    return Just(.presentAlert(message: error.localizedErrorMessage)).eraseToAnyPublisher()
                }.eraseToAnyPublisher()
            
        case .presentAlert(message: let message):
            state.alertTextMessage = message
            state.alertIsPresented = true
            
        case .dismissAlert:
            state.alertIsPresented = false
            state.alertTextMessage = ""
            
        case .hideAuthenticationScreen:
            state.authScreenIsPresented = false
        }
        
        return Empty().eraseToAnyPublisher()
    }
}
