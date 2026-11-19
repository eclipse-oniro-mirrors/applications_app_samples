# DLPCApiTest 测试用例归档

用例位于 `entry/src/ohosTest`，共十个测试文件 578 条用例。编号规则：`@tc.name` 后缀四位数字按文件内顺序从 0001 开始逐 1 递增；`@tc.number` 前缀按文件区分（`SUB_DLP_C_API_ABILITY_`、`SUB_DLP_C_API_DLPSANDBOX_`、`SUB_DLP_C_API_CONTRACT_`、`SUB_DLP_C_API_READONLY_`、`SUB_DLP_C_API_STATE_`、`SUB_DLP_C_API_FINAL_`、`SUB_DLP_C_API_VOLUME_`），序号按文件内顺序递增；`@tc.desc` 为英文描述。

执行方式：DevEco Studio 中选中 entry 模块右键 `Run 'test'`，或命令行 `hvigorw --mode module -p module=entry@ohosTest -p product=default test`。

## 一、Ability.test.ets（应用信息与 native 库导出，4 条）

| 用例编号 | 用例名 | 预置条件 | 测试点 | 预期输出 | 测试结果 |
|:---:|---|---|---|---|:---:|
| SUB_DLP_C_API_ABILITY_0100 | testAppContext0001 | 测试进程已启动 | 应用上下文、资源管理器可用，应用名与包名一致 | 断言通过 | Pass |
| SUB_DLP_C_API_ABILITY_0200 | testBundleInfo0001 | 应用已安装 | 包名、versionName、versionCode 与 app.json5 一致 | 断言通过 | Pass |
| SUB_DLP_C_API_ABILITY_0300 | testNapiExported0001 | native 库已编译打包 | libentry.so 导出 6 个 CAPI 封装函数 | 6 个均为 function 类型 | Pass |
| SUB_DLP_C_API_ABILITY_0400 | testStartEntryAbility0001 | 应用已安装 | 入口 Ability 可被正常拉起 | startAbility 回调无错误 | Pass |

## 二、DlpSandbox.test.ets（DLP CAPI 行为，9 条）

| 用例编号 | 用例名 | 预置条件 | 测试点 | 预期输出 | 测试结果 |
|:---:|---|---|---|---|:---:|
| SUB_DLP_C_API_DLPSANDBOX_0100 | testGetDlpPermissionInfo0001 | 应用处于非 DLP 沙箱环境 | OH_DLP_GetDlpPermissionInfo 返回值 | 返回 19100006 | Pass |
| SUB_DLP_C_API_DLPSANDBOX_0200 | testGetDlpPermissionInfoRepeat0001 | 同上 | 重复调用的结果稳定性 | 两次返回值相同 | Pass |
| SUB_DLP_C_API_DLPSANDBOX_0300 | testGetOriginalFileName0001 | 设备正常运行 | OH_DLP_GetOriginalFileName 对 test.txt.dlp 的处理 | 返回 test.txt | Pass |
| SUB_DLP_C_API_DLPSANDBOX_0400 | testGetOriginalFileNameRepeat0001 | 同上 | 重复调用的结果稳定性 | 两次返回值相同且为 test.txt | Pass |
| SUB_DLP_C_API_DLPSANDBOX_0500 | testIsInSandbox0001 | 应用处于非 DLP 沙箱环境 | OH_DLP_IsInSandbox 返回值类型与内容 | 返回 boolean false | Pass |
| SUB_DLP_C_API_DLPSANDBOX_0600 | testIsInSandboxRepeat0001 | 同上 | 重复调用的沙箱状态一致性 | 两次返回值相同 | Pass |
| SUB_DLP_C_API_DLPSANDBOX_0700 | testSetSandboxAppConfig0001 | 设备正常运行 | OH_DLP_SetSandboxAppConfig 设置配置信息 | 返回 0 | Pass |
| SUB_DLP_C_API_DLPSANDBOX_0800 | testGetSandboxAppConfig0001 | 设备正常运行 | 设置后读取沙箱应用配置信息 | 返回 configInfo | Pass |
| SUB_DLP_C_API_DLPSANDBOX_0900 | testSandboxAppConfigLifecycle0001 | 设备正常运行 | 设置-读取-清理的完整生命周期 | 设置 0、读取 configInfo、清理 0、清理后不可读到 configInfo | Pass |

