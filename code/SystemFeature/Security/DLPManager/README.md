# DLPManager

### Introduction

This sample demonstrates DLP (Data Loss Prevention) file management. It uses @ohos.dlpPermission, @ohos.file.fs, @ohos.file.fileAccess, @ohos.file.picker and Want to create and open DLP files, list the original files of the application sandbox, edit and save files, pull folders, view file permissions and listen for DLP file changes.

### Usage

1. Launch the application. The list of original files in the application sandbox is displayed.

2. Tap the icon in the upper right corner to obtain the sandbox retention information.

3. Tap the plus icon in the lower right corner to enter a folder.

4. Tap a file to display its content. In the file page, tap the edit icon to modify the content and save it.

5. Set the permission of a txt file by entering a user account and pressing Enter before confirming.

### Constraints

This sample can only be run on standard-system devices that support DLP.

### Download

To download this project alone, run:

```
git init
git config core.sparsecheckout true
echo code/SystemFeature/Security/DLPManager > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
