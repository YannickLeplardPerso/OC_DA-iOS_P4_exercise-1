import Foundation

struct ToDoItem: Equatable, Codable, Identifiable {
    var id = UUID()
    var title: String
    var isDone: Bool = false
}

// Ya
enum ToDoProgress: Int {
    case all = 0
    case done = 1
    case notDone = 2
}
