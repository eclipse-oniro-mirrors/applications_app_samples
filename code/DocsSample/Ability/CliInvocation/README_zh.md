# 应用内调用CLI

### 介绍

本示例展示了[应用内调用CLI](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/application-models/cli-invocation-guide.md)相关接口的使用方法：

通过Native（C/C++）代码以fork+execvp方式调用ohos-aa命令行工具，实现应用内启动目标应用的能力。

### 效果展示

不涉及。

### 测试代码说明

1. assertContain：基础断言测试，验证测试框架运行正常。

### 工程目录
```
entry/src/
├── main
│   ├── cpp
│   │   ├── napi_init.cpp                         // Native层实现，fork+execvp调用ohos-aa
│   │   ├── CMakeLists.txt                        // CMake构建配置
│   │   └── types
│   │       └── libentry
│   │           ├── Index.d.ts                    // ArkTS层Native接口声明
│   │           └── oh-package.json5              // NAPI包配置
│   ├── ets
│   │   ├── entryability
│   │   │   └── EntryAbility.ets                  // 应用入口Ability，管理应用生命周期
│   │   ├── entrybackupability
│   │   │   └── EntryBackupAbility.ets            // 备份恢复能力
│   │   └── pages
│   │       └── Index.ets                         // 主界面，包含启动应用按钮
│   ├── module.json5                              // 模块配置文件，声明CUSTOM_SANDBOX权限
│   └── resources                                 // 资源文件
└── ohosTest
    └── ets
        └── test
            ├── Ability.test.ets                  // 自动化测试代码
            └── List.test.ets                     // 测试套执行列表

```

### 使用说明

1. **启动目标应用**：点击"启动目标应用 (ohos-aa)"按钮，应用通过Native层fork+execvp方式执行ohos-aa start命令，拉起bundleName为com.example.agentExtension的目标应用。
2. **返回值说明**：返回值为0表示ohos-aa进程正常退出，非0表示进程执行失败。业务层面的执行结果需解析ohos-aa输出的JSON中status字段判断。

### 具体实现

1. **配置权限**：在module.json5中声明ohos.permission.CUSTOM_SANDBOX权限，deviceTypes配置为2in1。
2. **Native层实现**：在napi_init.cpp中实现forkAndExecute函数，通过fork()创建子进程，子进程中使用execvp()执行/system/bin/cli_tool/executable/ohos-aa命令，父进程通过waitpid()等待子进程结束并获取退出码。
3. **ArkTS层调用**：在Index.ets中通过import testNapi from 'libentry.so'引入Native模块，在按钮点击事件中调用testNapi.forkAndExecute接口。

### 相关权限

- ohos.permission.CUSTOM_SANDBOX：允许应用自定义沙箱，是应用内通过fork+execvp调用CLI的前提条件。

### 依赖

不涉及。

### 约束与限制

1. 仅支持PC/2in1设备。
2. 需设备开启开发者模式。
3. 目标应用需已安装且exported标签配置为true。
4. CLI自API version 26.0.0起支持。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/Ability/CliInvocation/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
