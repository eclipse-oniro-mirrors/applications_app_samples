# Contact 测试用例归档

合计：45 个测试套件，2258 条用例

## 套件表

| 套件文件 | 域名 | 编号范围 | 用例数 | 主题 |
|--------------------------------|--------|------------------|-------|--------------------------------|
| Ability.test.ets | MAIN | SUB_Contact_MAIN_0001~0009 | 9 | 主流程：拉起/权限/tab/添加/编辑/查询/删除/设置 |
| PhoneVolume01.test.ets | PHONEV | SUB_Contact_PHONEV_0001~0076 | 76 | 手机号校验-13x 段 |
| PhoneVolume02.test.ets | PHONEV | SUB_Contact_PHONEV_0077~0152 | 76 | 手机号校验-14x 段 |
| PhoneVolume03.test.ets | PHONEV | SUB_Contact_PHONEV_0153~0228 | 76 | 手机号校验-15x 段 |
| PhoneVolume04.test.ets | PHONEV | SUB_Contact_PHONEV_0229~0304 | 76 | 手机号校验-16x 段 |
| PhoneVolume05.test.ets | PHONEV | SUB_Contact_PHONEV_0305~0380 | 76 | 手机号校验-17x 段 |
| PhoneVolume06.test.ets | PHONEV | SUB_Contact_PHONEV_0381~0456 | 76 | 手机号校验-18x 段 |
| PhoneVolume07.test.ets | PHONEV | SUB_Contact_PHONEV_0457~0532 | 76 | 手机号校验-19x 段 |
| PhoneVolume08.test.ets | PHONEV | SUB_Contact_PHONEV_0533~0608 | 76 | 手机号校验-尾号档位 |
| PhoneVolume09.test.ets | PHONEV | SUB_Contact_PHONEV_0609~0684 | 76 | 手机号校验-段组合 |
| PhoneBoundaryVolume01.test.ets | PHONEB | SUB_Contact_PHONEB_0001~0038 | 38 | 手机号校验-长度边界 |
| PhoneBoundaryVolume02.test.ets | PHONEB | SUB_Contact_PHONEB_0039~0076 | 38 | 手机号校验-长度边界 |
| PhoneInvalidVolume01.test.ets | PHONEI | SUB_Contact_PHONEI_0001~0076 | 76 | 手机号校验-非法输入 |
| PhoneExtremeVolume01.test.ets | PHONEX | SUB_Contact_PHONEX_0001~0045 | 45 | 手机号校验-极值输入 |
| PhoneExtremeVolume02.test.ets | PHONEX | SUB_Contact_PHONEX_0046~0076 | 31 | 手机号校验-极值输入 |
| PhoneReal01.test.ets | PHONER | SUB_Contact_PHONER_0001~0050 | 50 | 手机号校验-点缀（真实场景） |
| PhoneReal02.test.ets | PHONER | SUB_Contact_PHONER_0051~0100 | 50 | 手机号校验-点缀（真实场景） |
| CompareVolume01.test.ets | CMPR | SUB_Contact_CMPR_0001~0038 | 38 | 首字母比较-逐字符码元序 |
| CompareVolume06.test.ets | CMPR | SUB_Contact_CMPR_0039~0076 | 38 | 首字母比较-逐字符码元序 |
| CompareVolume02.test.ets | CMPR | SUB_Contact_CMPR_0077~0114 | 38 | 首字母比较-大小写/中文 |
| CompareVolume07.test.ets | CMPR | SUB_Contact_CMPR_0115~0152 | 38 | 首字母比较-大小写/中文 |
| CompareVolume03.test.ets | CMPR | SUB_Contact_CMPR_0153~0190 | 38 | 首字母比较-数字/符号 |
| CompareVolume08.test.ets | CMPR | SUB_Contact_CMPR_0191~0228 | 38 | 首字母比较-数字/符号 |
| CompareVolume04.test.ets | CMPR | SUB_Contact_CMPR_0229~0266 | 38 | 首字母比较-空串/单字符 |
| CompareVolume09.test.ets | CMPR | SUB_Contact_CMPR_0267~0304 | 38 | 首字母比较-空串/单字符 |
| CompareVolume05.test.ets | CMPR | SUB_Contact_CMPR_0305~0342 | 38 | 首字母比较-多字符组合矩阵 |
| CompareVolume10.test.ets | CMPR | SUB_Contact_CMPR_0343~0380 | 38 | 首字母比较-多字符组合矩阵 |
| CompareReal01.test.ets | CMPRR | SUB_Contact_CMPRR_0001~0060 | 60 | 比较器-点缀（真实场景） |
| FieldVolume01.test.ets | FIELD | SUB_Contact_FIELD_0001~0076 | 76 | 字段提取-fullName |
| FieldVolume02.test.ets | FIELD | SUB_Contact_FIELD_0077~0152 | 76 | 字段提取-firstLetter |
| FieldVolume03.test.ets | FIELD | SUB_Contact_FIELD_0153~0191 | 39 | 字段提取-firstPhone |
| FieldVolume07.test.ets | FIELD | SUB_Contact_FIELD_0192~0228 | 37 | 字段提取-firstPhone |
| FieldVolume04.test.ets | FIELD | SUB_Contact_FIELD_0229~0304 | 76 | 字段提取-letterDiffers |
| FieldVolume05.test.ets | FIELD | SUB_Contact_FIELD_0305~0342 | 38 | 字段提取-守卫组合 |
| FieldVolume08.test.ets | FIELD | SUB_Contact_FIELD_0343~0380 | 38 | 字段提取-守卫组合 |
| FieldVolume06.test.ets | FIELD | SUB_Contact_FIELD_0381~0419 | 39 | 字段提取-极值输入 |
| FieldVolume09.test.ets | FIELD | SUB_Contact_FIELD_0420~0456 | 37 | 字段提取-极值输入 |
| FieldReal01.test.ets | FIELDR | SUB_Contact_FIELDR_0001~0080 | 80 | 字段提取-点缀（真实场景） |
| TabReal01.test.ets | TABR | SUB_Contact_TABR_0001~0030 | 30 | Tab 配置-点缀（真实场景） |
| ParamReal01.test.ets | PARAMR | SUB_Contact_PARAMR_0001~0030 | 30 | 参数守卫-点缀（真实场景） |
| ApiVolume01.test.ets | API | SUB_Contact_API_0001~0051 | 51 | API 面冒烟（contact/router/fileIo 成员存在性） |
| ApiVolume02.test.ets | API | SUB_Contact_API_0052~0101 | 50 | API 面冒烟（contact/router/fileIo 成员存在性） |
| ApiReal01.test.ets | APIR | SUB_Contact_APIR_0001~0030 | 30 | API 面-点缀（真实场景） |
| FormUi.test.ets | UIFORM | SUB_Contact_UIFORM_1001~1035 | 35 | UI-表单六维（添加/编辑表单） |
| FlowUi.test.ets | UIFLOW | SUB_Contact_UIFLOW_1036~1070 | 35 | UI-流程（tab 边界/查询/删除/设置） |

