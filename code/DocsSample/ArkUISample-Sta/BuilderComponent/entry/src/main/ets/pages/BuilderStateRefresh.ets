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
// [Start BuilderStateRefresh]
import { Entry, Text, TextAttribute, Column, ComponentV2, Button, ButtonAttribute, ClickEvent, Row, Color, CommonMethod, Margin, HorizontalAlign, Builder, TextAlign, FlexAlign, applyStyles, UIUtils, Binding, MutableBinding, State, ObservedV2, Trace, Local } from '@kit.ArkUI';

@ObservedV2
class ClassA {
  @Trace props: string = 'Hello';
}

function textStyles(this: TextAttribute): TextAttribute {
  this.fontColor('#e6000000');
  this.textAlign(TextAlign.Center);
  this.width(300);
  this.height(40);
  this.margin(10);
  this.backgroundColor('#0d000000');
  this.borderRadius(20);
  return this;
}

@Builder
function CustomButton(num1: Binding<number>, num2: MutableBinding<number>) {
  Row() {
    Column() {
      Text(`number1 === ${num1.value},  number2 === ${num2.value}`)
        .textStyles()

      Button(`only change number2`)
        .onClick((e) => {
          num2.value += 1;
        })
    }
  }
}

@Builder
function CustomButtonObj(obj1: MutableBinding<ClassA>) {
  Row() {
    Column() {
      Text(`props === ${obj1.value.props}`)
        .textStyles()

      Button(`change props`)
        .onClick((e) => {
          obj1.value.props += 'Hi';
        })
    }
  }
}

@Entry
@ComponentV2
struct Single {
  @Local number1: number = 5;
  @Local number2: number = 12;
  @Local classA: ClassA = new ClassA();

  build() {
    Column() {
      Button(`change both number1 and number2`)
        .onClick((e) => {
          this.number1 += 1;
          this.number2 += 2;
        })
      Text(`number1 === ${this.number1}`)
        .textStyles()
      Text(`number2 === ${this.number2}`)
        .textStyles()
      CustomButton(
        UIUtils.makeBinding<number>(() => this.number1),
        UIUtils.makeBinding<number>(
          () => this.number2,
          (val: number) => {
            this.number2 = val;
          })
      )
      Text(`classA.props === ${this.classA.props}`)
        .textStyles()
      CustomButtonObj(
        UIUtils.makeBinding<ClassA>(
          () => this.classA,
          (val: ClassA) => {
            this.classA = val;
          })
      )
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}

// [End BuilderStateRefresh]

@Builder
export function builderStateRefresh(): void {
  NavDestination() {
    Single();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.builder_state_refresh_title'))
}
