/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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

/**
 * 测试页面索引组件。
 * 作为 ohosTest 的默认页面，用于显示测试执行状态。
 */
@Entry
@Component
struct Index {
  /** 页面标题 */
  @State title: string = 'Bluetooth BaseProfile Tests';
  /** 测试状态信息 */
  @State statusMessage: string = 'Tests are running...';

  /**
   * 构建 UI 界面。
   */
  build() {
    Column() {
      Text(this.title)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.statusMessage)
        .fontSize(16)
        .fontColor('#666666')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

export default Index;
