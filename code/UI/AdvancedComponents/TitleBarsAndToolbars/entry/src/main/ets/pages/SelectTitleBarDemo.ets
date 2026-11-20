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

import { router, SelectTitleBar } from '@kit.ArkUI';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';
import { TitleBarConstants } from '../utils/Constants';
import { TitleBarUtils } from '../utils/TitleBarUtils';

/** SelectTitleBar sample page. */
@Entry
@Component
struct SelectTitleBarDemo {
  @State widthVp: number = 0;
  @State selected: number = 0;
  private options: SelectOption[] = [
    { value: $r('app.string.project_alpha') },
    { value: $r('app.string.project_beta') },
    { value: $r('app.string.project_gamma') }
  ];

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('SelectTitleBarDemo');
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('SelectTitleBarDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('SelectTitleBarDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('SelectTitleBarDemo');
  }

  // Apply the selected option and update the status text.
  private select(index: number): void {
    this.selected = TitleBarUtils.clampIndex(index, TitleBarConstants.PROJECT_COUNT);
    Logger.event('SelectTitleBarDemo', 'onSelected', `${this.selected}`);
  }

  // Compose the page layout and responsive controls.
  build() {
    Scroll() {
      Column({ space: 12 }) {
        Row({ space: 12 }) {
          Button($r('app.string.back'))
            .id('selectBack')
            .onClick(() => {
              Logger.event('SelectTitleBarDemo', 'back');
              router.back();
            })
          Text($r('app.string.select_title'))
            .id('selectPageTitle')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
        .padding(12)

        Column() {
          SelectTitleBar({
            selected: this.selected,
            options: this.options,
            subtitle: 'example@example.com',
            badgeValue: 3,
            hidesBackButton: true,
            onSelected: (index: number) => {
              this.select(index);
            }
          })
        }
        .id('selectTitleBar')
        .width('100%')

        Row({ space: 10 }) {
          Button($r('app.string.next_project')).id('selectNext').onClick(() => {
            this.select(TitleBarUtils.nextIndex(this.selected, TitleBarConstants.PROJECT_COUNT));
          })
          Button($r('app.string.reset_project')).id('selectReset').onClick(() => {
            this.select(0);
          })
        }

        Text(TitleBarUtils.describeIndex('selected', this.selected, TitleBarConstants.PROJECT_COUNT))
          .id('selectStatus')
          .fontSize(14)
        Text('Tap the title to open the drop-down menu')
          .fontSize(11)
          .fontColor('#999999')
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
    .scrollBar(BarState.Off)
    .onAreaChange((oldArea: Area, newArea: Area) => {
      this.widthVp = px2vp(Number(newArea.width));
    })
  }
}
