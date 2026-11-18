/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

@Entry
@Component
struct Index {
  build() {
    Column() {
      // 固定 200x100 vp 的绘制区，并用 margin 固定左上角位置，
      // 便于断言 GetXComponentSize / GetXComponentOffset 的缓存值。
      XComponent({ id: 'testXComponentId', type: 'surface', libraryname: 'nativerender' })
        .width(200)
        .height(100)
        .margin({ left: 16, top: 24 })
        .id('testXComponent')
        .backgroundColor(Color.Blue)
    }
    .width('100%')
      .height('100%')
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Start)
  }
}