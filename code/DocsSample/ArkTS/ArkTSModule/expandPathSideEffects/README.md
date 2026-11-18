# ArkTS按路径导入与模块副作用

### 介绍

本工程展示了按路径导入HAR包时与模块加载副作用之间的关系。HAR包入口（Index.ets）中的初始化代码属于模块加载副作用；采用按路径导入HAR包内指定文件时，HAR包入口Index.ets不会被执行，其初始化逻辑因此被跳过。本工程通过三个页面对比了不同导入路径下 `serviceManager` 初始化状态的差异，说明按路径导入时应在被导入文件内部完成必要的初始化，而不是依赖HAR包入口的副作用。该工程中展示的代码详细描述可查如下链接部分。

- [模块加载副作用及优化](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/arkts-utils/arkts-module-side-effects.md)

### 使用说明

1. 运行Index主界面。
2. opIndex.ets从HAR包入口整体导入（`import { serviceManager } from "servicemanagerhar"`），运行后HAR包入口Index.ets中的 `serviceManager.init()` 会被执行，`serviceManager.print()` 打印 `ServiceManager is inited.`。
3. Index.ets按路径导入OpServiceManager（`import { serviceManager } from "servicemanagerhar/src/main/ets/OpServiceManager"`），该文件在导出对象后于自身内部调用 `serviceManager.init()`，运行后 `serviceManager.print()` 同样打印 `ServiceManager is inited.`。
4. sideEffectIndex.ets按路径导入ServiceManager（`import { serviceManager } from "servicemanagerhar/src/main/ets/ServiceManager"`），由于按路径导入会跳过HAR包入口Index.ets，`init()` 未被调用，运行后 `serviceManager.print()` 打印错误日志 `ServiceManager is not inited.`。
5. 运行测试用例Ability.test.ets文件对页面代码进行测试可以全部通过。

### 具体实现

**1. ServiceManager 及两种导出方式（serviceManagerHar）**

`ServiceManager.ets` 定义服务管理类并导出实例，但不在文件内部做初始化：

```typescript
// serviceManagerHar/src/main/ets/ServiceManager.ets
class ServiceManager {
  public inited: boolean = false;

  public init() {
    this.inited = true;
  }
  public print() {
    if (this.inited) {
      console.info("ServiceManager is inited.");
    } else {
      console.error("ServiceManager is not inited.");
    }
  }
}
export let serviceManager: ServiceManager = new ServiceManager();
```

`OpServiceManager.ets` 与之结构相同，但在导出后于文件内部调用 `init()`（即在导出的模块执行对应初始化逻辑）：

```typescript
// serviceManagerHar/src/main/ets/OpServiceManager.ets
// ...同上 ServiceManager 定义与导出...
// 在导出的模块执行对应的逻辑。
serviceManager.init();
```

**2. HAR包入口初始化（serviceManagerHar/Index.ets）**

HAR包入口导入 `ServiceManager` 并调用 `init()`，再对外导出，该初始化属于入口的模块加载副作用：

```typescript
// serviceManagerHar/Index.ets
import { serviceManager } from "./src/main/ets/ServiceManager";

serviceManager.init();
export { serviceManager }
```

**3. 三种导入方式对比（entry）**

整体导入HAR包——会执行入口 `Index.ets`，`init()` 被调用，`print()` 输出已初始化：

```typescript
// entry/src/main/ets/pages/opIndex.ets
import { serviceManager } from "servicemanagerhar";

serviceManager.print(); // 打印 "ServiceManager is inited."
```

按路径导入 `OpServiceManager`——跳过入口，但被导入文件内部已调用 `init()`，同样已初始化：

```typescript
// entry/src/main/ets/pages/Index.ets
import { serviceManager } from "servicemanagerhar/src/main/ets/OpServiceManager"

serviceManager.print(); // 打印 "ServiceManager is inited."
```

按路径导入 `ServiceManager`——跳过入口且被导入文件未调用 `init()`，未初始化：

```typescript
// entry/src/main/ets/pages/sideEffectIndex.ets
import { serviceManager } from "servicemanagerhar/src/main/ets/ServiceManager"

serviceManager.print(); // 打印错误日志 "ServiceManager is not inited."
```

### 工程目录

```
expandPathSideEffects/
├── AppScope/
├── entry/
│   └── src/
│       ├── main/
│       │   ├── ets/
│       │   │   ├── entryability/
│       │   │   ├── entrybackupability/
│       │   │   └── pages/
│       │   │       ├── Index.ets             # 按路径导入OpServiceManager（内部已初始化）
│       │   │       ├── opIndex.ets           # 整体导入HAR包入口（入口初始化）
│       │   │       └── sideEffectIndex.ets   # 按路径导入ServiceManager（未初始化）
│       │   ├── resources/
│       │   └── module.json5
│       ├── mock/
│       └── ohosTest/
│           ├── ets/test/
│           │   ├── Ability.test.ets
│           │   └── List.test.ets
│           └── module.json5
├── serviceManagerHar/
│   ├── Index.ets                             # HAR导出入口，调用serviceManager.init()
│   └── src/main/ets/
│       ├── ServiceManager.ets               # 仅导出serviceManager，不做初始化
│       ├── OpServiceManager.ets             # 导出serviceManager并调用init()
│       ├── components/
│       │   └── MainPage.ets
│       └── module.json5
├── hvigor/
├── build-profile.json5
├── oh-package.json5
└── hvigorfile.ts
```

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行, 支持设备：RK3568。

2.本示例为Stage模型，支持API23版本SDK，版本号：6.1.0(23)，镜像版本号：OpenHarmony_6.1.0(23)。

3.本示例需要使用DevEco Studio 6.1.0及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkTS/ArkTSModule/expandPathSideEffects > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
