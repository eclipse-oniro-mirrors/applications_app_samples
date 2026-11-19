/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import nativeInject from 'libentry.so';

@Entry
@Component
struct Index {
  @State clickCount: number = 0;
  private targetX: number = 0;
  private targetY: number = 0;

  build() {
    Column({ space: 16 }) {
      Text('注入手势命令示例')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Button('目标组件')
        .width('90%')
        .onAreaChange((_oldArea: Area, newArea: Area) => {
          // 记录目标组件中心点，转换为相对窗口的物理像素（px），供注入命令使用。
          const uiContext = this.getUIContext();
          this.targetX = uiContext.vp2px(Number(newArea.globalPosition.x) + Number(newArea.width) / 2);
          this.targetY = uiContext.vp2px(Number(newArea.globalPosition.y) + Number(newArea.height) / 2);
        })
        .onClick(() => {
          this.clickCount += 1;
        })

      Text(`目标组件被点击 ${this.clickCount} 次`)
        .fontSize(16)

      Button('注入点击命令')
        .width('90%')
        .onClick(() => {
          nativeInject.injectClick(this.getUIContext(), this.targetX, this.targetY);
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .padding(20)
  }
}