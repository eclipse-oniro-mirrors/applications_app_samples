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

// [Start AddMonitorDuplicateFunc]
import { UIUtils } from '@kit.ArkUI';

@ObservedV2
class User {
  @Trace public age: number = 0;

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

  constructor() {
    // 正确用法，给age注册监听函数onChange1
    UIUtils.addMonitor(this, 'age', this.onChange1);
    // 正确用法，给age注册监听函数onChange2
    UIUtils.addMonitor(this, 'age', this.onChange2);
  }
}

@Entry
@ComponentV2
struct Page {
  user: User = new User();

  onChange1(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`onChange1 in View: User property ${path} change from ${mon.value(path)?.before} to ${mon.value(path)?.now}`);
    });
  }

  aboutToAppear(): void {
    // 错误用法，已经给age注册过方法名为onChange1的函数，无法重复注册相同函数名的监听函数
    // 打印错误日志提示添加失败：FIX THIS APPLICATION ERROR: AddMonitor 'onChange1' owned
    // by 'User' path: 'age' - failed when adding duplicate path
    UIUtils.addMonitor(this.user, 'age', this.onChange1);
  }

  build() {
    Column() {
      Text(`User age ${this.user.age}`)
        .fontSize(20)
        .onClick(() => {
          // age自增，回调User中的onChange1和onChange2方法
          this.user.age++;
        })
    }
  }
}
// [End AddMonitorDuplicateFunc]
