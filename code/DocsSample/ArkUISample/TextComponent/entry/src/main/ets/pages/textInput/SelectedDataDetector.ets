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

import { ComponentCard } from '../../common/Card';

@Entry
@Component
struct SelectedDataDetector {
  build() {
    NavDestination() {
      Column({ space: 12 }) {
        ComponentCard({ title: $r('app.string.SelectedDataDetector_title') }) {
          Column({ space: 12 }) {
            // [Start selectedDataDetector_textinput]
            // 请将$r('app.string.SelectedDataDetector_Text_One')替换为实际资源文件，在本示例中该资源文件的value值为"示例网址：www.example.com"
            TextInput({ text: $r('app.string.SelectedDataDetector_Text_One') })
              .copyOption(CopyOptions.LocalDevice)
              .enableSelectedDataDetector(true)
              .border({ width: 1, color: Color.Black })
              .height(100)
              .margin(10)
            // [End selectedDataDetector_textinput]

            // [Start selectedDataDetector_textarea]
            // 请将$r('app.string.SelectedDataDetector_Text_One')替换为实际资源文件，在本示例中该资源文件的value值为"示例网址：www.example.com"
            TextArea({ text: $r('app.string.SelectedDataDetector_Text_One') })
              .copyOption(CopyOptions.LocalDevice)
              .enableSelectedDataDetector(true)
              .border({ width: 1, color: Color.Black })
              .height(100)
              .margin(10)
            // [End selectedDataDetector_textarea]

            // [Start selectedDataDetector_search]
            // 请将$r('app.string.SelectedDataDetector_Text_One')替换为实际资源文件，在本示例中该资源文件的value值为"示例网址：www.example.com"
            Search({ value: $r('app.string.SelectedDataDetector_Text_One') })
              .copyOption(CopyOptions.LocalDevice)
              .enableSelectedDataDetector(true)
              .border({ width: 1, color: Color.Black })
              .height(100)
              .margin(10)
            // [End selectedDataDetector_search]
          }
        }
      }
      .width('100%')
      .height('100%')
      .padding({ left: 12, right: 12 })
    }
    .backgroundColor('#f1f2f3')
    .title($r('app.string.SelectedDataDetector_title'))
  }
}

export { SelectedDataDetector };
