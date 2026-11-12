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

import { colorSpaceManager, sendableColorSpaceManager } from '@kit.ArkGraphics2D';
import { collections, ErrorEvent, MessageEvents, taskpool, worker } from '@kit.ArkTS';
import { router } from '@kit.ArkUI';
import Logger from '../utils/Logger';
import { ColorSpaceInfo, getColorSpaceNameStr, STANDARD_COLOR_SPACES } from '../common/ColorSpaceData';
import { ColorSpaceResult } from '../sendable/ColorSpaceResult';

const TAG = '[Concurrency]';
const BTN_W = '80%';
const BTN_H = 44;

@Concurrent
function readColorSpaceInTask(colorSpace: sendableColorSpaceManager.ColorSpaceManager): ColorSpaceResult {
  let csName: colorSpaceManager.ColorSpace = colorSpace.getColorSpaceName();
  let whitePoint: collections.Array<number> = colorSpace.getWhitePoint();
  let gamma: number = colorSpace.getGamma();
  let wpX: number = 0;
  let wpY: number = 0;
  if (whitePoint.length >= 2) {
    wpX = whitePoint[0];
    wpY = whitePoint[1];
  }
  let nameStr: string = getColorSpaceNameStr(csName);
  let result: ColorSpaceResult = new ColorSpaceResult(nameStr, wpX, wpY, gamma);
  return result;
}

@Entry
@Component
struct Concurrency {
  @State taskResult: string = 'TaskPool result will appear here';
  @State workerResult: string = 'Worker result will appear here';
  @State referenceResult: string = 'Reference verification result will appear here';
  @State replaceResult: string = 'Reference replacement result will appear here';
  @State statusInfo: string = '';
  @State logEntries: string[] = [];
  private currentColorSpace: sendableColorSpaceManager.ColorSpaceManager | null = null;
  private colorSpaceWorker: worker.ThreadWorker | null = null;

  aboutToAppear(): void {
    Logger.info(TAG, 'aboutToAppear');
    let cs: sendableColorSpaceManager.ColorSpaceManager =
      sendableColorSpaceManager.create(STANDARD_COLOR_SPACES[0].enumValue);
    this.currentColorSpace = cs;
    this.statusInfo = `Auto-created SRGB for concurrency tests`;
    this.addLog('Page loaded, auto-created SRGB');
  }

  addLog(entry: string): void {
    let now: Date = new Date();
    let h: string = now.getHours().toString();
    let m: string = now.getMinutes().toString();
    let s: string = now.getSeconds().toString();
    if (h.length < 2) {
      h = '0' + h;
    }
    if (m.length < 2) {
      m = '0' + m;
    }
    if (s.length < 2) {
      s = '0' + s;
    }
    let timestamp: string = `${h}:${m}:${s}`;
    let newEntries: string[] = [];
    for (let i = 0; i < this.logEntries.length; i++) {
      newEntries.push(this.logEntries[i]);
    }
    newEntries.unshift(`[${timestamp}] ${entry}`);
    if (newEntries.length > 50) {
      newEntries = newEntries.slice(0, 50);
    }
    this.logEntries = newEntries;
  }

  aboutToDisappear(): void {
    if (this.colorSpaceWorker !== null) {
      this.colorSpaceWorker.terminate();
      this.colorSpaceWorker = null;
    }
  }

  executeTaskPoolRead(): void {
    if (this.currentColorSpace === null) {
      this.taskResult = 'No color space available';
      return;
    }
    let cs: sendableColorSpaceManager.ColorSpaceManager = this.currentColorSpace;
    let task: taskpool.Task = new taskpool.Task(readColorSpaceInTask, cs);
    this.taskResult = 'TaskPool executing...';
    this.addLog('TaskPool: Read started');
    taskpool.execute(task).then((result: Object) => {
      let csResult: ColorSpaceResult = result as ColorSpaceResult;
      this.taskResult =
        `[TaskPool] name=${csResult.name}\n` +
          `[TaskPool] whitePoint=[${csResult.whitePointX.toFixed(4)}, ${csResult.whitePointY.toFixed(4)}]\n` +
          `[TaskPool] gamma=${csResult.gamma}`;
      Logger.info(TAG, `TaskPool result: ${csResult.name}`);
      this.addLog(`TaskPool: OK - ${csResult.name}`);
    }).catch((err: Error) => {
      this.taskResult = `TaskPool error: ${err.message}`;
      this.addLog(`TaskPool: Error - ${err.message}`);
    });
  }

