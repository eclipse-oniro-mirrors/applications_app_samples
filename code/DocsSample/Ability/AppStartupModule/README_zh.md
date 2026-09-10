# 应用启动框架AppStartup（HSP与HAR跨模块）

### 介绍

本示例展示如何在[HSP](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/quick-start/in-app-hsp.md)和[HAR](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/quick-start/har-package.md)中使用应用启动框架，实现跨模块的启动任务依赖管理。详情可参考 [应用启动框架AppStartup](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/application-models/app-startup.md) 文档的"HSP与HAR中使用启动框架"章节。

### 运行机制

HSP和HAR的启动任务、so预加载任务只能配置为手动模式（`excludeFromAutoStart`为`true`），但可被HAP中自动模式的启动任务、so预加载任务通过`dependencies`依赖关系拉起，将所依赖的HSP/HAR任务一并执行。

### 使用说明

1. 本示例包含entry（HAP）、hsp1、hsp2、har1四个模块，各模块均配置了启动框架。
2. entry中HapTask01为自动模式，其依赖Hsp1Task01和Har1Task01；框架调度HapTask01时会递归解析依赖链，将Hsp1Task01、Har1Task01及其依赖的任务（Hsp1Task02、Hsp2Task01）一并执行。
3. so预加载任务同理，libentry_01依赖libhsp1_01和libhar1_01，框架会递归拉起libhsp1_01、libhar1_01及其依赖任务。

### 工程目录
```
AppStartupModule/
├─ entry/                      # HAP模块
│  ├─ src/main/
│  │  ├─ module.json5          # 模块配置（含appStartup标签）
│  │  ├─ ets/
│  │  │  ├─ entryability/      # EntryAbility
│  │  │  ├─ pages/             # Index页面
│  │  │  └─ startup/           # HapTask01启动任务、StartupConfig
│  │  ├─ cpp/                  # libentry_01.so源码
│  │  └─ resources/base/profile/startup_config.json  # 启动任务配置
├─ hsp1/                       # HSP模块
│  └─ src/main/
│     ├─ module.json5
│     ├─ ets/startup/          # Hsp1Task01、Hsp1Task02启动任务
│     ├─ cpp/                  # libhsp1_01.so、libhsp1_02.so源码
│     └─ resources/base/profile/startup_config.json
├─ hsp2/                       # HSP模块
│  └─ src/main/
│     ├─ module.json5
│     ├─ ets/startup/          # Hsp2Task01启动任务
│     ├─ cpp/                  # libhsp2_01.so源码
│     └─ resources/base/profile/startup_config.json
└─ har1/                       # HAR模块
   └─ src/main/
      ├─ module.json5
      ├─ ets/startup/          # Har1Task01启动任务
      ├─ cpp/                  # libhar1_01.so源码
      └─ resources/base/profile/startup_config.json
```

### 启动任务与so预加载任务依赖关系

| 模块  | 启动任务                          | so预加载任务                |
| ----- | --------------------------------- | --------------------------- |
| entry | HapTask01                        | libentry_01                 |
| hsp1  | Hsp1Task01、Hsp1Task02          | libhsp1_01、libhsp1_02      |
| hsp2  | Hsp2Task01                       | libhsp2_01                  |
| har1  | Har1Task01                       | libhar1_01                  |

依赖链：
- 启动任务：HapTask01 → {Hsp1Task01, Har1Task01}；Hsp1Task01 → {Hsp1Task02, Har1Task01}；Hsp1Task02 和 Har1Task01 → Hsp2Task01
- so预加载：libentry_01 → {libhsp1_01, libhar1_01}；libhsp1_01 → {libhsp1_02, libhar1_01}；libhsp1_02 和 libhar1_01 → libhsp2_01

注意：so文件和任务需自己进行相关配置，代码只做展示。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行，支持设备：RK3568。

2.本示例已适配API version 26版本SDK，版本号：26.0.0。

3.本示例需要使用DevEco Studio 26.0.0 Beta1及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/Ability/AppStartupModule/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
