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
import { PickerUtils } from '../utils/PickerUtils';
import { PickerConstants } from '../utils/Constants';

/** CalendarPicker sample page. */
@Entry
@Component
struct CalendarPickerDemo {
  @State widthVp: number = 0;
  @State selectedDate: Date = new Date();
  @State selectedText: string = PickerUtils.formatDate(new Date());
  @State lastEvent: string = 'ready';
  @State operationCount: number = 0;
  @State history: string[] = [];

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('CalendarPickerDemo');
    Logger.event('CalendarPickerDemo', 'range', PickerUtils.formatDateRange(PickerConstants.START_DATE, PickerConstants.END_DATE));
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('CalendarPickerDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('CalendarPickerDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('CalendarPickerDemo');
  }

  private record(action: string): void {
    this.operationCount++;
    this.history = [`#${this.operationCount} ${action} · ${this.selectedText}`, ...this.history].slice(0, 3);
    Logger.event('CalendarPickerDemo', 'history', action);
  }

  @Builder
  statCard(label: string, kind: string, id: string) {
    Column({ space: 2 }) {
      Text(label)
        .fontSize(11)
        .fontColor('#666666')
      Text(kind === 'selected' ? this.selectedText : kind === 'events' ? `${this.operationCount}` : '2020-2030')
        .id(id)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor('#0A59F7')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .layoutWeight(1)
    .height(54)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F1F3F5')
    .borderRadius(10)
    .padding({ left: 6, right: 6 })
  }

  // Compose the page layout and responsive controls.
  build() {
    Scroll() {
      Column({ space: 12 }) {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('calendarBack')
          .onClick(() => {
            Logger.event('CalendarPickerDemo', 'back');
            router.back();
          })
        Text($r('app.string.calendar_title'))
          .id('calendarTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding({ left: 12, right: 12, top: 12, bottom: 6 })

      Row({ space: 8 }) {
        this.statCard('Selected', 'selected', 'calendarSelectedCard')
        this.statCard('Events', 'events', 'calendarEventCount')
        this.statCard('Range', 'range', 'calendarRangeCard')
      }
      .width('100%')
      .padding({ left: 12, right: 12, bottom: 8 })

      Text(PickerUtils.describeSelection('Selected', this.selectedText))
        .id('calendarSelected')
        .fontSize(16)

      CalendarPicker({
        hintRadius: 10,
        selected: this.selectedDate,
        start: PickerConstants.START_DATE,
        end: PickerConstants.END_DATE
      })
        .id('calendarPicker')
        .edgeAlign(CalendarAlign.END)
        .markToday(true)
        .onChange((value: Date) => {
          this.selectedDate = PickerUtils.clampDate(value, PickerConstants.START_DATE, PickerConstants.END_DATE);
          this.selectedText = PickerUtils.formatDate(this.selectedDate);
          this.lastEvent = 'onChange';
          this.record('change');
          Logger.event('CalendarPickerDemo', 'onChange', this.selectedText);
        })

      Button($r('app.string.today'))
        .id('calendarToday')
        .onClick(() => {
          const today = new Date();
          this.selectedDate = today;
          this.selectedText = PickerUtils.formatDate(today);
          this.lastEvent = 'today';
          this.record('today');
          Logger.event('CalendarPickerDemo', 'today', this.selectedText);
        })

      Text(`event=${this.lastEvent}`)
        .id('calendarEvent')
        .fontSize(12)
        .fontColor('#666666')

      Column({ space: 2 }) {
        Row() {
          Text('Recent events')
            .fontSize(11)
            .fontColor('#666666')
          Blank()
          Button('Clear')
            .id('calendarClearHistory')
            .fontSize(10)
            .height(22)
            .onClick(() => {
              this.history = [];
              this.operationCount = 0;
            })
        }
        .width('100%')
        if (this.history.length === 0) {
          Text('No events yet')
            .fontSize(11)
            .fontColor('#999999')
            .width('100%')
        } else {
          ForEach(this.history, (item: string) => {
            Text(item)
              .fontSize(11)
              .fontColor('#666666')
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .width('100%')
          }, (item: string) => item)
        }
      }
      .id('calendarHistory')
      .width('100%')
      .height(88)
      .padding(8)
      .backgroundColor('#F7F8FA')
      .borderRadius(10)
      }
      .width('100%')
      .padding({ left: 16, right: 16 })
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
