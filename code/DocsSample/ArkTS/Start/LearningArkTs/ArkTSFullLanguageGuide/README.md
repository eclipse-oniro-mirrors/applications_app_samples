# ArkTS完整语言指南

### 介绍

本工程为ArkTS完整语言指南提供代码与文档源同步文件。

- `pages`目录下的`.ets`文件为可编译的ArkTS文档片段，由`snippets/CompiledDocs.ets`统一导入，使其在正常HAP构建时参与ArkTS编译检查。
- `tsPages`目录下的`.ts`文件为不参与编译的TypeScript片段（反例、迁移参考、与TypeScript对比等），仅与指南源码保持同步，不进入ArkTS编译路径。
- `snippets/CompiledSmoke.ets`为冒烟测试入口，可按需导入以校验参与编译路径检查的文档片段数量。

### 效果预览

| 首页 | 基本知识页面 | 函数页面 | 类页面 | 泛型页面 |
|---|---|---|---|---|
| <img src="./screenshots/Index.png" style="zoom:50%;" /> | <img src="./screenshots/Basics.png" style="zoom:50%;" /> | <img src="./screenshots/Functions.png" style="zoom:50%;" /> | <img src="./screenshots/Classes.png" style="zoom:50%;" /> | <img src="./screenshots/Generics.png" style="zoom:50%;" /> |

### 使用说明

1. 运行Index主界面。
2. 首页提供“基本知识/函数/类/泛型类型和函数”四个导航按钮，点击可进入对应分页面；各分页面提供“实时状态信息”面板与一组测试按钮，点击测试按钮运行对应语法示例，并在面板中展示当前状态与日志。
3. 运行测试用例`ArkTSFullLanguageGuide.test.ets`文件对应用代码进行测试可以全部通过。

### 工程目录

```
entry/src/
 ├── main
 │   ├── ets
 │   │   ├── common                              // 导入演示片段的配套模块
 │   │   │   ├── Config.ets                      // 导出常量
 │   │   │   ├── Feature.ets                     // 动态导入模块
 │   │   │   ├── Logger.ets                      // 默认导出
 │   │   │   ├── Math.ets                        // 多函数导出
 │   │   │   ├── ProfileFeature.ets              // 条件动态导入模块
 │   │   │   ├── Report.ets                      // 混合导出
 │   │   │   ├── Repository.ets                  // 子模块barrel文件仓库
 │   │   │   ├── Service.ets                     // 子模块导出类
 │   │   │   ├── SettingsFeature.ets             // 条件动态导入模块
 │   │   │   ├── Types.ets                       // 共享类型定义
 │   │   │   └── User.ets                        // 模块导出示例
 │   │   ├── config
 │   │   │   └── appConfig.ets                   // 相对路径导入的配置模块
 │   │   ├── entryability
 │   │   │   └── EntryAbility.ets                // 应用入口
 │   │   ├── entrybackupability
 │   │   │   └── EntryBackupAbility.ets          // 备份恢复能力
 │   │   ├── pages                               // ArkTS文档片段源码同步文件（部分兼UI页面）
 │   │   │   ├── Basics.ets                      // 基本知识片段及页面
 │   │   │   ├── Classes.ets                     // 类片段及页面
 │   │   │   ├── Functions.ets                   // 函数片段及页面
 │   │   │   ├── Generics.ets                    // 泛型片段及页面
 │   │   │   ├── ...                             // 其余语法主题片段文件
 │   │   │   └── Index.ets                       // 首页
 │   │   ├── snippets
 │   │   │   ├── CompiledDocs.ets                // 统一导入文档片段以参与编译
 │   │   │   └── CompiledSmoke.ets               // 冒烟测试入口
 │   │   └── tsPages                             // TypeScript片段（不参与ArkTS编译）
 │   │       └── ...
 ├── ohosTest
 │   ├── ets
 │   │   └── test
 │   │       ├── Ability.test.ets                // 自动化测试代码
 │   │       ├── ArkTSFullLanguageGuide.test.ets // 自动化测试代码
 │   │       └── List.test.ets
```

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.  本示例支持标准系统上运行，支持设备：RK3568；

2.  本示例支持API23版本的SDK，版本号：6.1.0.25；

3.  本示例已支持使用Build Version: 6.0.1.251, built on November 22, 2025；

4.  高等级APL特殊签名说明：无；

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkTS/Start/LearningArkTs/ArkTSFullLanguageGuide > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
