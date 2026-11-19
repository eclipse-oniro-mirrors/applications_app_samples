# Multi-device Navigation Bar

### Introduction

This sample shows how the navigation component adapts its style to different device forms and window sizes. It relies on the adaptive layout and responsive layout capabilities described in [One-time development for multi-device deployment](https://gitcode.com/openharmony/docs/tree/master/en/application-dev/key-features/multi-device-app-dev), and the whole layout is driven by the breakpoint events of GridRow.

The sample is organized as a runnable and self-explanatory project:

- At the sm breakpoint (narrow windows) the navigation is rendered as [Tabs](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkui/arkui-ts/ts-container-tabs.md) at the bottom. Content and navigation are laid out vertically, the bottom primary menu switches the content, and the secondary menu is listed horizontally at the top of the content area.
- At the md/lg breakpoints (wide windows) the navigation is rendered with [SideBarContainer](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkui/arkui-ts/ts-container-sidebarcontainer.md) on the left. Content and navigation are laid out side by side, and the primary and secondary side bar menus switch the content.
- The side bar has two styles of its own: the narrow list style (64vp on md, 96vp on lg) and the 240vp tabs style, which can be dragged up to 280vp. The drawer icon in the top-left corner switches between them.
- The banner and the application lists in the content area adjust their visible item count and grid columns per breakpoint, while the browsing progress survives a window resize.

Three breakpoints are recognized: sm, md and lg. The sm breakpoint uses the bottom tabs structure and md/lg use the side bar structure. Both structures stay in the component tree, and switching only toggles their visibility instead of destroying and rebuilding the components.

### Effect Preview

| Narrow sm: bottom tabs                   | Wide md: side bar, tabs style             | Wide lg: side bar, tabs style             |
| ---------------------------------------- | ----------------------------------------- | ----------------------------------------- |
| ![sm](screenshots/devices/image1.png)     | ![md](screenshots/devices/image2.png)      | ![lg](screenshots/devices/image4.png)      |

| Wide md: side bar, list style              | Wide lg: side bar, list style              |
| ----------------------------------------- | ----------------------------------------- |
| ![md-list](screenshots/devices/image3.png) | ![lg-list](screenshots/devices/image5.png) |

Log output

Filter the logs by the keyword "Sample_MultiNavBar" to view the lifecycle logs of the UIAbility and the result of loading the page, including `onCreate`, `onWindowStageCreate` and `loadContent`.

### Usage Instructions

1. Install the compiled HAP package and launch the application.
2. Open the previewer in DevEco Studio to check the initial effect. The previewer can switch device forms, and the window width can be resized once window dragging is enabled.
3. Resize the window to the sm breakpoint to get the bottom tabs structure, and back to the md/lg breakpoints to get the side bar structure.
4. On md/lg, tap the drawer icon in the top-left corner of the side bar to switch between the tabs style and the list style. In the list style, tapping the search box also returns to the tabs style.
5. Tap a primary menu entry to switch the main content, and a secondary menu entry to switch the sub page. In the tabs style on md/lg the secondary menu sits inside the side bar; at sm and in the list style it is listed horizontally at the top of the content area.
6. Swipe the banner or scroll the recommendation list, then resize the window. The browsing progress of the content area is kept.

### Project Structure

```
├──entry/src/main
│  ├──ets
│  │  ├──common
│  │  │  ├──BreakpointSystem.ets         // Generic value pickers: by breakpoint and by side bar style
│  │  │  ├──CommonMainTabs.ets           // Primary tabs that host the main content
│  │  │  ├──CommonSubTabs.ets            // Secondary tabs that host the sub menu and the recommendations
│  │  │  ├──Configuration.ets            // Responsive style table: design values and per-breakpoint getters
│  │  │  ├──Constants.ets                // Global constants: breakpoint keys, colors, dimensions, durations, component ids
│  │  │  ├──RecommendationList.ets       // Content area: banner and the application/game lists
│  │  │  └──SideBarController.ets        // Side bar and bottom navigation: drawer, menus, search, tool bar
│  │  ├──entryability
│  │  │  └──EntryAbility.ets             // Application entry
│  │  ├──model
│  │  │  ├──MenuType.ets                 // Menu data type
│  │  │  ├──SideListData.ets             // Primary and secondary side bar menu data
│  │  │  └──StyleType.ets                // Style data classes
│  │  └──pages
│  │     └──Index.ets                    // Home page: breakpoint dispatch and the overall layout
│  └──resources                          // Strings, colors, dimensions and page configuration
└──entry/src/ohosTest                    // Automated test cases, see ohosTest.md
```

### Implementation

**Overall layout and breakpoint dispatch**

The overall layout lives in [Index.ets](entry/src/main/ets/pages/Index.ets). The root node is a GridRow, and the breakpoint name is shared with every child component through LocalStorage, so a single breakpoint change updates the side bar, the content area and the style table at the same time:

1. `GridRow.onBreakpointChange` writes the reported breakpoint name back to `currentBreakpoint`. Valid values are `sm`, `md` and `lg`.
2. The md/lg branch is a SideBarContainer plus CommonMainTabs, and the sm branch is CommonMainTabs plus a bottom SideBarController. Both branches stay in the component tree and are toggled by complementary `visibility` attributes.
3. After a breakpoint change the side bar width is updated 100ms later with a 300ms animation, so the width change and the layout pass do not land in the same frame.
4. The built-in control button and the auto hide behaviour of SideBarContainer are disabled (`showControlButton(false)` and `autoHide(false)`). The drawer button is drawn by SideBarController so that both structures can reuse it.

**Breakpoint value pickers**

[BreakpointSystem.ets](entry/src/main/ets/common/BreakpointSystem.ets) collapses the "pick a different value per breakpoint" pattern into a single call:

| Value picker | Constructor parameters | GetValue argument | Unknown argument |
| -------- | -------- | -------- | -------- |
| `BreakpointType<T>` | Values for sm, md and lg | Breakpoint key | Returns `undefined` |
| `SideBarMode<T>` | Values for list and tabs | Side bar style key | Returns `undefined` |

Callers fall back with `?? current value`, so an unknown key leaves the previous style untouched. For example, the drawer button and the bottom tool bar only appear on md/lg: `new BreakpointType(false, true, true).GetValue(this.currentBreakpoint)`.

**Side bar and bottom navigation**

[SideBarController.ets](entry/src/main/ets/common/SideBarController.ets) serves both as the side bar on md/lg and as the bottom navigation on sm. From top to bottom it consists of the drawer button, the primary and secondary menus, and the bottom tool bar. The menus are wrapped in a Scroll and take the remaining height with `layoutWeight(1)`.

1. The primary menu is a List whose `listDirection` is horizontal at sm (the bottom navigation bar) and vertical on md/lg. At sm and in the list style the selected entry switches to the active icon tinted with the primary color `#0a59f7`; in the tabs style the icon is left untinted and the selected state is carried by the secondary menu entry instead (a translucent primary background with primary text).
2. The position of the secondary menu is decided by `isShowSecondMenu` and `isShowPageTitle` of `getSubTabsControllerStyle`: in the tabs style the secondary menu is nested inside the selected primary entry and the page title is shown above the content; at sm and in the list style the secondary menu becomes a horizontal list at the top of the content area.
3. In the list style the side bar width comes from the breakpoint, 64vp on md and 96vp on lg, and both `minSideBarWidth` and `maxSideBarWidth` are set to that width, so it cannot be dragged. In the tabs style the width is 240vp and can be dragged between 240vp and 280vp.
4. In the list style the md primary menu shows icons only, while lg is wide enough to keep both icons and text. The search box shrinks to 40vp and becomes unfocusable, and tapping it returns to the tabs style. The bottom tool bar collapses into a "more" menu.

**Content area**

[RecommendationList.ets](entry/src/main/ets/common/RecommendationList.ets) contains the banner and the application and game lists, and every dimension is taken per breakpoint:

1. The Swiper `displayCount` is 1, 2 and 3 at sm, md and lg. It caches 3 items with an 8vp item space, and the indicator is only shown at sm.
2. The recommendation area uses `GridRow({ columns: GridColumns.RECOMMEND })` with 4, 8 and 12 columns at sm, md and lg, and the horizontal application lists use a space of 20vp, 32vp and 36vp.
3. Because both structures stay mounted and only their visibility changes, the state of the Swiper and of the scrolling containers is not rebuilt, which is why the browsing progress survives a window resize.

**Responsive style table**

[Configuration.ets](entry/src/main/ets/common/Configuration.ets) collects the design values in the internal `DesignSpec` class and exposes four static methods that return style objects per breakpoint and per side bar style, so that no concrete number is scattered in the components:

| Method | Purpose |
| -------- | -------- |
| `getBreakpointStyle(currentBreakpoint)` | Breakpoint level style: side bar list height, margins, item width, content margins, recommendation heights, background color |
| `getCurrentMainTabsStyle(index, currentIndex, currentBreakpoint)` | Colors of the selected and unselected primary menu entries |
| `getSubTabsControllerStyle(currentBreakpoint, currentSideBarMode)` | Secondary menu container: direction, alignment, whether the page title and the secondary menu are shown, search and tool bar paddings |
| `getCurrentSubTabsStyle(currentBreakpoint, currentSideBarMode, index, currentIndex)` | Font size, background color and font color of the secondary menu entries |

The style fields are declared in [StyleType.ets](entry/src/main/ets/model/StyleType.ets). Colors, dimensions, durations and the component ids (`switchButton`, `searchButton`, `addTools`, `moreTools` and so on) are collected in [Constants.ets](entry/src/main/ets/common/Constants.ets), and the UI automation cases locate controls by these ids.

### Permissions

Not involved.

### Dependencies

No third-party dependency is involved.

The project only declares `@ohos/hypium 1.0.6` in `devDependencies` for the automation cases under `entry/src/ohosTest`. It is not a runtime dependency of the application.

### Constraints & Limitations

1. This sample runs on standard systems only.
2. The supported device types are default and tablet.
3. This sample uses the Stage model. It is compiled with the API version 26.0.0 SDK. The SDK version is 26.0.0.
4. DevEco Studio 26.0.0.851 or later is required to build and run this sample.
5. Only the sm, md and lg breakpoints are recognized. Any other value is ignored: the value pickers return `undefined` and the callers keep the previous style.
6. The side bar style switch is only available on md/lg. At the sm breakpoint the layout is always the bottom tabs structure.
7. The side bar widths, font sizes and margins are frozen design values. Changing them requires updating both the responsive style table and the frozen expectations of the automation cases.

### Download

To download this project separately, run the following commands:

```
git init
git config core.sparsecheckout true
echo code/SuperFeature/MultiDeviceAppDev/MultiNavBar/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
