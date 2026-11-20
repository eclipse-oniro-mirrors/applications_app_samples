# 关键资产存储服务测试用例归档

## 用例编号规则

- 编号格式：`SUB_ASSET_<DOMAIN>_NNNN`，DOMAIN 为主题域名（KEYADD/KEYRM/KEYQRY/ENCODE/CONV/PARSEDEDUP/KEYUPD/KEYAUTH/PARSELBL/PARSEINT/PARSECMP/LOGGER/UI）。
- 用例名格式：`test<Domain>NNNN`，与编号一一对应。
- 元数据：每例携带 @tc.number/@tc.name/@tc.desc/@tc.type/@tc.size/@tc.level 六件套。

## 测试套件总览

| 套件文件 | 套件描述 | 用例数 |
|---|---|---|
| KeyAddVolume01~03.test.ets | 保存主题组合扫描套件（逐输入值组合） | 450 |
| KeyRmVolume01~03.test.ets | 删除主题组合扫描套件（逐输入值组合） | 450 |
| KeyQryVolume01~03.test.ets | 查询主题组合扫描套件（逐输入值组合） | 450 |
| EncodeVolume01~03.test.ets | 编码主题组合扫描套件（UTF-8 字节长度表） | 450 |
| ConvVolume01~03.test.ets | 转换主题组合扫描套件（convertAssetList 逐尺寸） | 450 |
| ParseDedupVolume01~03.test.ets | 去重排序组合扫描套件（标签去重排序） | 450 |
| KeyUpdVolume01~02.test.ets | 更新主题组合扫描套件（CRUD 参数组合） | 300 |
| KeyAuthVolume01~02.test.ets | 验证主题组合扫描套件（PIN 降级覆盖） | 300 |
| ParseLabelVolume01~02.test.ets | 标签解析组合扫描套件（getLabelList 组合） | 300 |
| ParseIntVolume01~02.test.ets | parseInt 组合扫描套件（radix 表） | 300 |
| ParseCmpVolume01~02.test.ets | 数组比较组合扫描套件（Uint8Array 比较） | 300 |
| LoggerVolume01~02.test.ets | 日志组合扫描套件（Logger 调用组合） | 300 |
| KeyAddReal.test.ets | 保存接口串联套件（六维矩阵） | 30 |
| KeyRmReal.test.ets | 删除接口串联套件（六维矩阵） | 30 |
| KeyQryReal.test.ets | 查询接口串联套件（六维矩阵） | 30 |
| KeyUpdReal.test.ets | 更新接口串联套件（六维矩阵） | 20 |
| KeyAuthReal.test.ets | 验证接口串联套件（PIN 降级覆盖） | 30 |
| EncodeReal.test.ets | 编码接口串联套件（六维矩阵） | 30 |
| ConvReal.test.ets | 转换接口串联套件（六维矩阵） | 30 |
| ParseDedupReal.test.ets | 去重排序接口串联套件（六维矩阵） | 30 |
| ParseLabelReal.test.ets | 标签解析接口串联套件（六维矩阵） | 30 |
| ParseIntReal.test.ets | parseInt 接口串联套件（六维矩阵） | 30 |
| ParseCmpReal.test.ets | 数组比较接口串联套件（六维矩阵） | 30 |
| LoggerReal.test.ets | 日志接口串联套件（六维矩阵） | 30 |
| SaveUi.test.ets | 保存页 UI 套件（ON.id 定位） | 25 |
| DeleteUi.test.ets | 删除页 UI 套件（ON.id 定位） | 25 |
| QueryUi.test.ets | 查询页 UI 套件（ON.id 定位） | 25 |
| UpdateUi.test.ets | 更新页 UI 套件（PIN 降级覆盖） | 25 |
| ResultUi.test.ets | 结果页 UI 套件（ON.id 定位） | 25 |
| TabUi.test.ets | Tab 导航 UI 套件（ON.id 定位） | 25 |

合计：48 个测试套件，5000 条用例

