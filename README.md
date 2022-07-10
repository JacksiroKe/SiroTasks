# Siro's Task App

## Description
* A Flutter Task App with [Parse](https://parseplatform.org/) ([Back4app](https://back4app.com)) as the backend demonstrating CRUD operations.
* Getx State Management
 
## Objective
 This repo will be useful to developers looking for an alternative to backend services like Firebase as they will enjoy building apps without any third party libraries when they switch to using RestFUL APIs provided by the Back4App platform.

## Article
- [Technical Article on Hashnode](https://jacksiro.hashnode.dev/using-parse-server-back4app-as-an-alternative-to-firebase-for-your-flutter-app)

## ScreenShots
<table>
    <tr>
        <td><img width=300 src="https://github.com/JacksiroKe/SiroTasks/blob/main/screenshots/image1.jpg"/></td>
        <td><img width=300 src="https://github.com/JacksiroKe/SiroTasks/blob/main/screenshots/image2.jpg"/></td>
        <td><img width=300 src="https://github.com/JacksiroKe/SiroTasks/blob/main/screenshots/image3.jpg"/></td>
    </tr>
</table>

## Features
* Splash screen
* Search tasks
* Save tasks as well as Update tasks
* Delete tasks.

## How to run
* Sign Up or Sign In on [Back4app](https://back4app.com)
* Once signed in click “Build a new app” and give a name to your app
* You will be taken to the console where by default there are 2 classes Under **Database** present namely Role and User. Create a new class named `task` which will store the data for each Task item.
* Proceed to 2 columns namely: `title` and `content` to the class which will store the actual task.
* Clone this repo
* Navigate to the code `lib\app\constants\api_constants.dart`
* On the console go to **App Settings** >> *Security & Keys*
* Copy the **Application ID** and paste in place of `YOUR_PARSE_APPLICATION_ID`
* Copy the **REST API key** and paste in place of `YOUR_PARSE_REST_API_KEY`
* Run `cd`
* Run `flutter pub get`
* Run `flutter run`

## Contributions
Contributions are always welcome. Please fork this repository and contribute using pull requests. The pull requests will be thoroughly assessed and if found significant will be accepted.

## Connect with me
- [Medium](https://medium.com/@JacksiroKe)
- [Instagram](https://www.instagram.com/JacksiroKe)
- [Twitter](https://www.twitter.com/JacksiroKe)
- [LinkedIn](https://www.linkedin.com/in/JacksiroKe)
- [Github](https://github.com/JacksiroKe)

My email: JacksiroKe@gmail.com