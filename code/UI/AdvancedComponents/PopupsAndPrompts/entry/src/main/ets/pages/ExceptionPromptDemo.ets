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

import { ExceptionPrompt, MarginType, PromptOptions, router } from '@kit.ArkUI';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';
import { PromptUtils } from '../utils/PromptUtils';

/** ExceptionPrompt sample page. */
@Entry
@Component
struct ExceptionPromptDemo {
  @State widthVp: number = 0;
  @State actionCount: number = 0;
  @State status: string = 'ready';
  @State options: PromptOptions = {
    icon: $r('app.media.icon'),
    tip: 'Network unavailable',
    marginType: MarginType.DEFAULT_MARGIN,
    actionText: 'Settings',
    marginTop: 140,
    isShown: true
  };

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('ExceptionPromptDemo');
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('ExceptionPromptDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('ExceptionPromptDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('ExceptionPromptDemo');
  }

  // Compose the page layout and responsive controls.
  build() {
    Scroll() {
      Column({ space: 12 }) {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('exceptionBack')
          .onClick(() => {
            router.back();
          })
        Text($r('app.string.exception_title'))
          .id('exceptionTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding(12)

      Row({ space: 12 }) {
        Button($r('app.string.show'))
          .id('exceptionShow')
          .onClick(() => {
            this.options = {
              icon: $r('app.media.icon'),
              tip: 'Network unavailable',
              marginType: MarginType.DEFAULT_MARGIN,
              actionText: 'Settings',
              marginTop: 140,
              isShown: true
            };
            this.status = 'shown';
            Logger.event('ExceptionPromptDemo', 'show');
          })
        Button($r('app.string.hide'))
          .id('exceptionHide')
          .onClick(() => {
            this.options = {
              icon: $r('app.media.icon'),
              tip: 'Network unavailable',
              marginType: MarginType.DEFAULT_MARGIN,
              actionText: 'Settings',
              marginTop: 140,
              isShown: false
            };
            this.status = 'hidden';
            Logger.event('ExceptionPromptDemo', 'hide');
          })
      }

      ExceptionPrompt({
        options: this.options,
        onTipClick: () => {
          this.status = 'tip';
          Logger.event('ExceptionPromptDemo', 'onTipClick');
        },
        onActionTextClick: () => {
          this.actionCount++;
          this.status = 'action';
          Logger.event('ExceptionPromptDemo', 'onActionTextClick',
            PromptUtils.formatCount('action', this.actionCount));
        }
      })

      Text(`status=${this.status}, action=${this.actionCount}`)
        .id('exceptionStatus')
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
