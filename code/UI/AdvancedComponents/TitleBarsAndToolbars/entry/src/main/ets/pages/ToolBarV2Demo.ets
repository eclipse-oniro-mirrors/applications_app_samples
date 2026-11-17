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

import {
  ColorMetrics,
  LengthMetrics,
  router,
  ToolBarV2,
  ToolBarV2Item,
  ToolBarV2ItemState,
  ToolBarV2ItemText,
  ToolBarV2Modifier
} from '@kit.ArkUI';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';
import { TitleBarConstants } from '../utils/Constants';
import { TitleBarUtils } from '../utils/TitleBarUtils';

/** ToolBarV2 sample page. */
@Entry
@ComponentV2
struct ToolBarV2Demo {
  @Local toolBarList: ToolBarV2Item[] = [];
  @Local activeIndex: number = -1;
  @Local actionCount: number = 0;
  @Local activeLabel: string = 'none';
  @Local widthVp: number = 0;
  private labels: string[] = ['Home', 'Edit', 'Share', 'More'];
  private toolBarModifier: ToolBarV2Modifier = new ToolBarV2Modifier()
    .height(LengthMetrics.vp(56))
    .backgroundColor(ColorMetrics.resourceColor('#FFFFFF'))
    .stateEffect(true);

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('ToolBarV2Demo');
    this.toolBarList.push(new ToolBarV2Item({
      content: new ToolBarV2ItemText({ text: $r('app.string.tool_home') }),
      action: (index: number) => {
        this.onAction(index);
      },
      state: ToolBarV2ItemState.ENABLE
    }));
    this.toolBarList.push(new ToolBarV2Item({
      content: new ToolBarV2ItemText({ text: $r('app.string.tool_edit') }),
      action: (index: number) => {
        this.onAction(index);
      },
      state: ToolBarV2ItemState.ENABLE
    }));
    this.toolBarList.push(new ToolBarV2Item({
      content: new ToolBarV2ItemText({ text: $r('app.string.tool_share') }),
      action: (index: number) => {
        this.onAction(index);
      },
      state: ToolBarV2ItemState.ENABLE
    }));
    this.toolBarList.push(new ToolBarV2Item({
      content: new ToolBarV2ItemText({ text: $r('app.string.tool_more') }),
      action: (index: number) => {
        this.onAction(index);
      },
      state: ToolBarV2ItemState.DISABLE
    }));
    Logger.event('ToolBarV2Demo', 'init', `${this.toolBarList.length}`);
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('ToolBarV2Demo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('ToolBarV2Demo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('ToolBarV2Demo');
  }

  private onAction(index: number): void {
    this.activeIndex = TitleBarUtils.clampIndex(index, TitleBarConstants.TOOL_COUNT);
    this.activeLabel = this.labels[this.activeIndex];
    this.actionCount++;
    Logger.event('ToolBarV2Demo', 'action',
      TitleBarUtils.describeToolbar(this.activeIndex, this.activeLabel, this.actionCount));
  }

  // Compose the page layout and responsive controls.
  build() {
    Column() {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('toolbarBack')
          .onClick(() => {
            Logger.event('ToolBarV2Demo', 'back');
            router.back();
          })
        Text($r('app.string.toolbar_title'))
          .id('toolbarPageTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding({
        left: BreakpointUtils.pagePadding(this.widthVp),
        right: BreakpointUtils.pagePadding(this.widthVp),
        top: 12,
        bottom: 12
      })

      Column({ space: 8 }) {
        Text('Select an action from the toolbar below')
          .fontSize(14)
          .fontColor('#666666')
        Text(TitleBarUtils.describeToolbar(this.activeIndex, this.activeLabel, this.actionCount))
          .id('toolbarStatus')
          .fontSize(14)
        Text(`active=${this.activeIndex}`)
          .id('toolbarActive')
          .fontSize(12)
          .fontColor('#666666')
      }
      .width('100%')
      .constraintSize({ maxWidth: BreakpointUtils.contentMaxWidth(this.widthVp) })
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)

      Column() {
        ToolBarV2({
          toolBarList: this.toolBarList,
          activatedIndex: this.activeIndex,
          toolBarModifier: this.toolBarModifier
        })
      }
      .id('toolBar')
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .onAreaChange((oldArea: Area, newArea: Area) => {
      this.widthVp = px2vp(Number(newArea.width));
    })
  }
}
