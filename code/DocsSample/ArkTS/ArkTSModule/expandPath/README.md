# ArkTS按路径导入HAR包

### 介绍

本工程展示了按路径导入HAR包的能力。通过对比整体导入HAR包（`import * as har from 'expandPathHar'`）与按HAR包内文件路径导入（`import { One } from 'expandPathHar/src/main/ets/NumberString'`）两种方式，说明按路径导入可以只加载所需文件，避免触发包入口（Index.ets）及其聚合导出链路上其它模块的顶层副作用，从而减少不必要的模块加载。该工程中展示的代码详细描述可查如下链接部分。

- [模块加载副作用及优化](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/arkts-utils/arkts-module-side-effects.md)

### 使用说明

1. 运行Index主界面。
2. Index.ets采用整体导入HAR包的方式（`import * as har from 'expandPathHar'`），运行后可在日志中观察到HAR包入口Index.ets及其聚合导出的Utils.ets、NumberString.ets、OtherModule1~4.ets等模块的顶层代码均被执行（打印对应的`execute.`日志）。
3. index2.ets采用按路径导入的方式（`import { One } from 'expandPathHar/src/main/ets/NumberString'`），运行后仅会加载并执行NumberString.ets，HAR包入口Index.ets及其聚合导出链路上的其它模块均不会被加载。
4. 运行测试用例Ability.test.ets文件对页面代码进行测试可以全部通过。

### 具体实现

**1. HAR包导出链路（expandPathHar）**

HAR包入口 `expandPathHar/Index.ets` 聚合导出多个模块，并在顶层执行 `console.info`（属于模块加载副作用）：

```typescript
// expandPathHar/Index.ets
export { MainPage } from './src/main/ets/components/MainPage';
export * from "./src/main/ets/OtherModule1"
export * from "./src/main/ets/OtherModule2"
export * from "./src/main/ets/Utils"
console.info("har Index.ets execute.");
```

其中 `Utils.ets` 进一步聚合导出，`NumberString.ets` 导出常量 `One`：

```typescript
// expandPathHar/src/main/ets/Utils.ets
export * from "./OtherModule3"
export * from "./OtherModule4"
export * from "./NumberString"
console.info("har Utils.ets execute.");

// expandPathHar/src/main/ets/NumberString.ets
export const One: string = '1';
console.info('har NumberString.ets execute.');
```

`OtherModule1~4.ets` 结构相同，各自导出一个常量并在顶层打印日志（如 `export const module1: string = '1';`）。

**2. 两种导入方式对比（entry）**

未优化——整体导入HAR包，会触发入口 `Index.ets` 及其聚合导出链路上所有模块的顶层副作用：

```typescript
// entry/src/main/ets/pages/Index.ets
import * as har from 'expandPathHar';
console.info("har.One is ", har.One);
// 加载并执行 Index.ets、Utils.ets、NumberString.ets、OtherModule1~4.ets
```

优化——按HAR包内文件路径导入，仅加载并执行 `NumberString.ets`，HAR包入口及聚合导出链路上的其它模块均不会被执行：

```typescript
// entry/src/main/ets/pages/index2.ets
import { One } from 'expandPathHar/src/main/ets/NumberString';
console.info('One is ', One);
// 仅加载并执行 NumberString.ets
```

### 工程目录

```
expandPath/
├── AppScope/
├── entry/
│   └── src/
│       ├── main/
│       │   ├── ets/
│       │   │   ├── entryability/
│       │   │   ├── entrybackupability/
│       │   │   └── pages/
│       │   │       ├── Index.ets        # 整体导入HAR包（未优化）
│       │   │       └── index2.ets       # 按路径导入HAR包指定文件（优化）
│       │   ├── resources/
│       │   └── module.json5
│       ├── mock/
│       └── ohosTest/
│           ├── ets/test/
│           │   ├── Ability.test.ets
│           │   └── List.test.ets
│           └── module.json5
├── expandPathHar/
│   ├── Index.ets                        # HAR导出入口，整体导出会触发全链路副作用
│   └── src/main/ets/
│       ├── Utils.ets                    # 聚合导出OtherModule3/4、NumberString
│       ├── NumberString.ets             # 导出One
│       ├── OtherModule1.ets
│       ├── OtherModule2.ets
│       ├── OtherModule3.ets
│       ├── OtherModule4.ets
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
echo code/DocsSample/ArkTS/ArkTSModule/expandPath > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
