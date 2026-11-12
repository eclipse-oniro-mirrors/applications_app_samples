# 使用onIdle进行组件预创建

### 介绍

本示例展示如何使用onIdle进行组件预创建，减少进入首页的启动耗时。[文章链接](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/performance/node_custom_component_reusable_pool.md#%E4%BD%BF%E7%94%A8onidle%E8%BF%9B%E8%A1%8C%E7%BB%84%E4%BB%B6%E9%A2%84%E5%88%9B%E5%BB%BA)

### 效果预览
| 首页                         |
|----------------------------|
| ![](./screenshot/home.jpg) |

**使用说明**

1. 点击桌面应用图标，启动应用。

2. 查看首页图片是否加载成功。

#### 相关概念

FrameCallback.onIdle： 在下一帧渲染结束时，如果距离下一个Vsync信号到来还有1ms以上的剩余时间，该方法将被执行，否则将顺延至后面的帧。

### 工程目录
```
customreusablepool/src/main/ets
|---constants
|   |---Constants.ets                       // 常量类
|---data
|   |---MockData.ets                        // 模拟数据
|   |---TitleBean.ets                       // 标题数据
|   |---TitleDataSource.ets                 // 标题数据源
|   |---ViewItem.ets                        // 列表项数据
|   |---WaterFlowDataSource.ets             // 瀑布流数据源
|---pages
|   |---BuilderNodePoolDemo.ets             // 全局自定义组件复用池页面
|---utils
|   |---BuilderNodePool.ets                 // 自定义组件复用池
|---view
|   |---FlowItemNode.ets                    // 瀑布流列表项
|   |---SwiperView.ets                      // 轮播图
|   |---TabNode.ets                         // Tab节点
|   |---TitleView.ets                       // 标题
entry/src/main/ets/
|---pages
|   |---Index.ets                           // 启动页                                                     
|   |---OnIdlePage.ets                      // 首页                                                     
```

### ohosTest 目录

```
entry/src/ohosTest
├── ets
│   ├── test                              // 测试套件（List.test、矩阵用例、shared 工具）
│   ├── testability                       // TestAbility 与测试页面
│   └── testrunner                        // OpenHarmonyTestRunner
├── resources
└── module.json5                          // 测试模块配置
```

### 具体实现

1. 在自定义组件复用池中实现预创建。[详细代码](customreusablepool/src/main/ets/utils/BuilderNodePool.ets)

2. 在首页组件中预创建。[详细代码](customreusablepool/src/main/ets/pages/BuilderNodePoolDemo.ets)

3. 在广告页中预创建组件。[详细代码](entry/src/main/ets/pages/Index.ets)


### 相关权限

不涉及

### 依赖

不涉及

### 约束与限制

1. 本示例仅支持标准系统上运行，deviceTypes 配置为 `default`、`tablet`。

2. 本示例已适配API20版本SDK，SDK版本号(API Version 20 Release),镜像版本号(5.1.0 Release)；当前已升级至API 26版本SDK，SDK版本号(API Version 26)，镜像版本号(7.1.0.21)。`compileSdkVersion` 为 `26.0.0`，`compatibleSdkVersion` 为 `14`（最低兼容 API 14）。

3. 本示例需要使用DevEco Studio 版本号(5.1.0 Release)及以上版本才可编译运行；当前已升级至DevEco Studio 26.0.0 Release及以上版本。

### 下载

如需单独下载本工程，执行如下命令：
```
git init
git config core.sparsecheckout true
echo code/Performance/ComponentPrebuildByOnIdle/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```