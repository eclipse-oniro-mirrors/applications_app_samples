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
import {
  EditableLeftIconTypeV2,
  EditableLeftIconV2,
  EditableSaveButtonV2,
  EditableTitleBarMenuItemV2,
  EditableTitleBarStyleV2,
  EditableTitleBarV2,
  EditableTitleV2
} from '@ohos.arkui.advanced.EditableTitleBarV2';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';
import { TitleBarActions } from '../utils/TitleBarActions';

/** EditableTitleBarV2 sample page. */
@Entry
@ComponentV2
struct EditableTitleBarV2Demo {
  @Local widthVp: number = 0;
  @Local actionText: string = 'save=0, cancel=0, menu=0';
  private actions: TitleBarActions = new TitleBarActions('EditableTitleBarV2Demo');
  @Local leftIcon: EditableLeftIconV2 = new EditableLeftIconV2({
    iconType: EditableLeftIconTypeV2.Cancel,
    onAction: () => {
      this.onCancel();
    }
  });
  @Local title: EditableTitleV2 = new EditableTitleV2({
    mainTitle: $r('app.string.edit_v2_page_title'),
    subTitle: $r('app.string.edit_v2_page_subtitle')
  });
  @Local menuItems: EditableTitleBarMenuItemV2[] = [
    new EditableTitleBarMenuItemV2({
      value: $r('sys.media.ohos_ic_public_share'),
      label: 'Share',
      isEnabled: true,
      action: () => {
        this.onMenu();
      }
    })
  ];
  @Local saveButton: EditableSaveButtonV2 = new EditableSaveButtonV2({
    isRequired: true,
    onAction: () => {
      this.onSave();
    }
  });
  @Local options: EditableTitleBarStyleV2 = new EditableTitleBarStyleV2({
    backgroundColor: '#F1F3F5'
  });

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('EditableTitleBarV2Demo');
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('EditableTitleBarV2Demo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('EditableTitleBarV2Demo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('EditableTitleBarV2Demo');
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

  // Compose the page layout and responsive controls.
  build() {
    Scroll() {
      Column({ space: 12 }) {
        Row({ space: 12 }) {
          Button($r('app.string.back'))
            .id('editableV2Back')
            .onClick(() => {
              Logger.event('EditableTitleBarV2Demo', 'back');
              router.back();
            })
          Text($r('app.string.edit_v2_title'))
            .id('editableV2PageTitle')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
        .padding(12)

        Column() {
          EditableTitleBarV2({
            leftIcon: this.leftIcon,
            title: this.title,
            menuItems: this.menuItems,
            saveButton: this.saveButton,
            options: this.options
          })
        }
        .id('editableTitleBarV2')
        .width('100%')
        .backgroundColor('#F1F3F5')

        Text(this.actionText)
          .id('editableV2Counts')
          .fontSize(14)
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
