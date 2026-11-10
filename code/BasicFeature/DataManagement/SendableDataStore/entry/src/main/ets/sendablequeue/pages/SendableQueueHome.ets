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

import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../../utils/Logger';
import { SendableQueueManager } from '../SendableQueueManager';

@Entry
@Component
struct SendableQueueHome {
  @State private result: ResourceStr = $r('app.string.initial_result');
  private manager: SendableQueueManager = new SendableQueueManager();

  aboutToDisappear(): void {
    this.manager.release();
  }

  @Builder
  sectionTitle(title: Resource): void {
    Text(title)
      .fontSize(18)
      .fontWeight(FontWeight.Medium)
      .fontColor($r('app.color.primary_text'))
      .width('100%')
      .margin({ top: 8 })
  }

  @Builder
  actionButton(label: Resource, action: () => void): void {
    Button(label)
      .width('100%')
      .height(44)
      .fontSize(14)
      .onClick(action)
  }

  @Builder
  buttonRow(firstLabel: Resource, firstAction: () => void, secondLabel: Resource, secondAction: () => void): void {
    Row({ space: 8 }) {
      Button(firstLabel)
        .layoutWeight(1)
        .height(44)
        .fontSize(13)
        .onClick(firstAction)
      Button(secondLabel)
        .layoutWeight(1)
        .height(44)
        .fontSize(13)
        .onClick(secondAction)
    }
    .width('100%')
  }

  build(): void {
    Column({ space: 10 }) {
      Text($r('app.string.queue_title'))
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.primary_text'))
        .id('queue_page_title')
      Text($r('app.string.queue_description'))
        .fontSize(14)
        .fontColor($r('app.color.secondary_text'))
      Scroll() {
        Column({ space: 8 }) {
          this.sectionTitle($r('app.string.section_queue_init'))
          this.buttonRow($r('app.string.init_fifo'),
            (): void => this.runSync((): string => this.manager.initializeFIFO(100)),
            $r('app.string.init_lifo'),
            (): void => this.runSync((): string => this.manager.initializeLIFO(100)))
          this.actionButton($r('app.string.init_priority'),
            (): void => this.runSync((): string => this.manager.initializePriority(100)))

          this.sectionTitle($r('app.string.section_queue_basic'))
          this.buttonRow($r('app.string.enqueue_string'),
            (): void => this.runSync((): string => this.manager.enqueueString('task_1', 5)),
            $r('app.string.dequeue'),
            (): void => this.runSync((): string => this.manager.dequeue()))
          this.buttonRow($r('app.string.enqueue_number'),
            (): void => this.runSync((): string => this.manager.enqueueNumber(42, 8)),
            $r('app.string.peek'),
            (): void => this.runSync((): string => this.manager.peek()))
          this.buttonRow($r('app.string.enqueue_boolean'),
            (): void => this.runSync((): string => this.manager.enqueueBoolean(true, 3)),
            $r('app.string.peek_at'),
            (): void => this.runSync((): string => this.manager.peekAt(0)))
          this.buttonRow($r('app.string.queue_size'),
            (): void => this.runSync((): string => `size=${this.manager.size()}`),
            $r('app.string.queue_empty'),
            (): void => this.runSync((): string => `isEmpty=${this.manager.isEmpty()}`))

          this.sectionTitle($r('app.string.section_queue_batch'))
          this.buttonRow($r('app.string.drain_queue'),
            (): void => this.runSync((): string => this.manager.drain(2)),
            $r('app.string.peek_all'),
            (): void => this.runSync((): string => this.manager.peekAll()))
          this.buttonRow($r('app.string.batch_enqueue_str'),
            (): void => this.runSync((): string => this.manager.batchEnqueueString(['a', 'b', 'c'], 5)),
            $r('app.string.batch_enqueue_num'),
            (): void => this.runSync((): string => this.manager.batchEnqueueNumber([10, 20, 30], 3)))
          this.buttonRow($r('app.string.batch_dequeue'),
            (): void => this.runSync((): string => this.manager.batchDequeue(3)),
            $r('app.string.clear_queue'),
            (): void => this.runSync((): string => this.manager.clear()))

          this.sectionTitle($r('app.string.section_queue_convert'))
          this.buttonRow($r('app.string.queue_to_array'),
            (): void => this.runSync((): string => this.manager.toArray()),
            $r('app.string.queue_to_json'),
            (): void => this.runSync((): string => this.manager.toJSON()))
          this.buttonRow($r('app.string.show_queue_stats'),
            (): void => this.runSync((): string => this.manager.getStatistics()),
            $r('app.string.reset_queue_stats'),
            (): void => this.runSync((): string => this.manager.resetStatistics()))
        }
        .width('100%')
      }
      .layoutWeight(1)
      .width('100%')
      .align(Alignment.Top)
      Text($r('app.string.result_title'))
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .width('100%')
      Scroll() {
        Text(this.result)
          .fontSize(13)
          .fontColor($r('app.color.primary_text'))
          .width('100%')
      }
      .height(110)
      .width('100%')
      .padding(12)
      .backgroundColor($r('app.color.result_background'))
      .borderRadius(8)
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor($r('app.color.page_background'))
  }

  private runSync(action: () => string): void {
    try {
      this.result = action();
    } catch (error) {
      this.showError(error as BusinessError);
    }
  }

  private showError(error: BusinessError): void {
    const message = `${error.name}: ${error.message}; code=${error.code}`;
    this.result = message;
    Logger.error(message);
  }
}