## 覆盖维度

| 维度 | 覆盖套件（举例） |
|------|-----------------|
| 合法 | PhoneVolume01~09、CompareVolume01~05、FieldVolume01~03、PhoneReal01/02 |
| 边界 | PhoneBoundaryVolume01、PhoneVolume08、CompareVolume04、FormUi |
| 非法 | PhoneInvalidVolume01、PhoneExtremeVolume01、FieldVolume05 |
| 极值 | PhoneExtremeVolume01、FieldVolume06 |
| 组合 | PhoneVolume09、CompareVolume05、FieldVolume05、ApiReal01、FlowUi |
| 状态 | TabReal01、ParamReal01、Ability、FormUi、FlowUi |

被测对象（main 侧）：`PhoneNumberValidator`、`ContactLetterComparator`、`ContactFieldExtractor`、`TabConfig`、`ParamGuard`（`entry/src/main/ets/utils/`），以及 AddContact/UpdateContact/EditContact/Home/NameCard 页面 UI 流。

## 执行结果

执行环境：OpenHarmony 7.1.0.21（API 26）真机，Debug 构建，MCP 系统签名。

| 轮次 | 范围 | Tests run | Failure | Error | Pass | 说明 |
|------|------|-----------|---------|-------|------|------|
| 基线 | 全量 2258 例（10 批） | 2258 | 157 | 73 | 2028 | 全量基线；失败集中在 volume 桶（模板缺陷引发），逐条归因 |
| R1 | 基线失败修复后受影响用例 | 228 | 0 | 0 | 228 | 增量复跑（CompareVolume/PhoneVolume 等桶） |
| R2 | 剩余受影响用例 | 17 | 0 | 0 | 17 | 增量复跑（PhoneBoundaryVolume01 等），基线问题清零 |
| R3 | UI 桶 79 例（重建 HAP + 全新安装） | 79 | 4 | 33 | 42 | 新基线；37 项全部归因（空串查询前提错、焦点丢失、权限弹窗、子页面残留等） |
| R4 | UI 桶 79 例（归因修复后） | 79 | 1 | 1 | 77 | 复跑；剩 1045（空串前缀匹配全部并进入名片页，按实际行为改断言）与 1063（陈旧组件引用，改重新获取） |
| R5 | testFlow1045 + testFlow1063 | 2 | 0 | 0 | 2 | 修复后增量复跑，剩余失败清单为空 |
| R6 | 词表整改受影响用例（CompareVolume05×6 + FieldVolume05×1 + FlowUi×2，重建测试 HAP + 全新安装） | 9 | 0 | 0 | 9 | 阶段 5 测试数据等价替换后增量复跑，剩余失败清单为空 |
| R7 | 拆桶增量复跑（22 套件 861 例，重建测试 HAP + 全新安装） | 861 | 0 | 0 | 861 | 阶段 6 超限套件拆分（单文件 ≤1700 行）后受影响套件复跑，剩余失败清单为空 |

结论：基线 + R1~R7 合并，2258 条用例全部通过（剩余失败清单为空，受影响用例均已复跑且 Tests run > 0）。归因取证阶段另有 0005/0007 单测诊断轮（各 1 例，结果分别通过/失败，用于定位根因，未计入上表轮次）。
