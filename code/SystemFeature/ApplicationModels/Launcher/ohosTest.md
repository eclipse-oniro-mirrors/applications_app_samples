# Launcher 测试用例说明

## 测试环境

- Bundle：`ohos.samples.launcher`
- 测试模块：`entry_test`
- 测试框架：`OpenHarmonyTestRunner`
- SDK：API version 26.0.0

## 自动化测试套件

| 测试文件 | 用例数 |
|---|---:|
| `Ability.test.ets` | 3 |
| `BaseLogic.test.ets` | 7 |
| `BeanMatrixExtended.test.ets` | 30 |
| `BeansExtended.test.ets` | 10 |
| `BundleContract.test.ets` | 9 |
| `CheckEmptyUtilsEdge.test.ets` | 8 |
| `ConstantsExtended.test.ets` | 10 |
| `DataSourceExtended.test.ets` | 10 |
| `DataSourceListener.test.ets` | 8 |
| `DesktopLayoutPosition.test.ets` | 10 |
| `FormModelCache.test.ets` | 6 |
| `GridLayoutData.test.ets` | 5 |
| `GridLayoutItemInfoEdge.test.ets` | 10 |
| `GridLayoutItemInfoParse.test.ets` | 13 |
| `GridLayoutMatrixExtended.test.ets` | 30 |
| `LauncherAbilityFinal.test.ets` | 50 |
| `LauncherAbilityModelMatrix.test.ets` | 40 |
| `LauncherPlusBeans.test.ets` | 45 |
| `LauncherPlusConstants.test.ets` | 60 |
| `LauncherPlusEvents.test.ets` | 60 |
| `RdbContract.test.ets` | 5 |
| `ResourceManagerAsync.test.ets` | 12 |
| `ResourceManagerCache.test.ets` | 16 |

合计：**23 个测试套件，457 条用例**。

> 以上用例数与 `List.test.ets` 中实际注册的套件和用例数一致。

## 运行方式

```bash
aa test -b ohos.samples.launcher -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 900000
```