## 三、手工 UI 用例

| 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| 拉起应用 | 设备正常运行 | 无 | 成功拉起应用，显示 DLP CAPI TEST 首页 | Pass |
| 进入 CAPI 测试页 | 成功进入首页 | 点击 c api test 按钮 | 成功进入 C Api Test 页面，显示 6 个接口按钮 | Pass |
| 调用 GetDlpPermissionInfo | 已进入 CAPI 测试页 | 点击 GetDlpPermissionInfo | 页面显示 19100006 | Pass |
| 调用 GetOriginalFileName | 已进入 CAPI 测试页 | 点击 GetOriginalFileName | 页面显示 test.txt | Pass |
| 调用 IsInSandbox | 已进入 CAPI 测试页 | 点击 IsInSandbox | 页面显示 false | Pass |
| 调用 SetSandboxAppConfig | 已进入 CAPI 测试页 | 点击 SetSandboxAppConfig | 页面显示 0 | Pass |
| 调用 GetSandboxAppConfig | 已进入 CAPI 测试页 | 先点击 Set 再点击 Get | 页面显示 configInfo | Pass |
| 调用 CleanSandboxAppConfig | 已进入 CAPI 测试页 | 点击 CleanSandboxAppConfig | 页面显示 0 | Pass |
| 清屏 | 已进入 CAPI 测试页 | 点击 clear 按钮 | 页面显示内容被清空 | Pass |

## 四、DlpApiContract.test.ets（95 条）

| 用例范围 | 测试内容 | 预期输出 | 测试结果 |
|---|---|---|---|
| testDlpContract0001-0075 | 五个零参数 API 的 2-16 次重复调用稳定性 | 返回值保持一致 | Pass |
| testDlpContract0076-0115 | Set/Get/Clean 配置生命周期组合 | 设置 0、读取 configInfo、清理 0 | Pass |
| testDlpContract0116-0145 | 配置设置/读取/清理压力循环 | 每轮均成功且清理后不可读 | Pass |
| testDlpContract0146-0165 | 六个 API 返回类型校验 | number/string/boolean 类型正确 | Pass |

## 五、DlpApiReadOnly.test.ets（DlpApiReadOnlyPart01/02，120 条）

| 用例范围 | 测试内容 | 预期输出 | 测试结果 |
|---|---|---|---|
| testDlpReadOnly0001-0040 | GetDlpPermissionInfo 2-41 次只读重复 | 始终返回 19100006 | Pass |
| testDlpReadOnly0041-0080 | GetOriginalFileName 2-41 次只读重复 | 始终返回 test.txt | Pass |
| testDlpReadOnly0081-0120 | IsInSandbox 2-41 次只读重复 | 始终返回 false | Pass |

## 六、DlpApiState.test.ets（30 条）

| 用例范围 | 测试内容 | 预期输出 | 测试结果 |
|---|---|---|---|
| testDlpState0001-0010 | Set/Get/Clean 单次状态 | 设置 0、读取 configInfo、清理 0 | Pass |
| testDlpState0011-0020 | Clean 后读取 | 不再返回 configInfo | Pass |
| testDlpState0021-0030 | 配置与三个只读 API 混合 | 各接口返回值稳定 | Pass |

## 七、DlpApiFinal.test.ets（20 条）

| 用例范围 | 测试内容 | 预期输出 | 测试结果 |
|---|---|---|---|
| testDlpFinal0001-0005 | Set/Get/Clean 配置往返 | 设置 0、读取 configInfo、清理 0 | Pass |
| testDlpFinal0006-0010 | Clean 后读取 | 不再返回 configInfo | Pass |
| testDlpFinal0011-0015 | 三个只读 API 组合 | 19100006 / test.txt / false | Pass |
| testDlpFinal0016-0020 | 配置设置到清理 | 清理后不可读 | Pass |

## 八、DlpApiVolume.test.ets（DlpApiVolumePart01/02/03，300 条）

| 用例范围 | 测试内容 | 预期输出 | 测试结果 |
|---|---|---|---|
| testDlpVolume0001-0100 | GetDlpPermissionInfo 单次只读 | 19100006 | Pass |
| testDlpVolume0101-0200 | GetOriginalFileName 单次只读 | test.txt | Pass |
| testDlpVolume0201-0300 | IsInSandbox 单次只读 | false | Pass |
