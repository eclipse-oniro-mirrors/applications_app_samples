/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import nativeObserver from 'libentry.so';

@Entry
@Component
struct Index {
  build() {
    Column() {
      Row({ space: 10 }) {
        Button('注册观察者')
          .onClick(() => {
            // 将UIContext传给Native侧，注册交互事件观察者。
            nativeObserver.registerObserver(this.getUIContext());
          })
        Button('注销观察者')
          .onClick(() => {
            nativeObserver.unregisterObserver();
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)

      Text('注册后在下方区域操作，通过hilog（tag: GestureEventObserver）观察交互事件')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ top: 10, bottom: 10 })

      // 交互区域：触发点击事件、各类手势和原始触摸事件。
      Column() {
        Text('点击 / 长按 / 拖动 / 滑动')
          .fontSize(18)
          .fontColor('#FFFFFF')
      }
      .width('90%')
      .height(120)
      .borderRadius(12)
      .backgroundColor('#4A7DFF')
      .justifyContent(FlexAlign.Center)
      .onClick(() => {
        // 触发Click事件
      })
      .gesture(
        TapGesture({ count: 1 })
          .onAction(() => {
            // 触发Tap事件
          })
      )
      .gesture(
        LongPressGesture({ repeat: false, duration: 500 })
          .onAction(() => {
            // 触发LongPress事件（结束时上报）
          })
      )
      .gesture(
        PanGesture({ fingers: 1, direction: PanDirection.All, distance: 5 })
          .onActionStart(() => {
            // 触发Pan事件（start）
          })
          .onActionEnd(() => {
            // 触发Pan事件（end）
          })
      )
      .gesture(
        SwipeGesture({ fingers: 1, direction: SwipeDirection.All, speed: 100 })
          .onAction(() => {
            // 触发Swipe事件
          })
      )

      Text('任意位置的按下/抬起会触发Touch事件（down携带命中节点id）')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(15)
  }
}
