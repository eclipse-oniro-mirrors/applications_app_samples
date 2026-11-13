# MovingPhotoViewSample 测试用例说明

## 测试环境

- Bundle：`com.example.movingphotoviewsample`
- 测试模块：`entry_test`
- 测试框架：`OpenHarmonyTestRunner`
- SDK：API version 26.0.0

## 自动化测试套件

| 测试文件 | 用例数 |
|---|---:|
| `MovingPhotoBundleLongMatrix.test.ets` | 30 |
| `MovingPhotoConfigMatrix.test.ets` | 30 |
| `MovingPhotoControllerContract.test.ets` | 50 |
| `MovingPhotoControllerInstances.test.ets` | 40 |
| `MovingPhotoMediaDeep.test.ets` | 50 |
| `MovingPhotoPlaybackControl.test.ets` | 60 |
| `MovingPhotoPlaybackSequence.test.ets` | 60 |
| `MovingPhotoPlusUi.test.ets` | 60 |
| `MovingPhotoTextMatrix.test.ets` | 40 |
| `MovingPhotoUiContract.test.ets` | 50 |
| `MovingPhotoUiElements.test.ets` | 50 |
| `MovingPhotoView.test.ets` | 7 |
| `MovingPhotoViewExtended.test.ets` | 12 |

合计：**13 个测试套件，539 条用例**。

> 以上用例数与 `List.test.ets` 中实际注册的套件和用例数一致。

## 运行方式

```bash
aa test -b com.example.movingphotoviewsample -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 900000
```
