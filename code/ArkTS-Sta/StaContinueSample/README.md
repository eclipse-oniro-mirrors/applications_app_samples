### 介绍

本示例主要展示了应用数据跨端迁移的能力，通过跨端迁移的能力实现了一个简单的迁移应用，可以响应系统迁移事件，控制应用的迁移能力、是否迁移页面栈以及迁移后是否退出源端等。

### 效果预览

![main.png](https://raw.gitcode.com/user-images/assets/9646135/10bd6275-7e25-47e7-92d1-b66bd7ac5e5c/main.png 'main.png')

使用说明

1. 启动应用，进入主页，点击动态配置迁移能力按钮，可以跳转配置页设置迁移状态；
2. 进入主页，点击基础迁移数据示例，可以验证基础迁移数据；

### 工程目录
```
StaContinueSample/
├── entry/
│   └── src/main/ets/
│       ├── entryability/    # 应用入口
│       └── pages/           # 页面
│           └── Index.ets    # 主页面
```

本项目演示了应用的跨设备迁移功能，主要涉及以下两个核心接口：

| 接口 | 说明 |
|------|------|
| `onContinue` | 应用迁移时的回调接口，用于准备迁移数据 |
| `setMissionContinueState` | 设置应用的可迁移状态（ACTIVE/INACTIVE） |

## 功能特性

- 提供 **ACTIVE** 按钮：将应用设置为可迁移状态
- 提供 **INACTIVE** 按钮：将应用设置为不可迁移状态
- 演示应用迁移数据的传递与恢复
- 支持跨设备无缝流转

## API 说明

### 1. onContinue 接口

`onContinue` 是应用迁移时触发的回调方法，用于准备需要迁移的数据。

```typescript
onContinue(wantParam: Record<string, Object>): AbilityConstant.OnContinueResult {
  // 准备迁移数据
  wantParam['data'] = '迁移的数据';

  // 配置迁移参数
  wantParam[wantConstant.Params.SUPPORT_CONTINUE_PAGE_STACK_KEY] = false;
  wantParam[wantConstant.Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY] = false;

  // 返回同意迁移
  return AbilityConstant.OnContinueResult.AGREE;
}
```

**参数说明：**

| 参数 | 类型 | 说明 |
|------|------|------|
| `wantParam` | `Record<string, Object>` | 用于传递迁移数据的参数对象 |

**返回值：**

| 返回值 | 说明 |
|--------|------|
| `AGREE` | 同意迁移 |
| `REJECT` | 拒绝迁移 |
| `MISMATCH` | 版本不匹配 |

### 2. setMissionContinueState 接口

`setMissionContinueState` 用于动态设置应用的可迁移状态。

```typescript
this.context.setMissionContinueState(AbilityConstant.ContinueState.ACTIVE);
this.context.setMissionContinueState(AbilityConstant.ContinueState.INACTIVE);
```

| 状态 | 说明 |
|------|------|
| `ACTIVE` | 应用可以跨设备迁移 |
| `INACTIVE` | 应用不可跨设备迁移 |

## 迁移流程

```
┌─────────────┐     onContinue      ┌─────────────┐
│   源设备     │ ──────────────────> │   目标设备   │
│  (Source)    │      准备数据         │  (Target)   │
└─────────────┘                      └─────────────┘
       │                                    │
       │ setMissionContinueState           │
       │      (ACTIVE)                      │
       ▼                                    ▼
   可迁移状态                          onCreate/onNewWant
                                         (恢复数据)
```

## 运行要求

- OpenHarmony SDK 23API以上
- DevEco Studio

## 运行方式

1. 使用 DevEco Studio 打开项目
2. 连接手机或平板设备或启动模拟器
3. 点击 Run 按钮运行应用

### 依赖

不涉及

 ### 约束与限制
 	 
1. 本示例仅支持标准系统上运行，支持设备：Phone、Tablet
2. 本示例为Stage模型，支持API23版本SDK，SDK版本号(API Version 23)
3. 本示例需要使用DevEco Studio版本号(6.1.0.200)及以上版本才可编译运行
4. 本示例使用ArkTS 1.2静态模式编译
5. 需要两台设备登录同一华为账号才能进行分布式协作测试
 	 
### 下载

如需单独下载本工程，执行如下命令：
 	 
```
git init
git config core.sparsecheckout true
echo code/ArkTS-Sta/StaContinueSample/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
