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
import { TreeSortUtils } from '../utils/TreeSortUtils';

/** ContainerSpan sample page. */
@Entry
@Component
struct ContainerSpanDemo {
  @State widthVp: number = 0;
  @State dark: boolean = true;

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('ContainerSpanDemo');
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('ContainerSpanDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('ContainerSpanDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('ContainerSpanDemo');
  }

  // Toggle the related demo state and refresh the UI.
  private toggleStyle(): void {
    this.dark = TreeSortUtils.nextSpanStyle(this.dark);
    Logger.event('ContainerSpanDemo', 'style', TreeSortUtils.spanStyle(this.dark));
  }

  // Compose the page layout and responsive controls.
  build() {
    Scroll() {
      Column({ space: 14 }) {
        Row({ space: 12 }) {
          Button($r('app.string.back'))
            .id('spanBack')
            .onClick(() => {
              Logger.event('ContainerSpanDemo', 'back');
              router.back();
            })
          Text($r('app.string.span_title'))
            .id('spanPageTitle')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
        .padding(12)

        Text() {
          ContainerSpan() {
            Span($r('app.string.span_label_one'))
              .fontSize(18)
              .fontColor(this.dark ? '#FFFFFF' : '#0A59F7')
            ImageSpan($r('sys.media.ohos_app_icon'))
              .width(20)
              .height(20)
              .verticalAlign(ImageSpanAlignment.CENTER)
            Span($r('app.string.span_label_two'))
              .fontSize(18)
              .fontColor(this.dark ? '#FFFFFF' : '#0A59F7')
          }
          .textBackgroundStyle({
            color: this.dark ? '#0A59F7' : '#DDE8FF',
            radius: 10
          })
        }
        .id('containerSpanText')
        .padding(12)
        .backgroundColor('#F1F3F5')
        .borderRadius(12)

        Text($r('app.string.span_hint'))
          .fontSize(12)
          .fontColor('#666666')

        Button($r('app.string.span_toggle'))
          .id('spanToggle')
          .onClick(() => {
            this.toggleStyle();
          })

        Text(TreeSortUtils.spanStyle(this.dark))
          .id('spanStatus')
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
