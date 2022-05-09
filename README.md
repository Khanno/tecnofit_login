# TecnoLogin
## About
This project uses Flutter version 2.5.2, so to be able to run without errors and problems use the correct version. Downgrade or upgrade your version to 2.5.2 using the following command: ```flutter dongrade 2.5.2```
If for some reason the command above doesn't work, you can try the following:
1. Go to the your flutter sdk folder using your terminal
2. Use the following command line: ```git checkout 2.5.2```
3. Run ```flutter doctor``` to download the sdk.

## State Management
This project uses Flutter Bloc to control the state.
This choice was made because I feel that using Flutter Bloc is easier to predict how the state will work, and because of that, easier to find bugs related to data loss when developing the app.

## The API used to login/register
The app is using the free API https://reqres.in/. The itself dosn't send the e-mail to the API because only the pre-register accounts can login or complete the register flow. The app only saves the user input until the user itself closes the app. No data is send to any other third party API.

## Where does this app workspace
The app works on Android and Web. It doesn't iOS for now because I don't have a mac to test it.

