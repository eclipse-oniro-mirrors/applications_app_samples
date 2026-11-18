# Navigation Dynamic Routing

### Introduction

This project verifies dynamic routing. It uses the custom function packaging capability of WrapperBuilder and the cross-module file reference capability of dynamic routing to decouple the dependency between HAR and HAP packages, so that a page in a HAR package can still be navigated to even if the HAP package does not reference the HAR package.

Dynamic import of variable expressions and files with cross-module relative paths are not supported yet, so a switch statement is used as a substitute in the code. A patch will be provided when later versions support them.

Due to environment differences, it is not recommended to compile directly after downloading. Instead, create a project first and write code referring to the sample.

### Preview

![image](images/Index.jpg)
![image](images/HarA.jpg)
![image](images/HarB.jpg)

### Usage

1. The home page provides a NavIndex navigation page. Tapping the buttons navigates to different pages from the HAR packages.

2. Each page in the HAR packages also has buttons for navigating to other pages.

### Project Directory

```
.
├── entry // Home page
│   ├── pages
│   │   ├── Index.ets
│   ├── entryability
│   │   ├── EntryAbility.ets
├── harA
│   ├── pages
│   │   ├── page1.ets
│   │   ├── page2.ets
│   │   ├── page3.ets
│   ├── entryability
│   │   ├── EntryAbility.ets
├── harB
│   ├── pages
│   │   ├── page1.ets
│   │   ├── page2.ets
│   │   ├── page3.ets
│   ├── entryability
│   │   ├── EntryAbility.ets
├── RouterModule
│   ├── utils
│   │   ├── RouterModule.ets
│   ├── entryability
│   │   ├── EntryAbility.ets
.
```

### Implementation

1. Create hapA, harA, and harB.

2. Create the routing framework RouterModule, which uses a map to store the routes of the HAP package and the page information of the HAR packages.

3. Encapsulate get and set methods in RouterModule and expose them, allowing external modules to reference and call them.

4. Create a push method that accepts a URL string, parses it, extracts the route name, obtains the route stack from the map, and pushes the target page onto the stack.

5. Import RouterModule in the HAP and HAR packages, and store the route stack of the HAP package and the page information of the HAR packages into RouterModule through the exposed set methods.

### Required Permissions

N/A

### Constraints

1. This sample is supported only on standard systems. Supported device: RK3568.

2. This sample must be compiled and run with DevEco Studio 7.0 or later.

3. This sample is adapted to API version 26 SDK (compileSdkVersion 26.0.0), targeting OpenHarmony.

### Testing

This project provides Hypium-based automated tests in `entry/src/ohosTest`, with 803 test cases in 28 suites in total,
covering the NavPathStack page stack, the RouterModule dynamic route name table, and routing URL conventions.
See [ohosTest.md](ohosTest.md) for detailed suite descriptions and execution commands.

### Download

To download this project separately, run the following commands:

```
git init
git config core.sparsecheckout true
echo code/BasicFeature/ApplicationModels/DynamicRouter > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