  executeWorkerRead(): void {
    if (this.currentColorSpace === null) {
      this.workerResult = 'No color space available';
      return;
    }
    if (this.colorSpaceWorker !== null) {
      this.colorSpaceWorker.terminate();
      this.colorSpaceWorker = null;
    }
    this.colorSpaceWorker = new worker.ThreadWorker('entry/ets/workers/ColorSpaceWorker.ets');
    let self: Concurrency = this;
    this.workerResult = 'Worker executing...';
    this.addLog('Worker: Read started');
    this.colorSpaceWorker.onmessage = (e: MessageEvents) => {
      let result: ColorSpaceResult = e.data as ColorSpaceResult;
      self.workerResult =
        `[Worker] name=${result.name}\n` +
          `[Worker] whitePoint=[${result.whitePointX.toFixed(4)}, ${result.whitePointY.toFixed(4)}]\n` +
          `[Worker] gamma=${result.gamma}`;
      Logger.info(TAG, `Worker result: ${result.name}`);
      this.addLog(`Worker: OK - ${result.name}`);
    };
    this.colorSpaceWorker.onerror = (e: ErrorEvent) => {
      self.workerResult = `Worker error: ${e.message}`;
      self.addLog(`Worker: Error - ${e.message}`);
    };
    let cs: sendableColorSpaceManager.ColorSpaceManager = this.currentColorSpace;
    this.colorSpaceWorker.postMessageWithSharedSendable(cs);
  }

  verifyReferenceSemantics(): void {
    if (this.currentColorSpace === null) {
      this.referenceResult = 'No color space available';
      return;
    }
    let cs: sendableColorSpaceManager.ColorSpaceManager = this.currentColorSpace;
    let task: taskpool.Task = new taskpool.Task(readColorSpaceInTask, cs);
    let taskPromise: Promise<ColorSpaceResult> =
      taskpool.execute(task).then((result: Object) => {
        return result as ColorSpaceResult;
      });

    if (this.colorSpaceWorker !== null) {
      this.colorSpaceWorker.terminate();
      this.colorSpaceWorker = null;
    }
    this.colorSpaceWorker = new worker.ThreadWorker('entry/ets/workers/ColorSpaceWorker.ets');
    let self: Concurrency = this;
    this.referenceResult = 'Verifying...';
    this.addLog('Reference: Verification started');
    let workerPromise: Promise<ColorSpaceResult> = new Promise<ColorSpaceResult>(
      (resolve: Function, reject: Function) => {
        let currentWorker: worker.ThreadWorker | null = self.colorSpaceWorker;
        if (currentWorker === null) {
          reject(new Error('Worker is null'));
          return;
        }
        currentWorker.onmessage = (e: MessageEvents) => {
          let result: ColorSpaceResult = e.data as ColorSpaceResult;
          resolve(result);
        };
        currentWorker.onerror = (e: ErrorEvent) => {
          reject(new Error(e.message));
        };
        currentWorker.postMessageWithSharedSendable(cs);
      }
    );

    let allPromises: Array<Promise<ColorSpaceResult>> = [taskPromise, workerPromise];
    Promise.all(allPromises).then((results: Array<ColorSpaceResult>) => {
      let taskRes: ColorSpaceResult = results[0];
      let workerRes: ColorSpaceResult = results[1];
      let nameMatch: boolean = taskRes.name === workerRes.name;
      let wpMatch: boolean =
        taskRes.whitePointX === workerRes.whitePointX &&
          taskRes.whitePointY === workerRes.whitePointY;
      let gammaMatch: boolean = taskRes.gamma === workerRes.gamma;
      let sameRef: boolean = nameMatch && wpMatch && gammaMatch;
      self.referenceResult =
        `[TaskPool] name=${taskRes.name}, wp=[${taskRes.whitePointX.toFixed(4)}, ${taskRes.whitePointY.toFixed(4)}], ` +
          `gamma=${taskRes.gamma}\n` +
          `[Worker]  name=${workerRes.name}, wp=[${workerRes.whitePointX.toFixed(4)}, ` +
          `${workerRes.whitePointY.toFixed(4)}], gamma=${workerRes.gamma}\n` +
          `Same reference: ${sameRef ? 'YES' : 'NO'} (name:${nameMatch} wp:${wpMatch} gamma:${gammaMatch})`;
      Logger.info(TAG, `Reference verification: sameRef=${sameRef}`);
      this.addLog(`Reference: sameRef=${sameRef ? 'YES' : 'NO'}`);
    }).catch((err: Error) => {
      self.referenceResult = `Verification error: ${err.message}`;
      this.addLog(`Reference: Error - ${err.message}`);
    });
  }

