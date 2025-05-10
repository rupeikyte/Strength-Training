Strength Training Desktop App


This Desktop App was made to help beginners that want to start lifting weights. It serves to give the user a calendar to schedule their workouts and pairing that with an algorithm that will
give tips to the user to make the best out of their workout schedule. The app strives to solve the problem that many people trying to go to the gym face. Many people do not know where 
to start and have no knowledge of a plan that they can start working with. Giving users the ability to make a plan as well as informing them of ways that allow a person that goes to the 
gym to meet their goals will make the leap of starting to go to the gym a lot easier.
To give users our feedback we decided to make notifications for a schedule in the shape of warning signs, when a user's schedule does not meet a requirement a warning sign will pop up. Users will be able to hover over the warning signs and read a message that will help guide them in the right direction. The hovering ability takes a few seconds to render as their is a delay with hovering and the warining message.

We decided on three requirements for the best workout schedule: 
1. A user should not workout the same muscle group on back to back days
2. A user should account for rest days and should not workout more than 3 days in a row
3. The user should train every muscle group at least once throughout a month.

To be able to install the Desktop App the user must download XCode through the App Store. The XCode programming language needed to build and run the project is Apple's SwiftUI. The app is only supported on a MacBook.

Swift Documentation:
https://developer.apple.com/documentation/swift/

___________________


![Image](https://github.com/user-attachments/assets/969da67f-3890-4549-8ee7-d932755b01a8)

<img width="1462" alt="Image" src="https://github.com/user-attachments/assets/ced00462-b5b8-4a14-b776-12341195c428" />

___________________

File Documentation


Content View File:

Contains the Content View Structure, this was made to create the UI of the Main Screen that the user will see once they open up the App. Contains both the MonthView Structure as well as the
NotificationView Structure. Which are used to make the UI screen, the MonthView will give the user their calendar with each month and day of the year of 2025, while the NotificationView is
used to be able to give the user, feedback on the schedule that they made.


DayView File:

Contains the DayCard structure and the DayView strucure, this file represents the destination of each of the days that are clickable to the user. Where the screen will switch to the DayView screen
showcasing buttons for each muscle group as well as a DayCard that will pop up when clicking each of the muscle group buttons. The DayView gives the users the buttons that are pressed in order to
schedule the workout that they would want on the specific day. While the DayCard gives the users a pop up card filled with workouts that we decided to give the users as ideas to great workouts
for the specific muscle group.



Item File:

Contains the Item class, which has two global variables that the program will save upon selection. The muscle groups variable which is a dictionary with keys of strings of the muscle group and
values which are booleans. As well as the timestamp variable which is a Date, using the two together allows the app to save muscle group selections the user makes on each date of our calendar.


Month View File:

Contains the MonthView Structure, calendarTitle function, getFirstDayOfWeek function, getAllWeekDays function, getLastDayOfMonth function, getFirstDayOfWeekReverse function, getNumberOfWeeks function,
and then the DayCell and EmptyCell structures. MonthView Structure is built to hold the Calendar UI that you see once you enter application, accounts for all of the features and designs that are
on our main screen. the functions combine together to help make the MonthView what it is, with each function being self explanatory to what it adds to our UI and screen that users can see. The
DayCell and EmptyCell are each square/Day in the Calendar. DayCell displaying text of whichever muscle group that was chosen on the particular day and being clickable. While emptycell, displays
an only colored square that is not clickable and a static cell displaying nothing. The DayCell is a portrayal of days of the month while emptycell is a portrayal of the extra squares that every calendar
has. The last function generateMonthNotifications generates warning signs as well as messages to the user in order to let them know that they are missing one of the requirements in their schedule.


Strength_Training App File:

This file calls the app.


WorkoutCalendar File:

Contains WorkoutDay Structure, WorkoutCalendar Class and generateDays function. The WorkoutDay Structure gives us each workout day which is separate from the DayView as it focuses more on
the muscle group that is being displayed compared to the actual day of the month. Bringing us to the WorkoutCalendar class which is the month calendar but geared towards workouts, the class
is highlighted by the dictionary that we used to track the date which is our key and the workouts on that date which are the values. Explain load and save here The next four functions are used for evaluating our WorkoutCalendar, with getAllBackToBack, dayOverload, isEverythingGettingTrained, and getWorkoutDays. The getAllBackToBack function checks the workouts throughout the year and generates a warning sign if a muscle group is scheduled to be trained on back to back days. The dayOverload function generates a warning when workouts are scheduled on more than 3 consecutive days. This lets users know that they should account for rest days in their schedule. isEverythingGettingTrained function checks if the user has chosen every muscle group at least once throughout the month. While the last function getWorkoutDays allows the calendar to get the workout days throughout the schedules.


Workouts File:

Contains the workouts function as well as a workoutsByMuscleGroup dictionary. The workouts function is used for our DayCard structure as we each of our DayCard portrays a workout that we researched.
The workouts function takes from the workoutsByMuscleGroup dictionary where each muscle group is a key and a string of workouts as each of the values.

