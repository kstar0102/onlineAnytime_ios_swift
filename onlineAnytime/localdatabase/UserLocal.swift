
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
    
    static func delete(entityName: String) {
//          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
          let managedContext = persistentContainer.viewContext

          let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
          let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)

          do {
              try managedContext.execute(deleteRequest)
              try managedContext.save()
          } catch {
              print ("There was an error")
          }
      }
    
    static func getValueDatas() -> [FormValue] {
        var userData:[FormValue] = []
        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FormValue")
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "fid", ascending: true)
        ]

        let fetchData = try! context.fetch(fetchRequest)

        if(!fetchData.isEmpty){
            for i in 0..<fetchData.count{
                userData.append(fetchData[i] as! FormValue)
            }
            do{
                try context.save()
            }catch{
                print(error)
            }
        }

        return userData
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
//        fetchRequest.predicate = NSPredicate(format: "fid == %@", formid)
        
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "element_position", ascending: true)
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
    
    static func getSFEDatas(formid:String) -> [FormElementData] {
            var feData:[FormElementData] = []
            let context = persistentContainer.viewContext

            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FormElementData")
            fetchRequest.predicate = NSPredicate(format: "fid == %@", formid)
            
            fetchRequest.sortDescriptors = [
                NSSortDescriptor(key: "element_position", ascending: true)
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
            NSSortDescriptor(key: "element_position", ascending: true)
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
    
    static func getSFODatas(formid:String, elementid:String) -> [FormElementOptionData] {
        var foData:[FormElementOptionData] = []
        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FormElementOptionData")
        let p1 =  NSPredicate(format: "fid == %@", formid)
        let p2 = NSPredicate(format: "element_id == %@", elementid)
        fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [p1, p2])
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "position", ascending: true)
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
