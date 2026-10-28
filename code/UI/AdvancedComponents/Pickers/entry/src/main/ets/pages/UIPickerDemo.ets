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

import { router } from '@kit.ArkUI';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';
import { PickerUtils } from '../utils/PickerUtils';
import { PickerConstants } from '../utils/Constants';

/** UIPicker sample page. */
@Entry
@Component
struct UIPickerDemo {
  @State widthVp: number = 0;
  private options: string[] = PickerConstants.OPTIONS;
  @State selectedIndex: number = 0;
  @State selectedText: string = 'Todo';
  @State changeDesc: string = '';
  @State scrollStopDesc: string = '';
  @State canLoop: boolean = true;

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('UIPickerDemo');
    Logger.event('UIPickerDemo', 'options', `${this.options.length}`);
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('UIPickerDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('UIPickerDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('UIPickerDemo');
  }

  // Apply the selected option and update the status text.
  private selectIndex(index: number): void {
    this.selectedIndex = PickerUtils.clampIndex(index, this.options.length);
    this.selectedText = this.options[this.selectedIndex];
    this.changeDesc = `on change: ${this.selectedIndex}`;
    Logger.event('UIPickerDemo', 'selectIndex', `${this.selectedIndex}:${this.selectedText}`);
  }

  // Compose the page layout and responsive controls.
  build() {
    Scroll() {
      Column({ space: 12 }) {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('uiBack')
          .onClick(() => {
            Logger.event('UIPickerDemo', 'back');
            router.back();
          })
        Text($r('app.string.ui_title'))
          .id('uiTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding(12)

      Text(PickerUtils.describeSelection('Selected', this.selectedText))
        .id('uiSelected')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Column() {
        UIPickerComponent({ selectedIndex: this.selectedIndex }) {
          ForEach(this.options, (item: string) => {
            Text(item)
              .fontSize(18)
              .textAlign(TextAlign.Center)
              .width('100%')
          }, (item: string) => item)
        }
        .id('uiPicker')
        .width('60%')
        .height(240)
        .onChange((selectedIndex: number) => {
          this.changeDesc = `on change: ${selectedIndex}`;
          Logger.event('UIPickerDemo', 'onChange', this.changeDesc);
        })
        .onScrollStop((selectedIndex: number) => {
          this.selectedIndex = selectedIndex;
          this.selectedText = this.options[selectedIndex];
          this.scrollStopDesc = `on scroll stop: ${selectedIndex}`;
          Logger.event('UIPickerDemo', 'onScrollStop', this.scrollStopDesc);
        })
      }
      .width('100%')

      Row({ space: 12 }) {
        Button($r('app.string.previous')).id('uiPrevious').onClick(() => {
          this.selectIndex(this.selectedIndex - 1);
        })
        Button($r('app.string.next')).id('uiNext').onClick(() => {
          this.selectIndex(this.selectedIndex + 1);
        })
        Button(this.canLoop ? 'Loop on' : 'Loop off').id('uiLoopToggle').onClick(() => {
          this.canLoop = !this.canLoop;
          Logger.event('UIPickerDemo', 'canLoop', `${this.canLoop}`);
        })
      }

      Text(this.changeDesc)
        .id('uiChangeDesc')
        .fontSize(12)
        .fontColor('#666666')
      Text(this.scrollStopDesc)
        .id('uiScrollStopDesc')
        .fontSize(12)
        .fontColor('#666666')
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
    .constraintSize({ maxWidth: BreakpointUtils.contentMaxWidth(this.widthVp) })
    .alignSelf(ItemAlign.Center)
    .onAreaChange((oldArea: Area, newArea: Area) => {
      this.widthVp = px2vp(Number(newArea.width));
    })
  }
}
