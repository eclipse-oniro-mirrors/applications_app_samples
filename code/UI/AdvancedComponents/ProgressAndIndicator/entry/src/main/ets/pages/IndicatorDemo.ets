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
import { ProgressConstants } from '../utils/Constants';
import { ProgressUtils } from '../utils/ProgressUtils';

class IndicatorPage {
  title: string;
  description: string;
  color: string;

  constructor(title: string, description: string, color: string) {
    this.title = title;
    this.description = description;
    this.color = color;
  }
}

/** Indicator sample page. */
@Entry
@Component
struct IndicatorDemo {
  @State widthVp: number = 0;
  private controller: IndicatorComponentController = new IndicatorComponentController();
  private pages: IndicatorPage[] = [
    new IndicatorPage('Page 1', 'Dot indicator and page one', '#FFE8F1FF'),
    new IndicatorPage('Page 2', 'Swipe or use buttons to switch', '#FFE8FFF1'),
    new IndicatorPage('Page 3', 'Digit indicator shows current index', '#FFFFF4E5')
  ];
  @State currentIndex: number = 0;
  @State indicatorStyle: string = 'dot';

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('IndicatorDemo');
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('IndicatorDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('IndicatorDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('IndicatorDemo');
  }

  private updateIndex(index: number): void {
    this.currentIndex = ProgressUtils.indicatorIndex(index, ProgressConstants.INDICATOR_COUNT);
    Logger.event('IndicatorDemo', 'onChange', ProgressUtils.describeIndicator(this.currentIndex,
      ProgressConstants.INDICATOR_COUNT, this.indicatorStyle));
  }

  // Toggle the related demo state and refresh the UI.
  private toggleStyle(): void {
    this.indicatorStyle = this.indicatorStyle === 'dot' ? 'digit' : 'dot';
    Logger.event('IndicatorDemo', 'style', this.indicatorStyle);
  }

  // Compose the page layout and responsive controls.
  build() {
    Scroll() {
      Column({ space: 12 }) {
        Row({ space: 12 }) {
          Button($r('app.string.back'))
            .id('indicatorBack')
            .onClick(() => {
              Logger.event('IndicatorDemo', 'back');
              router.back();
            })
          Text($r('app.string.indicator_title'))
            .id('indicatorTitle')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
        .padding(12)

        Column({ space: 6 }) {
          Text(this.pages[this.currentIndex].title)
            .id('indicatorPageTitle')
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
          Text(this.pages[this.currentIndex].description)
            .fontSize(14)
            .fontColor('#666666')
            .textAlign(TextAlign.Center)
        }
        .id('indicatorPage')
        .width('100%')
        .height(180)
        .justifyContent(FlexAlign.Center)
        .backgroundColor(this.pages[this.currentIndex].color)

        IndicatorComponent(this.controller)
          .id('indicatorComponent')
          .width('100%')
          .height(40)
          .count(ProgressConstants.INDICATOR_COUNT)
          .initialIndex(0)
          .loop(false)
          .vertical(false)
          .style(this.indicatorStyle === 'dot' ?
            new DotIndicator()
              .itemWidth(8)
              .itemHeight(8)
              .selectedItemWidth(20)
              .selectedItemHeight(8)
              .color('#66000000')
              .selectedColor('#0A59F7') :
            new DigitIndicator()
              .fontColor('#666666')
              .selectedFontColor('#0A59F7')
              .digitFont({ size: 14, weight: FontWeight.Medium })
              .selectedDigitFont({ size: 16, weight: FontWeight.Bold }))
          .onChange((index: number) => {
            this.updateIndex(index);
          })

        Row({ space: 10 }) {
          Button($r('app.string.previous')).id('indicatorPrev').onClick(() => {
            this.controller.showPrevious();
            Logger.event('IndicatorDemo', 'previous');
          })
          Button($r('app.string.next')).id('indicatorNext').onClick(() => {
            this.controller.showNext();
            Logger.event('IndicatorDemo', 'next');
          })
          Button($r('app.string.jump_last')).id('indicatorJump').onClick(() => {
            this.controller.changeIndex(ProgressConstants.INDICATOR_COUNT - 1, false);
            Logger.event('IndicatorDemo', 'jumpLast');
          })
          Button($r('app.string.dots')).id('indicatorDots').onClick(() => {
            if (this.indicatorStyle !== 'dot') {
              this.toggleStyle();
            }
          })
          Button($r('app.string.digits')).id('indicatorDigits').onClick(() => {
            if (this.indicatorStyle !== 'digit') {
              this.toggleStyle();
            }
          })
        }
        .width('100%')
        .padding({ left: 12, right: 12 })

        Text(ProgressUtils.describeIndicator(this.currentIndex, ProgressConstants.INDICATOR_COUNT,
          this.indicatorStyle))
          .id('indicatorStatus')
          .fontSize(14)
        Text(`index=${this.currentIndex}`)
          .id('indicatorIndex')
          .fontSize(12)
          .fontColor('#666666')
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
