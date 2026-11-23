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

// [Start richEditor_selectedDataDetector]
@Entry
@Component
struct SelectedDataDetector {
  controller: RichEditorController = new RichEditorController();
  textSpanOptions: RichEditorTextSpanOptions = { style: { fontSize: 20 } };

  build() {
    // [StartExclude richEditor_selectedDataDetector]
    NavDestination() {
    // [EndExclude richEditor_selectedDataDetector]
      Column({ space: 12 }) {
        // 请将$r('app.string.SelectedDataDetector_Text_One')替换为实际资源文件，在本示例中该资源文件的value值为"示例网址：www.example.com"
        RichEditor({ controller: this.controller })
          .onReady(() => {
            this.controller.addTextSpan($r('app.string.SelectedDataDetector_Text_One'), this.textSpanOptions);
          })
          .copyOptions(CopyOptions.LocalDevice)
          .enableSelectedDataDetector(true)
          .border({ width: 1, color: Color.Black })
          .height(300)
          .margin(10)
      }
    // [StartExclude richEditor_selectedDataDetector]
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
    // [EndExclude richEditor_selectedDataDetector]
  }
}
// [End richEditor_selectedDataDetector]

export { SelectedDataDetector };
