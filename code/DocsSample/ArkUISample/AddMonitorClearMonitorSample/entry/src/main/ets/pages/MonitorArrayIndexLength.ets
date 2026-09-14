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

// [Start MonitorArrayIndexLength]
import { UIUtils } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Page {
  @Local arr: string[] = ['a', 'b', 'c']

  onChange(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(`onChange: View property ${path} change from ${JSON.stringify(mon.value(path)?.before)} to ${JSON.stringify(mon.value(path)?.now)}`);
    });
  }

  aboutToAppear(): void {
    // 添加对数组index为0,1,2和数组length的监听回调onChange
    UIUtils.addMonitor(this, ['arr.0', 'arr.1', 'arr.2', 'arr.length'], this.onChange);
  }

  build() {
    Column() {
      Text(`len ${this.arr.length}`).fontSize(20)
      Text(`${this.arr[0]}`).fontSize(20).onClick(() => {
        // 改变数组index为0的数组项
        // onChange回调：onChange: View property arr.0 change from "a" to "az"
        this.arr[0] += 'z';
      })
      Text(`${this.arr[1]}`).fontSize(20).onClick(() => {
        // 改变数组index为1的数组项
        // onChange回调：onChange: View property arr.1 change from "b" to "bz"
        this.arr[1] += 'z';
      })
      Text(`${this.arr[2]}`).fontSize(20).onClick(() => {
        // 改变数组index为2的数组项
        // onChange回调：onChange: View property arr.2 change from "c" to "cz"
        this.arr[2] += 'z';
      })
      Text(`push`).fontSize(20).onClick(() => {
        // 在数组末尾push新数组项'd'，其index为3，index为3没有被监听
        // 数组长度改变，length被监听
        // onChange回调：onChange: View property arr.length change from 3 to 4
        this.arr.push('d');
      })
      Text(`shift`).fontSize(20).onClick(() => {
        // 删除数组第一个元素
        // 0: az -> bz
        // 1: bz -> cz
        // 2: cz -> d
        // length: 4 -> 3
        // onChange回调：
        // onChange: View property arr.0 change from "az" to "bz"
        // onChange: View property arr.1 change from "bz" to "cz"
        // onChange: View property arr.2 change from "cz" to "d"
        // onChange: View property arr.length change from 4 to 3
        this.arr.shift();
      })
    }
  }
}
// [End MonitorArrayIndexLength]
