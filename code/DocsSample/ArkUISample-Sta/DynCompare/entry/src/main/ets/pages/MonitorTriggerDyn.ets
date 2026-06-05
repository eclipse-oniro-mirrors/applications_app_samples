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

// [Start monitor_trigger_dyn]
import { UIUtils } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN = 0x0000;

@ObservedV2
class Info {
  @Trace message: string = 'not initialized';

  constructor() {
    try {
      UIUtils.addMonitor(this, 'message', this.onMessageChange);
    } catch (err) {
      hilog.error(DOMAIN, 'testTag', `taskpool execute fail. code is ${err.name}, message is ${err.message}`);
    }
    // 会触发onMessageChange回调，打印`message change from not initialized to initialized`
    this.message = 'initialized';
  }

  onMessageChange(monitor: IMonitor) {
    console.info(`message change from ${monitor.value()?.before} to ${monitor.value()?.now}`);
  }
}

@Entry
@ComponentV2
struct Page {
  info: Info = new Info();

  aboutToAppear(): void {
    // 会再次触发onMessageChange回调，打印`message change from initialized to Index aboutToAppear`
    this.info.message = 'Index aboutToAppear';
  }

  build() {
    Column() {
      Text('Hello world')
    }
  }
}
// [End monitor_trigger_dyn]

@Builder
export function monitorTriggerDynBuilder(): void {
  NavDestination() {
    Page();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.monitor_trigger_dyn_title'))
}
