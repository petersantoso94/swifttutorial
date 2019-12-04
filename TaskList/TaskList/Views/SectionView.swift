//
//  SectionView.swift
//  TaskList
//
//  Created by Liem Peter Santoso on 2019/12/4.
//  Copyright © 2019 Liem Peter Santoso. All rights reserved.
//

import SwiftUI

struct SectionView: View {
    @Binding var prioritizedTasks : TaskStore.PrioritizedTasks
    
    var body: some View {
        Section(
            header: Text("\(prioritizedTasks.priority.capitalizedStringValue) Priority")
        ){
            ForEach(Array(prioritizedTasks.tasks.enumerated()), id: \.element.id){ index, _ in
                RowView(task: self.$prioritizedTasks.tasks[index])
            }.onDelete{ indexSet in
                self.prioritizedTasks.tasks.remove(atOffsets: indexSet)
            }.onMove{ source, destination in
                self.prioritizedTasks.tasks.move(fromOffsets: source, toOffset: destination)
            }
        }
        
    }
}

