# ArkWebSameLevelRendering 测试用例

## 测试环境

| 项目 | 说明 |
|------|------|
| 设备类型 | default |
| 系统能力 | API 26 |
| SDK 版本 | 26.0.0 |
| 编译工具 | DevEco Studio 6.1.1 Release，hvigor |
| 测试框架 | Hypium（entry_test 模块，OpenHarmonyTestRunner） |
| 被测应用 | com.example.nativeembed（entry 模块） |

## 一、用例总览

`entry/src/ohosTest/ets/test` 下共 30 个测试套件、2985 条用例，全部为逻辑用例，代码总量约 5.87 万行。用例不依赖界面坐标，仅读取应用自身的 BundleInfo、资源表、rawfile 与商品数据模型。

| 测试功能 | 预置条件 | 输入/操作 | 预期输出 | 用例数 | 测试结果 |
|----------|----------|-----------|----------|--------|----------|
| 语言与算法基础 | 应用已安装 | 编解码、JSON、数值、文本、集合、时间、数学运算 | 结果与预期值一致 | 1466 | 待运行 |
| 模块与包信息 | 应用已安装 | 查询 BundleInfo、HapModuleInfo、签名与模块名 | 包名、版本、模块、设备类型符合配置 | 468 | 待运行 |
| 资源与媒体 | 应用已安装 | 读取 string/color/integer/media/layered-image | 资源值、PNG 结构与错误码符合预期 | 280 | 待运行 |
| 文件与首选项 | 应用沙箱可写 | 读写/删除沙箱文件，读写 Preferences | 内容一致，异常码符合预期 | 470 | 待运行 |
| 显示与 Want | 应用已安装 | 查询默认显示器属性，构造显式 Want | 属性有效，字段完整可往返 | 150 | 待运行 |
| Ability 与 rawfile | 应用已安装 | 拉起 EntryAbility，读取 embed_view.html | 上下文正确，rawfile 内容与结构一致 | 118 | 待运行 |
| 文案切片 | 应用已安装 | 对应用文案做切片、重复、字符定位 | 文本结构与预期一致 | 33 | 待运行 |

## 二、测试套件设计

| 套件文件 | 用例数 | 覆盖内容 |
|----------|--------|----------|
| EncodeTextMatrix.test.ets | 214 | UTF-8/Base64 编解码、往返一致性、字节边界 |
| JsonDocMatrix.test.ets | 122 | JSON 序列化/反序列化、嵌套结构、类型还原 |
| NumberSenseMatrix.test.ets | 234 | 整数/浮点运算、边界值、精度与格式化 |
| TextSenseMatrix.test.ets | 300 | 字符串长度、切片、大小写、查找、拆分与拼接 |
| CollectionSenseMatrix.test.ets | 300 | Array/Map/Set 增删改查、排序、去重与遍历 |
| TimeSenseMatrix.test.ets | 132 | Date 构造、时间戳换算、格式化与比较 |
| MathSenseMatrix.test.ets | 164 | 取整、幂/对数、三角函数、极值与随机范围 |
| ModuleNameMatrix.test.ets | 225 | 模块名、资源名、文件名字符级校验 |
| VersionMatrix.test.ets | 55 | 版本号拆分、版本码换算与格式约束 |
| AppTextMatrix.test.ets | 33 | 应用文案的切片、重复与字符定位 |
| DraftIoMatrix.test.ets | 217 | 沙箱文件写入/追加/读取/删除、路径与编码 |
| PrefStoreMatrix.test.ets | 128 | Preferences 写入、读取、删除、清空与重新打开 |
| BundleFactsMatrix.test.ets | 46 | BundleInfo 名称、版本、签名、权限、appIndex |
| ModuleFactsMatrix.test.ets | 25 | entry/entry_test 模块类型、能力、启动模式与设备类型 |
| EntryStringMatrix.test.ets | 22 | module_desc/EntryAbility_desc 按名/按 ID 读取及错误码 |
| AppInstanceMatrix.test.ets | 51 | appIndex 取值、范围、稳定性及与各上下文字段一致性 |
| AppScopeMatrix.test.ets | 22 | ApplicationInfo 名称、版本、图标、标签、代码路径 |
| ColorFactsMatrix.test.ets | 11 | start_window_background 颜色通道与查找错误 |
| MediaFactsMatrix.test.ets | 39 | background/foreground/startIcon 的 PNG 签名、尺寸、分块、CRC |
| LayeredTextMatrix.test.ets | 8 | layered_image.json 文本结构校验 |
| LayeredJsonMatrix.test.ets | 16 | layered_image.json 解析后的键值与引用校验 |
| SignatureMatrix.test.ets | 22 | appId、指纹格式与重复读取稳定性 |
| DisplayFactsMatrix.test.ets | 70 | 默认显示器属性、宽高关系与数值运算 |
| FileErrorMatrix.test.ets | 125 | 文件不存在、路径非法、重复创建等错误码 |
| WantFactsMatrix.test.ets | 80 | Want 字段、URI、参数与序列化 |
| ResourceIdMatrix.test.ets | 35 | 字符串/颜色/媒体资源 ID 与名称的交叉校验 |
| AbilityFactsMatrix.test.ets | 15 | EntryAbility 上下文、标签、启动模式、资源读取 |
| ProductMediaMatrix.test.ets | 127 | 10 张商品与图标 PNG 的尺寸、分块、CRC、字节统计 |
| ProductMatrix.test.ets | 44 | PRODUCT_DATA 6 条商品数据的 ID、标题、价格、图片一致性 |
| RawfileMatrix.test.ets | 103 | embed_view.html 的字节长度、行结构、标签、校验和与非法路径 |

## 三、执行方式

1. 使用 DevEco Studio 自动签名，编译并安装应用与测试包。
2. 通过 hdc 执行全量测试：

```
hdc shell aa test -b com.example.nativeembed -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 600000
```

3. 也可在 DevEco Studio 中选中 entry 模块的 ohosTest 运行。

## 四、测试结果

- 编译：`assembleHap --mode module -p module=entry@ohosTest` 编译通过。
- 用例：30 个套件、2985 条用例已归档，用例之间无完全重复代码，`@tc.number` 全局唯一。
- 运行：本环境未连接设备，运行结果待设备执行后补充。
