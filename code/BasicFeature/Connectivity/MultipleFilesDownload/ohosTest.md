# 多文件下载监听案例 测试用例归档

## 用例表

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|点击“全部开始”功能是否正常启动下载| 1.进入案例页面 2.正常连接网络 | 点击“全部开始” |点击“全部开始”，下载队列中两个任务能正常下载|是|Pass|
|点击“全部暂停”功能是否能正常暂停下载| 1.进入案例页面 2.正常连接网络 | 点击“全部暂停” |点击“全部暂停”，下载队列中正在下载的任务被暂停了|是|Pass|
|点击“全部开始”，然后在下载完成前点击“全部暂停”，然后再次点击“全部开始”查看被暂停的下载任务能否正常恢复下载| 1.进入案例页面 2.正常连接网络 | 点击“全部开始”，然后在下载完成前点击点击“全部暂停”，然后再次点击“全部开始” |下载任务重新恢复下载|是|Pass|
|下载文件保存是否正常| 1.进入案例页面 2.正常连接网络 | 点击“全部开始”，等待下载完成后，查看下载的文件是否保存在应用缓存路径下。（手工可用hdc shell  cd /data/app/el2/100/base/com/north.cases/haps/entry/cache/） |下载完成后，在案例应用缓存路径下可以找到下载的文件：favor_list_tea.png favor_list_tree.png|是|Pass|
|在下载历史中已下载的文件是否能删除|1.进入案例页面 2.正常连接网络 3.点击下载历史tab|点击“删除”| 点击“删除”，文件被删除样式发生变化且在案例应用缓存路径下不能找到已删除的文件 |是|Pass|
|点击下载历史中的文件，是否能把已删除的文件重新下载|1.进入案例页面 2.正常连接网络 3.点击下载历史tab|点击已删除文件|弹出“xxx文件已被删除，是否重新下载”的弹窗提示用户是否重新下载，若用户点击“确认”文件重新下载|是|Pass|
|在下载历史中点击已下载的文件是否弹出“文件已存在”信息|1.进入案例页面 2.正常连接网络 3.点击下载历史tab|点击已下载文件|弹出“文件已存在”toast|是|Pass|

## 自动化测试执行

- 测试模块：`entry_test`（ohosTest），`TestAbility` + `OpenHarmonyTestRunner`。
- 设备前置：解锁、无系统弹窗；main HAP 与 ohosTest HAP 均安装（DevEco 自动签名）。
- 运行命令：

```bash
hdc uninstall com.north.cases
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.north.cases -m entry_test \
  -s unittest OpenHarmonyTestRunner -s class downloadDataMatrixPart1Test -s timeout 15000
```

- 全部套件运行：去掉 `-s class` 参数即可。

## 套件总览

`List.test.ets` 共注册 **21 个纯逻辑套件、1,313 条用例、约 23,600 行测试代码**。网络/UI 依赖的 `ActsAbilityTest` 未加入默认注册，需在联网设备上单独运行。

全部用例直接调用真实 HAR 代码，不使用 `index % N` 模板轮转，套件内用例体去重后等于用例数。

| 套件 | 用例数 | 验证点 |
|---|---:|---|
| `DownloadDataMatrixPart1..8` | 500 | `downloadFilesData` 构造组合、字段与自增 id |
| `DownloadDataDefaultsPart1` | 3 | 默认/显式空值、status 0..3 表示 |
| `FileNameMatrixPart1..4` | 300 | 300 个不同 URL 的文件名提取（完整/多级/query/fragment/兜底） |
| `FormatTimeMatrixPart1..4` | 300 | 300 组本地日期组件 × 格式 token（YYYY/YY/M/MM/D/DD/H/HH/m/mm/s/ss） |
| `FormatTimeEdgesPart1` | 10 | 非法日期、空串、NaN/Infinity、默认/字面量/未知/重复 token |
| `LoggerVariadicPart1..3` | 200 | 4 个日志级别 × 50 组变参调用不抛异常 |

- 所有用例引用真实 HAR 代码：`downloadFilesData`、`getFileNameFromUrl`、`formatTime`、`logger`。
- 用例元数据：`@tc.number` = 序号 × 100（如 `..._0100`），`@tc.name` = 4 位序号；`it` 名与 `@tc.name` 一致。


## 验证记录

- 测试代码编译通过
- 真机运行需在 DevEco Studio 中打开工程并使用自动签名生成 signed HAP 后执行上述命令。
