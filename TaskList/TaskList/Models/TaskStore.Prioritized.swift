//
//  TaskStore.Prioritized.swift
//  TaskList
//
//  Created by Liem Peter Santoso on 2019/12/4.
//  Copyright © 2019 Liem Peter Santoso. All rights reserved.
//

extension TaskStore{
    struct PrioritizedTasks {
        let priority: Task.Priority
        var tasks: [Task]
    }
}

extension TaskStore.PrioritizedTasks: Identifiable{
    var id : Task.Priority{ priority }
}
