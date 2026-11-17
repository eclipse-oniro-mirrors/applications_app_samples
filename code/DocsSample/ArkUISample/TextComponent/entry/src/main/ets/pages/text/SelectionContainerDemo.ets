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
// [Start cross_node_selection_demo]
// xxx.ets
import {
  SelectionContainer,
  SelectionContainerAttribute,
  SelectionContainerTextJoinStyle
} from '@kit.ArkUI';

@Entry
@Component
struct SelectionContainerDemo {
  @State selectedParts: string = '';
  @State copiedText: string = '';

  build() {
    NavDestination() {
      Column({ space: 16 }) {
        Text('请在下方区域跨节点选中文本')
          .fontSize(16)
          .fontColor('#999999')

        SelectionContainer() {
          Column({ space: 12 }) {
            Text('跨节点选中示例文章')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
            Text('在文章阅读场景中，标题与正文通常由多个Text组件分别承载。用户期望能够跨段落连续选中文本。')
              .fontSize(16)
            Text('SelectionContainer组件为多个文本节点提供跨节点选中、复制及菜单扩展能力，提升复杂文本布局中的交互体验。')
              .fontSize(16)
          }
        }
        .copyOption(CopyOptions.InApp)
        .textJoinStyle(SelectionContainerTextJoinStyle.NEWLINE)
        .caretColor(Color.Red)
        .selectedBackgroundColor('#33007DFF')
        .onTextSelectionChange((value: Array<string>) => {
          this.selectedParts = value.join(' | ');
        })
        .onWillCopy((value: string) => {
          this.copiedText = `准备复制：${value}`;
          return true;
        })
        .onCopy((value: string) => {
          this.copiedText = `复制成功：${value}`;
        })
        .border({ width: 1, color: '#DCDCDC' })
        .padding(12)
        .width('100%')

        Text(`选中内容：${this.selectedParts}`)
          .fontSize(14)
          .fontColor('#666666')
        Text(this.copiedText)
          .fontSize(14)
          .fontColor('#666666')
      }
      .width('100%')
      .padding(16)
    }
    // [StartExclude cross_node_selection_demo]
    .backgroundColor('#f1f2f3')
    .title($r('app.string.SelectionContainer_Demo'))
    // [EndExclude cross_node_selection_demo]
  }
}
// [End cross_node_selection_demo]

export { SelectionContainerDemo };
