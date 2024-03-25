import Foundation

struct ToDoItem: Equatable, Codable, Identifiable {
    var id = UUID()
    var title: String
    var isDone: Bool = false
}

// status of items : done or not
enum ToDoStatus {
    case all
    case done
    case notDone
}
