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
// [Start cross_node_custom_menu]
// xxx.ets
import {
  SelectionContainer,
  SelectionContainerAttribute,
  SelectionContainerMenuOptions,
  SelectionContainerTextJoinStyle
} from '@kit.ArkUI';

@Entry
@Component
struct SelectionContainerCustomMenu {
  @State selectedText: string = '';
  @State menuLog: string = '';

  build() {
    NavDestination() {
      Column({ space: 16 }) {
        Text('请在下方区域选中文本，体验自定义菜单')
          .fontSize(16)
          .fontColor('#999999')

        SelectionContainer() {
          Column({ space: 12 }) {
            Text('第一段文本：跨节点选中后长按可弹出完全自定义的选择菜单。')
              .fontSize(18)
            Text('第二段文本：通过bindSelectionMenu绑定自定义菜单，可替代系统默认菜单。')
              .fontSize(18)
          }
        }
        .copyOption(CopyOptions.InApp)
        .textJoinStyle(SelectionContainerTextJoinStyle.DIRECT)
        .bindSelectionMenu(
          TextSpanType.TEXT,
          this.menuBuilder,
          TextResponseType.DEFAULT,
          {
            onAppear: (text: string) => {
              this.menuLog = `菜单出现，选中文本：${text}`;
            },
            onDisappear: () => {
              this.menuLog = '菜单消失';
            }
          } as SelectionContainerMenuOptions
        )
        .onTextSelectionChange((value: Array<string>) => {
          this.selectedText = value.join(' | ');
        })
        .border({ width: 1, color: '#DCDCDC' })
        .padding(12)
        .width('100%')

        Text(`选中内容：${this.selectedText}`)
          .fontSize(14)
          .fontColor('#666666')
        Text(this.menuLog)
          .fontSize(14)
          .fontColor('#999999')
      }
      .width('100%')
      .padding(16)
    }
    // [StartExclude cross_node_custom_menu]
    .backgroundColor('#f1f2f3')
    .title($r('app.string.SelectionContainer_CustomMenu'))
    // [EndExclude cross_node_custom_menu]
  }

  @Builder
  menuBuilder() {
    Column() {
      Menu() {
        MenuItemGroup() {
          MenuItem({ content: '自定义复制', labelInfo: '' })
            .onClick(() => {
              this.menuLog = '点击了自定义复制';
            })
          MenuItem({ content: '自定义分享', labelInfo: '' })
            .onClick(() => {
              this.menuLog = '点击了自定义分享';
            })
          MenuItem({ content: '自定义翻译', labelInfo: '' })
            .onClick(() => {
              this.menuLog = '点击了自定义翻译';
            })
        }
      }
      .radius($r('sys.float.ohos_id_corner_radius_card'))
      .clip(true)
      .backgroundColor('#F0F0F0')
    }
  }
}
// [End cross_node_custom_menu]

export { SelectionContainerCustomMenu };
