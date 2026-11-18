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
// [Start cross_node_extend_menu]
// xxx.ets
import {
  OnMenuItemClickWithTextCallback,
  SelectionContainer,
  SelectionContainerAttribute,
  SelectionContainerEditMenuOptions,
  SelectionContainerTextJoinStyle
} from '@kit.ArkUI';

@Entry
@Component
struct SelectionContainerExtendMenu {
  @State selectedText: string = '';
  @State menuClickLog: string = '';

  onCreateMenu = (menuItems: Array<TextMenuItem>): Array<TextMenuItem> => {
    let targetIndex: number = menuItems.findIndex((item: TextMenuItem) => item.id.equals(TextMenuItemId.TRANSLATE));
    if (targetIndex !== -1) {
      menuItems.splice(targetIndex, 1);
    }
    targetIndex = menuItems.findIndex((item: TextMenuItem) => item.id.equals(TextMenuItemId.SEARCH));
    if (targetIndex !== -1) {
      menuItems.splice(targetIndex, 1);
    }
    let highlightItem: TextMenuItem = {
      content: '标注',
      id: TextMenuItemId.of('highlight')
    };
    let bookmarkItem: TextMenuItem = {
      content: '收藏',
      id: TextMenuItemId.of('bookmark')
    };
    let commentItem: TextMenuItem = {
      content: '批注',
      id: TextMenuItemId.of('comment')
    };
    menuItems.push(highlightItem);
    menuItems.push(bookmarkItem);
    menuItems.push(commentItem);
    return menuItems;
  }

  onMenuItemClick: OnMenuItemClickWithTextCallback = (menuItem: TextMenuItem, text: string): boolean => {
    this.menuClickLog = `点击菜单项：${menuItem.content}，选中文本：${text}`;
    if (menuItem.id.equals(TextMenuItemId.COPY)) {
      this.selectedText = `已复制：${text}`;
      return true;
    }
    if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
      this.selectedText = `全选操作：${text}`;
      return false;
    }
    if (menuItem.id.equals(TextMenuItemId.of('highlight'))) {
      this.selectedText = `已标注：${text}`;
      return true;
    }
    if (menuItem.id.equals(TextMenuItemId.of('bookmark'))) {
      this.selectedText = `已收藏：${text}`;
      return true;
    }
    if (menuItem.id.equals(TextMenuItemId.of('comment'))) {
      this.selectedText = `已批注：${text}`;
      return true;
    }
    return false;
  }

  @State editMenuOptions: SelectionContainerEditMenuOptions = {
    onCreateMenu: this.onCreateMenu,
    onMenuItemClick: this.onMenuItemClick
  };

  build() {
    NavDestination() {
      Column({ space: 16 }) {
        Text('请在下方区域选中文本，体验扩展菜单')
          .fontSize(16)
          .fontColor('#999999')

        SelectionContainer() {
          Column({ space: 12 }) {
            Text('第一段文本：通过editMenuOptions可以在系统菜单基础上扩展自定义项。')
              .fontSize(18)
            Text('第二段文本：可以移除不需要的系统菜单项，并添加标注、收藏、批注等自定义项。')
              .fontSize(18)
          }
        }
        .copyOption(CopyOptions.InApp)
        .textJoinStyle(SelectionContainerTextJoinStyle.DIRECT)
        .editMenuOptions(this.editMenuOptions)
        .onTextSelectionChange((value: Array<string>) => {
          this.selectedText = value.join(' | ');
        })
        .border({ width: 1, color: '#DCDCDC' })
        .padding(12)
        .width('100%')

        Text(this.selectedText)
          .fontSize(14)
          .fontColor('#666666')
        Text(this.menuClickLog)
          .fontSize(14)
          .fontColor('#999999')
      }
      .width('100%')
      .padding(16)
    }
    // [StartExclude cross_node_extend_menu]
    .backgroundColor('#f1f2f3')
    .title($r('app.string.SelectionContainer_ExtendMenu'))
    // [EndExclude cross_node_extend_menu]
  }
}
// [End cross_node_extend_menu]

export { SelectionContainerExtendMenu };