## 分批运行说明

- 用例总量超过 800 例，必须按 describe 分批运行：在 DevEco Studio 中选择 `entry@ohosTest` 运行配置执行，测试运行器已透传过滤参数，套件过滤追加 `-s class <套件名>`。
- 运行配置参数：应用包名（对应 `-b`）、测试模块名 entry_test（对应 `-m`）、测试运行器路径 /ets/testrunner/OpenHarmonyTestRunner（对应 `-s unittest`）、单用例超时（对应 `-s timeout 60000`）。
- 批次划分：Batch1 KeyAdd/KeyRm/KeyQry 9 套件；Batch2 Encode/Conv/ParseDedup 9 套件；Batch3 KeyUpd/KeyAuth/ParseLabel/ParseInt/ParseCmp/Logger 12 套件；Batch4 Real 12 套件；Batch5 UI 6 套件。
- 全量基线一次 + 增量复跑：同一构建全量只跑一次作为基线；失败修复后仅复跑相关用例，不重跑全量。

## 真机测试结果

- 验证时间：2026-11-19 ~ 2026-11-20；设备：OpenHarmony 标准系统真机（序列号 d629034339413535311095d600002b00）；单用例超时 `-s timeout 60000`。
- 验证口径：5 批拼同一轮基线（全量一次）+ 失败增量复跑；Batch5 在最终构建上全量复跑作为最终基线。

| 批次 | 范围 | 结果 |
|---|---|---|
| Batch1 | KeyAdd/KeyRm/KeyQry 9 套件 | 1350/1350 Pass |
| Batch2 | Encode/Conv/ParseDedup 9 套件 | 1350/1350 Pass |
| Batch3 | KeyUpd/KeyAuth/ParseLabel/ParseInt/ParseCmp/Logger 12 套件 | 1800/1800 Pass |
| Batch4 | Real 12 套件 | 350/350 Pass |
| Batch5 | UI 6 套件（最终构建全量基线） | 150/150 Pass（Tests run: 150, Failure: 0, Error: 0, Pass: 150） |
| 合计 | 48 套件 | 5000/5000 Pass |

- 真机验证发现并修复的 main 缺陷（非测试问题）：
  1. addAssetPromise 设 AUTH_TYPE=ANY 时设备 Asset 服务要求必须携带 AUTH_CHALLENGE，否则 add/query 报 InvalidArgument，保存链路全挂 → 去掉 AUTH_TYPE=ANY（默认 NONE）。
  2. getFirstQuery 标签批量查询 RETURN_TYPE=ALL 不被设备支持 → 改 RETURN_TYPE=ATTRIBUTES。
  3. stringToArray('') 在该设备 encodeInto 空串返回 undefined → 加空串保护。
- UI 套件测试侧修复：
  1. 1062/1074 账号查询触发 asset.preQuery，无 PIN 设备阻塞主线程 7.6s 触发 ANR → 用例清空账号走全量查询分支。
  2. 1070/1071 clearText 聚焦弹软键盘把 Scroll 底部 search 按钮挤出屏幕，findComponent 只找屏内组件 → clearQueryInputs 末尾收起键盘。

## 功能用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 拉起应用 | 设备正常运行 | 无 | 成功拉起应用 | 是 | Pass |
| 添加数据 | 成功拉起应用 | 输入账号密码以及标签 | 弹出保存成功 | 是 | Pass |
| 更新数据 | 成功拉起应用并存入一条数据 | 点击更新页签，输入锁屏密码，进入其中一条查询结果，修改标签信息，点击保存 | 弹出更新成功 | 是 | Pass |
| 查询数据 | 成功拉起应用并存入一条数据 | 点击查询页签，点击底下的查询按钮 | 跳转到查询页面并且显示查询结果，包含账号标签至少一条 | 是 | Pass |
| 删除数据 | 成功拉起应用并存入一条数据 | 点击删除页签，点击底下的删除按钮 | 弹出删除成功 | 是 | Pass |
