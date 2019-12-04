//
//  ContentView.swift
//  TaskList
//
//  Created by Liem Peter Santoso on 2019/12/3.
//  Copyright © 2019 Liem Peter Santoso. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskStore :TaskStore
    @State var showModal = false
    var body: some View {
        NavigationView {
            List{
                ForEach(Array(taskStore.prioritizedTasks.enumerated()), id: \.element.id){ index,_ in
                    SectionView(prioritizedTasks: self.$taskStore.prioritizedTasks[index])
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Tasks")
            .navigationBarItems(
                leading: EditButton(),
                trailing:Button(action: {
                self.showModal = true
            }) {
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $showModal) {
            NewTaskView(taskStore: self.taskStore, isPresented: self.$showModal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(taskStore: TaskStore())
    }
}
