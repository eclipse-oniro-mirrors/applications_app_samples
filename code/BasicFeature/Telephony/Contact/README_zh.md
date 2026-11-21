# 联系人

### 介绍

本示例使用[@ohos.contact](https://docs.openharmony.cn/pages/v4.1/zh-cn/application-dev/reference/apis-contacts-kit/js-apis-contact.md)
接口，实现了对联系人的增删查改功能。

本示例使用[Tabs](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-container-tabs.md)组件设置整体应用布局，使用[List](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-container-list.md)组件设置首页页面布局，使用[AlphabetIndexer](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-container-alphabet-indexer.md)组件设置索引条。

### 效果预览

|首页|详情页|新建联系人|
|-----|-----|-----|
|![](screenshots/device/main.png) |![](screenshots/device/details.png)|![](screenshots/device/add.png)|

### 使用说明

1.点击 **+** 按钮，跳转添加联系人界面，输入联系人信息，点击 **√**，确认添加联系人，并返回首页；

2.点击联系人列表跳转页面查看详细信息，并且可以编辑或删除联系人信息；

3.在搜索栏输入号码或邮箱可查询对应的联系人。

### 工程目录

```
entry/src/main/ets/
|---component
|   |---Contact.ets                       // 联系人页面
|   |---ContactInfo.ets                   // 联系人详情页主体内容
|   |---Home.ets                          // 主页主体内容
|   |---ItemContainer.ets                 // 联系人列表
|   |---NewContact.ets                    // 新建联系人页面主体内容
|   |---UpdateContact.ets                 // 编辑联系人主体内容
|---data                                  // 日志文件
|---entryability
|   |---EntryAbility.ts                   // 应用入口，在这里请求相关权限
|---pages
|   |---AddContact.ets                    // 新建联系人页面
|   |---EditContact.ets                   // 编辑联系人
|   |---Index.ets                         // 主页
|   |---NameCard.ets                      // 联系人详情页
|   |---Setting.ets                       // 设置页面
|---utils                                 // 可测性工具类（供测试直接引用）
|   |---ContactFieldExtractor.ets         // 联系人字段提取
|   |---ContactLetterComparator.ets       // 首字母比较
|   |---ParamGuard.ets                    // 参数守卫
|   |---PhoneNumberValidator.ets          // 手机号校验
|   |---TabConfig.ets                     // Tab 配置
```

### 具体实现

* 本示例的主要逻辑功能和源码在下列相关类中：
  * 查询所有联系人：在[Contact.ets](entry/src/main/ets/component/Contact.ets)
    页面调用contact.queryContacts()查询所有的联系人；
  * 新建联系人：在[AddContact.ets](entry/src/main/ets/pages/AddContact.ets)
    页面检验数据格式后通过contact.addContact()创建新的联系人；
  * 搜索联系人：在[Contact.ets](entry/src/main/ets/component/Contact.ets)
    页面调用contact.queryContactsByPhoneNumber()通过电话号码查询联系人或者调用contact.queryContactsByEmail()通过邮箱查询联系人；
  * 删除联系人：在[ContactInfo.ets](entry/src/main/ets/component/ContactInfo.ets)
    调用contact.deleteContact()删除指定的联系人；
  * 修改联系人：在[EditContact.ets](entry/src/main/ets/pages/EditContact.ets)
    页面调用contact.updateContact()。

### 相关权限

读取联系人信息：[ohos.permission.READ_CONTACTS](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-system-apps.md#ohospermissionread_contacts)

添加、删除、修改联系人信息：[ohos.permission.WRITE_CONTACTS](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-system-apps.md#ohospermissionwrite_contacts)

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568。

2. 本示例需要使用DevEco Studio 26及以上版本才可编译运行。

3. 本示例已适配 OpenHarmony SDK 26.0.0（compileSdkVersion / compatibleSdkVersion 均为 26.0.0，hvigor 工程模型 26.0.0）。

4. 本示例涉及[ohos.permission.READ_CONTACTS](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-system-apps.md#ohospermissionread_contacts)、[ohos.permission.WRITE_CONTACTS](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-system-apps.md#ohospermissionwrite_contacts) 为system_basic级别（相关权限级别可通过[权限定义列表](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-all.md))查看），需要手动配置对应级别的权限签名(具体操作可查看[自动化签名方案](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/hapsigntool-overview.md)。

### 测试

本工程提供 ohosTest 测试用例，共 34 个测试套件、2258 条用例，覆盖合法/边界/非法/极值/组合/状态六个维度，套件清单与用例编号详见 [ohosTest.md](ohosTest.md)。

在真机环境执行全量测试：在 DevEco Studio 中选择 `entry@ohosTest` 运行配置执行，运行参数如下，依次对应命令行参数 `-b`、`-m`、`-s unittest`、`-s timeout`：

| 参数 | 取值 |
|------|------|
| 应用包名 | `ohos.samples.contact` |
| 测试模块名 | `entry_test` |
| 测试运行器 | `/ets/testrunner/OpenHarmonyTestRunner` |
| 单例超时 | `300000` ms |

如需按套件过滤，追加 `-s class <套件名>` 参数。

真机执行结果见 [ohosTest.md](ohosTest.md) 执行结果章节。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/BasicFeature/Telephony/Contact/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
