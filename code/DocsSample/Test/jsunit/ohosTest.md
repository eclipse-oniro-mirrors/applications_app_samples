# 安全 ohosTest 说明

## 本轮新增与验证状态（2026-11-21）

- 保留上一阶段全部 44 个有效 it、1 个原 xit、旧辅助代码和原工程配置；新增 33 个断言主题文件、132 例。
  当前共 176 个有效 it；整个 `entry/src/ohosTest/**/*.ets` 为 49844 行，其中 `ets/test` 为 49724 行。
  新增测试代码为 47199 行；物理行包括输入、独立预期、注册及辅助文件，不把行数当成覆盖点数量。
- 264 组 matcher/否定标记/实际值/预期值组合全部唯一，132 组接受、132 组预期拒绝。
  覆盖标量比较、字符串转义、不同数组布局及长度/顺序/单项变化、小数组与正负零。
  不使用模板轮转；每例只创建两组输入，最多 24 次实际断言动作，注册回调不创建数据。
- 新代码使用真实 Hypium 断言服务和旧 `AssertionObservation`，预期失败在隔离 record 中观察；
  每行验证异常名称、报告标记、精确消息、用户消息和原 record 身份，再验证一次干净断言及 record 恢复。
  每条外层断言前记录参数；每例以原 `TestPace` 让出事件循环 30ms，不新增 UI 或生命周期操作。
- 独立 Python oracle 的 264 组结果已与备份中真实 Hypium 实现交叉核验，mismatches 为 0。
  主机另执行实际 33 个新增文件的 132 个回调及原隔离辅助代码，2640 条外层断言无失败，record 均恢复。
  该诊断将平台 Core 接口接到主机 record，并使用现有 TypeScript 转译；不是 ArkTS 编译、真实 runner 或设备 Pass。
- 编译仅在新独立备份 `E:/backup/jsunit_safe_completion_20261121` 尝试。
  `completion_jsunit_final_test.log` 与 `completion_jsunit_final_main.log` 表明原 4.0.4 插件缺离线元数据，
  同时有用户目录未匹配 npmrc 的 00303137 提示；未进入 ArkTS 编译，未生成本轮可验收的测试 HAP。
  未修改源码 hvigor/依赖、用户 npmrc、权限、设备类型或签名配置，不反复联网或改版本绕过。
- 新增文件与生成器预期逐文件一致；冻结基线中的旧测试、main、AppScope 与配置均未修改。
  已同步测试及既有文档到新备份；设备列表为空，未安装或运行，仍待真实 ArkTS 编译与单次全量两轮验收。

## 上一阶段验证状态与规模（2026-11-20）

- 源码：`E:/git_all/MY_GIT/applications_app_samples_7679/code/DocsSample/Test/jsunit`；备份：`E:/backup/jsunit`。
- bundleName：`com.samples.test.jsunit`；主模块 `entry`，测试模块 `entry_test`，主 Ability `EntryAbility`。
- 本轮只修改 `entry/src/ohosTest/**` 内测试代码/data.json 和既有 `README_zh.md`、`ohosTest.md`，同步相同文件到备份。
  不覆盖工程、main、AppScope、manifest、权限、deviceTypes、签名、hvigor、依赖或全局配置；未 commit/push。
- 实际计数为 44 个有效 `it`、1 个原 `xit`。整改前 64 个 it 减少 20 个：
  AssertExample 的 30 个薄例按相异输入、正负和 API 主题聚合为 11 例；dataDriver 两个空/done-only 例与
  paramExample 原两例聚合为三例。并非删除业务失败或把失败改成 skip，原 xit 不计有效用例或通过。
- 行数口径为 `entry/src/ohosTest/ets/test/**/*.ets` 的全部物理行，含注册与辅助文件，不含 JSON/文档。
  HEAD 基线 1697 行，当前 2525 行，净增 828 行；距约 50000 行仍差 47475 行，未达标。
  不复制常量、相同 arrange、重复输入或新增无关框架矩阵填充缺口。
