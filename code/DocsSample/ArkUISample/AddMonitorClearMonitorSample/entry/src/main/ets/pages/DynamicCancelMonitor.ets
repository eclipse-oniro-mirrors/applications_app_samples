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

// [Start DynamicCancelMonitor]
import { UIUtils } from '@kit.ArkUI';

@ObservedV2
class User {
  @Trace public age: number = 10;

  onChange(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`onChange: User property ${path} change from ${mon.value(path)?.before} to ${mon.value(path)?.now}`);
    });
  }

  constructor(needMonitor: boolean) {
    if (needMonitor) {
      UIUtils.addMonitor(this, 'age', this.onChange);
    }
  }
}

@Entry
@ComponentV2
struct Page {
  @Local user1: User = new User(true);
  @Local user2: User = new User(false);
  @Local count: number = 10;

  build() {
    Column() {
      Text(`user1 age ${this.user1.age}`).fontSize(20).onClick(() => {
        // 有Monitor回调
        this.user1.age++;
      })
      Text(`user2 age ${this.user2.age}`).fontSize(20).onClick(() => {
        // 无Monitor回调
        this.user2.age++;
      })
      Button(`remove user1 monitor`).onClick(() => {
        UIUtils.clearMonitor(this.user1, 'age', this.user1.onChange);
      })

      Button(`change count`).onClick(() => {
        this.count++;
      })

      Child({ needMonitor: true, count: this.count })
      Child({ needMonitor: false, count: this.count })
    }
  }
}

@ComponentV2
struct Child {
  @Param needMonitor: boolean = false;
  @Param count: number = 0;

  onChange(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`Child needMonitor ${this.needMonitor} onChange: property ${path} change from ${mon.value(path)?.before} to ${mon.value(path)?.now}`);
    });
  }

  aboutToAppear(): void {
    if (this.needMonitor) {
      UIUtils.addMonitor(this, 'count', this.onChange);
    }
  }

  build() {
    Column() {
      Text(`${this.count}`).fontSize(20)
    }
  }
}
// [End DynamicCancelMonitor]
