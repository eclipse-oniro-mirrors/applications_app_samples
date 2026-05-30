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
// [Start ParamFromParentToChild]
import {
  Button,
  ClickEvent,
  Column,
  ComponentV2,
  Entry,
  ForEach,
  Local,
  ObservedV2,
  Param,
  Require,
  Text,
  Trace
} from '@kit.ArkUI';

@ObservedV2
class Region {
  @Trace x: number;
  @Trace y: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

@ObservedV2
class Info {
  @Trace name: string;
  @Trace age: number;
  @Trace region: Region;

  constructor(name: string, age: number, x: number, y: number) {
    this.name = name;
    this.age = age;
    this.region = new Region(x, y);
  }
}

@Entry
@ComponentV2
struct Index {
  @Local infoList: Info[] = [new Info('Alice', 8, 0, 0), new Info('Barry', 10, 1, 20), new Info('Cindy', 18, 24, 40)];

  build() {
    Column() {
      ForEach(this.infoList, (info: Info, index: int) => {
        MiddleComponent({ info: info })
      })
      Button('change')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 对数组项整体赋值，变化同步给子组件的@Param
          this.infoList[0] = new Info('Atom', 40, 27, 90);
          // @Trace装饰的属性变化可被深度观测
          this.infoList[1].name = 'Bob';
          // 嵌套类对象整体赋值，变化可被观测
          this.infoList[2].region = new Region(7, 9);
        })
    }
    .width('100%')
  }
}

@ComponentV2
struct MiddleComponent {
  @Require @Param info: Info;

  build() {
    Column() {
      Text(`name: ${this.info.name}`)
        .fontSize(20)
        .margin(10)
      Text(`age: ${this.info.age}`)
        .fontSize(20)
        .margin(10)
      SubComponent({ region: this.info.region })
    }
    .width('100%')
  }
}

@ComponentV2
struct SubComponent {
  @Require @Param region: Region;

  build() {
    Column() {
      Text(`region: ${this.region.x}-${this.region.y}`)
        .fontSize(20)
        .margin(10)
    }
    .width('100%')
  }
}

// [End ParamFromParentToChild]

@Builder
export function paramFromParentToChild(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.param_from_parent_to_child_title'))
}