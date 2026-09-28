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
// [Start cross_node_join_style]
// xxx.ets
import {
  SelectionContainer,
  SelectionContainerAttribute,
  SelectionContainerTextJoinStyle
} from '@kit.ArkUI';

@Entry
@Component
struct SelectionContainerJoinStyle {
  @State joinStyle: SelectionContainerTextJoinStyle = SelectionContainerTextJoinStyle.NEWLINE;
  @State selectedText: string = '';
  @State copiedText: string = '';

  build() {
    NavDestination() {
      Column({ space: 16 }) {
        Row({ space: 12 }) {
          Button('换行拼接')
            .type(ButtonType.Capsule)
            .backgroundColor(this.joinStyle === SelectionContainerTextJoinStyle.NEWLINE ? '#007DFF' : '#E0E0E0')
            .fontColor(this.joinStyle === SelectionContainerTextJoinStyle.NEWLINE ? Color.White : Color.Black)
            .onClick(() => {
              this.joinStyle = SelectionContainerTextJoinStyle.NEWLINE;
            })
          Button('直接拼接')
            .type(ButtonType.Capsule)
            .backgroundColor(this.joinStyle === SelectionContainerTextJoinStyle.DIRECT ? '#007DFF' : '#E0E0E0')
            .fontColor(this.joinStyle === SelectionContainerTextJoinStyle.DIRECT ? Color.White : Color.Black)
            .onClick(() => {
              this.joinStyle = SelectionContainerTextJoinStyle.DIRECT;
            })
        }

        SelectionContainer() {
          Column({ space: 12 }) {
            Text('第一段文本：选中后复制的拼接方式由textJoinStyle决定。')
              .fontSize(18)
            Text('第二段文本：换行拼接时两段文本间会插入换行符，直接拼接时不插入任何分隔符。')
              .fontSize(18)
          }
        }
        .copyOption(CopyOptions.InApp)
        .textJoinStyle(this.joinStyle)
        .onTextSelectionChange((value: Array<string>) => {
          this.selectedText = value.join(' | ');
        })
        .onWillCopy((value: string) => {
          this.copiedText = value;
          return true;
        })
        .onCopy((value: string) => {
          this.copiedText = value;
        })
        .border({ width: 1, color: '#DCDCDC' })
        .padding(12)
        .width('100%')

        Text(`选中内容：${this.selectedText}`)
          .fontSize(14)
          .fontColor('#666666')
        Text('复制内容（体现拼接方式差异）：')
          .fontSize(14)
          .fontColor('#666666')
        Text(this.copiedText)
          .fontSize(14)
          .fontColor('#333333')
          .backgroundColor('#F5F5F5')
          .padding(8)
          .borderRadius(4)
          .width('100%')
      }
      .width('100%')
      .padding(16)
    }
    // [StartExclude cross_node_join_style]
    .backgroundColor('#f1f2f3')
    .title($r('app.string.SelectionContainer_JoinStyle'))
    // [EndExclude cross_node_join_style]
  }
}
// [End cross_node_join_style]

export { SelectionContainerJoinStyle };
