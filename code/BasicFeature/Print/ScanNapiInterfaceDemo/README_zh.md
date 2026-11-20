# 扫描仪应用demo

### 介绍

本示例使用[@ohos.scan](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-scan.md)接口（Basic Services Kit，系统能力 SystemCapability.Print.PrintFramework）拉起[打印框架](https://gitcode.com/openharmony/print_print_fwk)下的扫描服务，由扫描服务加载扫描仪驱动，实现扫描仪的发现与连接、获取与设置扫描仪参数、启动与取消扫描、获取扫描进度并预览扫描图片的功能。示例使用 ArkTS 语言与 Stage 模型编写，扫描接口统一封装在[scan.ets](entry/src/main/ets/scan/scan.ets)中，配套[scan/model](entry/src/main/ets/scan/model)目录下的可测纯逻辑模型，并随工程提供 46 个套件 2666 条 ohosTest 自动化用例，用例说明见[ohosTest.md](ohosTest.md)。

### 效果预览

|扫描仪应用首页|
|--------------------------------|
|![扫描demo](sceenshots/scandemo.png)|

### 使用说明

1. 本示例用于验证扫描框架接口能力，扫描仪驱动基于[sane-backends](https://gitcode.com/openharmony-sig/third_party_backends)开发，运行前需连接扫描仪并安装对应驱动。
2. 启动应用后，首页自动调用扫描初始化接口。
3. 点击 Searching Scanner 按钮搜索扫描仪，发现设备后通过回调记录扫描仪 id。
4. 点击 open Scanner 按钮连接扫描仪。
5. 点击 get options 按钮获取扫描仪全部选项描述与当前取值，点击 set option 按钮设置扫描仪参数。
6. 点击 Start Scan 按钮启动扫描，扫描完成后可通过 picture preview 按钮预览扫描出的图片。
7. 点击 Cancel Scan 按钮取消当前扫描任务。

### 工程目录

```
ScanNapiInterfaceDemo
├── AppScope/app.json5                              // APP信息配置文件
├── entry/src/main
│   ├── ets
│   │   ├── entryability/EntryAbility.ets           // 入口Ability
│   │   ├── entrybackupability/EntryBackupAbility.ets // 备份恢复扩展Ability
│   │   ├── pages/Index.ets                         // 应用首页
│   │   └── scan
│   │       ├── scan.ets                            // 扫描接口封装
│   │       ├── log.ts                              // 日志工具
│   │       ├── model                               // 可测纯逻辑模型
│   │       └── utils/SampleLogger.ets              // 示例日志工具
│   └── module.json5
├── entry/src/ohosTest                              // 自动化测试
│   ├── ets/test                                   // 46个测试套件
│   └── ets/test/List.test.ets                      // 测试套件注册
├── ohosTest.md                                    // 测试用例说明
└── sceenshots/scandemo.png                         // 运行截图
```

### 具体实现

* 扫描接口封装在[scan.ets](entry/src/main/ets/scan/scan.ets)的 Scan 类中，对外提供 init、exit、startScannerDiscovery、openScanner、closeScanner、startScan、cancelScan、getScannerParameter、getScannerCurrentSetting、setScannerParameter、getScanProgress 以及设备事件监听方法，页面通过该封装调用扫描服务。接口参考：[@ohos.scan](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-scan.md)。

* 搜索扫描仪：在[Index.ets](entry/src/main/ets/pages/Index.ets)中点击 Searching Scanner 按钮，先通过 scan.on('scanDeviceFound') 注册设备发现回调，再调用 startScannerDiscovery 开启搜索，发现扫描仪后回调返回设备信息并记录 scannerId。

* 连接扫描仪：点击 open Scanner 按钮调用 openScanner，传入扫描仪 id 完成连接，页面退出时调用 closeScanner 断开连接。

* 获取与设置扫描仪参数：点击 get options 按钮调用 getScannerParameter 获取全部选项描述，再对每个选项调用 getScannerCurrentSetting 获取当前取值；点击 set option 按钮调用 setScannerParameter 设置指定选项。

* 启动与取消扫描：点击 Start Scan 按钮调用 startScan 启动扫描任务，并定时调用 getScanProgress 查询进度，进度为 100 时通过 pictureFd 创建图片源并生成预览图；点击 Cancel Scan 按钮调用 cancelScan 取消任务。

* 图片预览：点击 picture preview 按钮打开弹窗展示扫描出的图片。

* 可测逻辑模型：参数约束、状态机、选项 UI 模型、进度聚合、设备目录、图片命名、单位换算、设备过滤、取值解析等纯逻辑放在[scan/model](entry/src/main/ets/scan/model)目录下，供页面与 ohosTest 用例复用。

### 测试

本工程提供 46 个套件 2666 条 ohosTest 自动化用例，覆盖扫描接口错误码映射、参数约束、状态机、参数 UI 模型、进度聚合、设备同步、图片命名、单位换算与页面主流程，已在真机分批执行通过，用例说明见[ohosTest.md](ohosTest.md)。

### 相关权限

[ohos.permission.PRINT](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissionprint)（normal级，系统授权）

[ohos.permission.MANAGE_PRINT_JOB](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-system-apps.md#ohospermissionmanage_print_job)（system_basic级，需配置高权限签名，可参考[特殊权限配置方法](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/hapsigntool-overview.md)）

### 依赖

1. 本示例不依赖其余 Sample。
2. 基于[sane-backends](https://gitcode.com/openharmony-sig/third_party_backends)开发的扫描仪驱动以及对应厂商型号的扫描仪设备。

### 约束与限制

1. 本示例为 Stage 模型，支持在标准系统设备上运行，设备类型为 default 与 tablet。
2. 本示例 compileSdkVersion、targetSdkVersion、compatibleSdkVersion 均为 26.0.0（runtimeOS 为 OpenHarmony），需要使用支持 API 26.0.0 SDK 的 DevEco Studio 才可编译运行。
3. 扫描接口首批从 API version 20 开始支持。
4. 运行本示例需要连接扫描仪并下载扫描仪对应的驱动。
5. ohos.permission.MANAGE_PRINT_JOB 为 system_basic 级权限，需按特殊权限配置方法完成高权限签名。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/BasicFeature/Print/ScanNapiInterfaceDemo/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
