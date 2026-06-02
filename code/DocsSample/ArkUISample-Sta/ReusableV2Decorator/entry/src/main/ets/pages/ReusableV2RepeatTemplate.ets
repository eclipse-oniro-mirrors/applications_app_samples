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
// [Start reusable_v2_repeat_template]
import { Entry, ComponentV2, Local, Column, Button, List, Repeat, ReusableV2, Param, Text, RepeatItem, Require, ListItem, Color } from '@kit.ArkUI';

@Entry
@ComponentV2
struct ReusableV2RepeatTemplateExample {
  @Local condition: boolean = true;
  @Local simpleList: int[] = [];
  aboutToAppear(): void {
    for (let i = 0; i < 100; i++) {
      this.simpleList.push(i)
    }
  }
  build() {
    Column() {
      Button('改变condition').onClick(()=>{this.condition=!this.condition;})
      if (this.condition) {
        // 此处仅做演示使用，让复用池中填充3个组件
        ReusableV2Component({ num: 0})
        ReusableV2Component({ num: 0})
        ReusableV2Component({ num: 0})
      }
      List() {
        Repeat<int>(this.simpleList)
          .virtualScroll()
          .each(()=>{})
          .templateId((item: int, index: int) => {
            return item % 2 === 0 ? 'a' : 'b'
          })
          .template('a', (obj: RepeatItem<int>) => {
            ListItem() {
              Column() {
                ReusableV2Component({ num: obj.item })
              }
            }
          })
          .template('b', (obj: RepeatItem<int>) => {
            ListItem() {
              Column() {
                ReusableV2Component({ num: obj.item })
              }
            }
          })
      }.height('50%')
      .cachedCount(2)
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
        .fontSize(50)
        .fontColor(this.num % 2 === 0 ? Color.Red : Color.Blue)
    }
  }
}
// [End reusable_v2_repeat_template]

@Builder
export function reusableV2RepeatTemplate(): void {
  NavDestination() {
    ReusableV2RepeatTemplateExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.reusable_v2_repeat_template_title'))
}
