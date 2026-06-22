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

// [Start smartgesture_case1]
// [Start smartgesture_case1_proposal]
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  GestureShortcut,
  Scroll,
  Callback,
  SmartGestureAction,
  FontWeight,
  TextAlign,
  ColumnOptions,
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
// [StartExclude smartgesture_case1_proposal]

@Entry
@Component
struct Demo1 {
  // [Start smartgesture_case1_controller]
  private controller: SmartGestureController = this.getUIContext().getSmartGestureController();
  // [StartExclude smartgesture_case1_controller]
  @State hint: string = 'Demo1: 长页面Scroll + Button\n划一划滚动至按钮区域 → 划一划切换选中按钮 → 敲一敲触发点击';
  @State btn0Count: int = 0;
  @State btn1Count: int = 0;
  @State btn2Count: int = 0;
  @State btn3Count: int = 0;
  private contentItems: Array<int> = [0, 1, 2, 3, 4, 5, 6];

  // [EndExclude smartgesture_case1_proposal]
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
        let node = this.getUIContext().getFrameNodeById('long_scroll');
        if (node) {
          resolution.selectedProposal = new ScrollActionProposal(node, 200);
        }
      }

      return resolution;
    };
  // [End smartgesture_case1_proposal]

  // [EndExclude smartgesture_case1_controller]
  aboutToAppear(): void {
    this.controller.enableSmartTapAndSlideGestures(true);
    this.controller.registerMonitor(this.callback);
  }

  aboutToDisappear(): void {
    this.controller.clearMonitors();
    this.controller.enableSmartTapAndSlideGestures(false);
  }
  // [End smartgesture_case1_controller]

  build() {
    Scroll() {
      Column({ space: 16 } as ColumnOptions) {
        Text('Demo1: 长页面Scroll + Button')
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

        this.contentItems.forEach((item: int) => {
          Column(undefined) {
            Text()
              .fontSize(15)
              .width('100%')
              .padding(16)
              .borderRadius(8)
              .backgroundColor('#f0f4f8')
          }
        })

        Text('按钮操作区域 (下方)')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .textAlign(TextAlign.Center)
          .margin({ top: 8 })

        // [Start smartgesture_case1_button]
        Button(`按钮A / 点击=${this.btn0Count}`)
          .id('btn_a')
          .width('100%')
          .smartGestureShortcut({ action: GestureShortcut.PRIMARY, enabled: true, selectable: true })
          .onClick((e: ClickEvent) => {
            this.btn0Count += 1;
            this.hint = '按钮A onClick 触发';
          })
        // [End smartgesture_case1_button]

        Button(`按钮B / 点击=${this.btn1Count}`)
          .id('btn_b')
          .width('100%')
          .smartGestureShortcut({ action: GestureShortcut.PRIMARY, enabled: true, selectable: true })
          .onClick((e: ClickEvent) => {
            this.btn1Count += 1;
            this.hint = '按钮B onClick 触发';
          })

        Button(`按钮C / 点击=${this.btn2Count}`)
          .id('btn_c')
          .width('100%')
          .smartGestureShortcut({ action: GestureShortcut.PRIMARY, enabled: true, selectable: true })
          .onClick((e: ClickEvent) => {
            this.btn2Count += 1;
            this.hint = '按钮C onClick 触发';
          })

        Button(`按钮D / 点击=${this.btn3Count}`)
          .id('btn_d')
          .width('100%')
          .smartGestureShortcut({ action: GestureShortcut.PRIMARY, enabled: true, selectable: true })
          .onClick((e: ClickEvent) => {
            this.btn3Count += 1;
            this.hint = '按钮D onClick 触发';
          })
      }.width('100%').padding(16)
    }.id('long_scroll').width('100%').height('100%').backgroundColor('#f1f3f5')
  }
}
// [End smartgesture_case1]