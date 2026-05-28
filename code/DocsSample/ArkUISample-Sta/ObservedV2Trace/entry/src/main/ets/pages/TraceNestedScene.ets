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
// [Start TraceNestedScene]
import { Button, Column, ComponentV2, Entry, ObservedV2, Text, Trace } from '@kit.ArkUI';

@ObservedV2
class Pencil {
  @Trace length: number = 21; // 当length变化时，会刷新关联的组件
}

class Bag {
  width: number = 50;
  height: number = 60;
  pencil: Pencil = new Pencil();
}

class Son {
  age: number = 5;
  school: string = 'some';
  bag: Bag = new Bag();
}

@Entry
@ComponentV2
struct Page {
  son: Son = new Son();
  renderTimes: number = 0;

  isRender(id: number): number {
    console.info(`id: ${id} renderTimes: ${this.renderTimes}`);
    this.renderTimes++;
    return 20;
  }

  build() {
    Column() {
      Text('pencil length' + this.son.bag.pencil.length) // UINode (1)
        .fontSize(this.isRender(1))
        .margin(10)
      Button('change length')
        .width(300)
        .margin(10)
        .onClick((e) => {
          // 点击更改length值，UINode（1）会刷新
          this.son.bag.pencil.length += 100;
        })
    }
    .width('100%')
  }
}

// [End TraceNestedScene]

@Builder
export function traceNestedScene(): void {
  NavDestination() {
    Page();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.trace_nested_scene_title'))
}