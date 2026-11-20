# DevelopingFileManagerApplication测试说明

## 自动化测试概览

当前 ohosTest 共 **1826 条用例**，测试代码 **55,826 行**：

| 套件 | 用例数 | 职责 |
|---|---:|---|
| `DevelopingFileManagerApplicationTest` | 3 | 启动、创建文件、目录监听 UI 流程 |
| `DfmaFileIoMatrix1Test` ~ `DfmaFileIoMatrix6Test` | 1028 | sandbox 文件创建、写入、统计、读取、删除矩阵 |
| `DfmaFileOpsTest` | 110 | rename、copy、move、mkdir、list 文件操作矩阵 |
| `DfmaBoundaryTest` | 40 | 特殊文件名、长路径、缺失路径边界 |
| `DfmaWatcherTest` | 15 | 目录 watcher create/modify/delete 事件 |
| `DfmaWatcherLifecycleExtraTest` | 20 | watcher stop/restart/multi/delete 生命周期 |
| `DfmaFileContentExtraTest` | 25 | 空内容、Unicode、长文本和特殊内容 |
| `DfmaExceptionExtraTest` | 25 | 非空目录删除、缺失文件、关闭句柄 |
| `DfmaMetadataConcurrencyTest` | 30 | 目录元数据、批量文件生命周期 |
| `DfmaLargeStreamExtraTest` | 30 | 大文件、追加、截断 |
| `DfmaWatcherEventExtraTest` | 15 | watcher rename 事件补充 |
| `DfmaSecurityExtraTest` | 20 | 路径安全与越界访问 |
| `DfmaMetadataPerfExtraTest` | 20 | mtime、目录元数据和批量生命周期 |
| `DfmaRandomAccessTest` | 20 | 随机偏移读取 |
| `DfmaSecurityPathExtra2Test` | 10 | 路径穿越/越界路径/缺失路径 |
| `DfmaWatcherCreateExtraTest` | 10 | watcher create 事件补充 |
| `DfmaBulkPerfExtraTest` | 10 | 批量文件生命周期 |
| `DfmaFileIoVolume2Test` | 70 | 文件内容体量补充 |
| `DfmaBulkLifecycle2Test` | 40 | 批量文件生命周期补充 |
| `DfmaMetadataVolume2Test` | 30 | 元数据体量补充 |

质量门禁：

- 用例名 `testXxxNNNN` / 现有 `CoreFileKitDfmaFunctionTestNNNN`；
- `@tc.*` 元数据全量存在；
- 每条用例至少 3 个断言；
- 新增 140 条单独执行 **140/140 通过**；全量合并执行受设备规模限制。

## 手工用例表

| 测试功能       | 预置条件           | 输入                                      | 预期输出                           | 是否自动 | 测试结果 |
| -------------- | ------------------ | ----------------------------------------- | ---------------------------------- | -------- | -------- |
| 拉起应用       | 设备正常运行       |                                           | 成功拉起应用                       | 是       | Pass     |
| 申请权限       | 成功拉起应用       |                                           | 成功申请权限                       | 是       | Pass     |
| 创建文件       | 申请权限成功       |                                           | 将创建文件成功结果输出到首页文本框 | 是       | Pass     |
| 监听设备上下线 | 安装应用，进入首页 | 测试代码点击监听按钮之后，插入u盘到开发板 | 将家庭成功结果输出到首页文本框     | 否       | Pass     |

