# DLPCApiTest

## 介绍

本示例是一个安全类App，使用[DataProtectionKit/dlp_permission_api.h](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/DataProtectionKit) 接口展示了在DLP中常用CAPI接口的调用。

## 效果预览

| Index                                     | 
|-----------------------------------------|
| ![Index](screenshots/index_pages.jpg) | 

**使用方法：**
1. 启动后点击”c api test“按钮。
2. 在主界面中有“clear”消除按钮，该按钮可以清除主界面的显示字符串，比如“点击按钮开始测试”。
3. 在主界面的下部分，有多个功能按钮，每个按钮对应着不同的CAPI接口。
4. [具体接口说明可以参考](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/DataProtectionKit)。

## 工程目录
```
entry/src/main/ets/
|---pages
|   |---index.ets                           // 主页面
|   |---CApiTest.ets                        // CAPI页面
entry/src/main/cpp/
|---types
|   |---libentry
|   |   |---index.d.ts                      // 导出接口
|---CMakeLists.txt                          // 编译C代码
|---napi_init.cpp                           // 定义接口（具体实现）
```

## 具体实现

* 设置、获取和清理沙箱应用配置信息、查询当前运行DLP沙箱环境、查询当前DLP沙箱的权限信息和获取指定DLP文件名的原始文件名封装在[napi_init.cpp](https://gitcode.com/openharmony/applications_app_samples/blob/master/code/SystemFeature/Security/DlpCApiTest/entry/src/main/cpp/napi_init.cpp)
  * 在该文件的实现中对入参预先进行了设置，若需要测试其他入参，需要修改该文件中函数的入参。
  * 在设置、获取和清理沙箱应用配置信息时，配置信息为“configInfo”。
  * 在查询当前运行DLP沙箱环境时，由于该应用一直处于非沙箱环境，该接口只会返回false。
  * 查询当前DLP沙箱的权限信息为19100006。
  * 默认的DLP的文件名为“test.txt.dlp”，即原始文件名为“test.txt”。

## 相关权限

不涉及。

## 依赖

不涉及。

## 约束与限制

1. 本示例仅支持标准系统上运行。

2. 本示例可在API23及其以上版本的SDK上运行。

3. 在将项目克隆下来后，需要配置签名。点击如下图所示“打开签名配置”，完成签名配置。

![signature](screenshots/signature.png)

4. 在完成签名配置后，需要点击运行（绿色小三角）。

![Index](screenshots/operations.png)

## 下载

```
git init
git config core.sparsecheckout true
echo code/SystemFeature/Security/DLP/  > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```