# ArkuiDialogMigrationSample（弹窗迁移示例）

### 介绍

本示例展示了将各类弹窗从旧接口迁移到新接口（DialogPresenter）的开发实例。由于CustomDialogController在使用上存在诸多限制，不支持动态创建也不支持动态刷新，从API version 26.0.0开始推荐使用UIContext中获取到的DialogPresenter对象来统一管理各类弹窗。

本示例覆盖自定义弹窗（openCustomDialog）、带控制器的自定义弹窗（openCustomDialogWithController）、PresentCustomDialog、ActionMenu、ShowDialog、ActionSheet、AlertDialog、基础CustomDialog等场景，每种场景均提供迁移前（BeforeMigrate）与迁移后（AfterMigrate）的对比实现，便于开发者学习与理解弹窗接口的迁移方式。

### 工程目录

```
entry/src/main/ets/
|---entryability
|   |---EntryAbility.ets                                  // 入口Ability
|---entrybackupability
|   |---EntryBackupAbility.ets                            // 备份恢复Ability
|---common
|   |---Card.ets                                          // 卡片组件
|   |---Route.ets                                         // 路由数据结构
|   |---resource.ets                                      // 资源工具
|   |---PromptActionClass.ts                              // PromptAction旧接口封装类
|   |---PromptActionClassNew.ts                           // PromptAction新接口封装类
|   |---DialogPresenterClassNew.ts                        // DialogPresenter新接口封装类
|---pages
|   |---Index.ets                                         // 主页
|   |---opencustomdialog
|   |   |---Index.ets                                     // openCustomDialog列表页
|   |   |---OpenDialogAndUpdate.ets                       // 完整示例
|   |   |---CustomDialogNewInterface.ets                  // 使用DialogPresenter弹出自定义弹窗
|   |   |---CustomDialogOldInterface.ets                  // 使用promptAction.openCustomDialog弹出自定义弹窗
|   |   |---OpenCustomDialogWithControllerBeforeMigrate.ets // openCustomDialogWithController迁移前示例
|   |   |---OpenCustomDialogWithControllerAfterMigrate.ets  // openCustomDialogWithController迁移后示例
|   |   |---PresentCustomDialogBeforeMigrate.ets          // PresentCustomDialog迁移前示例
|   |   |---PresentCustomDialogAfterMigrate.ets           // PresentCustomDialog迁移后示例
|   |   |---ActionMenuBeforeMigrate.ets                   // ActionMenu迁移前示例
|   |   |---ActionMenuAfterMigrate.ets                    // ActionMenu迁移后示例
|   |   |---ShowDialogBeforeMigrate.ets                   // ShowDialog迁移前示例
|   |   |---ShowDialogAfterMigrate.ets                    // ShowDialog迁移后示例
|   |   |---ActionSheetBeforeMigrate.ets                  // ActionSheet迁移前示例
|   |   |---ActionSheetAfterMigrate.ets                   // ActionSheet迁移后示例
|   |   |---AlertDialogBeforeMigrate.ets                 // AlertDialog迁移前示例
|   |   |---AlertDialogAfterMigrate.ets                  // AlertDialog迁移后示例
|   |   |---CustomDialogBeforeMigrate.ets                 // CustomDialog迁移前示例
|   |   |---CustomDialogAfterMigrate.ets                  // CustomDialog迁移后示例
|   |---customdialog
|       |---Index.ets                                     // CustomDialog列表页
|       |---pageleveldialogbox
|           |---PageLevelDialogBox.ets                    // 页面级弹出框
|           |---PageLevelDialogInNavigation.ets           // 基于Navigation导航的页面级弹出框
|           |---Next.ets                                  // 页面级弹出框跳转页
```

### 具体实现

