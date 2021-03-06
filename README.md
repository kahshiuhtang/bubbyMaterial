# bubbyMaterial

## Purpose:

- Objectively compare how well your significant other is performing against the field
- Analyze behavior throughout the day, week, month and year
- Track what has improved or needs fixing

## Features:

- Allows criterias/goals to be created by each significant other
  - Can be automated to give points unless otherwise
- Points can be awarded to the signigicant other
- There is a joint bar that affects both parties
- Experience bar to show how much
  - Points can increase and decrease in the experience bar
  - However, experience bar cannot drop below the current level
  - Debt is possible
- Data visualization to show progress
- Leaderboards that connects with your friends

## Constraints:

- Built using Flutter
- Using app requires the cooperation of a significant other
  - Allowed to view/use app, just can't particpate without
- Only a certain amount of points can be allocated each day/week/month
- Points cannot be taken away or given back once they have been removed/added
- Uses SQLlite to store data from the app

## Layout:

### Pages:

- Home Page
  - Access point incrementors
- Explore Page
  - Search bar within friends and new people
  - Leaderboard with friends
- Profile Page - View each category
  -Can edit the categories and adjust values
  -Stats Page
  - View statistics of each category

### Menus:

- Settings
- Edit Objective
- Add Objective

## Sources

- https://github.com/akshayejh/what_todo/blob/master/lib/database_helper.dart
