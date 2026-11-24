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

// [Start selectedDataDetector_text]
@Entry
@Component
struct SelectedDataDetector {
  build() {
    // [StartExclude selectedDataDetector_text]
    NavDestination() {
    // [EndExclude selectedDataDetector_text]
      Column({ space: 12 }) {
        // 请将$r('app.string.SelectedDataDetector_Text_One')替换为实际资源文件，在本示例中该资源文件的value值为"示例网址：www.example.com"
        Text($r('app.string.SelectedDataDetector_Text_One'))
          .copyOption(CopyOptions.LocalDevice)
          .enableSelectedDataDetector(true)
          .border({ width: 1, color: Color.Black })
          .padding(10)
          .margin(10)
      }
    // [StartExclude selectedDataDetector_text]
      .alignItems(HorizontalAlign.Start)
      .backgroundColor('#fff')
      .borderRadius(12)
      .padding(12)
      .width('100%')
    }
    .padding({ left: 12, right: 12 })
    .backgroundColor('#f1f2f3')
    // 请将$r('app.string.SelectedDataDetector_title')替换为实际资源文件，在本示例中该资源文件的value值为"设置文本选择的AI菜单"
    .title($r('app.string.SelectedDataDetector_title'));
    // [EndExclude selectedDataDetector_text]
  }
}
// [End selectedDataDetector_text]

export { SelectedDataDetector };
