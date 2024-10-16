# Flutter App with Mapbox Integration

This Flutter app includes multiple pages that meet design requirements, but not all are fully functional yet. A particular focus is on the "Find Interesting Places" page, which uses Mapbox for map display. 
## Mapbox Integration

The "Find Interesting Places" page utilizes Mapbox for displaying maps. Please note the following requirements and instructions for running the app with Mapbox:

### Prerequisites

- **OpenSSL 3.0** is required for the Mapbox integration to run properly. Please make sure it is installed and configured on your system/Emulator.
- The app has been tested on physical devices, where the Mapbox functionality works as expected. However, while the map may display on an emulator, it will not be fully functional. It is recommended to use a physical device for the best experience.

### Running the App

To run the app with full Mapbox functionality, use the following command:

```bash
flutter run --dart-define ACCESS_TOKEN=pk.eyJ1IjoiZ2F2ZW43NTMyNSIsImEiOiJjbTFwazhvZzQwNTVnMmpxMmJyZXNxbzRoIn0.kMJYwhonFStyMkVGKBwprgcls
```

If you prefer to run the app without Mapbox functionality, you can simply use:
```bash
flutter run
