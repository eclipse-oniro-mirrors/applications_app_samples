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

// [Start MixNestedV1ToV2]
import { Entry, Text, Column, Component, ComponentV2, Button, ClickEvent, ForEach, Observed, State, Track, ObjectLink, Require, Param } from '@kit.ArkUI';

@Observed
class ArrayItem {
  value: number = 0;

  constructor(value: number) {
    this.value = value;
  }
}

@Observed
class Inner {
  innerValue: string = 'inner';
  arr: Array<ArrayItem>;

  constructor(arr: Array<ArrayItem>) {
    this.arr = arr;
  }
}

@Observed
class Outer {
  @Track outerValue: string = 'out';
  @Track inner: Inner;

  constructor(inner: Inner) {
    this.inner = inner;
  }
}

@Entry
@Component
struct CompV1 {
  // 需保证每一层都是V1的状态变量
  @State outer: Outer =
    new Outer(
      new Inner([
        new ArrayItem(1),
        new ArrayItem(2)
      ])
    );

  build() {
    Column() {
      Text(`@State outer.outerValue can update ${this.outer.outerValue}`)
        .fontSize(20)
        .onClick(() => {
          // @State可以观察第一层的变化
          // 变化会通知@ObjectLink和@Param刷新
          this.outer.outerValue += '!';
        })

      Text(`@State outer.inner.innerValue cannot update ${this.outer.inner.innerValue}`)
        .fontSize(20)
        .onClick(() => {
          // @State无法观察第二层的变化
          // 但该变化会被@ObjectLink和@Param观察
          this.outer.inner.innerValue += '!';
        })
      // 将inner传递给@ObjectLink可观察inner属性的变化
      NestedClassV1ObjectLink({ inner: this.outer.inner })
      // 将outer传给V2
      NestedClassV2({ outer: this.outer })
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct NestedClassV1ObjectLink {
  @ObjectLink inner: Inner;

  build() {
    Text(`@ObjectLink inner.innerValue can update ${this.inner.innerValue}`)
      .fontSize(20)
      .onClick(() => {
        // 可以触发刷新，和@Param是同一个对象的引用，@Param也会进行刷新
        this.inner.innerValue += '!';
      })
  }
}

@ComponentV2
struct NestedClassV2 {
  @Require @Param outer: Outer;

  build() {
    Column() {
      Text(`@Param outer.outerValue can update ${this.outer.outerValue}`)
        .fontSize(20)
        .onClick(() => {
          // 可以观察第一层的变化
          this.outer.outerValue += '!';
        })
      Text(`@Param outer.inner.innerValue can update ${this.outer.inner.innerValue}`)
        .fontSize(20)
        .onClick(() => {
          // 可以观察第二层的变化，和@ObjectLink是同一个对象的引用，也会触发刷新
          this.outer.inner.innerValue += '!';
        })

      ForEach(this.outer.inner.arr, (item: ArrayItem, index: int) => {
        Text(`${index}: ${item.value}`)
      }, (item: ArrayItem) => '' + item.value + Math.random())

      Button('@Param push')
        .onClick(() => {
          // outer已经使能了V2观察能力，对于新增加的数据，则默认开启V2观察能力
          this.outer.inner.arr.push(new ArrayItem(20));
        })

      Button('@Param change the last Item')
        .onClick(() => {
          // 可以观察最后一个数组项的属性变化
          this.outer.inner.arr[this.outer.inner.arr.length - 1].value++;
        })
    }
  }
}
// [End MixNestedV1ToV2]

@Builder
export function mixNestedV1ToV2(): void {
  NavDestination() {
    CompV1()
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.mix_nested_v1_to_v2_title'))
}
