# Lunaris
Orbital Project by SaturnV @ 2020 NUS

![Lunaris-Logo](https://user-images.githubusercontent.com/61874388/142764140-114c4524-27cf-4ab3-bb1c-5838d4e6fa27.png)


**Video Demo**: https://drive.google.com/file/d/117pu0us7uZf91ahyFrj7yLDdKCTZATnA/view?usp=sharing

**Team Name:** SaturnV
**Proposed Level of Achievement:** Apollo 11
**![img](https://lh5.googleusercontent.com/6YFsfiohQVBSPWsJS9szBLC_4pdS1sqyZa1iyYnLnC0ZWaHdRaAKznOnOIqT4jXukALqjunYoZmOqy8tO-TScoUF--w_2im-7gh10gNgQVbt6AxmX2U8TXIVZXHHPivM__-CzGLC)**

### Description

**Lunaris is a nice-looking NUS LumiNUS iOS client written in Swift. It has File downloading & management features as well as a built-in task management system combined with the announcement & conferencing features.**


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
Features to be completed by the mid of June:

1. A mobile LumiNUS application, providing necessary functions students need on phones.
2. A “Downloaded” interface integrated with Apple’s “Files” app, which can show all the files downloaded from LumiNUS.

Features to be completed by the mid of July: 

1. A complete, nice-looking and intuitive user interface design of the app.
2. A task system which allows users to order the tasks, mark tasks as done, and swipe to remove the tasks.

**Tech Stack**

1. Swift & SwiftUI
2. Core Data

**Milestone 2 - Features implemented and Problems encountered**

**Features Implemented**

**Please watch the video for a full hand-on demo**

**Dashboard**

![img](https://lh5.googleusercontent.com/4ztAuByPQJXOGzfmb19oQbt6nHXaAJi9r_bkLnHJOZcrXWpWS_IsspbLi5q6V0VpnoMVtsDVzyt1DGERH6uhkMyIFt1wh6pBIONfTuNwovhyVlgWvVEYjkTt6LkjUF5qcYqAW99E)
![img](https://lh3.googleusercontent.com/72sGN6UYDBlkvUQbTMRACnRvOhYxTSYy--mIf5l6DC0cjbt-6kr-aR7fpd2lJ2__YWOiNCctaa8JbjGLwiDAxwvf2NBMcNJXkK4T44fS5c_07YUoineqsAKMucd0jXJ--Q58mD12)
![img](https://lh6.googleusercontent.com/-xGcc28nF3xYWxykZevij-UN46BnIY5TKLwMeYAIulDaVUxczAYR3C7jvaLZPeBuoz4GhaoibD7qVRfCdKrpF9akEU0ptS-C841VZtjx4VTZHuzSlZacoj2RIWtxnzbusg3Jz6lb)
Cards showing modules taken this semester with fantastic animationShow upcoming eventsChange Preference (Appearance, Language, etc)Quick access to todo listNice animation revealing the preference tab

**Modules**

![img](https://lh5.googleusercontent.com/ZtqUtrC2JusAysyOk_FZOr_-bmpEF2ZqaElmqvr7hLFv3SQ-PHb9XIC1bJQIkB6PcLpgJYdLMRYFdIA6mAgqfKJQPDK_5qAbW7Zftk-5W8qyAynX0q6L59picjscIvZ6WmE0rZKK)
![img](https://lh3.googleusercontent.com/GIN98bBkc4-mPcrSMrzyRZuZb6VIXnhLjYA4ORxemqz5c3AB790NtJpn0YQktTIqYmdWhpX6Nqo7JLkrCDAis70ce_avuCOFQ_IlT3spjoZ2VKXVY9letqA-qNxedcNdgoR23HYT)
List of module taken this semesterSmooth transition to show the detailed information of a specific moduledetailed page showing announcements, files, etc

**Downloads**

![img](https://lh5.googleusercontent.com/psvpnFo9rWc8fE5CS0MhQIgekpOVitz6NxcA98BdtSexuvg7rxzcPwptUq_gMxJ9X1FdPoIwP6Fo0d95VLBnwshH0fpFobDID5VfuvTeVJDmJvnjxmZVfgrZzsiuXgjoQMdpkp6X)
![img](https://lh6.googleusercontent.com/eMTA8GlE3X2ih8oeUZvrF54RIGbIieTrvwFiCM5i3ln3m2tSBN1dSOgc913PmVu0vpZm4LNhji_H4RTwQnYLjairxIAYsHNcR9UEUVSUI4S6YxDtSFZnER1oeIvk1f304pOUPYE8)Shows all downloadable files from LumiNUSShows all downloading files, with a circle progress bar to indicate progressShows all finished downloading tasksA button to show everything in the Files app of iOS

**Tasks**

![img](https://lh5.googleusercontent.com/hGjacNl_NABsgHM3J0S4FGSWTsdKP4KDV3jIlbS04Q4GkRjJupAFzy0wHJYFx-DphFD-sfeGNs9qBwDAKdhdbuhXO1r_FkO4bHTr2ndnAbQYq3Z5WHKF7sW-ybstz9GxHoFQXear)
![img](https://lh4.googleusercontent.com/BXUiMt9QhVrXhbEU_lDda1J3PJJ4ApvYicUdV1dlY_sSojuXqtyd0u_Y5TxkibRLPN2K30pUg_a7F1eZV4A2t13-M0fFG1ebL_vCbUFinyB4cCsJzp25IGWj1jDzeMln3LgF6eR6)Default to be retrieved from LumiNUS Tasks section or Conferencing section.Allow users’ customisationadd new tasks or scheduled meetingsdelete existing tasks or scheduled meetings (maybe someone of the same group has submitted and no need for you to work on this anymore, or scheduled meetings that are not your time slot)modify tasks or scheduled meetingsBuilt with iOS native technologiesSwiftUICoreData, such that the app can maintain the effects of user's operations later

**Problems encountered and further feathers to add**

Since there are no working LumiNUS APIs for now, the default data of the app is simply placeholders, but the data flow has been implemented. In the same time, we have also learnt from the internet about how to request and fetch data from HTTP APIs, so we believe it will not take too much time for us to transit from the current version to a fully workable LumiNUS with working APIs.While implementing the todo list, we found that such a todo list integrated with LumiNUS is indeed productive for NUS students, and therefore our users may want to use that on their computer. If time is enough for us in the end, we still consider moving this todo list to some backend database and implement a web application for this functionality.Currently, due to the limited time, we are not able to integrate cloud services uploading in this app, so we add a button to open a nested version of the system's Files app. This button will most likely be kept in the final version, but we would like to make it possible for users to automatically sync with their cloud services right in the app. However, currently we have no idea how to make that happen.

**Milestone 3 Goals:**

1. **User testing**
2. API
3. Cloud uploading
4. Item modification
5. UI changes

**Milestone 3 - New Features implemented, bugs squashed and user testing**

**New Features ImplementedPlease watch the video for a full hand-on demo** 

video link: https://drive.google.com/file/d/117pu0us7uZf91ahyFrj7yLDdKCTZATnA/view?usp=sharing

**Dashboard**

![img](https://lh6.googleusercontent.com/MPIDAIf1w56Mpta3qhrccgGfFAhrMTwuHW9rcIo8p6de30svrFt0c5V-Bb-fID_82RNst8pqKyZGDBXZwkL__AMDZg7N-oHH7E3mVted1CI3fjlELGn5nNQviiezyZ6mm5GcDmoE)
![img](https://lh3.googleusercontent.com/9YqO1_D-BGxHhaL0TmvOML0vjVbd5hxssTSqj6hEJ9CWJD1Nl-pv9hnKTjjYTzwKgGaxhc4tlxc_HAQIl2eSbuV4D3Z3Zdo9zlKCxP08bPV2oZ6SJxLVk7s-qHyqiI_hoZ5NgkTq)
![img](https://lh6.googleusercontent.com/wFJisx_cae_T57mPslfZDCuGZZ0hIu_AN8ORavHeCInicMOXbgxjVybz6RzTRlZy2ty7A9VzUTBTmpkN4CggClA9TpuajMflu6gZNPUZXpob16Za3gmfEJ1LPaeMdSO01zvWEODY)

1. Added a refresh button to fetch new dataAdded notification feature for conferences. 

2. Users can open the conference link in the notification center![img](https://lh3.googleusercontent.com/9niaXgAmcZ6m_Y4IJcfsqx2UoRZZQ5XUknQLoNWRQ2cdaaTM0XWzzk8Vz1qjcM8x0N1Cr6GUz8ow3BkP3gNz0THZR9igcC8ij1VVwhbc5vAuGT36eaHkPDPS7FK8Su_2SjOGBYNy)3. 

3. Added “+” button to quickly add an announcement to the task manager.

4. Added clickable title (Announcements, Conferences) which will direct to all Announcements (Conferences) listMake every card clickable (Click conference card to open conference link, click announcement to view announcement detail)

   **Modules**

![img](https://lh5.googleusercontent.com/zZMAALMJsHi5TOu-SikN2rzuD7CXyZaLw2Bsk04eTkrfGWmrJbdZO6nysJFkACgxfkajOl7U40APc9NepDLJP1i2aw6x4vfnsKFklC2ytFt3IRFAVcHVYkFNf7RkrawzygZpJwLT)
![img](https://lh6.googleusercontent.com/vrs9QQf6TdsDIofKS539BVFACDWnUdYGK005Pu4USqZU8RxudVA1trFADiMLbHSo_55vLDCEKyY3HSBfs1cZfxDLZBDgPuTO54zsycfJiAhXdKUeHAIfhFErnSgXk-0Lte1joQAQ)
![img](https://lh6.googleusercontent.com/Ji_B_TttOYCO2IP5F5irQK0JlD5IWj7sMYfjWg_sUodGqHQkaf4J_sEXmv3GWzKCf3vxc4ZQZBTSvdwO4syBTUsLGjFEBIZAbPm2B3ghwDfUarDb5wiedstsjy8z5h4y_rOWroIc)
![img](https://lh5.googleusercontent.com/7WSfZxA7NE8G6Y8ccH5VAJzXy3fCN8kY1T_2v3rhOQw91sMqHeXz-Yhq6IneF1jFgU0FXTA-xuS2bTnKvePJGYo9y2Y5FATtIolzsWbX5ZStAFJAUAj7SJmMUCciAKuKAS46YCY9)
![img](https://lh5.googleusercontent.com/4DDaRiWzbCS9MY9HjGFymTx8G3n2A3AyfjVIoqwg1U-zud6mpn6kmYeXLamjfk50mZljSbinjpNSLh9yjc3AKFeUA7fl0CNmWQW-d_Isp4y6QO3kaaK6XIwknl-bCCwjbghasunS)1. 

   1. Added pull to refresh feature
   2. Added similar design to announcements and conferences seen in Dashboard
   3. Added Searchbar in every list
   4. Added files (downloadable), whose icons will change depending on the extension of the file

   **Downloads**
   
![img](https://lh5.googleusercontent.com/a72MbOR1gYJJGKecJZ3Pghw5gMgJJLuhk4zKeu9IFAS9KSH3tOAlfHsOcgYKD4LJMH-llfhnuJIZuq0qN3GEyGV_bkxEzW9cnpO3sFDQFgHjXidMFbcEPJ6jq0sSQKp_UG8UDrEJ)
![img](https://lh4.googleusercontent.com/sl_KubGEGBZ0lbV-mhtYzRES4oKBSqoHTtGhiQuzOAZT5eHiydomnGLM1jAQpYJ7Kzo6VRSpBF3pKXotIMwVaof0Jh17SKfwxqFF6AeD59c1pPCuXQ7rcoxD9pH5LLDhhxhOsuYy)
![img](https://lh6.googleusercontent.com/ffQI-Uvez1iPh3w40rsybcYhvqg0lZKT3ASEJfUuMOkSgtAS-1UkRZWZnMOLghDAzJ9Nvk0AJCyw5M7ZPfhzCsX8NN-zzVZoN4eanAdFXBEJz3moWOtSH0-PyG-2uiIiJNLLE0zy)
![img](https://lh4.googleusercontent.com/aiNFiPOPdZVmp0aX40xLx6y_M62svHmp_j_MVBiQSlTbH9fWTH2wiqiYf2qkrVr_oR9YXhbeb88Qt8hxSPpwPHKO9dm9Wg19E-NgxWv2cTygYfiFlzkhuqi9hjb2DTb4pZoZXuxX)**

   1. Refined the UI design of the Downloads tab

   2. Added progress bar for user to view the download progress

   3. Added “view all in files app” button which will open files app

   4. In files app, users can continue other operations such as preview, open in another app, and upload to different cloud services.

      **Tasks**

      ![img](https://lh6.googleusercontent.com/PeLrUwGT2K3QIUq3dEaPgeqJxT7Un9d-dW_5nM8W4CA7dDqJoYpen5Wn5qfq1LFPDF_H0jtBGcyDeE4ARkLof3ONiY8qYQW5JNzPQvsgc5V9QsItRZgLMyPPmR9_ADq-3wx0NgZJ)
      ![img](https://lh6.googleusercontent.com/-v_ttvKVOVj-EzQVmjz9lm8msKEvApi5IT6Le1rD25bfPp15iYOsQJHhkEeqH3MIjK3vt-PHoSjHDNhOgooVxndX2VIr0TUlzppo0NtKxhuVougZFGvoFxbI9YaMWmqe93Gl0JRY)
      ![img](https://lh4.googleusercontent.com/vCwnt0duTIUNv6w4zTW0TLCpYagdM_5bdwhw4K5Nf_7HRATJ1snvW21QMelAVt2fPZ4aAPPEnB7oKwBNWrLzX06En6a3ZLwbrzoL4b9IsGQFx5XxM78EzDJ1RM7tqhqRXnzWZZfV)1. Refine the UI Design of task managerAdded search bar to search for tasks

      2. Added notification feature to notify user when the deadline is near, and user can complete the task right in the notification center![img](https://lh4.googleusercontent.com/vgF9alBeEfgVrtBPzMOdgwKrRiByYO6Tq2KK1og6DkU67ymI_J63F3jybhlfFzyU9t0C3KBdZs72zv3NtiwS0Wb-O10tPvys6XR3-jwYfKMZCXIVrkAGex-hq4-SJFwgVfWnQfzG)
         

**Bugs Squashed**

Bugs & Solution

1. shadow of the module card displayed abnormally in dark mode --> remove the shadow
2. unnecessary abbreviation of list title. e.g. “MA1521 Announcements” displayed as “MA1521...” --> add a line breaker between module code and “Announcement” (“Conferences”) since the intended way is to display the title in two lines 
3. “unwrapping an optional value and find a nil” if a module without announcements or conferences is published --> properly initialize a module during update process
4. if the user complete a task in the notification center, all tasks will be completed --> This error occurs because we have wrongly handled the response (add “notification observer” in every task ). The correct way to do this is to complete task in the AppDelegate immediately when the response comes back
5. the search bar will “bounce around” when user click the search bar --> This bug is related to the emergence of the “cancel” button. It adds height to the search bar when it appears. We chose to use a different way to hide(show) it (by using opacity)
6. When the user check a task, (s)he will still receive a notification of the already completed task --> Add a condition to check whether the task is completed before adding a notification to the queue. Also added clearPendingNotification to clear pending notification when the task’s due date changes

**User testing and problems encountered**
We have used two methods to do user testing: 1. self evaluation 2. Usability testing with potential users with high-fidelity artefacts (working prototype)

**Self evaluation**

We are constantly evaluating whether the UI is intuitive, whether certain functions are necessary, etc. During the process of self evaluation, we have fixed bugs listed above and made an important decision to not incorporate the uploading feature. We find uploading inside the app is unnecessarily cumbersome and the result is not ideal. Hence we chose to save files in the “files app” where users can upload to their desired services and do other operations on files downloaded. Through self evaluation, we were able to fix many issues before we gave the prototype to our friends for the second phase of user testing

**Usability testing with potential users with high-fidelity artefacts (working prototype)**

We have chosen 5 of our friends to do the user testing. Honestly, without their help we might miss some potential bugs. They have also given many useful suggestions on UI. However due to limited time, we only managed to make changes based on some of their advice. The unfixed minor problems are listed below

1. progress bar will display wrongly if the user attempts to download many files at once. (note: our downloader is single-threaded. When users try to download another file when the previous file has not completed, the progress bar of the previous file will stop. However, we have tested and found out that all files will be downloaded once the download of the last added file is complete. Hence it will only affect the appearance, but not actual usage of the app )
2. while editing the title of a new task, the keyboard will disappear after a letter is typed.
3. users suggest we add a feature to open files in the app. (note: we want to implement features to preview the file inside the app. However, Apple says that the api to open files inside “Files” is obsolete. Hence, we advise users to open “Files” app for further operations)

Thanks to our friends and their genuine feedback, we have realized many things that we can improve. 

