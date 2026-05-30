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
// [Start Common_MyButtonModifierSta3]
import {
  AttributeModifier,
  Button,
  ButtonAttribute,
  Color,
  Column,
  Component,
  Entry,
  Observed,
  Row,
  State
} from '@kit.ArkUI';

@Observed
export class MyButtonModifier2 implements AttributeModifier<ButtonAttribute> {
  public isDark: boolean = false

  constructor(dark?: boolean) {
    this.isDark = dark ?? false
  }

  applyNormalAttribute(instance: ButtonAttribute): void {
    if (this.isDark) {
      instance.backgroundColor(Color.Black)
        .width(200)
    } else {
      instance.backgroundColor(Color.Red)
        .width(100)
    }
  }
}

@Observed
export class MyButtonModifier3 implements AttributeModifier<ButtonAttribute> {
  public isDark2: boolean = false

  constructor(dark?: boolean) {
    this.isDark2 = dark ? dark : false
  }

  applyNormalAttribute(instance: ButtonAttribute): void {
    if (this.isDark2) {
      instance.backgroundColor('#2787D9')
    } else {
      instance.backgroundColor('#707070')
    }
  }
}

@Entry
@Component
struct Button3 {
  @State modifier: MyButtonModifier2 = new MyButtonModifier2(true);
  @State modifier2: MyButtonModifier3 = new MyButtonModifier3(true);

  build(): void {
    Row() {
      Column() {
        Button('Button')
          .attributeModifier(this.modifier)
          .attributeModifier(this.modifier2)
          .onClick(() => {
            this.modifier.isDark = !this.modifier.isDark
            this.modifier2.isDark2 = !this.modifier2.isDark2
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End Common_MyButtonModifierSta3]
