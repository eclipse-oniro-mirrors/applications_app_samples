/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
@Entry
@Component
struct Index {

  build() {
    RelativeContainer() {
      Row() {
        Column() {
          Text('窗口最小宽度 minWindowWidth: 600px')
            .id('messageText')
          Text('窗口最小高度 minWindowHeight: 500px')
          Text('窗口最大宽度 maxWindowWidth: 800px')
          Text('窗口最大高度 maxWindowHeight: 600px')
        }
      }
      .height('100%')
      .width('100%')
    }
    .height('100%')
    .width('100%')
  }
}
