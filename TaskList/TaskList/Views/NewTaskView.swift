//
//  NewTaskView.swift
//  TaskList
//
//  Created by Liem Peter Santoso on 2019/12/3.
//  Copyright © 2019 Liem Peter Santoso. All rights reserved.
//

import SwiftUI

struct NewTaskView: View {
    var taskStore: TaskStore
    
    @State var taskName:String = ""
    @State var taskPriority:Task.Priority = .no
    @Binding var isPresented:Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        
        Form {
            TextField("Task Name", text: $taskName)
            VStack {
                Text("Priority")
                Picker("Priority", selection: $taskPriority){
                    ForEach(Task.Priority.allCases){ v in
                        Text(v.capitalizedStringValue).tag(v)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Button("Add"){
                let priorityIndex = self.taskStore.getIndex(for: self.taskPriority)
                self.taskStore.prioritizedTasks[priorityIndex].tasks.append(Task(name:self.taskName))
                self.presentationMode.wrappedValue.dismiss()
            }.disabled(taskName.isEmpty)
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(taskStore: TaskStore(), isPresented: .constant(true))
    }
}
