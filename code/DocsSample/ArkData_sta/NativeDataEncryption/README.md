# 关系型数据库加密与备份恢复 (ArkTS)

### 介绍

此示例演示了关系型数据库的加密存储、备份与恢复功能，包括：
- 使用默认加密配置创建加密数据库
- 使用自定义加密参数创建加密数据库（支持配置密钥、迭代次数、加密算法、HMAC算法、KDF算法、加密页大小等）
- 数据库手动备份
- 数据库异常重建（配置 allowRebuild 参数）
- 恢复手动备份数据

### 效果预览

| 首页                                                     |
| -------------------------------------------------------- |
| <img src="./browse/start.png" style="zoom:50%;" /> |

### 使用说明

1. 在主页面中点击 "RdbStoreAPITest_ETS" 按钮，依次执行以下操作：
   - 使用默认加密配置创建数据库
   - 使用自定义加密参数创建数据库
   - 手动备份数据库
   - 数据库异常重建
   - 恢复手动备份数据

### 工程目录

```
entry/src/main
├── ets
│   ├── entryability
│   │   └── EntryAbility.ets        // 应用入口
│   └── pages
│       ├── Index.ets                // 主页面，提供按钮触发各功能测试
│       ├── backuprestore
│       │   └── BackupAndRestore.ets // 示例代码：数据库手动备份、异常重建、恢复备份数据
│       └── encryption
│           └── Encryption.ets        // 示例代码：使用默认和自定义加密参数创建加密数据库
├── module.json5                     // 模块配置文件
└── resources/                       // 资源文件
```

### 具体实现

- **加密数据库**：演示了两种创建加密数据库的方式
  - 使用默认加密配置：只需设置 `encrypt: true`，系统自动生成并管理密钥
  - 使用自定义加密参数：通过 `cryptoParam` 配置自定义密钥、迭代次数、加密算法等
- **数据库备份**：通过调用 `backup()` 接口实现数据库手动备份
- **数据库异常重建**：配置 `allowRebuild: true`，数据库异常时可自动删库并重建
- **数据恢复**：通过调用 `restore()` 接口恢复手动备份的数据库数据

### 相关权限

无

### 依赖

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行。

2.本示例为Stage模型，支持API20版本SDK。

3.本示例需要使用DevEco Studio 6.0.0 Release及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkData/RelationalStore/NativeDataEncryption_Sta > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
