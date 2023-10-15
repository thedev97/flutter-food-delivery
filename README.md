# flutter_food_delivery

Food Delivery App.

# Getx

# GetxStorage

## Screens

1. Splash Screen
2. OnBoarding Screen
3. Authentication
   a. Registration
   b. Login
4. Dashboard

## Getting Started

## About:

# The task is designed to test your UI skills as well as to test your integration skills.

# Instead of the below reference you can also go with your own creativity while developing UI screens.

# Your task consists of you creating pages like

#Three Splash Screens

- Sign up
- Log In
- Dashboard

# Splash Screens:

# In the first image if user click on Sign up or Sign in a pop-over should come from below showing the form.

- In the second image the redirect between Sign up and Sign in will be addressed at top.
- You can choose any design on your preference or you can show us your creativity as well.

# Sign Up:

- This is api url as well as sample payload for sign up screen.

- API url: https://snapkaro.com/eazyrooms_staging/api/user_registeration

/* Sample Payload:
{
"user_firstname":"mani",
"user_email":" mail@gmail.com ",
"user_phone":"9876543210",
"user_password":"123456",
"user_lastname":"ni",  
"user_city":"Hyderabad",
"user_zipcode": "500072"
} */

## Collect user_firstname, user_email, user_password, user_phone from the form (Like from UI) and for user_lastname, user_city, user_zipcode send some static data.

# Login In:

- This is api url as well as sample payload for log in screen.

- API url:  https://snapkaro.com/eazyrooms_staging/api/userlogin

/* Sample Payload:
{
"user_email":"mail@gmail.com",
"user_password":"123456"
}*/

## After Login In store user information and redirect user to dashboard page and in dashboard page just  show the user information (try to show your creativity here).

## Note:

- Framework should be Flutter.
- Both APIs are POST API, and you should submit JSON object for those.
- Design should be responsive.
- There should be form validations on fields like whether field is filled or not and whether the
  given
- information is valid or not.

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
