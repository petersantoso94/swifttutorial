//
//  Task.Priority.swift
//  TaskList
//
//  Created by Liem Peter Santoso on 2019/12/4.
//  Copyright © 2019 Liem Peter Santoso. All rights reserved.
//

extension Task{
    enum Priority: Identifiable, CaseIterable {
        case no, low, medium, high
        
        var capitalizedStringValue: String {
          return "\(self)".capitalized
        }
        
        var id: Priority {self}
    }
}
