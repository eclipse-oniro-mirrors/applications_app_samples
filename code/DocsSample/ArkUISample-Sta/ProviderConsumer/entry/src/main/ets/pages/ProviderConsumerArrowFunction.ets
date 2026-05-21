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
// [Start ProviderConsumerArrowFunction]
import { Button, ClickEvent, Column, ComponentV2, Consumer, Entry, Local, Provider, Text } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Parent {
  @Local childSub: number = 0;
  @Local childSum: number = 1;
  @Provider() onChange: (axisX: number, axisY: number) => void = (axisX: number, axisY: number): void => {
    this.childSub = axisX - axisY;
    this.childSum = axisX + axisY;
  }

  build() {
    Column() {
      Text(`childSub: ${this.childSub}, childSum: ${this.childSum}`)
      Child()
    }
  }
}

@ComponentV2
struct Child {
  @Local axisX: number = 0;
  @Local axisY: number = 1;
  @Consumer() onChange: (axisX: number, axisY: number) => void = (axisX: number, axisY: number): void => {
  };

  build() {
    Button('changed')
      .onClick((e: ClickEvent) => {
        this.onChange(this.axisX, this.axisY);
      })
  }
}
// [End ProviderConsumerArrowFunction]

@Builder
export function providerConsumerArrowFunction(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.provider_consumer_arrow_function_title'))
}