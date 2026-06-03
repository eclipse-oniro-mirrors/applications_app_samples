'use static'

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

// [Start smartgesture_case2]
import {
  Entry,
  Text,
  Column,
  Row,
  Component,
  Button,
  ClickEvent,
  GestureShortcut,
  Callback,
  List,
  ListItem,
  SmartGestureAction,
  FontWeight,
  TextAlign,
  ColumnOptions,
  RowOptions,
  State,
} from '@kit.ArkUI'
import {
  SmartGestureController,
  BaseGestureHandlingProposal,
  GestureHandlingResolution,
  TargetedGestureProposal,
  ClickActionProposal,
  SelectActionProposal,
  ScrollActionProposal,
} from '@ohos.arkui.UIContext'

@Entry
@Component
struct Demo2 {
  private controller: SmartGestureController = this.getUIContext().getSmartGestureController();
  @State hint: string = 'Demo2: 长列表List\n划一划切换选中ListItem → 敲一敲触发点击';
  @State clickCounts: Array<int> = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  private items: Array<string> = ['项目A', '项目B', '项目C', '项目D', '项目E', '项目F',
    '项目G', '项目H', '项目I', '项目J', '项目K', '项目L'];

  private callback: Callback<BaseGestureHandlingProposal, GestureHandlingResolution> =
    (proposal: BaseGestureHandlingProposal): GestureHandlingResolution => {
      let targetProposal = proposal as TargetedGestureProposal;
      let nodeId: string = targetProposal.node ? targetProposal.node.getId() : '';
      this.hint = `意图=${proposal.operateIntention}, 动作=${proposal.action}, 目标=${nodeId}`;
      let resolution = new GestureHandlingResolution(true);

      if (proposal.action === SmartGestureAction.CLICK) {
        if (nodeId) {
          let node = this.getUIContext().getFrameNodeById(nodeId);
          if (node) {
            resolution.selectedProposal = new ClickActionProposal(node);
          }
        }
      } else if (proposal.action === SmartGestureAction.SELECT) {
        if (nodeId) {
          let node = this.getUIContext().getFrameNodeById(nodeId);
          if (node) {
            resolution.selectedProposal = new SelectActionProposal(node);
          }
        }
      } else if (proposal.action === SmartGestureAction.SCROLL_FORWARD) {
        let node = this.getUIContext().getFrameNodeById('long_list');
        if (node) {
          resolution.selectedProposal = new ScrollActionProposal(node, 100);
        }
      }

      return resolution;
    };

  aboutToAppear(): void {
    this.controller.enableSmartTapAndSlideGestures(true);
    this.controller.registerMonitor(this.callback);
  }

  aboutToDisappear(): void {
    this.controller.clearMonitors();
    this.controller.enableSmartTapAndSlideGestures(false);
  }

  build() {
    Column({ space: 12 } as ColumnOptions) {
      Text('Demo2: 长列表List')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.hint)
        .fontSize(13)
        .fontColor('#666')
        .width('100%')
        .textAlign(TextAlign.Center)
        .padding(8)
        .borderRadius(8)
        .backgroundColor('#e8e8e8')

      List({ space: 8 }) {
        this.items.forEach((item: string, index: int) => {
          ListItem() {
            Row(undefined) {
              Text(item)
                .fontSize(16)
                .layoutWeight(1)
              Text(`点击=${this.clickCounts[index]}`)
                .fontSize(14)
                .fontColor('#4caf50')
            }.width('100%')
              .padding({ left: 16, right: 16, top: 14, bottom: 14 })
              .borderRadius(10)
              .borderWidth(1)
              .backgroundColor(index % 2 === 0 ? '#f6f8fa' : '#ffffff')
              .id(`list_item_${index}`)
              .smartGestureShortcut({ action: GestureShortcut.PRIMARY, enabled: true, selectable: true })
              .onClick((e: ClickEvent) => {
                this.clickCounts[index] += 1;
                this.hint = `${item} onClick 触发, 点击次数=${this.clickCounts[index]}`;
              })
          }
        })
      }.id('long_list')
        .width('100%')
        .layoutWeight(1)
        .borderRadius(12)
        .borderWidth(1)
    }.width('100%').height('100%').padding(16).backgroundColor('#f1f3f5')
  }
}
// [End smartgesture_case2]