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

/**
 * test page index quote group item.
 * operate for ohosTest default page, used for show display test try execute row state state.
 */
@Entry
@Component
struct Index {
  /** page title */
  @State title: string = 'Bluetooth BaseProfile Tests';
  /** test try state state info info */
  @State statusMessage: string = 'Tests are running...';

  /**
   * structure build UI interface layout.
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
