# Flip Clock

### Introduction

 This sample uses the Feature Ability (FA) model and related APIs to implement a simple flip clock app. Below shows the sample app.

![FlipClock](screenshots/devices/FlipClock.png)  ![CountDown](screenshots/devices/CountDown.png)

### Concepts

**reminderAgent**: a class that provides APIs to create scheduled reminders for countdown timers, calendar events, and alarm clocks. When the created reminders are published, the timing and pop-up notification functions of your application will be taken over by the reminder agent in the background when your application is frozen or exits.

### Required Permissions

ohos.permission.PUBLISH_AGENT_REMINDER (permission for the reminder agent)

ohos.permission.RUNNING_LOCK (permission for the running lock)

ohos.permission.NOTIFICATION_CONTROLLER (permission for send notification)

### Usage

1. There are four tab bars (**Clock**, **Alarm**, **Countdown**, and **Settings**) at the bottom of the home page of the sample app. The **Clock** tab page displays a flip clock.

2. On the **Alarm** tab page, you can touch **+** to create an alarm record. When the alarm time arrives, a notification will be displayed.

3. The **Countdown** tab page provides the countdown function.

4. The **Settings** tab page provides the following functions: full screen, screen brightness adjustment, and screen-on.

### Constraints

1. This sample can only be run on standard-system devices. It has been verified on a 32-bit OpenHarmony board with deviceType `default`.

2. This sample requires DevEco Studio 26.0.0 Release or later to compile and run.

3. This sample has been adapted to API version 26.0.0 (`compileSdkVersion` / `targetSdkVersion` / `compatibleSdkVersion` are all `"26.0.0"`, `runtimeOS: OpenHarmony`, OpenHarmony 26.0.0.38 SDK).

4. The unused system permissions `ohos.permission.NOTIFICATION_CONTROLLER` and `ohos.permission.RUNNING_LOCK` have been removed to avoid debug-signature installation failure.

5. The Settings tab is an in-app page: full screen, keep-screen-on and brightness are implemented with the app window API (`window.setWindowBrightness`), with no external sample dependency.

6. `ohosTest` contains 16 cases covering clock digits, alarm add/delete/cancel, countdown boundaries, reset and auto-finish at zero, the settings page controls, and the DataSource/ContactSource logic.