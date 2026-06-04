# 测试框架
### 介绍
- 本示例展示测试框架中UI测试框架的使用示例。

### 工程目录

```
uitest 
|-----entry 
          |-----src/hypium                              // 放hypium三方库 
          |-----src/main/pages                          // 放页面组件                    
          |-----src/main/src/test                       // 放自动化测试用例
|-----AppScope
          |-----app.json5                               // 定义应用唯一的包名："bundleName": "com.uitest.acts.static",
```
 须知

*   
1、引入UiTest依赖:import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';。  
2、引入hypium依赖:import { describe, expect, it, Level } from '../../../../hypium/index'。  
3、Ui测试用例均需使用异步语法编写用例，需遵循单元测试框架异步用例编写规范。

#### uitestUI测试框架示例内容
* 1） 使用uitest中 findComponent接口查找各种不同组件示例。
* 2） 使用uitest中 click，doubleClick，longClick等各种模拟事件示例。
* 3） 使用uitest中 fling，swipe，等接口模拟滑动操作示例。
* 4） 使用uitest中 mouseClick，mouseDoubleClick，mouseLongClick等接口模拟鼠标操作示例 。
* 5） 使用uitest中 inputText等接口实现模拟输入操作示例。
* 6） 使用uitest中 findWindow接口查找各种不同窗口示例。
* 7） 使用uitest中 moveTo，resize，maximize等接口实现窗口各种操作示例。   

### 具体实现
- 可参考各接口示例代码


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
echo code/DocsSample/Test-Sta/uitestStatic > .git/info/sparse-checkout
git remote add origin git@gitcode.com:openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
```
