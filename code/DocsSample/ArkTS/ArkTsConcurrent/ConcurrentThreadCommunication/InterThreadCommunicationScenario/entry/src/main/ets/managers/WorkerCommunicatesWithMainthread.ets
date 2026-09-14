/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// [Start respond_worker_instant_message]
import { worker, ErrorEvent, MessageEvents } from '@kit.ArkTS';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            // 创建Worker线程实例
            const ss: worker.ThreadWorker = new worker.ThreadWorker('entry/ets/workers/Worker.ets');

            // 接收Worker线程发送的消息，收到后刷新成功并销毁Worker
            ss.onmessage = (e: MessageEvents): void => {
              console.info('worker:: res is ' + e.data);
              this.message = 'success';
              // 在回调中销毁Worker线程，避免资源泄漏
              ss.terminate();
            };

            // 捕获Worker线程生命周期内的全局异常，刷新失败状态（API version 18+）
            ss.onAllErrors = (err: ErrorEvent): void => {
              console.error('worker:: error is ' + err.message);
              this.message = 'failed';
            };

            // 给Worker线程发送消息
            ss.postMessage('hello world');
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End respond_worker_instant_message]
