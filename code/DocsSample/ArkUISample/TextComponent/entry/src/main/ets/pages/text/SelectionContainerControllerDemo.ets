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
// [Start cross_node_controller]
// xxx.ets
import {
  SelectionContainer,
  SelectionContainerAttribute,
  SelectionContainerController
} from '@kit.ArkUI';

@Entry
@Component
struct SelectionContainerControllerDemo {
  private controller: SelectionContainerController = new SelectionContainerController();
  @State selectedText: string = '';

  build() {
    NavDestination() {
      Column({ space: 16 }) {
        Text('请在下方区域跨节点选中文本，再点击按钮操作')
          .fontSize(16)
          .fontColor('#999999')

        SelectionContainer({ controller: this.controller }) {
          Column({ space: 12 }) {
            Text('第一段文本：选中后可通过控制器关闭选择菜单或清除选中文本。')
              .fontSize(18)
            Text('第二段文本：closeSelectionMenu仅关闭菜单，clearTextSelection会同时清除选中态。')
              .fontSize(18)
          }
        }
        .copyOption(CopyOptions.InApp)
        .onTextSelectionChange((value: Array<string>) => {
          this.selectedText = value.join(' | ');
        })
        .border({ width: 1, color: '#DCDCDC' })
        .padding(12)
        .width('100%')

        Row({ space: 12 }) {
          Button('关闭选择菜单')
            .type(ButtonType.Capsule)
            .onClick(() => {
              this.controller.closeSelectionMenu();
            })
          Button('清除文本选中')
            .type(ButtonType.Capsule)
            .onClick(() => {
              this.controller.clearTextSelection();
              this.selectedText = '';
            })
        }

        Text(`选中内容：${this.selectedText}`)
          .fontSize(14)
          .fontColor('#666666')
      }
      .width('100%')
      .padding(16)
    }
    // [StartExclude cross_node_controller]
    .backgroundColor('#f1f2f3')
    .title($r('app.string.SelectionContainer_Controller'))
    // [EndExclude cross_node_controller]
  }
}
// [End cross_node_controller]

export { SelectionContainerControllerDemo };
