# flutter_posts_app

A simple Flutter application that fetches posts from a REST API, displays them in a list, and allows marking posts as read while persisting this state locally using SharedPreferences.

## Architecture

# 1. MVC Pattern with GetX

The application uses the MVC (Model-View-Controller) pattern, with GetX as the state management solution. This choice simplifies dependency injection, state management, and navigation.

Model: Represents the data structure of a Post (Post class).
View: Widgets that build the UI (PostPage, PostTile).
Controller: Handles business logic and API interactions (PostController).

# 2. Folder Structure
```
lib/
|-- component/ 
|   |-- postController.dart    # Responsible for fetching data, handling local storage, and state updates.
|   |-- postListItem.dart      # Displays a single list item with UI design for posts.
|   |-- snackbar.dart          # Custom SnackBar widget to display error and success messages.
|   |-- timerWidget.dart       # Timer widget to display the timer on the right side of list items.
|
|-- model/
|   |-- postModel.dart         # Defines the Post data model and handles JSON parsing.
|
|-- screens/
|   |-- postDetails.dart       # Displays detailed information for a selected post.
|   |-- postListPage.dart      # Displays the list of posts fetched from the API.
|
|-- main.dart                  # Entry point of the application.

```


## Third-party library used

# 1. GetX
- Simplifies state management, dependency injection, and routing.
- Lightweight and reactive.

# 2. Http
- Used for making HTTP requests to fetch posts from the API.

# 3. SharedPreferences
- Provides a simple way to store key-value pairs locally.
- Used to persist the "read" status of posts.

# 4. visibility_detector
- A VisibilityDetector widget wraps an existing Flutter widget and fires a callback when the     widget's visibility changes. 


