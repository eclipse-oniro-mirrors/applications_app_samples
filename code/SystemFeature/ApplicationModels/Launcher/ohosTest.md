# Launcher 测试用例归档

本工程测试位于 `entry/src/ohosTest`，覆盖应用上下文、base 模块公共逻辑、网格布局数据映射、常量契约、数据 Bean、数据源行为与空值工具边界。用例编号使用 `@tc.number`，用例名为 `testXxxNNNN`。

## 测试环境

- 设备：deviceType 为 `default` 的开发板，系统 API version 26
- 工程 SDK：API version 26.0.0（Full SDK）
- Bundle：`ohos.samples.launcher`
- 测试模块：`entry_test`
- 测试框架：`OpenHarmonyTestRunner`

运行方式：

- 测试入口：`OpenHarmonyTestRunner`
- 模块：`entry_test`
- 超时：120000 ms

> 通过 Ability Assistant 测试命令执行；Git Bash 下需加 `MSYS_NO_PATHCONV=1`，否则 `/ets/testrunner/...` 会被转换成 Windows 路径。

## 自动化用例

| 测试文件 | 覆盖内容 | 用例数 |
| -------- | -------- | ------ |
| `Ability.test.ets` | 应用上下文、Bundle 信息、模块与 ServiceExtensionAbility 声明 | 3 |
| `BaseLogic.test.ets` | 空值判断、Item 类型、布局常量、卡片尺寸常量 | 7 |
| `GridLayoutData.test.ets` | 列名常量、ResultSet 全字段映射、area 解析与缺省值 | 5 |
| `ConstantsExtended.test.ets` | 类型/卡片尺寸/菜单/卸载常量、布局计数、卡片圆角、表单尺寸表、事件名、数据库列名 | 10 |
| `BeansExtended.test.ets` | AppItemInfo、CardItemInfo、FormCardItem、MissionInfo、MenuInfo、GridLayoutItemInfo 字段与默认值 | 10 |
| `GridLayoutItemInfoParse.test.ets` | 完整行解析、卡片行解析、area 合法/非法/边界、缺省列、页面位置边界、空白与负值 | 13 |
| `GridLayoutItemInfoEdge.test.ets` | area 前后空段、仅逗号、小数、十六进制、NaN/Infinity、大整数、制表符 | 10 |
| `DataSourceExtended.test.ets` | MyDataSource 与 LauncherDataSource 的 totalCount/getData/addData/pushData | 10 |
| `CheckEmptyUtilsEdge.test.ets` | undefined/null/空串/空白串/0/false/空数组/非空容器/数组边界 | 8 |
| `FormModelCache.test.ets` | FormModel 表单列表存储、读取、覆盖、隔离与引用语义 | 6 |
| `ResourceManagerCache.test.ets` | 资源缓存读写、覆盖、删除、类型隔离、容量淘汰、对象/空键、图标/名称回退 | 16 |
| `DataSourceListener.test.ets` | 数据变更监听注册、通知、移动、删除、注销与重复注册 | 8 |
| `RdbContract.test.ets` | 表名、建表 SQL、字段集合、数据库配置、RdbManager API | 5 |
| `BundleContract.test.ets` | Bundle 标识、系统应用标记、entry 模块与主元素、权限声明、安装时间、代码路径、安装模式 | 9 |
| `GridLayoutMatrixExtended.test.ets` | 30 组 ResultSet 行映射矩阵 | 30 |
| `BeanMatrixExtended.test.ets` | 30 组 AppItemInfo/CardItemInfo 字段矩阵 | 30 |
| `ResourceManagerAsync.test.ets` | 异步资源读取、图标/名称回调、缓存写入/命中、异常回退、空名称回退 | 12 |
| `DesktopLayoutPosition.test.ets` | 空列表、首行/第二行/末格位置、应用元数据转换、布局缓存、FormModel 委托 | 10 |

> 合计 **202 条** 自动化用例。2026-11-12 在 `default` 开发板（API 26）执行结果：`Tests run: 202, Failure: 0, Error: 0, Pass: 202`。

## 说明

- 测试直接导入 `@ohos/base` 的公共类与常量，断言产品实现返回值，不在测试内重复实现业务逻辑。
- `GridLayoutItemInfoParse` 使用本地 `FakeResultSet` 提供列索引和字段值，验证真实 `fromResultSet` 映射与 `area` 解析。
- `DataSourceExtended` 验证数据源对构造数组的引用、头尾插入和追加行为。
- 修复 `getAppNameWithCache` 误用 `KEY_ICON` 读取名称缓存的问题，并补充名称缓存命中回归用例。
- UI 场景（桌面展示、添卡片、卸载、最近任务等）仍需在目标设备上手工验证。
