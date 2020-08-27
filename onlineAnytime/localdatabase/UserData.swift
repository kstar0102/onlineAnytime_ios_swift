import UIKit
import CoreData

class UserDatabase: NSObject {
    static var persistentContainer: NSPersistentContainer = {
    
        let container = NSPersistentContainer(name: "onlineAnytime")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
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
    
    static func getBinDatas() -> [UserData] {
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

}
