# 网络场景

### 介绍
多任务依赖，要在完成任务A和完成任务B之后，才会唤醒任务C。

**使用说明**
1. 用户点击"启动所有任务"按钮
2. 任务A和B同时开始执行
3. 任务A完成后：
    - 进度条更新至100%
4. 任务B完成后：
    - 进度条更新至100%
    - 任务锁被释放
5. 任务C检测到锁已释放，开始执行：
    - 进度条开始增长
6. 任务C完成后：
    - 进度条更新至100%

### 工程结构&模块类型
   ```
   entry/src/main/ets/
|---pages
|   |---taskDependencies.ets                    // 任务依赖
|   |---index.ets                              // 首页(UI)
   ```

### 具体实现
*初始状态*：
- 任务锁 `lock` 设置为 `true`（锁定状态）
- 任务A和B完成状态均为 `false`

2. **任务执行过程**：
    - 任务A和B并行执行
    - 当任务A完成时，调用 `completeTaskA()` 方法：
        - 设置 `taskACompleted = true`
        - 更新进度
        - 检查是否可以解锁
    - 任务B同理

3. **解锁条件**：
    - 只有当任务A和B都完成且锁处于锁定状态时才会解锁

4. **任务C触发**：
    - 当锁被释放（`lock = false`）时执行任务C

### 进度管理

1. **进度分配**：
    - 任务A完成：100%
    - 任务B完成：100%
    - 任务C完成：100%

2. **进度更新**：
    - 每次任务完成时增加相应进度

### UI组件说明

1. **进度条组件**：
    - 使用ArkTS的`Progress`组件
    - 线性样式直观展示进度变化
    - 实时显示百分比数值

2. **控制按钮**：
    - "启动所有任务"：触发整个任务流程

### 相关权限

网络权限: ohos.permission.INTERNET

### 依赖

无

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：Phone;
2. 本示例为Stage模型，支持API20版本SDK，SDK版本号(API Version 20),镜像版本号(6.0.0.31)。
3. 本示例需要使用DevEco Studio 版本号(6.0.0.6)版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/ArkTS1.2/NetworkSample/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull
```