* 完整示例，展示openCustomDialog打开、关闭、更新自定义弹窗的完整流程，源码参考[OpenDialogAndUpdate.ets](./entry/src/main/ets/pages/opencustomdialog/OpenDialogAndUpdate.ets)；
* 使用DialogPresenter弹出自定义弹窗，展示通过新接口DialogPresenter.present弹出并管理自定义弹窗，源码参考[CustomDialogNewInterface.ets](./entry/src/main/ets/pages/opencustomdialog/CustomDialogNewInterface.ets)；
* 使用promptAction.openCustomDialog弹出自定义弹窗，展示通过旧接口弹出自定义弹窗，源码参考[CustomDialogOldInterface.ets](./entry/src/main/ets/pages/opencustomdialog/CustomDialogOldInterface.ets)；
* openCustomDialogWithController迁移前后对比，展示从CustomDialogController迁移到DialogPresenter的实现方式，源码参考[OpenCustomDialogWithControllerBeforeMigrate.ets](./entry/src/main/ets/pages/opencustomdialog/OpenCustomDialogWithControllerBeforeMigrate.ets)和[OpenCustomDialogWithControllerAfterMigrate.ets](./entry/src/main/ets/pages/opencustomdialog/OpenCustomDialogWithControllerAfterMigrate.ets)；
* PresentCustomDialog迁移前后对比，展示从promptAction.presentCustomDialog迁移到DialogPresenter的实现方式，源码参考[PresentCustomDialogBeforeMigrate.ets](./entry/src/main/ets/pages/opencustomdialog/PresentCustomDialogBeforeMigrate.ets)和[PresentCustomDialogAfterMigrate.ets](./entry/src/main/ets/pages/opencustomdialog/PresentCustomDialogAfterMigrate.ets)；
* ActionMenu迁移前后对比，展示从promptAction.showActionMenu迁移到DialogPresenter的实现方式，源码参考[ActionMenuBeforeMigrate.ets](./entry/src/main/ets/pages/opencustomdialog/ActionMenuBeforeMigrate.ets)和[ActionMenuAfterMigrate.ets](./entry/src/main/ets/pages/opencustomdialog/ActionMenuAfterMigrate.ets)；
* ShowDialog迁移前后对比，展示从promptAction.showDialog迁移到DialogPresenter的实现方式，源码参考[ShowDialogBeforeMigrate.ets](./entry/src/main/ets/pages/opencustomdialog/ShowDialogBeforeMigrate.ets)和[ShowDialogAfterMigrate.ets](./entry/src/main/ets/pages/opencustomdialog/ShowDialogAfterMigrate.ets)；
* ActionSheet迁移前后对比，展示从promptAction.showActionSheet迁移到DialogPresenter的实现方式，源码参考[ActionSheetBeforeMigrate.ets](./entry/src/main/ets/pages/opencustomdialog/ActionSheetBeforeMigrate.ets)和[ActionSheetAfterMigrate.ets](./entry/src/main/ets/pages/opencustomdialog/ActionSheetAfterMigrate.ets)；
* AlertDialog迁移前后对比，展示从promptAction.showDialog（AlertDialog）迁移到DialogPresenter的实现方式，源码参考[AlertDialogBeforeMigrate.ets](./entry/src/main/ets/pages/opencustomdialog/AlertDialogBeforeMigrate.ets)和[AlertDialogAfterMigrate.ets](./entry/src/main/ets/pages/opencustomdialog/AlertDialogAfterMigrate.ets)；
* CustomDialog迁移前后对比，展示从@CustomDialog + CustomDialogController迁移到DialogPresenter的实现方式，源码参考[CustomDialogBeforeMigrate.ets](./entry/src/main/ets/pages/opencustomdialog/CustomDialogBeforeMigrate.ets)和[CustomDialogAfterMigrate.ets](./entry/src/main/ets/pages/opencustomdialog/CustomDialogAfterMigrate.ets)；
* 页面级弹出框，展示CustomDialogController在页面级弹出框场景的使用，源码参考[PageLevelDialogBox.ets](./entry/src/main/ets/pages/customdialog/pageleveldialogbox/PageLevelDialogBox.ets)和[PageLevelDialogInNavigation.ets](./entry/src/main/ets/pages/customdialog/pageleveldialogbox/PageLevelDialogInNavigation.ets)；

### 相关权限

无。

### 依赖

无。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备如：RK3568；
2. 本示例为Stage模型，仅支持API23及以上版本SDK；
3. DialogPresenter相关接口自API版本26.0.0起可用；

### 下载

如需单独下载本工程，在本地目录使用git执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample/ArkuiDialogMigrationSample > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
