# 测试框架
### 介绍
本示例展示测试框架中白盒性能测试框架的使用示例。

### 效果预览
不涉及

使用说明
- 将perftest目录下的项目工程整体导入到DevEco Studio开发工具中。
- 查看ohosTest目录下的测试代码实现。
- 在DevEco Studio中执行测试用例代码查看执行效果，执行方式请[参考](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/application-test/arkxtest-guidelines.md)  

### 工程目录

```
uitest 
|-----entry 
          |-----src/hypium                              // 放hypium三方库 
          |-----src/main/ets/pages                          // 放页面组件                    
          |-----src/main/src/test                       // 放自动化测试用例
|-----AppScope
          |-----app.json5                               // 定义应用唯一的包名："bundleName": "com.samples.test.jsunit.static",
```
 须知

* 前提：引入import { describe, expect, it, Level } from '../../../../hypium/index';  

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
1.本示例仅支持标准系统上运行。

2.本示例从API version 26版本SDK起开始支持，SDK版本号(26.0.0),镜像版本号(7.0.0.25)。

3.本示例需要使用DevEco Studio 版本号(26.0.0.2)及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/ArkTS-Sta/Test/jsunitStatic > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
```