//
//  PreviewServiceDependencies.swift
//  Date Me
//
//  Created by Alexander Ignatov on 22.07.20.
//  Copyright © 2020 Alexander Ignatov. All rights reserved.
//

class PreviewServiceDependencies: ServiceDepdendencies {
    lazy var authenticationService: AuthenticationService = PreviewAuthenticationService()
}
