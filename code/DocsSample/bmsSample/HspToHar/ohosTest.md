# HSP转HAR指导 测试用例归档

## 测试环境

| 项目 | 说明 |
|------|------|
| 设备 | default、tablet（默认设备、平板或对应模拟器） |
| SDK | API 26（6.0.0.47 及以上） |
| 测试框架 | Hypium（ohosTest） |
| 测试入口 | `entry/src/ohosTest/ets/test/List.test.ets` |

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|----------|----------|------|----------|----------|
| 语言基础能力（编码、JSON、数值、字符串、集合、时间、数学） | 应用安装成功 | 无 | 1466 条断言全部符合预期 | Pass |
| 模块与包信息（bundle、module、签名、版本、AppScope） | 应用安装成功 | 无 | 393 条断言全部符合预期 | Pass |
| HAR 静态打包事实（har 不作为独立模块安装） | 应用安装成功 | 无 | 22 条断言全部符合预期 | Pass |
| entry 资源（字符串、颜色、图片、分层图标） | 应用安装成功 | 无 | 97 条断言全部符合预期 | Pass |
| 文件读写与偏好项（应用沙箱） | 应用安装成功 | 沙箱路径 | 345 条断言全部符合预期 | Pass |
| 显示与窗口 | 应用安装成功 | 无 | 70 条断言全部符合预期 | Pass |
| 错误码与文件异常 | 应用安装成功 | 非法路径/资源名 | 125 条断言全部符合预期 | Pass |
| Want 构造与字段解析 | 应用安装成功 | 各类 Want 组合 | 80 条断言全部符合预期 | Pass |
| 资源 ID 解析 | 应用安装成功 | 资源 id/名称 | 35 条断言全部符合预期 | Pass |
| Ability 启动与上下文 | 应用安装成功 | 启动 EntryAbility | 23 条断言全部符合预期 | Pass |

## 测试套件设计

| 序号 | 套件 | 用例数 | 覆盖内容 |
|------|------|--------|----------|
| 1 | EncodeTextMatrix | 214 | Base64/十六进制编解码、文本摘要、字符集转换 |
| 2 | JsonDocMatrix | 122 | JSON 解析、序列化、嵌套结构、异常输入 |
| 3 | NumberSenseMatrix | 234 | 数值边界、进制转换、精度、极值 |
| 4 | TextSenseMatrix | 300 | 字符串查找、切片、大小写、填充、比较 |
| 5 | CollectionSenseMatrix | 300 | 数组/Map/Set 增删改查与遍历 |
| 6 | TimeSenseMatrix | 132 | 时间戳、日期换算、时区无关计算 |
| 7 | MathSenseMatrix | 164 | 三角/幂/取整/随机边界 |
| 8 | ModuleNameMatrix | 180 | 模块名、资源名、能力名的字符串语义 |
| 9 | VersionMatrix | 55 | 版本号编码规则与语义化排序 |
| 10 | HarTextMatrix | 43 | HAR 相关文本切片、重复与字符定位 |
| 11 | DraftIoMatrix | 217 | 沙箱文件创建、追加、读取、截断 |
| 12 | PrefStoreMatrix | 128 | Preferences 读写、删除、类型校验 |
| 13 | BundleFactsMatrix | 47 | bundleName、版本、应用信息、签名 |
| 14 | ModuleFactsMatrix | 24 | entry/test 模块类型、能力、扩展、设备类型 |
| 15 | EntryStringMatrix | 23 | entry 字符串资源按名/按 id 读取及非法名 |
| 16 | HarFactsMatrix | 22 | HAR 不形成独立 HapModuleInfo、无 shared 模块、资源不越界 |
| 17 | AppScopeMatrix | 22 | 应用级配置、签名指纹、代码路径 |
| 18 | ColorFactsMatrix | 11 | 启动窗口背景色通道与名称/ID 一致性 |
| 19 | MediaFactsMatrix | 39 | PNG 字节结构、尺寸、CRC、模块内媒体读取 |
| 20 | LayeredTextMatrix | 8 | 分层图标 JSON 文本结构 |
| 21 | LayeredJsonMatrix | 16 | 分层图标 JSON 字段与取值 |
| 22 | SignatureMatrix | 22 | appId 与证书指纹格式、稳定性 |
| 23 | DisplayFactsMatrix | 70 | 屏幕尺寸、密度、色彩空间、刷新率 |
| 24 | FileErrorMatrix | 125 | 文件系统错误码与边界路径 |
| 25 | WantFactsMatrix | 80 | Want 字段、skills 组合、实体与动作 |
| 26 | ResourceIdMatrix | 35 | 资源 id 范围、名称解析、类型校验 |
| 27 | AbilityFactsMatrix | 15 | EntryAbility 启动、上下文、资源访问 |
| 28 | UiFlowMatrix | 8 | 首页点击切换文案的交互流程 |

合计 28 个套件、2656 条用例。



## 测试结果

编译通过，全量 2656 条用例已归档；HAR 转换后 har 模块不再作为独立 HapModuleInfo 安装，entry 模块能力、资源与上下文行为保持不变。
