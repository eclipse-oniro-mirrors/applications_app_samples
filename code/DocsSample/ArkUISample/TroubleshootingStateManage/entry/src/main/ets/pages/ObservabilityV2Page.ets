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

// [Start V2Observe]
import { UIUtils } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0x0000;
const TAG: string = '[Sample_TroubleshootingStateManage]';

@ObservedV2
class Info {
  @Trace public value: string = 'info';
  @Trace public numberArr: number[] = [];
  public count: number = 0;

  constructor(val: string) {
    this.value = val;
    this.numberArr = [0, 1, 2];
  }
}

@Entry
@ComponentV2
struct ObservabilityV2Page {
  info: Info = new Info('info');

  aboutToAppear(): void {
    // 日志输出：this.info.numberArr is observed array
    hilog.info(DOMAIN, TAG, '%{public}s', `this.info.numberArr is ${UIUtils.getTarget(this.info.numberArr) === this.info.numberArr ?
      'not observed array' :
      'observed array'}`);
  }

  build() {
    Column() {
      Text(`Index: info value: ${this.info.value}`)
      Text(`Index: info numberArr length: ${this.info.numberArr.length}`)
      Text(`Index: info count: ${this.info.count}`)

      Button('change info property')
        .onClick(() => {
        this.info.value = 'new info';
        this.info.numberArr.push(3);
        this.info.count++;
      })
    }
  }
}
// [End V2Observe]
