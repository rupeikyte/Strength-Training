Strength Training Desktop App


This Desktop App was made to help beginners that want to start lifting weights. It serves to give the user a calendar to schedule their workouts and pairing that with an algorithm that will
give tips to the user to make the best out of their workout schedule. The app strives to solve the problem that many people trying to go to the gym face. Many people do not know where 
to start and have no knowledge of a plan that they can start working with. Giving users the ability to make a plan as well as informing them of ways that allow a person that goes to the 
gym to meet their goals will make the leap of starting to go to the gym a lot easier.

To be able to install the Desktop App the user must download XCode through the App Store. The XCode programming language needed to build and run the project is Apple's SwiftUI.

___________________

Users/NathanGumagay/Desktop/Strength-Training/files-pri/T0F19MNUD-F08RTEYV4D8/screenshot_2025-05-09_at_8.51.14___pm.png

Users/NathanGumagay/Desktop/Strength-Training/files-pri/T0F19MNUD-F08RBEKTMU7/screenshot_2025-05-09_at_8.51.23___pm.png

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
has.


NotificationView File (subject to change?):

Contains the NotificationView and NotificationCell Structure, as well as the splitDaysIntoWeeks, generateNotifications, and DayNumberToWeekdayName functions. The NotificationView is going to be
aloow us to give users feedback to their schedules that they make. It serves to support users when they make a schedule as decisions made by the NotificationView is research that we did to give
great advice. The spliDaysIntoWeekdays function allows all of our days to be split into weeks so our NotificationView can give feedback by the week for our calendar. The NotificationCell is subject
to change as it is a cell that we decided as a vertical stack of rectangles on the side panel. But, it has changed towards a warning sign on each DayCell instead. This structure serves to be able to
display messages that gives users feedback to their scheduled week. The generateNotifications function goes hand in hand with the NotificationCell as it allows us to be able to protray the text
that the NotificationCell displays. dayNumberToWeekdayName function changes the problem of displaying daycell numbers, so the corresponding number of the month with the DayCell. But, being able to
change it to a weekday makes it much easier for the user to be able to read our messages a lot easier by giving them the weekday name.


Strength_Training App File:



WorkoutCalendar File:

Contains WorkoutDay Structure, WorkoutCalendar Class and generateDays function. The WorkoutDay Structure gives us each workout day which is separate from the DayView as it focuses more on
the muscle group that is being displayed compared to the actual day of the month. Bringing us to the WorkoutCalendar class which is the month calendar but geared towards workouts, the class
is highlighted by the dictionary that we used to track the date which is our key and the workouts on that date which are the values. The generateDays function gives us each day for the
workoutCalendar class.


WorkoutEvaluator File:

Contains WorkoutEvaluator Structure, and dayOverload as well as isEverythingGettingTrained function. This WorkoutEvaluator is aimed to evaluate each week of workouts separately and give
feedback to the user. dayOverload function is our function that catches if users workout the same musclegroup on consecutive days. While the isEverythingGettingTrained function checks if the
user has chosen a every single muscle group at least once throughout the month.


Workouts File:

Contains the workouts function as well as a workoutsByMuscleGroup dictionary. The workouts function is used for our DayCard structure as we each of our DayCard portrays a workout that we researched.
The workouts function takes from the workoutsByMuscleGroup dictionary where each muscle group is a key and a string of workouts as each of the values.