- List 保留原 27 个教学入口加既有 EntryAbilitySequence，共 28 个可运行注册入口。
  dataDriver 文件仍有入口，委托参数主题注册原 AbilityTest 套件；独立审计的 suites=27 是含 it 的物理文件数，
  不等于删掉一个教学入口。data.json 的新 it 选择器与两个形参的回调匹配，真实注入套件、条目及两行不同数据。
  原 suite stress=4/item stress=2 保留教学语义，其执行重复不计新增覆盖。
- 全部 44 例采用全局唯一 `testXxxNNNN`、六项 `@tc` 字段及 `@tc.level Level1`，每例至少三条有效断言，
  有 HiLog 输入/状态诊断和每例 30ms pace。代码补齐显式变量、参数、回调返回类型及空行，行宽不超过 120。

## 实际整改与清理边界

- `EntryAbilitySequence.test.ets` 沿用同一例，导入真实 main EntryAbility 与默认导出的 Logger 实例。
  使用已装 Hypium 1.0.29 的 MockKit 拦截 Logger.info，afterAction 收集原始 string[] 参数。
  MockKit 同时匹配参数个数，故注册三个 ArgumentMatchers.any 对应 main 实际三个参数，无动态 rebind。
  只调用上下文无关的 onCreate（合法 Want/LaunchParam）、onForeground、onBackground、onDestroy，
  断言 create 参数、前后台有序参数、destroy 参数及四次调用数；finally clear(Logger)。
  不再重复 customFun 常量伪称生命周期覆盖，不在未创建 WindowStage 时调用其 destroy。
- ExecuteOrder1 将 afterAll 中的状态断言移到活跃 case 的 afterEach，避免 suite hookError 假绿。
  ExecuteOrder2 的 A 指定 before hook 直接 reset，B 指定 before hook 先 reset 再 B++，普通 beforeEach 仅 pace。
  Hypium 1.0.29 的指定 hook map 循环只检查首条 entry，因此使用一条指定 hook 显式按当前 it 分发 A/B。
- coverExample 移除恒真布尔断言和重复 nested beforeEach，以真实 beforeAll setup trace、局部 beforeEach trace
  和 Map 中 outer/inner 范围状态验证父子语义，不复制 ExecuteOrder4 的继承案例。
  Order3 保留原 xit，active case 验证 skipped body 未执行及当前 it/describe 身份，不再为空例。
- AfterThrow 在 catch 外验证确实抛出、精确字符串 error xxx 及不是 Error，同时验证原方法基线与 clear 后恢复。
  unregister 后的调用也在外部验证 threw、Error 身份和精确消息，不抛不能通过。
  每个 Mock 用例用 finally clear 对应实例或类；每个自定义断言用例 finally unregister，不靠泄漏的 afterEach 注册。
- Any/String/Regex 保留不同类型及匹配边界；Clear/Ignore 分别验证整体清理和选择性恢复，静态/私有/属性 Mock
  验证真实基线、mock 状态和恢复，Promise Mock 等待真实结果；verify 保留真实调用和次数/参数验证。
  真实主机诊断发现 MockKit.getReturnInfo 对零参数调用回退到最后设置的 stub，VertifyTimes 保留七次调用和
  次数验证，断言该实际回退值及非空不匹配参数的原结果，不删失败例或改框架。
- AssertExample 按包含、标量、深比较、Promise 等原 API 主题聚合，保留相异输入与正负断言。
  Hypium 在抛 AssertException 前先标记当前 spec.fail；AssertionObservation 选择独立 record，
  只接受真正记录的 AssertException，验证名称、消息和记录标记，finally 恢复原 record，非预期被测错误重新抛出。
  assertClose 保留 100/99、precision=0.1 的相对误差正向，使用 0.001 观察真正拒绝，不能把原正向误写为失败。
- JsUiSession 删除 mainStarted 缓存，每例 pace 后重新 start 本 bundle EntryAbility、等待真实 Hello World 并确认 top。
  首页与 custom 例去掉 beforeAll 缓存依赖，finally 只对确认本 bundle 的 EntryAbility 调用 terminateSelf；
  不 force-stop runner，不吞通用 16000100，不点击 next page。