  switchColorSpace(index: number): void {
    let info = STANDARD_COLOR_SPACES[index];
    let cs: sendableColorSpaceManager.ColorSpaceManager =
      sendableColorSpaceManager.create(info.enumValue);
    this.currentColorSpace = cs;
    this.statusInfo = `Switched to ${info.label} for concurrency tests`;
    this.addLog(`Switched to ${info.label}`);
  }

  demonstrateReferenceReplacement(): void {
    if (this.colorSpaceWorker !== null) {
      this.colorSpaceWorker.terminate();
      this.colorSpaceWorker = null;
    }
    this.replaceResult = 'Verifying...';
    this.addLog('Reference replacement: started');
    let cs1: sendableColorSpaceManager.ColorSpaceManager =
      sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
    let cs2: sendableColorSpaceManager.ColorSpaceManager =
      sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3);
    let self: Concurrency = this;
    let step: number = 0;
    let firstName: string = '';
    let firstGamma: number = 0;
    this.colorSpaceWorker = new worker.ThreadWorker('entry/ets/workers/ColorSpaceWorker.ets');
    this.colorSpaceWorker.onmessage = (e: MessageEvents) => {
      let result: ColorSpaceResult = e.data as ColorSpaceResult;
      if (step === 0) {
        firstName = result.name;
        firstGamma = result.gamma;
        step = 1;
        self.addLog(`Step1: Worker read SRGB -> name=${result.name}, gamma=${result.gamma}`);
        self.colorSpaceWorker!.postMessageWithSharedSendable(cs2);
      } else {
        let secondName: string = result.name;
        let secondGamma: number = result.gamma;
        let changed: boolean = firstName !== secondName || Math.abs(firstGamma - secondGamma) > 0.01;
        self.replaceResult =
          `[Step 1] Sent SRGB -> Worker read: name=${firstName}, gamma=${firstGamma}\n` +
            `[Step 2] Sent DCI_P3 -> Worker read: name=${secondName}, gamma=${secondGamma}\n` +
            `Reference changed: ${changed ? 'YES (Sendable semantics confirmed)' : 'NO'}`;
        self.addLog(`Reference replacement: ${changed ? 'CONFIRMED' : 'FAILED'}`);
        Logger.info(TAG, `Reference replacement: changed=${changed}`);
      }
    };
    this.colorSpaceWorker.onerror = (e: ErrorEvent) => {
      self.replaceResult = `Worker error: ${e.message}`;
      self.addLog(`Reference replacement: error - ${e.message}`);
    };
    this.colorSpaceWorker.postMessageWithSharedSendable(cs1);
  }

  goBack(): void {
    if (this.colorSpaceWorker !== null) {
      this.colorSpaceWorker.terminate();
      this.colorSpaceWorker = null;
    }
    router.back();
    this.addLog('Navigated back');
  }

  build() {
    Scroll() {
      Column({ space: 8 }) {
        Row() {
          Button('< Back')
            .id('ConBtnBack')
            .fontSize(14)
            .height(36)
            .onClick(() => {
              this.goBack();
            })
          Text('Concurrency Scenarios')
            .id('ConPageTitle')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ left: 12 })
        }
        .width('100%')
        .margin({ top: 12 })
        .padding({ left: 12, right: 12 })

        Text(this.statusInfo)
          .id('StatusInfo')
          .fontSize(12)
          .fontColor('#666666')
          .margin({ top: 4 })

        Text('Switch Test Color Space')
          .id('SwitchLabel')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 8 })

        Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center }) {
          ForEach(STANDARD_COLOR_SPACES, (info: ColorSpaceInfo, index: number) => {
            Button(info.label)
              .id(`BtnSwitch_${info.label}`)
              .fontSize(10)
              .height(30)
              .layoutWeight(1)
              .margin({ bottom: 4, left: 3, right: 3 })
              .onClick(() => {
                this.switchColorSpace(index);
              })
          }, (info: ColorSpaceInfo) => info.label)
        }
        .width('95%')

        Text('TaskPool (@Concurrent)')
          .id('TaskPoolLabel')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 12 })

        Button('Read via TaskPool')
          .id('ConBtnTaskPoolRead')
          .width(BTN_W)
          .height(BTN_H)
          .fontSize(14)
          .onClick(() => {
            this.executeTaskPoolRead();
          })

        Text(this.taskResult)
          .id('ConTaskPoolResult')
          .width('90%')
          .fontSize(11)
          .fontColor('#333333')
          .backgroundColor('#F0F8FF')
          .padding(8)
          .borderRadius(8)

        Text('Worker (postMessageWithSharedSendable)')
          .id('WorkerLabel')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 12 })

        Button('Read via Worker')
          .id('BtnWorkerRead')
          .width(BTN_W)
          .height(BTN_H)
          .fontSize(14)
          .onClick(() => {
            this.executeWorkerRead();
          })

        Text(this.workerResult)
          .id('WorkerResult')
          .width('90%')
          .fontSize(11)
          .fontColor('#333333')
          .backgroundColor('#FFF8F0')
          .padding(8)
          .borderRadius(8)

        Text('Sendable Reference Semantics')
          .id('RefLabel')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 12 })

        Button('Verify: TaskPool + Worker Same Reference')
          .id('BtnVerifyRef')
          .width(BTN_W)
          .height(BTN_H)
          .fontSize(13)
          .onClick(() => {
            this.verifyReferenceSemantics();
          })

        Text(this.referenceResult)
          .id('ReferenceResult')
          .width('90%')
          .fontSize(11)
          .fontColor('#333333')
          .backgroundColor('#F0FFF0')
          .padding(8)
          .borderRadius(8)
          .margin({ bottom: 12 })

        Text('Reference Replacement Demo')
          .id('ReplaceLabel')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 12 })

        Button('Send SRGB then DCI_P3 to Same Worker')
          .id('BtnReplaceRef')
          .width(BTN_W)
          .height(BTN_H)
          .fontSize(13)
          .onClick(() => {
            this.demonstrateReferenceReplacement();
          })

        Text(this.replaceResult)
          .id('ReplaceResult')
          .width('90%')
          .fontSize(11)
          .fontColor('#333333')
          .backgroundColor('#FFF0F8')
          .padding(8)
          .borderRadius(8)
          .margin({ bottom: 12 })

        Text('Operation Log')
          .id('ConLogTitle')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 12 })
          .alignSelf(ItemAlign.Start)
          .padding({ left: 16 })

        List({ space: 2 }) {
          ForEach(this.logEntries, (entry: string, index: number) => {
            ListItem() {
              Text(entry)
                .fontSize(10)
                .fontColor('#555555')
                .width('100%')
            }
          }, (entry: string, index: number) => index.toString())
        }
        .id('ConLogList')
        .width('90%')
        .height(150)
        .backgroundColor('#F8F8F8')
        .borderRadius(8)
        .padding(8)
        .margin({ bottom: 24 })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Auto)
  }
}
