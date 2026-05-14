# 线性容器

## 介绍

线性容器实现能按顺序访问的数据结构，其底层主要通过数组实现，包括ArrayList、Vector、List、LinkedList、Deque、Queue和Stack。

## 效果预览

| 首页                                |
|-----------------------------------|
| ![Index](screenshots/Index.png) |

## 工程目录

```
├───entry/src/main/ets
│   ├───pages                               
│   │   └───Index.ets                                        // 首页。
└───entry/src/main/resources                                 // 资源目录。         
```

## 具体实现

* 非线性容器
    * 源码参考：[Index.ets](./entry/src/main/ets/pages/Index.ets)
    * 使用流程：
    * 点击'测试HashMap'按钮，可看到非线性容器HashMap的'set'操作结果。
    * 点击'测试TreeMap'按钮，可看到非线性容器HashMap的'set'操作结果。
    * 点击'测试LightWeightMap'按钮，可看到非线性容器HashMap的'set'操作结果。
    * 点击'测试PlainArray'按钮，可看到非线性容器HashMap的'add'操作结果。

## 依赖

不涉及。

## 相关权限

不涉及。

## 约束与限制

1.  本示例仅支持在标准系统上运行。

2.  本示例推荐使用当前最新版本的API和SDK编译运行。

3. 本示例推荐使用当前最新版本的DevEco Studio。

4. 高等级APL特殊签名说明：无。

## 下载

如需单独下载本工程，执行如下命令：

```git
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkTS/ArkTsCommonLibrary/ArkTsContainerLibrary/NonlinearContainers > .git/info/sparse-checkout
git remote add origin OpenHarmony/applications_app_samples
git pull origin master