- 资源例从 delegator.getAppContext().resourceDir 获取实际测试模块目录，不启动 TestAbility，也不猜外部路径。
  真实验证 test.txt 文件名、23 字节及 Resource Reference Test 精确内容，finally 关闭 fd。

## 实际审计与保护核验

- `ohos-testcase-supplement` 技能的 `scripts/audit_cases.js` 已逐 11 个目录运行，
  汇总 44 例；重名、tc.number 重复、元数据问题、少于三条静态 expect 均为 0，不能仅将顶层 total=1 当全量。
  输出：`E:/backup/remaining_jsunit_node_audit.log`。
- `python E:/backup/remaining_audit.py jsunit` 最终实测：suites=27、cases=44、ets_lines=2525、issues=0、
  exact_duplicate_groups=0、literal_masked_candidates=2、main_changed=0、source_backup_mismatches=0。
  命名、tc/Level、断言、空行及宽度候选为 0；全文显式声明、禁止类型/非空断言/locale 静态复核未发现问题。
  ArgumentMatchers.any 是已装 SDK 的合法 matcher 成员，不是 any 类型；未修改规范脚本或依赖。
  自有 Python 审计修复正则字面量漏计和点号成员误判，保留原有断言、命名与重复检查。
  输出：`E:/backup/remaining_jsunit_audit.json`。
- 两组近似候选逐一保留并复核：
  1. ExecuteOrder2 的 testJsunitSpecifiedHooks0001/0002：A 的指定 before 仅 reset；B reset 后 B++ 并留下 before B，
     断言不同指定 hook 输入及 A/B 状态，不是重复常量。
  2. ExecuteOrder4 的 testJsunitParentHooks0001/testJsunitChildHooks0002：验证 beforeEachIt 继承，
     父局部 beforeEach 不继承；trace 为 BA/BFE，parent/child 计数为 1/0 与 0/1，语义真实不同。
- 源码和备份 main 各 10 文件、AppScope 各 3 文件，共 13 个冻结基线文件，逐文件 SHA-256 均 0 差异。
  本轮未修改配置；工作区先前已有根 compileSdkVersion 从 20 改为 26.0.0 的变更保留不动。
  profile_scope_ok=true 不代表所有配置相对 HEAD 零差异，不能将先前变更说成本轮授权修改。
- 最后构建前后另核验源 29 个/备份 30 个非测试受保护文件及已装 Hypium 的 60 个文件，哈希差异均为 0。
  全部允许修改的测试代码、data.json 和两份既有文档已同步备份并逐文件比对一致；未回写构建生成物。

## 构建与运行限制

- 最后仅一次在 `E:/backup/jsunit` 执行测试构建，保留原 @ohos/hvigor-ohos-plugin 4.0.4。
  只在进程中设置 npm_config_registry 和 npm_config_@ohos:registry 为华为 npm 仓库，未写 npmrc 或改全局配置。
- 最新证据 `E:/backup/remaining_jsunit_test.log`：ERR_PNPM_FETCH_404，
  `https://repo.huaweicloud.com/repository/npm/@ohos%2Fhvigor-ohos-plugin` 返回 404，随后 00308019。
  缺用户 npmrc 提示已消除，但原插件仍不可得；未进入 ArkTS 编译，不宣称编译通过或测试 HAP 已生成。
- 主机使用真实已装 Hypium 1.0.29 和实际 main EntryAbility/Logger 做额外逻辑诊断，修正零参数 stub 回退后
  51 条执行记录未发现失败。只适配平台模块导入，不执行 UI/资源/设备 API；这不是 ArkTS 编译、aa 全量或设备 Pass。
- 最新 `hdc list targets` 返回 `[Empty]`，无设备；未安装、卸载或设备运行，不填 UI/SDK Pass 或设备 Tests run 数。
  原环境由用户在许可范围外自行修复后再编译；有设备且签名符合时使用原 runner 单次全量运行，不按 class 筛选或跳过失败。
