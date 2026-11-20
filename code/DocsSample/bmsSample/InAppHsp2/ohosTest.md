# HSP 测试用例归档

## 概述

本工程 `entry/src/ohosTest` 面向 HSP 场景补充了 16 个测试套件，共 2578 条用例，覆盖应用包信息、entry/library 模块信息、HSP 路由集成、资源解析、上下文目录、文件读写、显示信息、编码转换、数组/数值/字符串逻辑、Ability 生命周期与页面导航。

用例以逻辑校验为主，UI 自动化仅保留 11 条核心路径用例。每个用例执行前都会通过 hilog（domain `0xF812`，tag `[Sample_InAppHsp2]`）打印用例名与关键参数，便于定位失败点。

## 预置条件

1. 使用 DevEco Studio 6.1.1 Release 及以上版本，SDK 版本 26.0.0。
2. 设备为 tablet（平板或平板模拟器），系统支持 API 26。
3. 先编译 library 模块生成 `library.hsp`，再编译 entry 模块生成 `entry.hap`，两个包都需要安装到设备，否则依赖 HSP 的用例会记录 `library module not installed` 后跳过。

## 用例表

| 测试功能 | 测试套件 | 用例数 | 预置条件 | 输入 | 预期输出 | 测试结果 |
| --- | --- | --- | --- | --- | --- | --- |
| 应用包信息与权限状态 | BundleCoreMatrix | 130 | 安装 entry.hap | 读取 BundleInfo | 名称、版本、vendor、权限、签名信息符合配置 | Pass |
| entry 模块信息 | EntryModuleMatrix | 134 | 安装 entry.hap | 读取 HapModuleInfo | 模块名、类型、设备类型、Ability/Extension 信息符合配置 | Pass |
| library 模块信息 | LibraryModuleMatrix | 129 | 安装 library.hsp | 读取 library 模块信息 | 模块名 library、类型 SHARED、路由信息完整 | Pass |
| HSP 路由集成 | HspIntegrationMatrix | 51 | 安装 entry.hap 与 library.hsp | 读取聚合路由表 | 路由名、页面路径、构建函数与 HSP 内配置一致 | Pass |
| entry 资源解析 | EntryResourceMatrix | 285 | 安装 entry.hap | 读取字符串、颜色、图片、分层图标 | 资源值与工程配置逐项一致 | Pass |
| library 资源解析 | LibraryResourceMatrix | 42 | 安装 library.hsp | 读取 library 共享资源 | 资源值与工程配置一致 | Pass |
| 上下文目录 | ContextDirMatrix | 101 | 应用可运行 | 读取 files/cache/temp 等目录 | 路径为完整路径、目录存在且可读写 | Pass |
| 文件读写 | FileCacheIoMatrix | 557 | 应用可运行 | 创建、追加、复制、重命名、删除文件 | 文件大小、内容、元数据与操作一致，且无残留 | Pass |
| 文件异常路径 | FileCacheErrorMatrix | 240 | 应用可运行 | 读取/删除不存在的文件、重复建目录、删除非空目录 | 返回对应错误码或保持目录原状 | Pass |
| 显示与设备信息 | DisplayMatrix | 84 | 设备正常显示 | 读取 Display 与 deviceInfo | 分辨率、密度、刷新率、旋转方向取值合法且稳定 | Pass |
| 文本编码 | TextEncodingMatrix | 218 | 无 | UTF-8 编解码、Base64 编解码、字节序检查 | 编码结果与预期字节/字符串一致 | Pass |
| 数组逻辑 | ArrayLogicMatrix | 240 | 无 | 求和、最值、排序、增删、过滤、Set/Map | 计算结果与预期值一致 | Pass |
| 数值格式 | NumberFormatMatrix | 149 | 无 | 进制转换、取整、幂运算、toFixed | 格式化结果与预期字符串一致 | Pass |
| 字符串解析 | StringParseMatrix | 175 | 无 | 截取、大小写、替换、补齐、拼接 | 解析结果与预期字符串一致 | Pass |
| Ability 生命周期 | AbilityLifecycleMatrix | 32 | 安装 entry.hap | 启动/停止 EntryAbility | AbilityInfo、ApplicationInfo、上下文目录符合配置 | Pass |
| 页面导航 | UiNavigationMatrix | 11 | 安装 entry.hap 与 library.hsp | 点击 click_to_menu、back_to_index，返回手势 | 页面在 entry 与 library 之间正确跳转，文案正确 | Pass |

## 运行方式

   在 DevEco Studio 中选择 `entry` 模块的 `ohosTest` 运行配置，连接 tablet 设备后直接运行全部用例。

## 测试结果

全部 16 个套件在 DevEco Studio 6.1.1、SDK 26.0.0、tablet 环境编译通过；用例逐条执行，结果记录为 Pass。HSP 未安装时，依赖 HSP 的套件会输出未安装日志并跳过，不影响其余用例。
