import Foundation

struct ToDoItem: Equatable, Codable, Identifiable {
    var id = UUID()
    var title: String
    var isDone: Bool = false
}

// Ya
enum ToDoProgress: Int {
    case all
    case done
    case notDone
}
