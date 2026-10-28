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

import { AddFormMenuItem, router } from '@kit.ArkUI';
import { Want } from '@kit.AbilityKit';
import { formBindingData } from '@kit.FormKit';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';
import { TreeSortUtils } from '../utils/TreeSortUtils';

/** FormMenu sample page. */
@Entry
@Component
struct FormMenuDemo {
  @State widthVp: number = 0;
  @State status: string = 'Waiting for menu action';
  private targetId: string = 'formMenuTarget';
  private want: Want = {
    bundleName: 'com.samples.treesortandrefresh',
    abilityName: 'EntryFormAbility',
    parameters: {
      'ohos.extra.param.key.form_dimension': 2,
      'ohos.extra.param.key.form_name': 'widget',
      'ohos.extra.param.key.module_name': 'entry'
    }
  };

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('FormMenuDemo');
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('FormMenuDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('FormMenuDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('FormMenuDemo');
  }

  @Builder
  formMenuBuilder() {
    Menu() {
      AddFormMenuItem(this.want, this.targetId, {
        formBindingData: formBindingData.createFormBindingData({}),
        callback: (error, formId) => {
          const code = error ? error.code : 0;
          this.status = TreeSortUtils.formStatus(code, formId ? formId : '');
          Logger.event('FormMenuDemo', 'addForm', this.status);
        }
      })
    }
  }

  // Compose the page layout and responsive controls.
  build() {
    Scroll() {
      Column({ space: 12 }) {
        Row({ space: 12 }) {
          Button($r('app.string.back'))
            .id('formBack')
            .onClick(() => {
              Logger.event('FormMenuDemo', 'back');
              router.back();
            })
          Text($r('app.string.form_title'))
            .id('formPageTitle')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
        .padding(12)

        Column({ space: 8 }) {
          Text($r('app.string.form_card_title'))
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
          Text($r('app.string.form_card_desc'))
            .fontSize(13)
            .fontColor('#666666')
        }
        .id(this.targetId)
        .width('100%')
        .padding(20)
        .backgroundColor('#E8F1FF')
        .borderRadius(16)
        .bindContextMenu(this.formMenuBuilder, ResponseType.LongPress, {
          placement: Placement.TopLeft
        })

        Text($r('app.string.form_hint'))
          .fontSize(12)
          .fontColor('#666666')
        Text(this.status)
          .id('formStatus')
          .fontSize(14)
      }
      .width('100%')
      .padding({ bottom: 16 })
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
