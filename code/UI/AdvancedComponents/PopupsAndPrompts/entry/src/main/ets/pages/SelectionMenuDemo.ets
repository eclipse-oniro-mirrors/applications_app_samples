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

import { EditorMenuOptions, router, SelectionMenu } from '@kit.ArkUI';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';
import { PromptUtils } from '../utils/PromptUtils';

/** SelectionMenu sample page. */
@Entry
@Component
struct SelectionMenuDemo {
  @State widthVp: number = 0;
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State start: number = -1;
  @State end: number = -1;
  @State status: string = 'ready';
  @State menuActions: number = 0;
  private editorMenuOptions: Array<EditorMenuOptions> = [
    {
      icon: $r('app.media.icon'),
      action: () => {
        this.menuActions++;
        this.status = PromptUtils.actionSummary('menu action', this.menuActions);
        Logger.event('SelectionMenuDemo', 'menuAction', this.status);
        this.controller.closeSelectionMenu();
      }
    }
  ];

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('SelectionMenuDemo');
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('SelectionMenuDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('SelectionMenuDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('SelectionMenuDemo');
  }

  @Builder
  MyMenu() {
    Column() {
      SelectionMenu({
        editorMenuOptions: this.editorMenuOptions,
        controller: this.controller
      })
    }
    .width(220)
    .backgroundColor(Color.Transparent)
  }

  // Compose the page layout and responsive controls.
  build() {
    Scroll() {
      Column({ space: 12 }) {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('selectionBack')
          .onClick(() => {
            router.back();
          })
        Text($r('app.string.selection_title'))
          .id('selectionTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding(12)

      RichEditor(this.options)
        .id('richEditor')
        .onReady(() => {
          this.controller.addTextSpan('Select this text to open the custom menu.',
            { style: { fontColor: Color.Black, fontSize: 20 } });
          Logger.event('SelectionMenuDemo', 'onReady');
        })
        .onSelect((value: RichEditorSelection) => {
          if (value.selection[0] === -1 && value.selection[1] === -1) {
            return;
          }
          this.start = value.selection[0];
          this.end = value.selection[1];
          this.status = PromptUtils.selectionSummary(this.start, this.end, 60);
          Logger.event('SelectionMenuDemo', 'onSelect', this.status);
        })
        .bindSelectionMenu(RichEditorSpanType.TEXT, this.MyMenu(), RichEditorResponseType.SELECT)
        .bindSelectionMenu(RichEditorSpanType.TEXT, this.MyMenu(), RichEditorResponseType.LONG_PRESS)
        .borderWidth(1)
        .borderColor('#CCCCCC')
        .width('100%')
        .height(200)

      Button($r('app.string.set_selection'))
        .id('selectionSet')
        .onClick(() => {
          this.controller.setSelection(0, 6);
          this.status = 'selected';
          Logger.event('SelectionMenuDemo', 'setSelection', PromptUtils.clampRange(0, 6, 60).join('-'));
        })

      Text(`status=${this.status}, start=${this.start}, end=${this.end}, menuActions=${this.menuActions}`)
        .id('selectionStatus')
        .fontSize(13)
      }
      .width('100%')
      .constraintSize({ maxWidth: BreakpointUtils.contentMaxWidth(this.widthVp) })
      .padding({
        left: BreakpointUtils.pagePadding(this.widthVp),
        right: BreakpointUtils.pagePadding(this.widthVp),
        bottom: 16
      })
    }
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
    .alignSelf(ItemAlign.Center)
    .onAreaChange((oldArea: Area, newArea: Area) => {
      this.widthVp = px2vp(Number(newArea.width));
    })
  }
}
