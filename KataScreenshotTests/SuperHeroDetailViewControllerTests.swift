//
//  SuperHeroDetailViewControllerTests.swift
//  KataScreenshotTests
//
//  Created by Fernando García Fernández on 21/11/17.
//  Copyright © 2017 Karumi. All rights reserved.
//

import Foundation
import UIKit
@testable import KataScreenshot

class SuperHeroDetailViewControllerTests: ScreenshotTest{
    
    fileprivate let repository = MockSuperHeroesRepository()
    let superHeroNameTest = "Mr. Clean"
    let superHeroBigNameTest = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    func testSuperHeroDetailAppearWithoutBadge(){
        givenASuperHero(isAvenger: false)
        
        let viewController = getSuperHeroDetailViewController(superHeroName: superHeroNameTest)
        
        verify(viewController: viewController)
    }
    
    func testSuperHeroDetailAppearWithBadge(){
        givenASuperHero(isAvenger: true)
        
        let viewController = getSuperHeroDetailViewController(superHeroName: superHeroNameTest)
        
        verify(viewController: viewController)
    }
    
    func testSuperHeroWithBigName(){
        givenASuperHeroWithBigName(isAvenger: true)
     
        let viewController = getSuperHeroDetailViewController(superHeroName: superHeroBigNameTest)
        
        verify(viewController: viewController)
    }
    
    func givenASuperHeroWithBigName(isAvenger: Bool){
        var superHeroes = [SuperHero]()
        superHeroes.append(SuperHeroMother.givenASuperHeroWithBigName(isAvenger: isAvenger))
        repository.superHeroes = superHeroes
    }
    
    func givenASuperHero(isAvenger: Bool){
        var superHeroes = [SuperHero]()
        superHeroes.append(SuperHeroMother.givenASuperHero(isAvenger: isAvenger))
        repository.superHeroes = superHeroes
    }
    
    fileprivate func getSuperHeroDetailViewController(superHeroName: String) -> UIViewController {
        let superHeroDetailViewController = ServiceLocator()
            .provideSuperHeroDetailViewController(superHeroName) as! SuperHeroDetailViewController
        superHeroDetailViewController.presenter = SuperHeroDetailPresenter(ui: superHeroDetailViewController, superHeroName: superHeroName, getSuperHeroByName: GetSuperHeroByName(repository: repository))
        return superHeroDetailViewController
    }
        
}
