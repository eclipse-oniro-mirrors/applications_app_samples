# HiTraceMeter ArkTS静态模式接口使用样例

###  介绍

本示例主要展示了使用HiTraceMeter提供系统性能打点接口（静态模式）。开发者通过在关键代码位置调用HiTraceMeter接口提供的API接口，能够有效跟踪进程轨迹、查看系统性能。

本样例展示了在静态模式（'use static'）下使用HiTraceMeter进行性能打点，包括异步跟踪、同步跟踪和数值跟踪等功能。

该工程中的展示的代码详细描述可查如下链接：

- [使用HiTraceMeter跟踪性能（ArkTS）](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/dfx/hitracemeter-guidelines-arkts.md)


###  效果预览

|                             主页                             |
|:----------------------------------------------------------:|
| <img src="./screenshots/sample.jpg" alt="z" width = "400"> |

#### 使用说明

1.在主界面点击testHiTraceMeter按钮；DevEco Studio Terminal 中执行如下命令：

```
PS D:\xxx\xxx> hdc shell
$ hitrace --trace_begin app
```

2.执行抓取trace命令后，先在设备中点击几次"testHiTraceMeter"按钮，继续在Terminal窗口执行命令：

```
$ hitrace --trace_dump | grep myTest
```

3.成功输出如下数据即为成功：

```
e.myapplication-39945   (  39945) [010] .... 347921.342267: tracing_mark_write: S|39945|H:myTestAsyncTrace|1001|M62|categoryTest|key=value
e.myapplication-39945   (  39945) [010] .... 347921.342280: tracing_mark_write: C|39945|H:myTestCountTrace|1|M62
e.myapplication-39945   (  39945) [010] .... 347921.342327: tracing_mark_write: S|39945|H:myTestAsyncTrace|1002|M62|categoryTest|key=value
e.myapplication-39945   (  39945) [010] .... 347921.342333: tracing_mark_write: C|39945|H:myTestCountTrace|2|M62
e.myapplication-39945   (  39945) [010] .... 347921.342358: tracing_mark_write: F|39945|H:myTestAsyncTrace|1001|M62
e.myapplication-39945   (  39945) [010] .... 347921.342365: tracing_mark_write: F|39945|H:myTestAsyncTrace|1002|M62
e.myapplication-39945   (  39945) [010] .... 347921.342387: tracing_mark_write: B|39945|H:myTestSyncTrace|M62|key=value
```

###  工程目录

```
└── entry
    └── src
        └── main
            └── ets
                ├── entryability
                │   └── EntryAbility.ets
                └── pages
                    └── Index.ets     		//主页
```

###  具体实现

1. 本示例在静态模式（'use static'）下使用HiTraceMeter接口，通过`import { hiTraceMeter } from '@kit.PerformanceAnalysisKit'`导入模块。
2. 示例展示了以下接口的使用：
   - `startAsyncTrace`：开始异步跟踪
   - `finishAsyncTrace`：结束异步跟踪
   - `startSyncTrace`：开始同步跟踪
   - `finishSyncTrace`：结束同步跟踪
   - `traceByValue`：数值跟踪
   - `isTraceEnabled`：检查trace是否开启

###  相关权限

不涉及。

###  依赖

不涉及。

###  约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568；
2. 本示例已适配API26版本SDK，版本号：26.0.0.25，镜像版本号：OpenHarmony 7.0.0.25；
3. 本示例需要使用DevEco Studio(6.0.0.94)及以上版本才可编译运行。

###  下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/PerformanceAnalysisKit/HiTrace/HitraceMeter_ArkTS_Sta/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```