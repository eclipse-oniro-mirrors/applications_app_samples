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

import { router, SplitLayout } from '@kit.ArkUI';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';

/** SplitLayout sample page. */
@Entry
@Component
struct SplitLayoutDemo {
  @State widthVp: number = 0;
  private lastBreakpoint: string = '';
  @State breakpoint: string = BreakpointUtils.SM;
  @State showOptionalText: boolean = true;
  @State previewWidth: number = 500;

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('SplitLayoutDemo');
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('SplitLayoutDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('SplitLayoutDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('SplitLayoutDemo');
  }

  @Builder
  PreviewLayout() {
    Column({ space: 4 }) {
      SplitLayout({
        mainImage: $r('app.media.icon'),
        primaryText: `${this.previewWidth}vp layout`,
        secondaryText: 'Secondary text',
        tertiaryText: 'Tertiary text'
      }) {
        Text('Container')
          .fontSize(12)
          .width('100%')
          .textAlign(TextAlign.Center)
      }
    }
    .id('splitPreview')
    .width(this.previewWidth)
    .height(220)
    .backgroundColor('#F1F3F5')
  }

  // Compose the page layout and responsive controls.
  build() {
    Column() {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('splitBack')
          .onClick(() => {
            Logger.info('back to index from SplitLayoutDemo');
            router.back();
          })
        Text($r('app.string.split_title'))
          .id('splitTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding(12)

      Scroll() {
        Column({ space: 10 }) {
          Text(`width=${Math.round(this.widthVp)}vp, breakpoint=${this.breakpoint}, columns=${BreakpointUtils.columnCount(this.widthVp)}`)
            .id('splitBreakpoint')
            .fontSize(12)
            .fontColor('#666666')
            .width('100%')

          Row({ space: 8 }) {
            Button(this.showOptionalText ? 'Hide optional text' : 'Show optional text')
              .id('splitToggleOptional')
              .onClick(() => {
                this.showOptionalText = !this.showOptionalText;
                Logger.info(`showOptionalText=${this.showOptionalText}`);
              })
            Text(this.showOptionalText ? 'full text' : 'primary only')
              .id('splitOptionalState')
              .fontSize(12)
          }
          .width('100%')

          Row({ space: 8 }) {
            Button('500vp').id('preview500').onClick(() => {
              this.previewWidth = 500;
              Logger.event('SplitLayoutDemo', 'previewWidth', '500vp');
            })
            Button('700vp').id('preview700').onClick(() => {
              this.previewWidth = 700;
              Logger.event('SplitLayoutDemo', 'previewWidth', '700vp');
            })
            Button('1000vp').id('preview1000').onClick(() => {
              this.previewWidth = 1000;
              Logger.event('SplitLayoutDemo', 'previewWidth', '1000vp');
            })
            Text(`${this.previewWidth}vp`)
              .id('splitPreviewLabel')
              .fontSize(12)
          }
          .width('100%')

          if (this.showOptionalText) {
            Column() {
              SplitLayout({
                mainImage: $r('app.media.icon'),
                primaryText: 'Navigation and layout',
                secondaryText: 'SplitLayout adapts to screen width automatically.',
                tertiaryText: 'Try resizing the window or rotating the device.'
              }) {
                Column({ space: 8 }) {
                  Text($r('app.string.split_content'))
                    .id('splitContainerText')
                    .fontSize(14)
                    .textAlign(TextAlign.Center)
                    .width('100%')
                  Text(`Container columns: ${BreakpointUtils.columnCount(this.widthVp)}`)
                    .id('splitContainerColumns')
                    .fontSize(12)
                    .fontColor('#666666')
                }
                .padding(16)
                .width('100%')
              }
            }
            .width('100%')
            .height(360)
          } else {
            Column() {
              SplitLayout({
                mainImage: $r('app.media.icon'),
                primaryText: 'Primary text only'
              }) {
                Text($r('app.string.split_content'))
                  .id('splitContainerText')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .width('100%')
              }
            }
            .width('100%')
            .height(360)
          }

          Text('Narrow / medium / wide preview')
            .fontSize(13)
            .width('100%')

          Scroll() {
            this.PreviewLayout()
          }
          .scrollable(ScrollDirection.Horizontal)
          .width('100%')
          .height(240)
        }
        .padding({ left: 12, right: 12, bottom: 12 })
      }
      .layoutWeight(1)
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .onAreaChange((oldArea: Area, newArea: Area) => {
      this.widthVp = px2vp(Number(newArea.width));
      const nextBreakpoint = BreakpointUtils.resolve(this.widthVp);
      if (nextBreakpoint !== this.lastBreakpoint) {
        this.lastBreakpoint = nextBreakpoint;
        this.breakpoint = nextBreakpoint;
        Logger.event('SplitLayoutDemo', 'breakpointChanged', BreakpointUtils.describe(this.widthVp));
      }
    })
  }
}
