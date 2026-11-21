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
          |-----src/main/pages
                |-----index.ets                         // 页面组件 
          |-----ohosTest                                // 自动化测试用例
                |-----ets/test
                      |-----PerfTest.test.ets        // 自动化测试脚本，其中it()就是一个测试用例
|-----AppScope
          |-----app.json5                               // 定义应用唯一的包名："bundleName": "com.samples.test.perftest",
```
 须知

* 前提：引入PerfTest依赖：import { PerfMetric, PerfTest, PerfTestStrategy, PerfMeasureResult } from '@ohos.test.PerfTest';  

### 具体实现

#### PerfTest测试框架示例内容
* 1）测试函数执行期间的应用性能。
* 2）在ohosTest的test/PerfTest.test.ets中it()定义一条测试用例，支持三个参数：用例名称，过滤参数和用例函数。用例操作的行为以异步的形式编写。
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

`entry/src/ohosTest` 下共 32 个测试套件、2737 条用例，其中保留原有 3 个性能测试套件（PerfTest、CPUMetric、SlideFps），新增 29 个逻辑测试套件，覆盖 Utils 计算逻辑、BundleInfo 与模块信息、应用信息、entry 资源、文件与首选项、显示、Want、Ability 与 UI 等场景。用例设计与执行方式见 [ohosTest.md](ohosTest.md)。

执行命令：

```
hdc shell aa test -b com.samples.test.perftest -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 600000
```

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/Test/perftest > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```