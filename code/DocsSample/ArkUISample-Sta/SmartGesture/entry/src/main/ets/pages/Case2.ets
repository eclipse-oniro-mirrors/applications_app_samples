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
  BackPressActionProposal,
} from '@ohos.arkui.UIContext'

@Entry
@Component
struct Demo2 {
  // 获取智慧手势控制器实例，用于启停手势、注册监听、控制选中态
  private controller: SmartGestureController = this.getUIContext().getSmartGestureController();
  @State hint: string = 'Demo2: 长列表List\n划一划切换选中ListItem → 敲一敲触发点击';
  @State clickCounts: Array<int> = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; // 各ListItem点击计数
  private items: Array<string> = ['项目A', '项目B', '项目C', '项目D', '项目E', '项目F',
    '项目G', '项目H', '项目I', '项目J', '项目K', '项目L'];

  // Monitor回调接收BaseGestureHandlingProposal参数，根据手势动作类型动态决策处理方案
  // BaseGestureHandlingProposal是基类，包含action(动作类型)和operateIntention(操作意图)
  // TargetedGestureProposal是子类，额外携带node属性指向目标组件节点，构造ActionProposal时需要该节点
  private callback: Callback<BaseGestureHandlingProposal, GestureHandlingResolution> =
    (proposal: BaseGestureHandlingProposal): GestureHandlingResolution => {
      // 翻腕手势意图，需执行返回操作
      if (proposal instanceof BackPressActionProposal) {
        this.hint = `意图=${proposal.operateIntention}, 动作=${proposal.action}`;
        let resolution = new GestureHandlingResolution(true);
        return resolution;
      }
      // 将BaseGestureHandlingProposal转为TargetedGestureProposal，以获取目标组件节点信息
      let targetProposal = proposal as TargetedGestureProposal;
      // 获取目标组件的id标识，用于后续通过id查找FrameNode
      let nodeId: string = targetProposal.node ? targetProposal.node.getId() : '';
      this.hint = `意图=${proposal.operateIntention}, 动作=${proposal.action}, 目标=${nodeId}`;
      // 构造手势处理结果，参数true表示消费本次手势，后续回调不再执行
      let resolution = new GestureHandlingResolution(true);

      // 敲一敲手势意图，需执行点击操作
      if (proposal.action === SmartGestureAction.CLICK) {
        if (nodeId) {
          // 通过组件id获取对应的FrameNode，用于构造点击动作提案
          let node = this.getUIContext().getFrameNodeById(nodeId);
          if (node) {
            // 构造点击动作提案，指定目标节点执行点击
            resolution.selectedProposal = new ClickActionProposal(node);
          }
        }
      // 划一划手势意图，需切换选中组件
      } else if (proposal.action === SmartGestureAction.SELECT) {
        if (nodeId) {
          let node = this.getUIContext().getFrameNodeById(nodeId);
          if (node) {
            // 构造选中动作提案，指定目标节点切换选中态
            resolution.selectedProposal = new SelectActionProposal(node);
          }
        }
      // 划一划手势意图，需滚动容器内容，滚动距离100px
      } else if (proposal.action === SmartGestureAction.SCROLL_FORWARD) {
        // ScrollActionProposal的目标节点为滚动容器而非列表项，此处通过容器id获取List的FrameNode
        let node = this.getUIContext().getFrameNodeById('long_list');
        if (node) {
          // 构造滚动动作提案，指定目标容器节点和滚动距离(100px)
          resolution.selectedProposal = new ScrollActionProposal(node, 100);
        }
      }

      return resolution;
    };

  aboutToAppear(): void {
    // 开启敲一敲和划一划智慧手势识别
    this.controller.enableSmartTapAndSlideGestures(true);
    // 注册Monitor监听回调，回调类型为Callback<BaseGestureHandlingProposal, GestureHandlingResolution>，按后注册先执行的顺序触发
    this.controller.registerMonitor(this.callback);
  }

  aboutToDisappear(): void {
    // 清空所有已注册的Monitor回调
    this.controller.clearMonitors();
    // 关闭智慧手势识别，组件侧smartGestureShortcut配置仍保留但不响应
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
              // 标记组件为智慧手势目标：action指定手势动作类型，enabled控制是否响应，selectable控制是否可被选中
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