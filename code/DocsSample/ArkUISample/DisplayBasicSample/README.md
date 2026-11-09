# 屏幕管理基础使用示例

### 介绍

本示例主要展示了屏幕管理提供管理设备屏幕的一些基础能力，例如获取默认显示设备的相关信息、获取全部显示设备的信息，此外还能对显示设备的插拔行为进行监听。应用可以根据对应的屏幕信息、屏幕状态变化、屏幕折叠状态等适配不同的UI界面显示。此外，本示例还展示了扩展模式下的多屏坐标转换能力，识别主屏与扩展屏，实现全局坐标与相对坐标的相互转换，适配多屏业务。

屏幕属性的常见使用场景有以下几种：

- 查询屏幕信息：包括屏幕的分辨率、物理像素密度、逻辑像素密度、刷新率、屏幕尺寸、屏幕旋转方向、屏幕旋转角度等。
- 监听屏幕状态变化，包括屏幕旋转变化，屏幕分辨率变化、屏幕刷新率变化等。
- 查询当前设备是否为可折叠设备，同时支持折叠状态（展开/折叠）变化的监听。
- 多屏扩展场景：识别各屏幕的显示模式（主屏、扩展屏等），获知屏幕在全局坐标系中的位置，并在全局坐标与相对坐标之间相互转换。

### 使用说明

本示例包含13个功能：
1. 获取Display对象。
2. 获取Display对象属性。
3. 获取挖孔信息。
4. 获取截录屏状态。
5. 测试Display监听机制。
6. 折叠设备判断。
7. 获取所有屏幕显示模式。
8. 获取指定屏幕显示模式。
9. 监听屏幕显示模式变化。
10. 获取扩展屏全局坐标。
11. 相对坐标转全局坐标。
12. 全局坐标转相对坐标。
13. 判断全局坐标所在屏幕。

### 工程目录

```
DisplayBasicSample

entry/src/
 ├── main
 │   ├── ets
 │   │   └── pages
 │   │      └── Index.ets (功能页面)
 │   ├── module.json5
 │   └── resources
 ├── ohosTest
 ├── mock
 ├── test
```

### 具体实现

1. **获取Display对象**
   - 调用getDefaultDisplaySync()接口获取Display对象，将获取到的Display对象打印到log中。
2. **获取Display对象属性**
   - 调用getDefaultDisplaySync()接口获取Display对象。
   - 通过相关属性查询屏幕的一些基础信息，将属性信息打印到log中。
3. **获取挖孔信息**
   - 调用getCutoutInfo()获取挖孔屏、刘海屏、瀑布屏等不可用的屏幕区域信息，以在UI布局时更好地规避该区域，将对应的信息打印到log中。
4. **获取截录屏状态**
   - 调用display.isCaptured()判断当前设备是否正在截屏、投屏或录屏。
5. **测试Display监听机制**
   - 调用display.on('add'|'remove'|'change')监听设备屏幕变化，支持监听屏幕设备的增加、移除和改变等，在不需要监听的时候，调用display.off('add'|'remove'|'change')关闭对应的监听。
   - 调用display.on('captureStatusChange')开启屏幕截屏、投屏或录屏状态变化的监听；在不需要监听的时候，调用display.off('captureStatusChange')关闭对应的监听。
   - 调用on('availableAreaChange')监听当前屏幕对象（Display对象）的可用区域变化；在不需要监听的时候，调用off('availableAreaChange')关闭对应的监听。
6. **折叠设备判断**
   - 通过display.isFoldable()接口查询当前设备是不是折叠设备。
   - 若当前设备为折叠设备，调用display.on('foldStatusChange')开启折叠设备折叠状态变化的监听；在不需要监听的时候，调用display.off('foldStatusChange')关闭对应的监听。
7. **获取所有屏幕显示模式**
   - 调用getAllDisplays()获取当前所有Display对象后，遍历读取sourceMode属性，即可得到每块屏幕当前的显示模式（主屏、扩展屏等）。
8. **获取指定屏幕显示模式**
   - 已知屏幕ID时，调用getDisplayByIdSync()获取对应Display对象的sourceMode属性。
9. **监听屏幕显示模式变化**
   - 屏幕的接入、移除或显示模式切换（例如用户在系统设置中切换投屏模式）时，会触发'add'、'remove'或'change'事件，通过display.on('add'|'remove'|'change')进行监听，在回调中重新查询各屏幕的显示模式并更新业务逻辑；在不需要监听的时候，调用display.off('add'|'remove'|'change')关闭对应的监听。
10. **获取扩展屏全局坐标**
    - 调用getAllDisplays()获取Display对象后，读取x、y属性即可得到扩展屏左上角在全局坐标系中的坐标。
11. **相对坐标转全局坐标**
    - 调用convertRelativeToGlobalCoordinate()将相对坐标转换为全局坐标。
12. **全局坐标转相对坐标**
    - 调用convertGlobalToRelativeCoordinate()并传入目标屏幕ID，将全局坐标转换为该屏幕的相对坐标。
13. **判断全局坐标所在屏幕**
    - 调用convertGlobalToRelativeCoordinate()时不传入displayId，返回的RelativePosition对象中，displayId即为该全局坐标所在屏幕的ID。

### 相关权限

不涉及

### 依赖

不涉及

### 约束与限制

1. 本示例仅支持标准系统上运行, 支持设备：手机、平板、2in1。（部分字段可能仅支持部分设备，可参考使用说明）
2. api20以上版本
3. 屏幕显示模式与坐标转换相关功能（功能7-13）需设备外接屏幕进入扩展显示模式后，才能观察到实际的查询与转换效果。

### 下载

如需单独下载本工程，执行如下命令：

````
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample/DisplayBasicSample > .git/info/sparse-checkout
git remote add origin https://gitCode.com/openharmony/applications_app_samples.git
git pull origin master
````