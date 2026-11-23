# 测试框架
### 介绍
本示例展示测试框架中白盒性能测试框架的使用示例。

测试框架arkxtest的详细介绍请[参考](https://docs.openharmony.cn/pages/v5.1/zh-cn/application-dev/application-test/arkxtest-guidelines.md) 。

本实例需要引入PerfTest接口[@ohos.test.PerfTest](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-test-kit/js-apis-perftest.md) 。  

### 效果预览
不涉及

使用说明
- 将perftest目录下的项目工程整体导入到DevEco Studio开发工具中。
- 查看ohosTest目录下的测试代码实现。
- 在DevEco Studio中执行测试用例代码查看执行效果，执行方式请[参考](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/application-test/arkxtest-guidelines.md)  

### 工程目录

```
perfTest 
|-----entry 
          |-----src/main/ets/pages
                |-----Index.ets                         // 页面组件 
          |-----ohosTest                                // 自动化测试用例
                |-----ets/test
                      |-----List.test.ets               // 测试套件入口
                      |-----model/PerfTestLogic.ets     // 确定性业务逻辑模型
                      |-----common/PerfTestSupport.ets  // 日志与公共测试工具
                      |-----logic                        // 数据驱动逻辑与调用序列用例
                      |-----core                         // 常量与指标核心用例
|-----AppScope
          |-----app.json5                               // 定义应用唯一的包名："bundleName": "com.samples.test.perftest",
```
 须知

* 前提：引入PerfTest依赖：import { PerfMetric, PerfTest, PerfTestStrategy, PerfMeasureResult } from '@ohos.test.PerfTest';  

### 具体实现

#### PerfTest测试框架示例内容
* 1）测试函数执行期间的应用性能。
* 2）在ohosTest的test/logic、test/core中按业务规则组织用例，每条用例包含输入、确定性期望值与状态断言。
* 3）指定唯一的ability即entry：通过want()中指定bundleName和abilityName：EntryAbility。
* 4）启动指定ability(相当于手动运行hap)：通过abilityDelegatorRegistry.getAbilityDelegator.startAbility(want)。
* 5）获取当前应用最顶层的ability对象：通过abilityDelegatorRegistry.getAbilityDelegator.getCurrentTopAbility().then((ability)=>{}) 。
* 6）引入PerfTest类作为白盒性能测试框架的总入口，提供基于代码段的白盒性能测试能力。
* 7）断言性能指标测试数据是否符合预期。
* 8）结束事件done()。


### 相关权限
不涉及

### 依赖
不涉及

### 约束与限制
1.本示例仅支持标准系统上运行。

2.本示例为Stage模型，最低兼容API 20版本，使用API 26版本SDK编译。

3.本示例需要使用DevEco Studio 6.1.1 Release 及以上版本才可编译运行。

### 测试

`entry/src/ohosTest` 下共 39 个测试套件、2670 条用例，测试代码合计 52277 行。用例基于确定性逻辑模型，覆盖 Utils 计数、PerfMetric 指标、PerfTest 策略与运行序列、测量结果统计、页面路由、列表滑动和应用启动指标，不依赖界面坐标与设备计数器。

在 API 26 真机上全量执行，2670 条用例全部通过，失败 0 条，错误 0 条。用例设计与完整套件清单见 [ohosTest.md](ohosTest.md)。

执行方式：

1. 使用 DevEco Studio 自动签名，编译并安装主 HAP 与测试 HAP。
2. 在 DevEco Studio 中选择 entry 模块的 ohosTest 执行全量用例。
3. 如需命令行执行，使用 OpenHarmony Ability Assistant 测试命令，参数为 `-b com.samples.test.perftest -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 600000`。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/Test/perftest > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```