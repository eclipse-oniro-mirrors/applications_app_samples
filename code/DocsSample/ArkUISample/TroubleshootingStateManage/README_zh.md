# 状态变量改变不触发刷新问题定位

### 介绍

本示例展示了在ArkUI状态管理中，当状态变量发生改变却未触发UI刷新时，如何按照固定的排查步骤逐一定位问题根因。

当状态变量发生变化但界面未按预期刷新时，通常可以从以下几个环节逐步排查：

1. 状态变量发生改变：确认赋值前后变量的实际取值，避免逻辑分支未真正走到赋值语句。
2. 赋值是否可被观察：确认被修改的对象或属性是否被状态管理框架所观察（V1使用`@Observed`/`@ObjectLink`，V2使用`@ObservedV2`/`@Trace`）。
3. 数据源与同步对象关联：确认父组件数据源与子组件接收对象是否仍为同一实例，避免`ForEach`键值不稳定或重新赋值导致关联断链。
4. 是否执行组件更新函数：确认属性变化是否触发了组件的重新渲染，例如`Image`的`onComplete`回调在资源已缓存场景下的同步/异步行为。

### 使用说明

1. 启动应用后进入主页，主页以列表形式列出各排查步骤的入口。
2. 点击列表项进入对应的排查步骤页面，按照页面中按钮的编号顺序依次点击。
3. 配合日志输出（`hilog`/`console.info`）观察状态变量的赋值，可观察性，同步关系以及刷新时机的实际表现。

### 工程目录

```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   │   │   └── EntryAbility.ets
│   │   ├── entrybackupability
│   │   │   └── EntryBackupAbility.ets
│   │   └── pages
│   │       ├── Index.ets                      // 主页，各排查步骤入口
│   │       ├── StateValueChangePage.ets       // 第二步：状态变量发生改变
│   │       ├── ObservabilityPage.ets          // 第三步（V1）：赋值是否可被观察
│   │       ├── ObservabilityV2Page.ets        // 第三步（V2）：赋值是否可被观察
│   │       ├── ForEachSyncPage.ets            // 第四步：数据源与同步对象关联（ForEach断链）
│   │       └── RenderUpdatePage.ets           // 第五步：是否执行组件更新函数（Image回调）
│   ├── module.json5
│   └── resources
│       └── base
└── ohosTest
    └── ets
        └── test
            ├── Ability.test.ets  // 自动化测试代码
            └── List.test.ets    // 测试套执行列表

```

### 具体实现

1. 主页`Index.ets`通过列表展示各排查步骤的入口，使用`router.pushUrl`跳转至对应页面。
2. `StateValueChangePage.ets`演示赋值前后状态变量的取值变化，通过日志确认赋值是否真正发生。
3. `ObservabilityPage.ets`（V1）和`ObservabilityV2Page.ets`（V2）使用`UIUtils.getTarget`判断对象/数组是否被状态管理框架观察，验证`@Observed`/`@ObjectLink`与`@ObservedV2`/`@Trace`的可观察性。
4. `ForEachSyncPage.ets`演示`ForEach`键值不稳定导致子组件重建，`@ObjectLink`指向新实例的现象，通过`util.getHash`输出对象哈希值验证同步关系是否断链。
5. `RenderUpdatePage.ets`演示`Image`组件在资源已进入缓存与未缓存两种情况下，`onComplete`回调的同步/异步差异对后续状态变量刷新时机的影响。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.本示例已适配API version 26及以上版本SDK。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample/TroubleshootingStateManage/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
