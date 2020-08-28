//
//  UserLocal.swift
//  onlineAnytime
//
//  Created by Admin on 26/08/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import CoreData

class UserLocal: NSObject {
    static var persistentContainer: NSPersistentContainer = {
    
        let container = NSPersistentContainer(name: "onlineAnytime")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
        }
    }
    
    static func getuserDatas() -> [UserData] {
        var userData:[UserData] = []
        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "useremail", ascending: true)
        ]

        let fetchData = try! context.fetch(fetchRequest)

        if(!fetchData.isEmpty){
            for i in 0..<fetchData.count{
                userData.append(fetchData[i] as! UserData)
            }
            do{
                try context.save()
            }catch{
                print(error)
            }
        }

        return userData
    }
    
    static func getFDatas() -> [FormData] {
        var fData:[FormData] = []
        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FormData")
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "ftitle", ascending: true)
        ]

        let fetchData = try! context.fetch(fetchRequest)

        if(!fetchData.isEmpty){
            for i in 0..<fetchData.count{
                fData.append(fetchData[i] as! FormData)
            }
            do{
                try context.save()
            }catch{
                print(error)
            }
        }

        return fData
    }
    
    static func getFEDatas() -> [FormElementData] {
        var feData:[FormElementData] = []
        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FormElementData")
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "fid", ascending: true)
        ]

        let fetchData = try! context.fetch(fetchRequest)

        if(!fetchData.isEmpty){
            for i in 0..<fetchData.count{
                feData.append(fetchData[i] as! FormElementData)
            }
            do{
                try context.save()
            }catch{
                print(error)
            }
        }

        return feData
    }
    
    static func getFODatas() -> [FormElementOptionData] {
        var foData:[FormElementOptionData] = []
        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FormElementOptionData")
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "fid", ascending: true)
        ]

        let fetchData = try! context.fetch(fetchRequest)

        if(!fetchData.isEmpty){
            for i in 0..<fetchData.count{
                foData.append(fetchData[i] as! FormElementOptionData)
            }
            do{
                try context.save()
            }catch{
                print(error)
            }
        }

        return foData
    }
}
