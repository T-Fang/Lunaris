# Lunaris
Orbital Project by SaturnV @ 2020 NUS

**README**

**Team Name:** SaturnV
**Proposed Level of Achievement:** Apollo 11
**![img](https://lh5.googleusercontent.com/BDOGfK1q3fhjclxYXmNcwdxjbpOiH4XKgdbjweBTuMCSUZ4f9hPgPBgxmU5mJjIttXYEi-8BJLlN3F1joIYL7vo41wED2FwzJSM4_q5P2sr4poepvD0jOVyLxojVJ4EPytmRwWk5)**

**Motivation** 

When students want to **download** **newly added** files from all modules. They have to check all modules they have taken **one by one** and click the “show all files not downloaded”. What’s more frustrating is that, when newly added files are big or too many, iPhone and iPad will have to **wait for a long time** before “selected-download” is added to the downloading queue. If one accidentally refreshes the web page before “selected-download” being added to the downloading queue, there are no more “newly added files”, and he or she has to **manually search** in the “file” tab and try to recall what is new.
Also, although the current luminous system already highlights which quiz or assignment is due soon and what are the recent announcements made. There isn’t a **task management system** with functionalities like tagging and setting expected finishing time for students to prioritize certain tasks, add preparatory tasks that are not mentioned in the announcements, or simply just add one’s own tasks.

**Aim** 
We hope to create a better user experience of LumiNUS on iOS mobile devices (specifically, iPhone) with our application named “Lunaris” - nice-looking (hopefully sticking with the Apple SwiftUI design code), intuitive user interface, with a useful and easy-to-use download function and file managing capacity, as well as a task ranking and tagging system.

**User Stories**
As a student who has many modules, I want to download all the newly added files efficiently.As a student who backs up files using multiple net disk systems, I want to be able to sync all the files with third party net disks.As a student who is used to task management, I want to be able to add existing announcements and deadlines as a side note of tasks and remind myself of tasks I need to do within the app.

**Scope of Project**
Our **Lunaris** App offers an elegant way to download files and manage tasks on LumiNUS.
The iOS app starts with an interface with 4 tabs - Modules, Announcements, Files and Profile. These functions (except Files) provide the basic functionality of the LumiNUS platform as the website does.
A download function with file management system can download files from LumiNUS and allow users to do basic operations on the downloaded files.
A task management system to allow the users to manage their LumiNUS tasks - order the priority of the tasks, mark them as done or remove the tasks.
Features to be completed by the mid of June:A fully functional LumiNUS on the application, providing the same functions as the website LumiNUS does.A “Downloaded” interface integrated with Apple’s “Files” app, which can show all the files downloaded from LumiNUS, with sorting by date/name/size/module, renaming and sharing functions.
Features to be completed by the mid of July: A complete, nice-looking and intuitive user interface design of the app.A task system which allows users to order the tasks, mark tasks as done, and swipe to remove the tasks.

**Tech Stack**

1. Swift & SwiftUI
2. Core Data

**Milestone 2 - Features implemented and Problems encountered**

**Features Implemented**

**Please watch the video for a full hand-on demo**

**Dashboard**![img](https://lh5.googleusercontent.com/4ztAuByPQJXOGzfmb19oQbt6nHXaAJi9r_bkLnHJOZcrXWpWS_IsspbLi5q6V0VpnoMVtsDVzyt1DGERH6uhkMyIFt1wh6pBIONfTuNwovhyVlgWvVEYjkTt6LkjUF5qcYqAW99E)![img](https://lh3.googleusercontent.com/72sGN6UYDBlkvUQbTMRACnRvOhYxTSYy--mIf5l6DC0cjbt-6kr-aR7fpd2lJ2__YWOiNCctaa8JbjGLwiDAxwvf2NBMcNJXkK4T44fS5c_07YUoineqsAKMucd0jXJ--Q58mD12)![img](https://lh6.googleusercontent.com/-xGcc28nF3xYWxykZevij-UN46BnIY5TKLwMeYAIulDaVUxczAYR3C7jvaLZPeBuoz4GhaoibD7qVRfCdKrpF9akEU0ptS-C841VZtjx4VTZHuzSlZacoj2RIWtxnzbusg3Jz6lb)
Cards showing modules taken this semester with fantastic animationShow upcoming eventsChange Preference (Appearance, Language, etc)Quick access to todo listNice animation revealing the preference tab

**Modules**![img](https://lh5.googleusercontent.com/ZtqUtrC2JusAysyOk_FZOr_-bmpEF2ZqaElmqvr7hLFv3SQ-PHb9XIC1bJQIkB6PcLpgJYdLMRYFdIA6mAgqfKJQPDK_5qAbW7Zftk-5W8qyAynX0q6L59picjscIvZ6WmE0rZKK)![img](https://lh3.googleusercontent.com/GIN98bBkc4-mPcrSMrzyRZuZb6VIXnhLjYA4ORxemqz5c3AB790NtJpn0YQktTIqYmdWhpX6Nqo7JLkrCDAis70ce_avuCOFQ_IlT3spjoZ2VKXVY9letqA-qNxedcNdgoR23HYT)
List of module taken this semesterSmooth transition to show the detailed information of a specific moduledetailed page showing announcements, files, etc

**Downloads**![img](https://lh5.googleusercontent.com/psvpnFo9rWc8fE5CS0MhQIgekpOVitz6NxcA98BdtSexuvg7rxzcPwptUq_gMxJ9X1FdPoIwP6Fo0d95VLBnwshH0fpFobDID5VfuvTeVJDmJvnjxmZVfgrZzsiuXgjoQMdpkp6X)![img](https://lh6.googleusercontent.com/eMTA8GlE3X2ih8oeUZvrF54RIGbIieTrvwFiCM5i3ln3m2tSBN1dSOgc913PmVu0vpZm4LNhji_H4RTwQnYLjairxIAYsHNcR9UEUVSUI4S6YxDtSFZnER1oeIvk1f304pOUPYE8)Shows all downloadable files from LumiNUSShows all downloading files, with a circle progress bar to indicate progressShows all finished downloading tasksA button to show everything in the Files app of iOS

**Tasks**

![img](https://lh5.googleusercontent.com/hGjacNl_NABsgHM3J0S4FGSWTsdKP4KDV3jIlbS04Q4GkRjJupAFzy0wHJYFx-DphFD-sfeGNs9qBwDAKdhdbuhXO1r_FkO4bHTr2ndnAbQYq3Z5WHKF7sW-ybstz9GxHoFQXear)![img](https://lh4.googleusercontent.com/BXUiMt9QhVrXhbEU_lDda1J3PJJ4ApvYicUdV1dlY_sSojuXqtyd0u_Y5TxkibRLPN2K30pUg_a7F1eZV4A2t13-M0fFG1ebL_vCbUFinyB4cCsJzp25IGWj1jDzeMln3LgF6eR6)Default to be retrieved from LumiNUS Tasks section or Conferencing section.Allow users’ customisationadd new tasks or scheduled meetingsdelete existing tasks or scheduled meetings (maybe someone of the same group has submitted and no need for you to work on this anymore, or scheduled meetings that are not your time slot)modify tasks or scheduled meetingsBuilt with iOS native technologiesSwiftUICoreData, such that the app can maintain the effects of user's operations later

**Problems encountered and further feathers to add**

Since there are no working LumiNUS APIs for now, the default data of the app is simply placeholders, but the data flow has been implemented. In the same time, we have also learnt from the internet about how to request and fetch data from HTTP APIs, so we believe it will not take too much time for us to transit from the current version to a fully workable LumiNUS with working APIs.While implementing the todo list, we found that such a todo list integrated with LumiNUS is indeed productive for NUS students, and therefore our users may want to use that on their computer. If time is enough for us in the end, we still consider moving this todo list to some backend database and implement a web application for this functionality.Currently, due to the limited time, we are not able to integrate cloud services uploading in this app, so we add a button to open a nested version of the system's Files app. This button will most likely be kept in the final version, but we would like to make it possible for users to automatically sync with their cloud services right in the app. However, currently we have no idea how to make that happen.

**Milestone 3 Goals:**

1. **User testing**
2. API
3. Cloud uploading
4. Item modification
5. UI changes

