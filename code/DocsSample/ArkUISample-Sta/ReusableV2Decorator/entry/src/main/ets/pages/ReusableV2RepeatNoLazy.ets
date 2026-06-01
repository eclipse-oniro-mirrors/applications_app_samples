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

import { NavDestination, $r } from '@kit.ArkUI';
// [Start reusable_v2_repeat_no_lazy]
import { Entry, ComponentV2, Local, Column, Button, List, Repeat, ReusableV2, Require, Param, Text, RepeatItem, ListItem } from '@kit.ArkUI';

@Entry
@ComponentV2
struct ReusableV2RepeatNoLazyExample {
  @Local simpleList: int[] = [1, 2, 3, 4, 5];
  @Local condition: boolean = true;
  build() {
    Column() {
      Button('删除/创建Repeat').onClick(()=>{this.condition=!this.condition;})
      Button('增加元素').onClick(()=>{this.simpleList.push(this.simpleList.length+1);})
      Button('删除元素').onClick(()=>{this.simpleList.pop();})
      Button('更改元素').onClick(()=>{this.simpleList[0]++;})
      if (this.condition) {
        List({ space: 10 }) {
          Repeat<int>(this.simpleList)
            .each((obj: RepeatItem<int>) => {
              ListItem() {
                Column() {
                  ReusableV2Component({ num: obj.item })
                }
              }
            })
            .virtualScroll({ disableVirtualScroll: true })
        }
      }
    }
  }
}

@ReusableV2
@ComponentV2
struct ReusableV2Component {
  @Require @Param num: int;
  aboutToAppear() {
    console.info('ReusableV2Component aboutToAppear');
  }
  aboutToRecycle() {
    console.info('ReusableV2Component aboutToRecycle');
  }
  aboutToReuse() {
    console.info('ReusableV2Component aboutToReuse');
  }
  build() {
    Column() {
      Text(`${this.num}`)
    }
  }
}
// [End reusable_v2_repeat_no_lazy]

@Builder
export function reusableV2RepeatNoLazy(): void {
  NavDestination() {
    ReusableV2RepeatNoLazyExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.reusable_v2_repeat_no_lazy_title'))
}
