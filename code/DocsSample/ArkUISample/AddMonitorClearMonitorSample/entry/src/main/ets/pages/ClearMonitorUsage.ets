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

// [Start ClearMonitorUsage]
import { UIUtils } from '@kit.ArkUI';

@ObservedV2
class User {
  @Trace public age: number = 0;
  @Trace public name: string = 'Jack';

  onChange1(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`onChange1: User property ${path} change from ${mon.value(path)?.before} to ${mon.value(path)?.now}`);
    });
  }

  onChange2(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`onChange2: User property ${path} change from ${mon.value(path)?.before} to ${mon.value(path)?.now}`);
    });
  }

  onChange3(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`onChange3: User property ${path} change from ${mon.value(path)?.before} to ${mon.value(path)?.now}`);
    });
  }

  constructor() {
    UIUtils.addMonitor(this, 'age', this.onChange1);
    UIUtils.addMonitor(this, 'age', this.onChange2);
    UIUtils.addMonitor(this, 'age', this.onChange3);
  }
}

@Entry
@ComponentV2
struct Page {
  user: User = new User();

  build() {
    Column() {
      Text(`User age ${this.user.age}`)
        .fontSize(20)
        .onClick(() => {
          // step1：点击age，回调onChange1，onChange2，onChange3
          this.user.age++;
        })
      Button('clear age onChange1').onClick(() => {
        // step2：第一次点击该Button。删除onChange1，删除成功。此时点击User age，仅会回调onChange2，onChange3
        // step3：再次点击该Button。再次删除onChange1，onChange1已经被删除，此次删除失败
        // 打印错误日志：FIX THIS APPLICATION ERROR: cannot clear path age for onChange1
        // because it was never registered with addMonitor
        UIUtils.clearMonitor(this.user, 'age', this.user.onChange1);
      })
      Button('clear age monitors').onClick(() => {
        // step4：删除age所有添加的监听函数。再次点击User age，无监听函数回调
        UIUtils.clearMonitor(this.user, 'age');
      })
      Button('clear name monitors').onClick(() => {
        // step5：删除name添加的监听方法。因为name无任何监听回调，删除失败
        // 打印错误日志：FIX THIS APPLICATION ERROR: cannot clear path name for current target
        // User because no Monitor function for this path was registered
        UIUtils.clearMonitor(this.user, 'name');
      })
    }
  }
}
// [End ClearMonitorUsage]
