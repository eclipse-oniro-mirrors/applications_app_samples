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

// [Start AddMonitorArray]
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

  constructor() {
    UIUtils.addMonitor(this, ['age', 'name'], this.onChange1);
  }
}

@Entry
@ComponentV2
struct Page {
  user: User = new User();

  build() {
    Column() {
      Text(`User name ${this.user.name}`)
        .fontSize(20)
        .onClick(() => {
          // 改变name，回调onChange1监听函数
          this.user.name += '!';
        })
      Text(`User age ${this.user.age}`)
        .fontSize(20)
        .onClick(() => {
          // age自增，回调onChange1监听函数
          this.user.age++;
        })
      Button('clear name and age monitor fun')
        .onClick(() => {
          // 删除age和name的onChange1监听函数
          // 再次点击Text组件改变name和age，无监听函数回调
          UIUtils.clearMonitor(this.user, ['age', 'name'], this.user.onChange1);
        })
    }
  }
}
// [End AddMonitorArray]
