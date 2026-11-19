# LocationKit

## Introduction

This sample demonstrates OpenHarmony Location Kit usage. It is built on the `@ohos.geoLocationManager` ArkTS APIs and the Location C APIs provided by `@kit.LocationKit`, covering the following features:

- **Location**:
  Query the location switch state, obtain the last cached location, obtain the current location once, and subscribe to or unsubscribe from continuous location changes. See [Location Development Guide (ArkTS)](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/device/location/location-guidelines.md).
- **Geocode**:
  Query geocoder availability, convert coordinates to addresses (reverse geocoding) and addresses to coordinates (forward geocoding). See [Forward and Reverse Geocoding Development Guide](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/device/location/geocode-guidelines.md).
- **Geofence**:
  Create a circular GNSS geofence, subscribe to enter/exit transition events with system notifications, and remove the fence. See [Geofence Development Guide](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/device/location/geofence-guidelines.md).
- **Location C API**:
  Query the location switch and subscribe to or unsubscribe from location changes through the native Location C APIs, with results passed back to the ArkTS UI. See [Location Development Guide (C/C++)](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/device/location/location-guidelines-capi.md).

This is a guideline-code co-source sample. Page code is mapped to the guideline snippets one-to-one through `[Start xxx]`/`[End xxx]` comment anchors.

## Preview

Screenshots to be added (screenshot directory).

### How to use

1. Grant the location permissions requested on first launch.
2. Tap **Location** to check the switch state, get the cached or current location, and start or stop continuous locating.
3. Tap **Geocode** to check service availability and convert between coordinates and address descriptions (network connection required).
4. Tap **Geofence** to configure the fence center and radius, add the fence, and receive enter/exit events and notifications (open outdoor area required).
5. Tap **Location C API** to query the switch state and subscribe to location changes on the native side, with results shown on the page.

## Project structure

```
entry/src/main/
├── cpp/                              // Native code (C API locating)
│   ├── CMakeLists.txt                // Build script, links the location native library
│   ├── napi_init.cpp                 // NAPI interfaces (switch query, subscribe, unsubscribe)
│   └── types/libentry/
│       ├── index.d.ts                // NAPI interface declarations
│       └── oh-package.json5
├── ets/
│   ├── entryability/
│   │   └── EntryAbility.ets          // Ability entry, requests location permissions
│   ├── entrybackupability/
│   │   └── EntryBackupAbility.ets    // Backup and restore entry
│   ├── pages/
│   │   └── Index.ets                 // Entry page, Navigation container
│   └── location/                     // Feature pages
│       ├── pages/
│       │   ├── MainPage.ets          // Main page, feature navigation
│       │   ├── LocationPage.ets      // Location page
│       │   ├── GeocodePage.ets       // Geocode page
│       │   ├── GeofencePage.ets      // Geofence page
│       │   └── LocationCapiPage.ets  // Location C API page
│       └── components/
│           └── CommonComponents.ets  // Common UI components (NavBar, SectionCard, etc.)
└── resources/                        // Application resources

entry/src/ohosTest/ets/test/          // UI automation test cases
├── List.test.ets                     // Test suite entry
├── Ability.test.ets                  // App startup test
├── MainPageNavigation.test.ets       // Page navigation test
└── ...                               // Per-page UI verification tests
```

## Implementation

- **Location**: LocationPage calls `geoLocationManager.isLocationEnabled()`, `getLastLocation()`, `getCurrentLocation(request)` with the fast locating priority, and `on('locationChange')`/`off('locationChange')` for continuous locating, refreshing latitude, longitude and accuracy in the callback. See [LocationPage.ets](entry/src/main/ets/location/pages/LocationPage.ets).
- **Geocode**: GeocodePage calls `isGeocoderAvailable()`, `getAddressesFromLocation()` and `getAddressesFromLocationName()`, and displays the result list on the page. See [GeocodePage.ets](entry/src/main/ets/location/pages/GeocodePage.ets).
- **Geofence**: GeofencePage builds a `Geofence` and a `GnssGeofenceRequest` with enter/exit events and notifications, calls `addGnssGeofence()` to add the fence and records the fence ID, and `removeGnssGeofence()` to remove it. See [GeofencePage.ets](entry/src/main/ets/location/pages/GeofencePage.ets).
- **Location C API**: napi_init.cpp queries the switch with `OH_Location_IsLocatingEnabled()` and subscribes or unsubscribes with `OH_Location_StartLocating()`/`OH_Location_StopLocating()`; reported locations are passed back through a NAPI threadsafe function and displayed by LocationCapiPage. See [napi_init.cpp](entry/src/main/cpp/napi_init.cpp) and [LocationCapiPage.ets](entry/src/main/ets/location/pages/LocationCapiPage.ets).

## Required permissions

[ohos.permission.LOCATION](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-all-user.md#ohospermissionlocation)

[ohos.permission.APPROXIMATELY_LOCATION](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-all-user.md#ohospermissionapproximately_location)

## Dependencies

Not involved.

## Constraints and limitations

1. This sample supports standard systems only. Supported device: RK3568.

2. This sample uses the Stage model and requires API version 26 SDK.

3. This sample requires DevEco Studio NEXT Developer Preview2 or later to build and run.

4. Geocoding requires a network connection; the geofence feature depends on the GNSS chip and only reports transitions accurately in open outdoor areas.

### Download

To download this project separately, run the following commands:

```
git init
git config core.sparsecheckout true
echo code/DocsSample/LocationKit/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
