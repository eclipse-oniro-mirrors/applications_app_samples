# 使用HiLog打印日志

###  介绍

本示例主要展示了使用HiLog打印日志相关的功能，在应用开发过程中，可在关键代码处输出日志信息。在运行应用后，通过查看日志信息来分析应用执行情况（如应用是否正常运行、代码运行时序、运行逻辑分支是否正常等）。

HiLog日志系统，提供给系统框架、服务、以及应用，用于打印日志，记录用户操作、系统运行状态等。

该工程中的展示的代码详细描述可查如下链接：

- [使用HiLog打印日志（ArkTS Static）](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/dfx/hilog-guidelines-arkts.md)

###  效果预览

|                             主页                             |
| :----------------------------------------------------------: |
| <img src="./screenshots/Screenshot_20260716192133753.jpeg" alt="z" width = "400" /> |

#### 使用说明

##### Hilog（ArkTS Static）使用说明

1.在应用侧主界面，点击"HiLog ArkTS Static"按钮；

2.在DevEco界面切换到"Log"窗口，日志过滤选择"No filters",搜索内容设置为"testTag"。此时窗口仅显示符合条件的日志，打印日志结果为：

```
08-05 06:32:35.928   10753-10753   A0ff00/testTag                  com.samples.hilog  I     A log with a domainID of 0xFF00 and a label of testTag can print logs at the Info level or higher.
08-05 06:32:35.928   10753-10753   A0ff00/testTag                  com.samples.hilog  I     hello World 3
08-05 06:32:35.928   10753-10753   A0ff00/testTag                  com.samples.hilog  I     peter is {"name":"peter","age":15}
08-05 06:32:35.928   10753-10753   A0ff00/testTag                  com.samples.hilog  E     this is an error level log
08-05 06:32:35.928   10753-10753   A0ff00/testTag                  com.samples.hilog  I     this is an another info level log
08-05 06:32:35.928   10753-10753   A0ff00/testTag                  com.samples.hilog  E     this is an another error level log
```

3.在应用侧主界面，点击"SandboxLog Static"按钮；

4.打开应用公共沙箱日志，打印结果为：

```
08-05 06:32:35.928 10753 10753 I A0ff00/testTag: current log type:4
08-05 06:32:35.928 10753 10753 I A0ff00/testTag: current log dir:/data/storage/el2/log/hiapplog
08-05 06:32:35.929 10753 10753 I A0ff00/testTag: hilog_info_test
08-05 06:32:35.929 10753 10753 D A0ff00/testTag: hilog_debug_test
08-05 06:32:35.929 10753 10753 W A0ff00/testTag: hilog_warn_test
08-05 06:32:35.929 10753 10753 F A0ff00/testTag: hilog_fatal_test
08-05 06:32:35.929 10753 10753 E A0ff00/testTag: hilog_error_test
08-05 06:32:35.930 10753 10753 I A0ff00/testTag: current log files:hiapplog.10753.001.20170805-063235.log
```

###  工程目录

```
entry/src/main
└─ets
   └─pages
     └─Index.ets     //主页

```

###  具体实现

ArkTS Static实现时只需在按钮的点击事件中添加各种类型日志的打印函数

###  相关权限

不涉及。

###  依赖

不涉及。

###  约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568；
2. 本示例已适配API26版本SDK，版本号：26.0.0.34，镜像版本号：OpenHarmony 7.0.0.34；
3. 本示例需要使用DevEco Studio(6.0.0.94)及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/PerformanceAnalysisKit/Hilog_Static/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```