Flutter Sdk: 3.24.0

# Search Countries App

This Flutter application dynamically fetches and displays country data from a public RESTful API, focusing on a user-friendly experience. The app includes features such as real-time search, detailed country information, and error handling.

## Approach

### Data Integration
- The app integrates with the **REST Countries API** to fetch country data based on the user's search query.
- Data such as country name, flag, region, and population are fetched and displayed in the app.

### State Management
- **GetX** is used for state management to handle data flow, manage search functionality, and ensure reactive UI updates.

### Debounce Logic
- A debounce mechanism is implemented to reduce API calls during search input, triggering the search functionality only after 500ms of inactivity.

### UI Design
- A clean and responsive design is implemented using Flutter's **Material Design** components.
- The app dynamically displays results or appropriate feedback (e.g., "No countries found").

### Features
- **Real-Time Search**: Users can type in a country's name, and results update dynamically.
- **Detail Page Navigation**: The app is designed to allow for future click-through navigation to detailed country pages.
- **Error Handling**: Provides user-friendly error messages for API failures and empty responses.

### Error Management
- Error scenarios such as API failures or no search results are gracefully handled with appropriate feedback and visuals.
- Loading indicators provide a smooth user experience during data fetching.


### Step to run app
Download and install Flutter SDK from the official website.
Add the bin folder of the Flutter SDK to your system's PATH.
Install Android Studio and set up the Android SDK and Emulator using its SDK Manager.
Run flutter doctor to verify your setup and resolve any issues.
Clone the repository.
Run Flutter Pub get after set up enviornment

## Author
Asad Ali![no_Data](https://github.com/user-attachments/assets/6d883af8-3d2d-4bcb-a80b-d6458fc4ef1f)
![search](https://github.com/user-attachments/assets/fe02be2a-4f84-426a-8efb-b1664a49fcb6)

