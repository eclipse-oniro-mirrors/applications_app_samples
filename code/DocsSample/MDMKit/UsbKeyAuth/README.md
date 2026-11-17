# USB Key Trusted Possession Authentication

### Introduction

This sample demonstrates how to use the securityManager APIs of MDM Kit to bind, unbind, and query USB Key credentials, and to configure the unlock policy. A USB Key is a hardware-based identity authentication device. With an MDM application, you can manage the binding and unbinding between a USB Key and an enterprise device. This sample is written based on the development guide [USB Key-based Authentication](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/mdm/mdm-kit-ukey-auth.md).

APIs used in this sample:
- [openSession](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-mdm-kit/js-apis-enterprise-securityManager.md#securitymanageropensession), [closeSession](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-mdm-kit/js-apis-enterprise-securityManager.md#securitymanagerclosesession), [addUserExtendCredential](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-mdm-kit/js-apis-enterprise-securityManager.md#securitymanageradduserextendcredential), [removeUserExtendCredential](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-mdm-kit/js-apis-enterprise-securityManager.md#securitymanagerremoveuserextendcredential), [getUserExtendCredential](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-mdm-kit/js-apis-enterprise-securityManager.md#securitymanagergetuserextendcredential), [setUnlockPolicy](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-mdm-kit/js-apis-enterprise-securityManager.md#securitymanagersetunlockpolicy), and [getUnlockPolicy](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-mdm-kit/js-apis-enterprise-securityManager.md#securitymanagergetunlockpolicy) in @ohos.enterprise.securityManager
- [getUserAuthInstance](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-user-authentication-kit/js-apis-useriam-userauth.md#userauthgetuserauthinstance10) in @ohos.userIAM.userAuth

### Usage

1. After the installation is complete, run a command to activate the enterprise device management extension ability.

2. Activate: `hdc shell edm enable-admin -n com.example.usbkeyauth -a EnterpriseAdminAbility`.

3. Deactivate: `hdc shell edm disable-admin -n com.example.usbkeyauth`.

4. Open the application and tap the corresponding button on the function page to call the related APIs. For example, tap "Bind USB Key" to start the USB Key binding process.

### Project Directory
```
entry/src/main/ets/
|---common
|   |---Constants.ets                      // Constant definitions
|   |---Logger.ets                         // Logging utility
|---service
|   |---UsbKeyAuthService.ets              // USB Key authentication business logic
|---enterpriseadminability
|   |---EnterpriseAdminAbility.ets         // Lifecycle callbacks of the enterprise device management extension ability
|---entryability
|   |---EntryAbility.ets                   // Application entry
|---pages
|   |---MainPage.ets                       // Main page
```

### Implementation

* USB Key binding: Call openSession to obtain the challenge, use userAuth to initiate PIN authentication and obtain the authToken, and then call addUserExtendCredential to complete the binding.
* USB Key unbinding: Query the bound credentials to obtain the credentialId, call openSession to obtain the challenge, and then call removeUserExtendCredential after user authentication to complete the unbinding.
* Query credentials: Call getUserExtendCredential to query the list of bound USB Key credentials.
* Unlock policy: Call setUnlockPolicy to configure the unlock mode, and call getUnlockPolicy to query the current unlock policy.

### Required Permissions

1. Allows an application to activate the device administrator application: ohos.permission.MANAGE_ENTERPRISE_DEVICE_ADMIN

2. Allows a device management application to manage security policies: ohos.permission.ENTERPRISE_MANAGE_SECURITY

3. Allows access to biometric authentication: ohos.permission.ACCESS_BIOMETRIC

### Dependencies

None.

### Constraints

1. The USB Key trusted possession authentication feature is supported only on PC and 2in1 devices.

2. On devices that do not support this capability (such as a development board), the related APIs return error code 801. This sample handles that case and reports that the device is not supported.

### Download

To download this project separately, run the following commands:
```
git init
git config core.sparsecheckout true
echo code/DocsSample/MDMKit/UsbKeyAuth/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
