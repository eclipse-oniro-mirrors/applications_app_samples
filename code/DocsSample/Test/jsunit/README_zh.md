# 测试框架

### 介绍
本示例展示测试框架中单元测试框架的使用示例。

本实例用到了自动化测试框架代码部件仓arkXtest，测试框架的详细介绍[arkXtest](https://docs.openharmony.cn/pages/v5.1/zh-cn/application-dev/application-test/arkxtest-guidelines.md)。   

如需日志打印调试，需要引入日志打印接口[@ohos.hilog](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-performance-analysis-kit/js-apis-hilog.md) 。

单元测试用例相较于UI自动化测试用例而言更偏重于接口返回数据的校验及逻辑处理。


### 效果预览
不涉及

使用说明
- 将jsunit目录下的项目工程整体导入到DevEco Studio开发工具中。
- 查看ohostest目录下的测试代码实现。
- 在DevEco Studio中执行测试用例代码查看执行效果，执行方式请[参考](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/application-test/arkxtest-guidelines.md) 。

### 工程目录

```
jsunit
|-----entry 
          |-----src/main/pages
                |-----index.ets                         // 放页面组件 
          |-----ohosTest                                // 放自动化测试用例
                |-----ets/test/basicExampleTest
                      |-----basicExampleTest.ets        // 放自动化测试脚本，其中it()就是一个测试用例
|-----AppScope
          |-----app.json5                               // 定义应用唯一的包名："bundleName": "com.samples.test.jsunit",
```

### 具体实现

#### jsunit单元测试框架示例内容
* 1）在entry的index.ets中放页面组件。
* 2）在ohosTest的test/basicExample.test.ets中it()定义一条测试用例，支持三个参数：用例名称，过滤参数和用例函数。用例操作的行为以异步的形式编写。
* 3）通过Want配置指定唯一的ability即entry：通过want()中指定bundleName：com.samples.test.jsunit和abilityName：EntryAbility。
* 4）启动指定ability(相当于手动运行hap)：通过abilityDelegatorRegistry.getAbilityDelegator.startAbility(want)。
* 5）获取当前应用最顶层的ability对象：通过abilityDelegatorRegistry.getAbilityDelegator.getCurrentTopAbility().then((ability)=>{}) 。
* 6）在第5步.then()中加入需要测试内容：
    * 例如本案例中需要检验当前UIAbility的abilityname是否正确，在第五步中引入断言接口，并检查断言结果是否符合预期：通过expect().assertEqual()断言检查实际值（actualvalue）是否等于期望值（expectvalue）。
* 7）测试完毕： done();


### 相关权限
不涉及

### 依赖
不涉及

### 约束与限制
1.本示例仅支持标准系统上运行，支持设备：RK3568。

2.本示例为Stage模型，支持API12版本SDK，SDK版本号(API Version 12 Release),镜像版本号(5.0.0.23)。

3.本示例需要使用DevEco Studio 版本号(4.1.3.501 Release)及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/Test/jsunit > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```


### 本次存量测试整改（2026-11-20）

- 整改前 64 个 it 聚合为 44 个有效 it，保留 1 个原 xit，但不计有效用例或通过。
  测试目录 ETS 共 2525 行，相对 HEAD 基线 1697 行净增 828 行；距约 50000 行仍差 47475 行。
  不复制常量、重复输入或框架案例凑数量，也不删除或跳过业务失败。
- 全部 44 例采用唯一 testXxxNNNN、六项 tc 字段、Level1、至少三条有效断言、HiLog、30ms pace，
  补齐显式类型与空行，行宽不超过 120。原 27 个教学入口及既有 EntryAbilitySequence 入口均保留。
- EntryAbilitySequence 的同一例改为拦截真实 main Logger 参数，验证创建、前后台顺序及销毁日志；
  修复钩子断言时机、异常假绿与 Mock/自定义断言清理，聚合断言及数据驱动的重复或空例。
- 首页/custom UI 每例重新启动并确认本 bundle EntryAbility，仅安全 terminateSelf；
  资源例读取 delegator.getAppContext().resourceDir，验证文件名、23 字节、精确内容，finally 关闭 fd。
- Node 逐 11 目录审计共 44 例，命名、元数据、三断言问题为 0；独立审计 issues=0、exact=0，
  两组近似候选是指定钩子 A/B 与父/子继承语义差异，详见 [ohosTest.md](ohosTest.md)。
- 允许范围的代码、data.json 及两份既有文档已同步到 `E:/backup/jsunit`，逐文件差异为 0。
  main 10 文件和 AppScope 3 文件对冻结基线均为 0 差异；本轮未改配置、权限、签名、hvigor 或依赖。
  工作区先前已有 compileSdkVersion 变更保留不动，不将其说成本轮变更或 HEAD 配置零差异。
- 最后一次备份构建仍因原 @ohos/hvigor-ohos-plugin 4.0.4 在华为 npm 仓库 404 而阻断，
  日志 `E:/backup/remaining_jsunit_test.log`；仅设置进程 registry 环境变量，未写 npmrc，未进入 ArkTS 编译。
- hdc 无设备，未安装、卸载或设备运行，不填 Pass；主机真实 Hypium 逻辑诊断无失败，不等于设备验证。

### 本轮断言补测（2026-11-21）

- 在上述 44 个有效 it 与 1 个原 xit 基础上新增 33 套、132 例，目前共 176 个有效 it。
  全部 ohosTest ETS 为 49844 行，其中 ets/test 为 49724 行；不改旧用例、main 或原工程配置。
- 新增 264 组唯一比较输入，覆盖数字、字符串、数组及正负零边界；每例两组输入、最多 24 次断言动作，
  数据只在执行时创建，每例 30ms 节流，预期失败与真实 case record 隔离并验证恢复。
- 264 组独立 oracle 与真实 Hypium 实现核对一致；主机执行实际新增 132 个回调，2640 条外层断言无失败。
  这是主机逻辑诊断，不是 ArkTS 编译或设备 Pass。
- 测试与既有文档同步至 `E:/backup/jsunit_safe_completion_20261121`；该备份 test/main 均被原 4.0.4 插件
  缺离线元数据和 npmrc 配置提示阻断，未进入 ArkTS 编译，未修改依赖或用户配置绕过。
  无设备，尚未完成真实 runner 全量运行；完整统计口径与限制见 [ohosTest.md](ohosTest.md)。
