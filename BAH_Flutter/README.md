# Biggest At Heart mobile app
## Overview
emmy fill in hehe

## Table of Contents
1. [List of All Features](#features)
2. [Frequently Asked Questions](#faq)

## Features
1. [User Sign Up](#user-sign-up) 
2. [User Log In](#user-log-in)
3. [Home Page](#home-page)
4. [Blog/Reflection](#blog-feed)
5. [Certificate Request](#certificate)
6. [View Reports](#view-reports-(admin-users-only))

### User Sign Up

<div style="text-align:center;">
    <img src="assets/images/sign up.png" alt="img" width="200px">
</div>
</br>

When a new user is brought to the login page without an account, he or she can click on the `Sign Up` button at the bottom of the screen to navigate to a sign up page. 

There, new users will go through 3 separate pages of forms to input their personal information as well as other fields such as interests, skills and preferences as shown above. For security purposes, user's password must be **at least 8 characters, including 1 uppercase character, and 1 special character**.

Upon successful sign up, users will be navigated back to the Log In page.

[Back to table of contents](#table-of-contents)

### User Log In

<div style="text-align:center;">
    <img src="assets/images/login.png" alt="img" width="200px">
</div>
</br>

User can log in to their account by keying in their email and password, then clicking on `Log In` button.

Upon successful log in, users will be navigated to their Home page.

[Back to table of contents](#table-of-contents)

### Home Page

<div style="text-align:center;">
    <img src="assets/images/home page.png" alt="img" width="200px">
</div>
</br>

Upon successful login, users will be navigated to their respective home page. It should display their respective profile picture and user name on the top, and a list of volunteering activities that they have enrolled in. Users can click on these activities to view the details of the activities. 

Users can log out of their account by clicking on the `logout` button at the top right of the home page.

Users can navigate to the following pages by clicking on one of the four buttons in the bottom navigation bar:
- `Upload Post Page` - Users can upload a reflecton/sharing/blog 
- `Activity Gallery Page` - Users can view the list of upcoming activities
- `Blog Feed Page` - Users can view others' reflection/sharing
- `Generate Certificate Page` **OR** `View Reports Page` - Depending on whether the user is a normal volunteer or an admin user, the corresponding button and navigation will be shown. For normal users, clicking on the `Generate Certificate Page` will allow them to download a pdf version of a certificate for their volunteering work. For admin users, clicking on the `View Reports Page` will bring allow them to view different types of reports.

**Note**: For details on the respective pages, check out the detailed guide under each feature.

[Back to table of contents](#table-of-contents)

### Blog/Reflection

<div style="display:flex; justify-content:center;">
    <div style="margin-right: 40px;">
        <img src="assets/images/feed button.png" alt="Report by Month" width="200px">
    </div>
    <div style="margin-left: 40px;">
        <img src="assets/images/blog feed.png" alt="Report by Type" width="200px">
    </div>
</div>
<br/>

User can navigate to the Blog Feed page where he/she can view all blog/reflection posts uploaded by other users by clicking on the `Blog Feed Page` button (third button at the bottom navigation bar). At this page, for each post, user can see:
- author of post
- title of post
- date of post

User can click on the `Add Post` button (Plus sign) on the right side of the top navigation bar at this page to upload a blog/reflection post. Upon clicking, user will be navigated to the Upload Post page, where users can type the title and the caption of the post. To delete the whole field fast, user can click on the `Delete` button ('X' mark) at the end of each field. 

<div style="text-align:center;">
    <img src="assets/images/post.png" alt="img" width="200px">
</div>
<br/>

When user finishes crafting his/her post, he/she can click on the `Upload` button below the fields to upload it. Upon successful uploading, user will be notified with a pop-up message and a `Back to Blog Feed` button, and their post will be displayed on the Blog Feed.

<div style="text-align:center;">
    <img src="assets/images/blog.png" alt="img" width="200px">
</div>
<br/>

User can also click on a post on the Blog Feed to view its details. Upon clicking on a post, user will be navigated to the Post Details page, where he/she can see the caption of the post, in addition to the details displayed on Blog Feed page.

In future implementations, user should be able to interact with the posts by clicking on the `Like` button, and leaving comments on the post.

[Back to table of contents](#table-of-contents)

### Request Certificate (Volunteer users only)

<div style="display:flex; justify-content:center;">
    <div style="margin-right: 10px;">
        <img src="assets/images/save pdf.png" alt="Download PDF" width="200px">
    </div>
    <div style="margin-right: 10px;">
        <img src="assets/images/pdf device.png" alt="Save PDF to file" width="200px">
    </div>
    <div>
        <img src="assets/images/pdf on phone.png" alt="PDF viewed on Phone" width="200px">
    </div>
</div>

<br/>

User can request for a certificate by clicking on the `PDF` button on the bottom navigation bar (fourth botton). Upon clicking, user will be navigated to the Preview page of their certificate. The certificate consists of the following component:
- Logo of the organisation
- Name of user
- Total number of volunteering hours (real-time data as of the moment the certificate is requested)
- Date of issuance
- Signature

To download and save the certificate as PDF to his/her device, user can click on the blue `PDF` button on the top right corner of the screen. The PDF certificate can be found under the Files application on the user's phone. An example of the PDF certificate successfully generated and downloaded to device is shown above.

### View Reports (Admin users only)

<div style="text-align:center;">
    <img src="assets/images/report page.png" alt="img" width="200px">
</div>

Admin Users can view reports and statistics regarding the volunteers in 3 ways: 
- By individual 
- By demographics (feature coming soon)
- By month/type of activity

#### By individual volunteers

<div style="text-align:center;">
    <img src="assets/images/indiv report list.png" alt="img" width="200px">
</div>

Admin users can view the entire list of registered volunteers arranged alphabetically by their names. Each volunteer's email and phone number is also shown below their name. Admin users can search for specific volunteers by searching for the user's name in the search bar at the top of the screen.

<div style="text-align:center;">
    <img src="assets/images/report by indiv.png" alt="img" width="200px">
</div>

Clicking on a specific volunteer will display a page with more detailed report for that particular volunteer. Admin can also select a time range and view all activities attended by the user within that period of time, along with each activity's date and duration.

#### By month/type of activity

<div style="text-align:center;">
    <img src="assets/images/month type select.png" alt="img" width="200px">
</div>

Admin users can select between viewing statistical report by month via a date picker or by the one of the 3 types of activity (Volunteering, Training, Workshop) through a drop down menu.

<div style="display:flex; justify-content:center;">
    <div style="margin-right: 40px;">
        <img src="assets/images/report by month.png" alt="Report by Month" width="200px">
    </div>
    <div style="margin-left: 40px;">
        <img src="assets/images/report by type.png" alt="Report by Type" width="200px">
    </div>
</div>
