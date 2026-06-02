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
// [Start BuilderGeneric]
import { Entry, Column, Component, Text, Resource, Color, ForEach, Builder, Row, TextAlign, Observed } from '@kit.ArkUI';

type ItemBuilder<T> = @Builder (item: T) => void;

@Builder
function forEachWithType<T>(arrayList: T[], closer: ItemBuilder<T>) {
  Column() {
    ForEach(arrayList, (item: T) => {
      Row() {
        closer(item)
      }
    })
  }
}

@Observed
export class ClassA {
  stringData: string = 'Hello';
}

@Entry
@Component
export struct ExampleOne {
  array: ClassA[] = [new ClassA(), new ClassA(), new ClassA()];

  @Builder
  componentCloser(data: ClassA): void {
    Text(`${data.stringData} genericBuilderFunc`)
      .width(230)
      .height(40)
      .margin(12)
      .backgroundColor('#0d000000')
      .fontColor('#e6000000')
      .borderRadius(20)
      .textAlign(TextAlign.Center)
  }

  build(): void {
    Row() {
      Column() {
        forEachWithType<ClassA>(this.array, this.componentCloser)
      }
    }
  }
}

// [End BuilderGeneric]

@Builder
export function builderGeneric(): void {
  NavDestination() {
    ExampleOne();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.builder_generic_title'))
}
