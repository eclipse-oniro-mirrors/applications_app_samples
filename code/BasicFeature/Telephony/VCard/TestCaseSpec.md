# 测试用例编写规范

> 适用于本项目的 hypium 测试用例（`entry/src/ohosTest/`、`entry/src/test/`）。
> 参考实现：`entry/src/ohosTest/ets/test/VCard.test.ets`。

## 1. 用例头注释（必填六要素）

每条 `it` 用例之前必须有一段 `/** ... */` 头注释，包含以下字段：

| 字段 | 规则 |
|---|---|
| `@tc.number` | 用例编号。`SUB_` 前缀 + 项目/模块代号 + 测试接口名，**字母全部大写**，下划线分隔。编号从 `0100` 起，每条用例递增：`0100, 0200, 0300 ... 1000, 1100`。 |
| `@tc.name` | 用例方法名。`test` + 接口名（大驼峰），从 `0001` 起，同一接口多条用例依次递增：`0001, 0002, 0003 ... 0010, 0011`。 |
| `@tc.desc` | **英文**描述当前用例的测试目的/作用，一句话说清验证什么。 |
| `@tc.size` | 用例规模，与 `it` 的 filter 一致：`SmallTest` / `MediumTest` / `BigTest`。 |
| `@tc.type` | 用例类型：`Function` / `Performance` / `Power` / `Reliability` / `Safety` / `Security` / `Sysport` / `User`。 |
| `@tc.level` | 用例等级：`Level 0` ~ `Level 3`。 |

## 2. it() 写法三一致

`@tc.name`、`it()` 第一个参数、用例内的日志 `TAG`，**三者必须完全一致**（④⑤与②一致）：

```typescript
/**
 * @tc.number    SUB_VCARD_UI_TOOLBOX_0100
 * @tc.name      testToolboxPreview0001
 * @tc.desc      Verify the toolbox page shows pick-file, sample-import and export entries,
 *               and clicking sample import opens the parse preview panel.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 0
 */
it('testToolboxPreview0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
  const TAG: string = 'testToolboxPreview0001';
  const driver = Driver.create();
  hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
  // ... 测试逻辑 ...
  hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
})
```

- `it()` 的 filter 参数使用 `TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0`，与头注释的 `@tc.size/@tc.type/@tc.level` 对应（需从 `@ohos/hypium` 导入 `TestType, Size, Level`）。
- 用例内日志统一以 `TAG + ' start'` 开始、`TAG + ' end'` 结束，便于日志检索。
- 套件级日志（如 `beforeAll`）使用独立的 `SUITE_TAG`，与用例 TAG 区分。

## 3. 断言（⑥ 必须有）

每条用例的逻辑中**必须有断言**作为是否符合预期结果的验证，不允许只操作不校验：

- UI 用例：`driver.assertComponentExist(ON.id('id_xxx'))`、`expect(xxx).assertTrue()`、`expect(xxx).assertEqual(xxx)` 等。
- 单元用例：`expect(实际值).assertEqual(期望值)` / `assertContain` / `assertLarger` 等。

## 4. 命名示例对照

| 场景 | @tc.number | @tc.name |
|---|---|---|
| 首页页签切换 | `SUB_VCARD_UI_MAINTABS_0100` | `testMainTabs0001` |
| 联系人权限/列表 | `SUB_VCARD_UI_CONTACTS_0100` | `testContactsPermission0001` |
| 工具箱预览 | `SUB_VCARD_UI_TOOLBOX_0100` | `testToolboxPreview0001` |
| 记录页 | `SUB_VCARD_UI_HISTORY_0100` | `testHistoryPage0001` |
| 设置页 | `SUB_VCARD_UI_SETTINGS_0100` | `testSettingsPage0001` |

同一接口追加用例时：number 编号 `0200、0300` 递增，name 编号 `0002、0003` 递增，例如 `SUB_VCARD_UI_TOOLBOX_0200` / `testToolboxPreview0002`。

## 5. 落库检查清单

新增或修改用例后，按以下清单自检：

- [ ] 头注释六要素齐全，number 全大写且编号递增
- [ ] `@tc.name` = `it()` 第一参数 = 用例内 `TAG`
- [ ] `@tc.desc` 为英文且描述的是测试目的
- [ ] `it` filter 与 `@tc.size/@tc.type/@tc.level` 一致
- [ ] 用例体内至少一处断言
- [ ] 日志以 `TAG + ' start'` / `TAG + ' end'` 包裹
