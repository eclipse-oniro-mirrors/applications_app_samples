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

import { EditableLeftIconType, EditableTitleBar, router } from '@kit.ArkUI';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';
import { TitleBarActions } from '../utils/TitleBarActions';

/** EditableTitleBar sample page. */
@Entry
@Component
struct EditableTitleBarDemo {
  @State widthVp: number = 0;
  @State actionText: string = 'save=0, cancel=0, menu=0';
  @State subtitleState: string = 'shown';
  private actions: TitleBarActions = new TitleBarActions('EditableTitleBarDemo');

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('EditableTitleBarDemo');
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('EditableTitleBarDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('EditableTitleBarDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('EditableTitleBarDemo');
  }

  private onSave(): void {
    this.actionText = this.actions.save();
  }

  private onCancel(): void {
    this.actionText = this.actions.cancel();
  }

  private onMenu(): void {
    this.actionText = this.actions.menu();
  }

  // Toggle the related demo state and refresh the UI.
  private toggleSubtitle(): void {
    this.subtitleState = this.subtitleState === 'shown' ? 'hidden' : 'shown';
    Logger.event('EditableTitleBarDemo', 'subtitle', this.subtitleState);
  }

  // Compose the page layout and responsive controls.
  build() {
    Scroll() {
      Column({ space: 12 }) {
        Row({ space: 12 }) {
          Button($r('app.string.back'))
            .id('editableBack')
            .onClick(() => {
              Logger.event('EditableTitleBarDemo', 'back');
              router.back();
            })
          Text($r('app.string.edit_title'))
            .id('editablePageTitle')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
        .padding(12)

        Column() {
          EditableTitleBar({
            leftIconStyle: EditableLeftIconType.Cancel,
            title: $r('app.string.edit_page_title'),
            subtitle: this.subtitleState === 'shown' ? $r('app.string.edit_page_subtitle') : '',
            isSaveIconRequired: true,
            menuItems: [
              {
                value: $r('sys.media.ohos_ic_public_share'),
                label: 'Share',
                isEnabled: true,
                action: () => {
                  this.onMenu();
                }
              }
            ],
            onSave: () => {
              this.onSave();
            },
            onCancel: () => {
              this.onCancel();
            },
            options: {
              backgroundColor: '#F1F3F5'
            }
          })
        }
        .id('editableTitleBar')
        .width('100%')
        .backgroundColor('#F1F3F5')

        Button($r('app.string.toggle_subtitle'))
          .id('editableToggle')
          .onClick(() => {
            this.toggleSubtitle();
          })

        Text(this.actionText)
          .id('editableCounts')
          .fontSize(14)
        Text(`subtitle=${this.subtitleState}`)
          .id('editableSubtitle')
          .fontSize(12)
          .fontColor('#666666')
        Text('Save: right check icon; Cancel: left close icon')
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
