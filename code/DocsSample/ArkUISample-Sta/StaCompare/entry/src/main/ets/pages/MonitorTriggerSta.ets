'use static'

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

import { NavDestination, $r, ObservedV2, Trace, Local, IMonitor, IMonitorDecoratedVariable, UIUtils,
  ComponentV2, Column, Entry, Button, Text } from '@kit.ArkUI';

// [Start monitor_trigger_sta]
import { ObservedV2, Trace, Local, IMonitor, IMonitorDecoratedVariable, UIUtils,
         ComponentV2, Column, Entry, Button, Text } from '@kit.ArkUI';

@ObservedV2
class Info {
  @Trace message: string = 'not initialized';
  messageMonitor?: IMonitorDecoratedVariable;

  constructor() {
    this.messageMonitor = UIUtils.addMonitor(() => this.message, this.onMessageChange);
    // 不会触发onMessageChange回调，因为this.message修改时申请的Vsync在下方aboutToAppear执行后才被执行
    // 导致该修改被下方aboutToAppear里的修改覆盖。
    this.message = 'initialized';
  }
  onMessageChange(monitor: IMonitor): void {
    monitor.dirty.forEach((path: string) => {
      console.info(`message change from ${monitor.value<string>(path)?.before} to ${monitor.value<string>(path)?.now}`);
    });
  }
}

@Entry
@ComponentV2
struct Page {
  @Local info: Info = new Info();

  aboutToAppear(): void {
    // 触发onMessageChange回调，打印`message change from not initialized to Index aboutToAppear`
    this.info.message = 'Index aboutToAppear';
  }

  build() {
    Column() {
      Text('Hello world')
    }
  }
}
// [End monitor_trigger_sta]

@Builder
export function monitorTriggerStaBuilder(): void {
  NavDestination() {
    Page();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.monitor_trigger_sta_title'))
}
