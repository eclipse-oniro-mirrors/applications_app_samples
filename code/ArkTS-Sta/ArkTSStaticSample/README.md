# ArkTS-Static演示工程

### 介绍

本示例工程为一个OpenHarmony ArkTS演示工程。主要展示了同一业务能力在library中提供动态（`ArkTS-Dyn`）与静态（`ArkTS-Sta`）两套实现的功能。通过`dispatch`层在运行时按系统API版本自动分发具体实现。对外暴露统一接口，业务侧（entry）无需关心底层使用的是哪套实现。

工程library统一导出了`DataParser`,`DataSource`,`CardData`和`ResolverRegistry`等核心能力供上层调用。

### 效果预览

效果如下所示：

| 主页面                                                   |  
|--------------------------------------------------------|
| ![main](entry/src/main/resources/base/media/main.png) |


### 使用说明

1.  启动应用进入主页面。
2.  页面会自动调用统一接口`DataParser.parse`解析 JSON 数据，并通过`LazyForEach`渲染为应用卡片列表。
3.  若需验证不同版本的运行时分发逻辑，可在控制台日志中观察`dispatch/DataParser.js`的输出：
      - 当设备`sdkApiVersion >= 23`时，日志应显示走静态实现。
      - 当设备`sdkApiVersion < 23`时，日志应显示走动态实现。

当前工程的编译、目标和最低兼容 SDK 均配置为 `26.0.0`，本机连接的设备 API 为 `26`，
因此本次设备验证实际执行静态分支。上述 API 23 判断是源码中的分发规则，
不表示当前构建配置可以直接安装到低于 API 23 的设备。

### 工程目录

```text
entry/src/main/ets/
|---pages
|   |---Index.ets                       // 示例页面入口，注册 card resolver，调用 DataParser.parse，渲染列表
library/src/main/ets/
|---components
|   |---dispatch
|   |   |---DataParser.js               // 运行时版本分发逻辑层
|   |---dyn                             // 动态实现目录，纯 TS 侧逻辑
|   |   |---CardData.ts
|   |   |---DataParser.ts
|   |   |---DataSource.ts
|   |   |---ResolverRegistry.ts
|   |---sta                             // 静态实现目录
|   |   |---CardData.ets
|   |   |---DataParser.ets
|   |   |---DataSource.ets
|   |   |---ResolverRegistry.ets
|   |---sta_bridge                      // TS与ETS桥接层 (EtsFactory / InitStatic)，完成实例初始化
|   |---sta_dummy                       // 静态空实现目录，提供兜底保障
|   |---sta_wrapper
|   |   |---DataParserStaW.ts           // 静态适配动态的实现层，解决静态实现适配动态接口的数据格式转换问题
|   |---Index.ets                       // library 统一出口，对外导出 dyn 公共类型与接口
entry/src/ohosTest/
|---ets/test/List.test.ets              // 注册全部 96 个套件、1,782 条用例
|---ets/test/                          // Models、Parser、Interop、Registry、DataSource、Integration、UI、Workload
|---ets/testability/                   // 测试宿主与页面准备
|---ets/testrunner/                    // OpenHarmonyTestRunner
script/
|---run-device-tests.sh                // 构建、安装、设备运行与完整性核验
ohosTest.md                            // 基础功能用例与自动化覆盖表
```

### 具体实现

本工程的核心在于“统一接口封装”与“按版本双实现分发”。

  * **动态版本分发**：业务侧统一调用`library`出口。在DataParser.js中，系统会根据 API 版本判断选择相应的实现。
      * 若 `sdkApiVersion >= 23`：选择静态实现包装器`DataParserStaW`。
      * 若 `sdkApiVersion < 23`：选择动态实现`DataParserDyn`。
  * **动态实现逻辑 (Dyn)**：采用更直接的纯TS侧逻辑进行数据处理。
  * **静态实现逻辑 (Sta)**：结合使用了`taskpool`和`jsonx.JsonElement`等静态能力，并通过`sta_bridge`桥接与`sta_wrapper`包装器来适配动态接口格式。
  * 两者底层逻辑处理完毕后，均返回统一的数据模型类型（`CardData`和`DataSource`），确保entry业务层渲染逻辑的一致性。

### 相关权限

不涉及。


### 自动化测试覆盖与结果

测试覆盖数据模型、动态解析器、静态包装器、注册表、数据源、计算工作负载、
真实静态链路及页面渲染、交互和前后台切换，共 **96 个套件、1,782 条用例**。
完整套件名称、覆盖点和逐项用例数见 [ohosTest.md](ohosTest.md)。

2026-11-14 已完成设备全量回归：**1,782 条全部通过，Failure / Error / Ignore 均为 0**，
总测试时间 359,848 毫秒，最长单条 7,996 毫秒，15 秒配置未修改。

### 约束与限制

1.  本示例仅支持在标准系统上运行。
2.  当前工程使用 OpenHarmony API 26 / SDK `26.0.0` 构建，最低兼容版本同为 `26.0.0`。
3.  本机已验证 DevEco Studio `26.0.0`、上述工程内 Hvigor 和 API 26 真机；测试需连接并解锁设备。
4.  业务扩展说明：若新增业务卡片类型，需在`ResolverRegistry`注册新类型并补充相应的解析逻辑，同时务必保持ArkTS-Dyn和ArkTS-Sta两侧能力的一致性。

### 下载

如需单独下载本工程，执行如下命令：

```bash
git init
git config core.sparsecheckout true
echo code/ArkTS-Sta/ArkTSStaticSample/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
