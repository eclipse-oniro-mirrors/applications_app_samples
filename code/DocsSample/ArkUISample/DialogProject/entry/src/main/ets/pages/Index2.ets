/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// [Start dialog_route_jump_back]
@Entry
@Component
struct Index2 {
  @State message: ResourceStr = $r('app.string.back');
  build() {
    Column() {
      Button(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold).onClick(() => {
        this.getUIContext().getRouter().back({
          url: '',
          params: {
            info: 'Hello World'
          }
        });
      })
    }.width('100%').height('100%').margin({ top: 20 })
  }
}
// [End dialog_route_jump_back]
