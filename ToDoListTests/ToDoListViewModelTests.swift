import XCTest
import Combine
@testable import ToDoList

final class ToDoListViewModelTests: XCTestCase {
    // MARK: - Properties
    
    private var viewModel: ToDoListViewModel!
    private var repository: MockToDoListRepository!
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        repository = MockToDoListRepository()
        viewModel = ToDoListViewModel(repository: repository)
    }
    
    // MARK: - Tear Down
    
    override func tearDown() {
        viewModel = nil
        repository = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testAddTodoItem() {
        // Given
        let item = ToDoItem(title: "Test Task")
        
        // When
        viewModel.add(item: item)
        
        // Then
        XCTAssertEqual(viewModel.toDoItems.count, 1)
        XCTAssertTrue(viewModel.toDoItems[0].title == "Test Task")
    }
    
    func testToggleTodoItemCompletion() {
        // Given
        let item = ToDoItem(title: "Test Task")
        viewModel.add(item: item)
        
        // When
        viewModel.toggleTodoItemCompletion(item)
        
        // Then
        XCTAssertTrue(viewModel.toDoItems[0].isDone)
    }
    
    func testRemoveTodoItem() {
        // Given
        let item = ToDoItem(title: "Test Task")
        viewModel.toDoItems.append(item)
        
        // When
        viewModel.removeTodoItem(item)
        
        // Then
        XCTAssertTrue(viewModel.toDoItems.isEmpty)
    }
    
    func testFilteredToDoItems() {
        // Given
        let item1 = ToDoItem(title: "Task 1", isDone: true)
        let item2 = ToDoItem(title: "Task 2", isDone: false)
        let item3 = ToDoItem(title: "Task 3", isDone: false)
        let item4 = ToDoItem(title: "Task 4", isDone: true)
        let item5 = ToDoItem(title: "Task 5", isDone: false)
        viewModel.add(item: item1)
        viewModel.add(item: item2)
        viewModel.add(item: item3)
        viewModel.add(item: item4)
        viewModel.add(item: item5)
        
        // When
        let itemsAll = viewModel.applyFilter(at: .all)
        // Then
        XCTAssertEqual(itemsAll.count, 5)
        
        // When
        let itemsDone = viewModel.applyFilter(at: .done)
        // Then
        XCTAssertEqual(itemsDone.count, 2)
        XCTAssertEqual(itemsDone.first?.title, item1.title)
        
        // When
        let itemsNotDone = viewModel.applyFilter(at: .notDone)
        // Then
        XCTAssertEqual(itemsNotDone.count, 3)
        XCTAssertEqual(itemsNotDone.first?.title, item2.title)
        
    }
}
