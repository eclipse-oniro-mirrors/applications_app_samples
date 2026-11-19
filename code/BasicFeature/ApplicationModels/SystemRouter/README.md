# Navigation System Routing

### Introduction

This project verifies the system routing table. With the system routing table, pages of modules (HSP/HAR) can be navigated to without configuring dependencies between the modules involved in the navigation. When a page navigation occurs, pages that are not navigated to are not loaded, and pages that have already been loaded are not loaded again. This resolves the coupling caused by module dependencies and the long home page loading time.

For detailed configuration, see [system routing table](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/ui/arkts-navigation-navigation.md).

Due to environment differences, it is not recommended to compile directly after downloading. Instead, create a project first and write code referring to the sample.

### Preview

<img src="./images/NavIndex.jpeg" width="200" height="360" />

| EntryPageOne | EntryPageTwo | HarAPageOne |
|------------------------------------------------------------------|------------------------------------------------------------------|-----------------------------------------------------------------|
| <img src="./images/EntryPageOne.jpeg" width="200" height="360"/> | <img src="./images/EntryPageTwo.jpeg" width="200" height="360"/> | <img src="./images/HarAPageOne.jpeg" width="200" height="360"/> |

### Usage

1. The home page provides a NavIndex navigation page. Tapping the buttons navigates to different pages from the HAR and HSP packages.

2. Each page in the HAR and HSP packages also has buttons for navigating to other pages.

### Project Directory

```
├──entry/src/main/ets/
│  ├──common
│  │  └──utils
│  │     └──Logger.ets                          // Logging wrapper
│  ├──entryability
│  │  └──EntryAbility.ets                       // Entry point
│  └──pages
│     ├──EntryPageOne.ets                       // Page 1
│     ├──EntryPageTwo.ets                       // Page 2
│     └──Index.ets                              // UI implementation
├──entry/src/main/resources                     // Application resources
├──harA
├──harB
├──hspA
└──hspB
```

### Implementation

1. Create hapA, harA, hspA, and hspB.

2. Add the routing table configuration to the configuration file [module.json5](entry/src/main/module.json5) of the target module.

3. After adding the routing configuration file address, create the [route_map.json](entry/src/main/resources/base/profile/router_map.json) file in the project's resources/base/profile.

4. In the target page, configure an entry Builder function whose name matches the buildFunction in the [route_map.json](entry/src/main/resources/base/profile/router_map.json) configuration file.

5. By calling pushDestinationByName and similar APIs, the application can obtain the error information of the target page navigation.

6. At runtime, all HSP modules must be referenced. After setting this up, click Run > entry to build and launch the application.

### Required Permissions

N/A

### Dependencies

N/A

### Constraints

1. This sample is supported only on standard systems. Supported device: RK3568.

2. This sample is adapted to API version 26 SDK (compileSdkVersion 26.0.0), targeting OpenHarmony.

3. This sample must be compiled and run with DevEco Studio 7.0 or later.

### Testing

This project provides Hypium-based automated tests in `entry/src/ohosTest`, with 825 test cases in 30 suites in total,
covering the system routing table (routerMap), routing naming conventions, the NavPathStack page stack, and cross-HSP calls.
See [ohosTest.md](ohosTest.md) for detailed suite descriptions and execution commands.

### Download

To download this project separately, run the following commands:

```
git init
git config core.sparsecheckout true
echo code/BasicFeature/ApplicationModels/SystemRouter > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
