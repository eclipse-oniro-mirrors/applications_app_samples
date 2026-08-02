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

// [Start AddMonitorIsSynchronous]
import { UIUtils } from '@kit.ArkUI';

@ObservedV2
class User {
  @Trace public age: number = 0;

  onChange1(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`onChange1: User property ${path} change from ${mon.value(path)?.before} to ${mon.value(path)?.now}`);
    });
  }

  constructor() {
    // 正确用法，给age注册监听函数onChange1，没有设置options默认为异步监听回调
    UIUtils.addMonitor(this, 'age', this.onChange1);
    // 错误用法，不能改变this.onChange1的监听回调的方式
    // 打印错误日志提示： FIX THIS APPLICATION ERROR: addMonitor failed, current function
    // onChange1 has already register as async, cannot change to sync anymore
    UIUtils.addMonitor(this, 'age', this.onChange1, { isSynchronous: true });
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
          // age自增，回调onChange1，回调方式为异步回调
          // 监听回调的日志：onChange1: User property age change from 0 to 2
          this.user.age++;
          this.user.age++;
        })
    }
  }
}
// [End AddMonitorIsSynchronous]
