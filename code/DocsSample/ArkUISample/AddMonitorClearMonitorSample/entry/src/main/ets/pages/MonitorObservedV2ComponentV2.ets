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

// [Start MonitorObservedV2ComponentV2]
import { UIUtils } from '@kit.ArkUI';

@ObservedV2
class User {
  @Trace public age: number = 0;
  @Trace public name: string = 'Jack';

  onChange(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`onChange: User property ${path} change from ${mon.value(path)?.before} to ${mon.value(path)?.now}`);
    });
  }

  constructor() {
    UIUtils.addMonitor(this, ['age', 'name'], this.onChange);
  }
}

@Entry
@ComponentV2
struct Page {
  @Local user: User = new User();

  onChangeInView(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`onChange in View: View property ${path} change from ${JSON.stringify(mon.value(path)?.before)} to ${JSON.stringify(mon.value(path)?.now)}`);
    });
  }

  aboutToAppear(): void {
    UIUtils.addMonitor(this, 'user', this.onChangeInView);
  }

  build() {
    Column() {
      Text(`User name ${this.user.name}`)
        .fontSize(20)
        .onClick(() => {
          // 改变name，回调onChange监听函数
          this.user.name += '!';
        })
      Text(`User age ${this.user.age}`)
        .fontSize(20)
        .onClick(() => {
          // age自增，回调onChange监听函数
          this.user.age++;
        })
      Text(`reset User`)
        .fontSize(20)
        .onClick(() => {
          // user整体赋值，回调onChangeInView监听函数
          this.user = new User();
        })
    }
  }
}
// [End MonitorObservedV2ComponentV2]
