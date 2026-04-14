# 分布式数据对象跨设备迁移示例项目

## 介绍

本项目演示了如何使用**分布式数据对象（Distributed Data Object）** 实现应用数据的跨设备迁移。

核心接口包括：

| 接口 | 说明 |
|------|------|
| `create` | 创建分布式数据对象实例 |
| `save` | 保存分布式数据对象到目标设备 |
| `onStatus` | 监听分布式数据对象的状态变化 |

## 功能特性

- 支持复杂数据结构（含资产文件）的跨设备迁移
- 实现源端数据保存与目标端数据恢复
- 提供状态监听机制，实时获取数据同步状态

## 核心接口说明

### 1. create 接口

创建分布式数据对象实例。

```typescript
g_object = distributedObject.create(this.context, note);
```

**参数说明：**

| 参数 | 类型 | 说明 |
|------|------|------|
| `context` | `UIAbilityContext` | 应用上下文 |
| `note` | `Object` | 要同步的业务数据对象 |

**业务数据对象示例：**

```typescript
class Note {
  title: string | undefined       // 标题
  text: string | undefined        // 内容
  attachment: commonType.Asset    // 附件资产（如图片）

  constructor(title: string | undefined, text: string | undefined, attachment: commonType.Asset) {
    this.title = title;
    this.text = text;
    this.attachment = attachment;
  }
}
```

---

### 2. save 接口

将分布式数据对象保存到目标设备。

```typescript
g_object!.save(targetDeviceId).then((result: distributedObject.SaveSuccessResponse) => {
  console.info(`Succeeded in saving. SessionId: ${result.sessionId}`);
}).catch((err) => {
  console.error('Failed to save. code: ' + err.code);
});
```

**参数说明：**

| 参数 | 类型 | 说明 |
|------|------|------|
| `targetDeviceId` | `string` | 目标设备ID |

**返回值：**

| 字段 | 类型 | 说明 |
|------|------|------|
| `sessionId` | `string` | 会话ID |
| `version` | `number` | 数据版本号 |
| `deviceId` | `string` | 设备ID |

---

### 3. onStatus 接口

监听分布式数据对象的状态变化。

```typescript
let statusCallback: distributedObject.StatusObserver = (sessionId: string, networkId: string, status: string) => {
  if (status === 'restored') {
    console.info('Data restored, title:' + g_object!['title']);
  }
};

g_object!.onStatus(statusCallback);
```

**回调参数：**

| 参数 | 类型 | 说明 |
|------|------|------|
| `sessionId` | `string` | 会话ID |
| `networkId` | `string` | 网络ID |
| `status` | `string` | 状态值 |

**状态值说明：**

| 状态 | 说明 |
|------|------|
| `restored` | 数据已恢复完成 |
| `initialized` | 对象已初始化 |
| `updated` | 数据已更新 |

## 迁移流程

```
┌─────────────────────────────────────────────────────────────────┐
│                         源设备 (Source)                          │
├─────────────────────────────────────────────────────────────────┤
│  onContinue()                                                   │
│    ├─ genSessionId()        // 生成会话ID                       │
│    ├─ create()              // 创建分布式数据对象                │
│    ├─ setAsset()            // 设置资产文件（如图片）            │
│    ├─ setSessionId()        // 设置会话ID                       │
│    └─ save(targetDevice)    // 保存数据到目标设备                │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                       目标设备 (Target)                          │
├─────────────────────────────────────────────────────────────────┤
│  onCreate() / onNewWant()                                       │
│    ├─ create()              // 创建分布式数据对象                │
│    ├─ onStatus(callback)    // 注册状态监听                      │
│    ├─ setSessionId()        // 设置会话ID（加入同步网络）        │
│    └─ status='restored'     // 数据恢复完成，可获取迁移数据       │
└─────────────────────────────────────────────────────────────────┘
```

## 依赖模块

```typescript
import distributedObject from '@ohos.data.distributedDataObject';
import { UIAbility } from '@kit.AbilityKit';
import { AbilityConstant } from '@kit.AbilityKit';
import commonType from '@ohos.data.commonType';
```

## 运行要求

- 两台手机或平板设备（或一台设备 + 模拟器）
- 设备需登录同一华为账号
- 设备需开启蓝牙和 WLAN
- DevEco Studio

## 运行方式

1. 使用 DevEco Studio 打开项目
2. 连接两台手机或平板设备，将test_img.jpg文件放入A设备/mnt/hmdfs/100/acount/merge_view/data/com.example.staticdistibutedobjectcontinue路径下
3. 在源设备上运行应用
4. 触发跨设备迁移（如通过流转）
5. 观察目标设备数据恢复情况，查看B设备/mnt/hmdfs/100/acount/merge_view/data/com.example.staticdistibutedobjectcontinue路径下存在test_img.jpg

### 工程目录

```
StaObjectContinueSample/
├── entry/
│   └── src/main/ets/
│       ├── entryability/
│       │   └── EntryAbility.ets    # 分布式数据对象迁移实现
│       └── pages/
│           └── Index.ets           # 主页面
```
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
echo code/ArkTS-Sta/StaObjectContinueSample/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```

