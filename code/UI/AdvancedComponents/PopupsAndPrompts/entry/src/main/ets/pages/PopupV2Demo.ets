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

import { ImageModifier, PopupV2, PopupV2Button, router, TextModifier } from '@kit.ArkUI';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';
import { PromptUtils } from '../utils/PromptUtils';

/** PopupV2 sample page. */
@Entry
@ComponentV2
struct PopupV2Demo {
  @Local widthVp: number = 0;
  @Local status: string = 'ready';
  @Local confirmCount: number = 0;
  @Local cancelCount: number = 0;
  @Local closeCount: number = 0;
  @Local operationCount: number = 0;
  @Local history: string[] = [];

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('PopupV2Demo');
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('PopupV2Demo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('PopupV2Demo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('PopupV2Demo');
  }

  private record(action: string): void {
    this.operationCount++;
    this.history = [`#${this.operationCount} ${action}`, ...this.history].slice(0, 3);
    Logger.event('PopupV2Demo', 'history', action);
  }

  @Builder
  statCard(label: string, kind: string, id: string) {
    Column({ space: 2 }) {
      Text(label)
        .fontSize(11)
        .fontColor('#666666')
      Text(kind === 'confirm' ? `${this.confirmCount}` :
        kind === 'cancel' ? `${this.cancelCount}` : `${this.operationCount}`)
        .id(id)
        .fontSize(17)
        .fontWeight(FontWeight.Bold)
        .fontColor('#0A59F7')
    }
    .layoutWeight(1)
    .height(54)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F1F3F5')
    .borderRadius(10)
  }

  // Compose the page layout and responsive controls.
  build() {
    Scroll() {
      Column({ space: 12 }) {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('popupBack')
          .onClick(() => {
            router.back();
          })
        Text($r('app.string.popup_title'))
          .id('popupTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding({ left: 12, right: 12, top: 12, bottom: 6 })

      Row({ space: 8 }) {
        this.statCard('Confirm', 'confirm', 'popupConfirmCount')
        this.statCard('Cancel', 'cancel', 'popupCancelCount')
        this.statCard('Actions', 'actions', 'popupActionCount')
      }
      .width('100%')
      .padding({ left: 12, right: 12, bottom: 8 })

      PopupV2({
        icon: $r('app.media.icon'),
        iconModifier: new ImageModifier().width(32).height(32).fillColor(Color.White).borderRadius(16),
        title: 'PopupV2 title',
        titleModifier: new TextModifier().fontSize(20).fontColor(Color.Black),
        message: 'PopupV2 message for confirmation.',
        messageModifier: new TextModifier().fontSize(15).fontColor(Color.Black),
        showClose: true,
        onClose: () => {
          this.closeCount++;
          this.status = 'close';
          this.record('close');
          Logger.event('PopupV2Demo', 'onClose', PromptUtils.formatCount('close', this.closeCount));
        },
        buttons: [{
          text: 'Confirm',
          action: () => {
            this.confirmCount++;
            this.status = 'confirm';
            this.record('confirm');
            Logger.event('PopupV2Demo', 'confirm', PromptUtils.formatCount('confirm', this.confirmCount));
          },
          buttonTextModifier: new TextModifier().fontSize(15).fontColor(Color.Black)
        }, {
          text: 'Cancel',
          action: () => {
            this.cancelCount++;
            this.status = 'cancel';
            this.record('cancel');
            Logger.event('PopupV2Demo', 'cancel', PromptUtils.formatCount('cancel', this.cancelCount));
          },
          buttonTextModifier: new TextModifier().fontSize(15).fontColor(Color.Black)
        }] as [PopupV2Button | undefined, PopupV2Button | undefined]
      })

      Text(`status=${this.status}, confirm=${this.confirmCount}, cancel=${this.cancelCount}, close=${this.closeCount}`)
        .id('popupStatus')
        .fontSize(13)

      Column({ space: 2 }) {
        Row() {
          Text('Recent actions')
            .fontSize(11)
            .fontColor('#666666')
          Blank()
          Button('Clear')
            .id('popupClearHistory')
            .fontSize(10)
            .height(22)
            .onClick(() => {
              this.history = [];
              this.operationCount = 0;
            })
        }
        .width('100%')
        if (this.history.length === 0) {
          Text('No actions yet')
            .fontSize(11)
            .fontColor('#999999')
            .width('100%')
        } else {
          ForEach(this.history, (item: string) => {
            Text(item)
              .fontSize(11)
              .fontColor('#666666')
              .maxLines(1)
              .width('100%')
          }, (item: string) => item)
        }
      }
      .id('popupHistory')
      .width('100%')
      .height(88)
      .padding(8)
      .backgroundColor('#F7F8FA')
      .borderRadius(10)
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
