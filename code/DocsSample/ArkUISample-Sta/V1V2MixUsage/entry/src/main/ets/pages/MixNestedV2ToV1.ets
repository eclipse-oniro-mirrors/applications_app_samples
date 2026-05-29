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

// [Start MixNestedV2ToV1]
import { Entry, Text, Column, Component, ComponentV2, Button, ClickEvent, ForEach, Observed, Track, ObjectLink, Local } from '@kit.ArkUI';

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
@ComponentV2
struct CompV2 {
  // 需保证每一层都是V1的状态变量
  @Local outer: Outer =
    new Outer(
      new Inner([
        new ArrayItem(1),
        new ArrayItem(2)
      ]));

  build() {
    Column() {
      Text(`@Local outer.outerValue can update ${this.outer.outerValue}`)
        .fontSize(20)
        .onClick(() => {
          // 可观察第一层的变化
          this.outer.outerValue += '!';
        })

      Text(`@Local outer.inner.innerValue can update ${this.outer.inner.innerValue}`)
        .fontSize(20)
        .onClick(() => {
          // 可观察第二层的变化
          this.outer.inner.innerValue += '!';
        })
      // 将inner传递给@ObjectLink可观察inner属性的变化
      NestedClassV1ObjectLink({ inner: this.outer.inner })
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct NestedClassV1ObjectLink {
  @ObjectLink inner: Inner;

  build() {
    Column() {
      Text(`@ObjectLink inner.innerValue can update ${this.inner.innerValue}`)
        .fontSize(20)
        .onClick(() => {
          // 可以触发刷新
          this.inner.innerValue += '!';
        })
      NestedClassV1ObjectLinkArray({ arr: this.inner.arr })
    }
  }
}

@Component
struct NestedClassV1ObjectLinkArray {
  @ObjectLink arr: Array<ArrayItem>;

  build() {
    Column() {
      ForEach(this.arr, (item: ArrayItem) => {
        NestedClassV1ObjectLinkArrayItem({ item: item })
      }, (item: ArrayItem, index: int) => {
        return item.value.toString() + index.toString();
      })

      Button('@ObjectLink push')
        .onClick(() => {
          this.arr.push(new ArrayItem(20));
        })

      Button('@ObjectLink change the last Item')
        .onClick(() => {
          // 在NestedClassV1ObjectLinkArrayItem中可以观察最后一个数组项的属性变化
          this.arr[this.arr.length - 1].value++;
        })
    }
  }
}

@Component
struct NestedClassV1ObjectLinkArrayItem {
  @ObjectLink item: ArrayItem;

  build() {
    Text(`@ObjectLink outer.inner.arr item: ${this.item.value}`)
  }
}
// [End MixNestedV2ToV1]

@Builder
export function mixNestedV2ToV1(): void {
  NavDestination() {
    CompV2()
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.mix_nested_v2_to_v1_title'))
}
