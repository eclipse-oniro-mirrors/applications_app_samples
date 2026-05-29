# HiTraceChain ArkTS静态模式接口使用样例

###  介绍

本示例主要展示了使用HiTraceChain提供分布式跟踪接口（静态模式）。

HiTraceChain是基于云计算分布式跟踪调用链思想，在端侧业务流程（涉及跨线程、跨进程、跨设备）中的一种轻量级实现。hiTraceChain在业务控制面流程中，生成和传递唯一跟踪标识，在业务流程中输出的各类信息中（包括应用事件、系统时间、日志等）记录该跟踪标识。在调试、问题定位过程中，开发者可以通过该唯一跟踪标识将本次业务流程端到端的各类信息快速关联起来。

本样例展示了在静态模式（'use static'）下使用HiTraceChain，包括HiTraceId自动传递和手动传递两种场景。

该工程中的展示的代码详细描述可查如下链接：

- [使用HiTraceChain打点（ArkTS）](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/dfx/hitracechain-guidelines-arkts.md)



###  效果预览

|                             主页                              |
|:-----------------------------------------------------------:|
| <img src="./screenshots/example.jpg" alt="z" width = "400"> |

#### 使用说明

1. 在主页面上点击设备上的“testHiTraceIdPassedAutomatically”按钮，触发业务逻辑。 使用关键字“testTag”过滤日志，查看该业务代码打印的hilog日志。
```
05-28 11:47:20.499   7439-7439     A00000/testTag                  com.examp...racedemo  I     HiTraceId is invalid, begin hiTraceChain
05-28 11:47:20.500   7439-7439     A00000/testTag                  com.examp...racedemo  I     [a92ab3bac87a1a6, 0, 0] record with traceId at first task
05-28 11:47:20.509   7439-7439     A00000/testTag                  com.examp...racedemo  I     hiTraceChain end in main thread
05-28 11:47:20.511   7439-7439     A00000/testTag                  com.examp...racedemo  I     [a92ab3bac87a1a6, 857f6f, 0] record with traceId at task 1
05-28 11:47:20.511   7439-7439     A00000/testTag                  com.examp...racedemo  I     [a92ab3bac87a1a6, 857f6f, 0] record with traceId at task 2
05-28 11:47:20.511   7439-7439     A00000/testTag                  com.examp...racedemo  I     [a92ab3bac87a1a6, 857f6f, 0] record with traceId at task 3
05-28 11:47:20.511   7439-7439     A00000/testTag                  com.examp...racedemo  I     [a92ab3bac87a1a6, 857f6f, 0] record with traceId at task 4
05-28 11:47:20.511   7439-7439     A00000/testTag                  com.examp...racedemo  I     [a92ab3bac87a1a6, 857f6f, 0] record with traceId at task 5
05-28 11:47:20.511   7439-7439     A00000/testTag                  com.examp...racedemo  I     [a92ab3bac87a1a6, 857f6f, 0] record with traceId at task 6
05-28 11:47:20.512   7439-7439     A00000/testTag                  com.examp...racedemo  I     [a92ab3bac87a1a6, 857f6f, 0] record with traceId at task 7
05-28 11:47:20.512   7439-7439     A00000/testTag                  com.examp...racedemo  I     [a92ab3bac87a1a6, 857f6f, 0] record with traceId at task 8
05-28 11:47:20.512   7439-7439     A00000/testTag                  com.examp...racedemo  I     [a92ab3bac87a1a6, 857f6f, 0] record with traceId at task 9
05-28 11:47:20.512   7439-7439     A00000/testTag                  com.examp...racedemo  I     [a92ab3bac87a1a6, 857f6f, 0] record with traceId at task 10
05-28 11:47:20.513   7439-7439     A00000/testTag                  com.examp...racedemo  I     [a92ab3bac87a1a6, 857f6f, 0] record with traceId at then function
```
2. 在主页面上点击设备上的“testHiTraceIdPassedManually”按钮，触发业务逻辑。 使用关键字“testTag”过滤日志，查看该业务代码打印的hilog日志。
```text
05-28 11:49:00.787   7439-7439     A00000/testTag                  com.examp...racedemo  I     HiTraceId is invalid, begin hiTraceChain
05-28 11:49:00.788   7439-7439     A00000/testTag                  com.examp...racedemo  I     [a92ab4bb2cc0575, 0, 0] start testHiTraceIdPassedManually async trace
05-28 11:49:00.789   7439-7439     A00000/testTag                  com.examp...racedemo  I     hiTraceChain end in main thread
05-28 11:49:00.890   7439-7439     A00000/testTag                  com.examp...racedemo  I     [a92ab4bb2cc0575, 3b5f934, 0] end testHiTraceIdPassedManually async trace
```

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

1. 本示例在静态模式（'use static'）下使用HiTraceChain和HiTraceMeter接口，通过`import { hiTraceChain, hiTraceMeter } from '@kit.PerformanceAnalysisKit'`导入模块。
2. 示例展示了以下接口的使用：
   - `hiTraceChain.begin`：开始HiTraceChain跟踪
   - `hiTraceChain.getId`：获取当前HiTraceId
   - `hiTraceChain.isValid`：判断HiTraceId是否有效
   - `hiTraceChain.enableFlag`：设置HiTraceId标志
   - `hiTraceChain.isFlagEnabled`：判断HiTraceId标志是否设置
   - `hiTraceChain.setId`：设置当前HiTraceId（手动传递场景）
3. 示例包含两种场景：
   - **testHiTraceIdPassedAutomatically**：HiTraceId在Promise异步任务中自动传递
   - **testHiTraceIdPassedManually**：HiTraceId在setTimeout中手动传递

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
echo code/DocsSample/PerformanceAnalysisKit/HiTrace/HitraceChain_ArkTS_Sta/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```