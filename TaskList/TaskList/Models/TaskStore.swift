import Combine

class TaskStore: ObservableObject{
    @Published var prioritizedTasks = [
        PrioritizedTasks(priority: .high, names: [
            "Learn Swift","Learn Swift1","Learn Swift2"
            ]
        ),
        PrioritizedTasks(priority: .medium, names: [
            "Learn JS","Learn JS2","Learn JS3"
            ]
        ),
        PrioritizedTasks(priority: .low, names: [
            "Learn GO"
            ]
        ),
        PrioritizedTasks(priority: .no, names: [
            "Dota2"
            ]
        )
    ]
    
    func getIndex(for priority: Task.Priority) -> Int {
        prioritizedTasks.firstIndex{$0.priority == priority}!
    }
}

private extension TaskStore.PrioritizedTasks{
    init(priority: Task.Priority, names: [String]) {
        self.init(
            priority: priority,
            tasks: names.map{Task(name:$0)}
        )
    }
}
