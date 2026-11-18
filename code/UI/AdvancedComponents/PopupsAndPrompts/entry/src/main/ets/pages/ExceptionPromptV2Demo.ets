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

import { ExceptionPromptV2, MarginTypeV2, PromptOptionsV2 } from '@ohos.arkui.advanced.ExceptionPromptV2';
import { router } from '@kit.ArkUI';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';
import { PromptUtils } from '../utils/PromptUtils';

/** ExceptionPromptV2 sample page. */
@Entry
@ComponentV2
struct ExceptionPromptV2Demo {
  @Local widthVp: number = 0;
  @Local actionCount: number = 0;
  @Local status: string = 'ready';
  @Local options: PromptOptionsV2 = new PromptOptionsV2({
    icon: $r('app.media.icon'),
    tip: 'V2 network unavailable',
    marginType: MarginTypeV2.DEFAULT_MARGIN,
    actionText: 'Settings',
    marginTop: 140,
    isShown: true
  });

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('ExceptionPromptV2Demo');
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('ExceptionPromptV2Demo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('ExceptionPromptV2Demo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('ExceptionPromptV2Demo');
  }

  private createOptions(shown: boolean): PromptOptionsV2 {
    return new PromptOptionsV2({
      icon: $r('app.media.icon'),
      tip: 'V2 network unavailable',
      marginType: MarginTypeV2.DEFAULT_MARGIN,
      actionText: 'Settings',
      marginTop: 140,
      isShown: shown
    });
  }

  // Compose the page layout and responsive controls.
  build() {
    Scroll() {
      Column({ space: 12 }) {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('exceptionV2Back')
          .onClick(() => {
            router.back();
          })
        Text($r('app.string.exception_v2_title'))
          .id('exceptionV2Title')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding(12)

      Row({ space: 12 }) {
        Button($r('app.string.show'))
          .id('exceptionV2Show')
          .onClick(() => {
            this.options = this.createOptions(true);
            this.status = 'shown';
            Logger.event('ExceptionPromptV2Demo', 'show');
          })
        Button($r('app.string.hide'))
          .id('exceptionV2Hide')
          .onClick(() => {
            this.options = this.createOptions(false);
            this.status = 'hidden';
            Logger.event('ExceptionPromptV2Demo', 'hide');
          })
      }

      ExceptionPromptV2({
        options: this.options,
        onTipClick: () => {
          this.status = 'tip';
          Logger.event('ExceptionPromptV2Demo', 'onTipClick');
        },
        onActionTextClick: () => {
          this.actionCount++;
          this.status = 'action';
          Logger.event('ExceptionPromptV2Demo', 'onActionTextClick',
            PromptUtils.formatCount('action', this.actionCount));
        }
      })

      Text(`status=${this.status}, action=${this.actionCount}`)
        .id('exceptionV2Status')
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
