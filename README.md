# Taskify - To-Do List Application

Taskify is a Flutter project that aims to provide a simple and efficient to-do list application. It includes a sign-up and login page, as well as a main page where the to-do list functionality is implemented. SQLite is used for handling the sign-up and login features.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Dependencies](#dependencies)

## Features

- User sign-up and login functionality
- Secure password storage using SQLite database
- Create, edit, and delete tasks
- Mark tasks as completed
- Clear all completed tasks


## Installation


1. Clone the Taskify repository to your local machine.

git clone https://github.com/your-username/taskify.git

2. Navigate to the project directory.

cd taskify

3. Install the required dependencies using the following command.

flutter pub get

## Uasge

1. Open the project in your preferred Flutter development environment (e.g., Android Studio, Visual Studio Code).

2. Connect a physical device or start an emulator.

3. Run the application using the following command.

flutter run

4. The application should now be running on your device/emulator. You can sign up for a new account or log in with your existing credentials.

5. On the main page, you can add new tasks, mark them as completed, edit or delete existing tasks, and clear all completed tasks.

## Dependencies

The following dependencies are used in this project:

- sqflite: ^2.0.0 - SQLite plugin for Flutter.
- path_provider: ^2.0.1 - Provides access to the device's file system.
- intl: ^0.17.0 - Internationalization and localization support.

These dependencies are already listed in the `pubspec.yaml` file. Running `flutter pub get` will automatically install them.



