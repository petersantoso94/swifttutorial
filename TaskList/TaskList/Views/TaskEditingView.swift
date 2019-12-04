//
//  TaskEditingView.swift
//  TaskList
//
//  Created by Liem Peter Santoso on 2019/12/4.
//  Copyright © 2019 Liem Peter Santoso. All rights reserved.
//

import SwiftUI

struct TaskEditingView: View {
    @Binding var task:Task
    
    var body: some View {
        Form{
            TextField("Name", text: $task.name)
            Toggle("Completed", isOn:$task.completed)
        }
    }
}

struct TaskEditingView_Previews: PreviewProvider {
    static var previews: some View {
        TaskEditingView(task: .constant(Task(name: "todo list")))
    }
}
