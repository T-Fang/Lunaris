//
//  Constants.swift
//  Lunaris
//
//  Created by T放 on 12/7/20.
//  Copyright © 2020 NUS. All rights reserved.
//

import SwiftUI
import Contentful
import NotificationCenter

let conferenceCardColor = #colorLiteral(red: 0.6666666667, green: 0.8235294118, blue: 0.9019607843, alpha: 1)


var AngleMultiplier: Double {
    if screen.width > 500 {
        return 80
    } else {
        return 20
    }
}



let client = Client(spaceId: "nst9eyb0hkt5", accessToken: "bfOoe9_nxBXD7PNXQADC_gTTiNmYCX-l0_UtxkST7kA")

let screen = UIScreen.main.bounds

let complete = UNNotificationAction(identifier: "complete", title: "Complete", options: .foreground)
let dismiss = UNNotificationAction(identifier: "dismiss", title: "Dismiss", options: .destructive)
let notificationCategory = UNNotificationCategory(identifier: "action", actions: [complete, dismiss], intentIdentifiers: [])


let moduleCardHeight: CGFloat = 165
let moduleCardWidth: CGFloat = 275
var listCardHeight:CGFloat {
    if screen.width > 712 {
        return 80
    }
    return 165
}
var listCardWidth:CGFloat {
    if screen.width > 712 {
        return 712
    }
    return screen.width - 28
}



let detailCardHeight: CGFloat = 225
let moduleDetailCardWidth: CGFloat = screen.width


private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


var shortDateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
}

var shortDateFormatterWithHours: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}

var longDateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .medium
    return formatter
}

var sampleModule: Module {
    let module = Module.withName("Communicating in the Information Age this is a Long name", context: context)
    module.prefix = "ES"
    module.digits = "2660"
    module.overview = "In a context of prolific production and convenient access to content and innovation in the Information Age, how should one critically process and clearly communicate ideas to various audiences? In this module, students will learn to question and articulate their analysis of assumptions and assertions on issues facing the Information Age through processes such as identifying bias and substantiating arguments. The Ennis’ (1986, 2001) taxonomy of critical thinking dispositions will be employed to develop students’ analytical thinking skills and their ability to articulate cogent responses to arguments or to defend their own positions in both written and oral form."
    
    return module
}

var sampleDownloadItem: DownloadItem {
    DownloadItem(fileName: "Lecture 10 Recording", fileType: "mp4", moduleCode: "CS2100 Computer Organisation", url: URL(string: "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_1920_18MG.mp4")!)
}

var sampleAnnouncement1: Announcement {
    let announcement = Announcement.withTitle("Announcement about the final exam", context: context)
    announcement.announcedAt = Date()
    announcement.body = "We are going to have our final next week. Venue: MPH, see seating arrangement for more information"
    announcement.module = sampleModule
    
    try? context.save()
    return announcement
}

var sampleAnnouncement2: Announcement {
    let announcement = Announcement.withTitle("Example Essays", context: context)
    announcement.announcedAt = Date()
    announcement.body = "Three example essays has been uploaded. Hope these essays can help :)"
    announcement.module = sampleModule
    
    try? context.save()
    return announcement
}

var sampleConference1: Conference {
    let conference = Conference.withTopic("Seeds of Good Group's First Meeting", context: context)
    conference.link = "https://zoom.us"
    conference.meetingDate = Date()
    conference.module = sampleModule
    
    try? context.save()
    return conference
}

var sampleConference2: Conference {
    let conference = Conference.withTopic("Robot Competition Briefing", context: context)
    conference.link = "https://zoom.us"
    conference.meetingDate = Date()
    conference.module = sampleModule
    
    try? context.save()
    return conference
}
var sampleTodo: Todo {
    let todo = Todo(context: context)
    todo.changeInfo(title: "Create our own API", dueDate: Date(), note: "Using contentful API")
    return todo
}

var sampleFileInfo1: FileInfo {
    let fileInfo = FileInfo(context: context)
    fileInfo.fileName = "Assignment 2 Rubrics Feb 2020"
    fileInfo.fileType = "docx"
    fileInfo.fileSize = 20480
    fileInfo.fileUrl = "https://assets.ctfassets.net/nst9eyb0hkt5/8kAG2U18FUOJf2ewRz7wL/2e9cf8f3b63bce9833fdf495c6efe0e1/Assignment_2_Rubrics_Feb_2020.docx"
    fileInfo.module = sampleModule
    return fileInfo
}

var sampleFileInfo2: FileInfo {
    let fileInfo = FileInfo(context: context)
    fileInfo.fileName = "lecture03"
    fileInfo.fileType = "pdf"
    fileInfo.fileSize = 1100000
    fileInfo.fileUrl = "https://assets.ctfassets.net/nst9eyb0hkt5/7FK85j84J7fsRFgs4hQaUd/7bbbe66c27301291006bf67b47f7c700/lecture03.pdf"
    fileInfo.module = sampleModule
    return fileInfo
}



struct FontModifier: ViewModifier {
    var size: CGFloat = 17
    var weight: Font.Weight = .regular
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: .default))
    }
}
