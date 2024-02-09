# biggestatheart
## Overview

## Table of Contents
1. [List of All Features](#features)
2. [Frequently Asked Questions](#faq)

## Features
1. [User Sign up](#user-sign-up) 
3. [Home Page](#home-page)
7. [View Reports](#view-reports-(admin-users-only))

### User Sign Up

![img](<BAH_Flutter/assets/images/sign up.png>)


When a new user is brought to the login page without an account, he or she can click on the `Sign Up` button at the bottom of the screen to navigate to a sign up page. There, new users will go through 3 separate pages of forms to input their personal information as well as other fields such as interests, skills and preferences as shown above. Upon successful sign up, users will be navigated back to the login page where they can key in their username/email and password to log in.

[Back to table of contents](#table-of-contents)

### Home Page

![img](<BAH_Flutter/assets/images/home page.png>)

Upon successful login, users will be navigated to their respective home page. It should display their respective profile picture and user name on the top, and a list of volunteering activities that they have enrolled in. Users can click on these activities to view the details of the activities. 

Users can log out of their account by clicking on the `logout` button at the top right of the home page.

Users can navigate to the following pages by clicking on one of the four buttons in the bottom navigation bar:
- `Upload Post Page` - Users can upload a reflecton/sharing/blog 
- `Activity Gallery Page` - Users can view the list of upcoming activities
- `Blog Feed Page` - Users can view others' reflection/sharing
- `Generate Certificate Page` **OR** `View Reports Page` - Depending on whether the user is a normal volunteer or an admin user, the corresponding button and navigation will be shown. For normal users, clicking on the `Generate Certificate Page` will allow them to download a pdf version of a certificate for their volunteering work. For admin users, clicking on the `View Reports Page` will bring allow them to view different types of reports.

**Note**: For details on the respective pages, check out the detailed guide under each feature.

[Back to table of contents](#table-of-contents)

### View Reports (Admin users only)

![img](<BAH_Flutter/assets/images/report page.png>)

Admin Users can view reports and statistics regarding the volunteers in 3 ways: 
- By individual 
- By demographics (feature coming soon)
- By month/type of activity

#### By individual volunteers

![img](<BAH_Flutter/assets/images/indiv report list.png>)

Admin users can view the entire list of registered volunteers arranged alphabetically by their names. Each volunteer's email and phone number is also shown below their name. Admin users can search for specific volunteers by searching for the user's name in the search bar at the top of the screen.

![img](<BAH_Flutter/assets/images/report by indiv.png>)

Clicking on a specific volunteer will display a page with more detailed report for that particular volunteer. Admin can also select a time range and view all activities attended by the user within that period of time, along with each activity's date and duration.

#### By month/type of activity

![img](<BAH_Flutter/assets/images/month type select.png>)

Admin users can select between viewing statistical report by month via a date picker or by the one of the 3 types of activity (Volunteering, Training, Workshop) through a drop down menu.

![img](<BAH_Flutter/assets/images/report by month.png>)
![img](<BAH_Flutter/assets/images/report by type.png>)
[Back to table of contents](#table-of-contents)

