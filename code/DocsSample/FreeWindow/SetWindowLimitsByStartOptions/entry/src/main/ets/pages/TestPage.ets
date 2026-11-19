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
// 示例应用的测试页面，用于显示新创建窗口的内容
@Entry
@Component
struct TestPage {
  build() {
    Row() {
      Column() {
        Text('窗口最小宽度 minWindowWidth: 600vp')
        Text('窗口最小高度 minWindowHeight: 500vp')
        Text('窗口最大宽度 maxWindowWidth: 800vp')
        Text('窗口最大高度 maxWindowHeight: 600vp')
      }
    }
    .width('100%')
    .height('100%')
  }
}