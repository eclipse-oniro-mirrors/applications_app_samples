# Weather

### Introduction

This sample demonstrates one-time development for multi-device deployment by showing how to develop a weather app and deploy it across different devices. The demo app includes the home page, the **Manage Cities** page, the **Add City** page and the update interval dialog. Following [One-time development for multi-device deployment](https://gitcode.com/openharmony/docs/tree/master/en/application-dev/key-features/multi-device-app-dev), it uses the grid breakpoint system to render different content areas and column counts at SM (320vp to 600vp), MD (600vp to 840vp) and LG (above 840vp) window sizes.

The project is organized as a complete sample that is both runnable and teachable:

- **Home page** hosts a `SideBarContainer` with a sidebar and a content area. The content area uses a `Swiper` to page through the added cities; swipe left or right, or tap a sidebar item, to switch the current city. The background image follows the weather type of the current city.
- **Manage Cities page** lists the added cities in two columns on LG/MD and one column on SM, and leads to the add-city page.
- **Add City page** lists hot cities. Cities already added cannot be tapped; tapping a new city adds it and returns to the manage page.
- **Update interval dialog** is opened from the **Update interval** menu entry. It lists seven radio options — 1, 2, 4, 6, 12, 24 hours and never — in two columns on LG and one column on small screens, and closes on **Cancel**. The dialog is display-only and does not change the refresh policy.
- **Common HAR** `common` provides the mock data, data source, date formatting, style tokens and logging wrapper. The app and the ohosTest module share the same frozen baseline.
- **Automated tests** cover 60 suites / 2445 cases; see [ohosTest.md](./ohosTest.md) for the case matrix and how to run them.

The sidebar is expanded by default at the LG breakpoint and hidden at MD/SM. When the window is dragged across a breakpoint, the sidebar visibility and the content column count follow immediately.

### Display Effect

| Home | Manage Cities | Add City |
|--------------------------------|--------------------------------|--------------------------------|
|![home](./screenshots/devices/zh/home.png)|![city](./screenshots/devices/zh/city.png)|![add_city](./screenshots/devices/zh/add_city.png)|

### How to Use

1. After the app starts, the home page shows the weather of the added cities (two by default). Swipe left or right to switch cities. On an LG device the sidebar is displayed by default and the content area takes 2/3 of the width; when the sidebar is hidden, the content area fills the window.
2. On a device that supports free window dragging, drag the window to its maximum width to show the sidebar, and tap the sidebar control icon at the left of the title bar to hide or show it.
3. Drag the window down to the MD breakpoint; the sidebar and its control icon are hidden automatically, and the weather content area reflows with the window size.
4. Tap the menu button at the upper right and tap **Update interval**. The dialog shows two columns on LG and one column on small screens; tap **Cancel** to close it.
5. Tap the menu button and tap **Manage Cities** to open the city management page, which shows two columns on LG/MD and one column on small screens.
6. Tap **Add City** at the end of the manage page. Cities already added cannot be tapped; tapping a new city adds it and returns to the manage page.

### Project Structure

```
Weather
├──common/src/main/ets                        // HAR module shared by the app and the tests
│  ├──mock
│  │  ├──CityInfo.ts                          // City list mock data (frozen test baseline)
│  │  ├──Mock.ts                              // Weather mock data (frozen test baseline)
│  │  └──RequestData.ts                       // Home page, air quality and life index data
│  ├──model
│  │  ├──BasicDataSource.ets                  // LazyForEach data source
│  │  ├──FormDate.ts                          // Date formatting (fill / month-day / time slot)
│  │  ├──Main.ts                              // Page level models
│  │  └──MenuData.ts                          // Menu entry data
│  ├──util
│  │  ├──Constants.ts                         // Routes, storage keys, breakpoints and tokens
│  │  ├──Logger.ts                            // hilog wrapper
│  │  └──Style.ts                             // Shared style tokens
│  └──index.ets                               // HAR entry, exports all public symbols
└──product/default/src
   ├──main/ets
   │  ├──Application
   │  │  └──MyAbilityStage.ets                // Custom AbilityStage
   │  ├──common/images                        // Images used by canvas drawing
   │  ├──feature
   │  │  ├──AirQualityFeature.ts              // Air quality curve drawing
   │  │  ├──CanvasConstants.ts                // Canvas size, color and business tokens
   │  │  └──SunCanvasFeature.ts               // Sunrise and sunset curve drawing
   │  ├──MainAbility
   │  │  └──MainAbility.ets                   // Main window
   │  └──pages
   │     ├──AddCity.ets                       // Add City page
   │     ├──CityList.ets                      // Manage Cities page
   │     ├──Home.ets                          // Entry page, SideBarContainer + Swiper
   │     └──home
   │        ├──AirQuality.ets                 // Air quality card
   │        ├──HomeContent.ets                // Content area of one city
   │        ├──HoursWeather.ets               // Hourly weather
   │        ├──IndexEnd.ets                   // Home page footer
   │        ├──IndexHeader.ets                // Header weather information
   │        ├──IndexTitleBar.ets              // Title bar and menu
   │        ├──LifeIndex.ets                  // Life suggestions
   │        ├──MultidayWeather.ets            // Multiday weather
   │        ├──SideContent.ets                // Sidebar
   │        ├──SunCanvas.ets                  // Sunrise and sunset card
   │        └──UpdateTimeDialog.ets           // Update interval dialog
   └──ohosTest                                // Automated tests, see ohosTest.md
      └──ets
         ├──Application                       // AbilityStage used by the test HAP
         ├──test                              // 60 suites / 2445 cases, registered in List.test.ets
         ├──testability                       // UIAbility and page used by the test HAP
         ├──testrunner                        // OpenHarmonyTestRunner
         └──util                              // Test helper and UI probe utilities
```

### How to Implement

**Breakpoint listeners and the sidebar**

[Home.ets](product/default/src/main/ets/pages/Home.ets) registers three `mediaquery` listeners in `aboutToAppear` (`SM_QUERY` / `MD_QUERY` / `LG_QUERY` from [Constants.ts](common/src/main/ets/util/Constants.ts)). When a query matches, the page updates `curBp`, writes it to `AppStorage`, hides the sidebar for SM/MD and expands it for LG. `SideBarContainer(SideBarContainerType.Embed)` fixes the sidebar width and disables the built-in control button; visibility is driven by the title bar icon and the icon inside the sidebar.

**City switching and weather background**

The content area iterates `getCityListWeatherData()` with `Swiper` + `ForEach`, and `onChange` writes the current index to `AppStorage` under `swiperIndex`. Tapping a sidebar item writes the same key, so the sidebar and the `Swiper` stay in sync. The page background comes from `getBg(weatherType of the current city)`, falling back to the sunny background when the city list is empty. `@StorageLink('isRefresh')` with `@Watch` rebuilds the city list when the data is refreshed.

**Sidebar and title bar**

[SideContent.ets](product/default/src/main/ets/pages/home/SideContent.ets) renders the city list with `Search` + `LazyForEach(MyDataSource)`; each item has the id `sliderCity<index>` and switches the current city by writing `swiperIndex`. The first city also shows a location icon. [IndexTitleBar.ets](product/default/src/main/ets/pages/home/IndexTitleBar.ets) renders the two entries of `getMenuInfo()` through `bindPopup`: **Manage Cities** navigates with `router.pushUrl`, **Update interval** opens the custom dialog.

**Manage Cities and Add City**

[CityList.ets](product/default/src/main/ets/pages/CityList.ets) lays out the city cards with `GridRow` / `GridCol` (`span: { sm: 4, md: 3, lg: 4 }`); the **Add City** entry at the end of the list (id `addCity`) opens the add page. [AddCity.ets](product/default/src/main/ets/pages/AddCity.ets) renders the hot cities with nested `GridRow` / `GridCol`; `isAdded` marks cities that are already in the list, so they cannot be tapped, while tapping a new city calls `addCity` and returns.

**Air quality and sunrise/sunset curves**

`initRound` in [AirQualityFeature.ts](product/default/src/main/ets/feature/AirQualityFeature.ts) draws the background arc, then a value arc filled with a `createLinearGradient` gradient, and finally writes the air quality description, the AQI value and the two end labels with `fillText`. `initSun` / `initMoon` in [SunCanvasFeature.ts](product/default/src/main/ets/feature/SunCanvasFeature.ts) draw the time axis, the sun and moon arcs and the sunset label. Canvas size, colors and offsets are kept in [CanvasConstants.ts](product/default/src/main/ets/feature/CanvasConstants.ts).

**Update interval dialog**

[UpdateTimeDialog.ets](product/default/src/main/ets/pages/home/UpdateTimeDialog.ets) is a `@CustomDialog` laid out with `GridRow` / `GridCol` (`span: 4`, `offset` 0 / 2 / 4 per breakpoint) so that it is centered or bottom-aligned. The `List` uses two lanes on LG and one lane on the other breakpoints, each interval is a `Radio` in `RadioGroup.UPDATE_TIME`, and **Cancel** closes the dialog through the `handleCancelDialog` callback.

**Common HAR**

[common/index.ets](common/index.ets) exports the `RequestData` request functions, `MyDataSource`, the page models, `FormDate`, `Logger`, `Style` and the constant classes. Both the app and ohosTest reference the same implementation through `@ohos/common`, so the test assertions anchor on one frozen baseline.

### Test

- Test project: `product/default/src/ohosTest` (bundleName `ohos.samples.weather`, test module `entry_test`, runner `OpenHarmonyTestRunner`).
- Scale: 60 suites / 2445 cases — L1 hand-written behavior suites (289), `@volume` specification suites (2128) and L2 UI probe suites (28).
- Result: all 2445 cases passed on a real device (OpenHarmony 7.1.0.21 / API 26) on 2026-11-19, executed in 9 batches.

For the case matrix, the `@tc` metadata, the build/signing steps and the batch commands, see [ohosTest.md](./ohosTest.md).

### Required Permissions

N/A

### Dependency

No third-party dependencies.

### Constraints

1. This sample can only be run on standard-system devices.
2. This sample is a Stage model project built with API version 26; `compileSdkVersion` and `compatibleSdkVersion` are both `"26.0.0"` (runtimeOS: OpenHarmony).
3. This sample can be compiled and run only with DevEco Studio 26 or later versions.
4. The sidebar is available only at the LG breakpoint (window width above 840vp) and is always hidden at MD/SM. The update interval dialog is display-only and does not change the data refresh period.
5. Running all 2445 cases in a single process triggers App died, so the automated regression must follow the 9-batch plan in [ohosTest.md](./ohosTest.md).

### How to Download

If you need to download this project separately, run the following commands:

```shell
git init
git config core.sparsecheckout true
echo code/SuperFeature/MultiDeviceAppDev/Weather/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
