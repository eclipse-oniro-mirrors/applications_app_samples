/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// ArkTS-Dyn har包主页面功能：通过调用ArkTS-Sta har包中的模块，展示ArkTS-Dyn与ArkTS-Sta互操作的基础场景

// 从ArkTS-Sta har包中导入自定义组件MainPage01
import { MainPage01 } from 'har_static';

// 导出Data类，用于在自定义构建函数中传递参数
export class Data {
  public a: string;
  public b: string;

  toString(): string {
    return `Data a: ${this.a}, b: ${this.b}`;
  }

  constructor(a?: string, b?: string) {
    this.a = a ?? 'defaultA';
    this.b = b ?? 'defaultB';
  }
}

// 导出自定义构建函数myBuilder，供ArkTS-Sta模块调用
@Builder
export function myBuilder(param: Data) {
  Column() {
    Text('myBuilder')
    Text(`param.a: ${param.a}`)
    Text(`param.b: ${param.b}`)
  }
}

// 导出全局自定义构建函数globalBuilder，供ArkTS-Sta模块调用
export const globalBuilder: WrappedBuilder<[Data]> = wrapBuilder(myBuilder);

// 导出ArkTS-Dyn组件DynamicComp1，展示ArkTS-Dyn模块中状态管理装饰器成员属性的使用
@Component
export struct DynamicComp1 {
  @Consume provideStr: string = 'consumeVar';
  @StorageLink('keyA') storageLink: string = 'temp';

  @State stateVar: string = '';
  @Prop propVar: string = '';
  @Link linkVar: string;
  @Provide provideVar: string = '';
  regVar: string = '';

  build() {
    Row() {
      Column() {
        Text('----- dynamic primitive-----')

        Button(`provideStr: ${this.provideStr}`)
          .backgroundColor('#FFFF00FF')
          .onClick(() => {
            // 点击按钮修改consume状态管理成员属性
            this.provideStr = 'consumeVar';
          })

        Button(`storageLink: ${this.storageLink}`)
          .backgroundColor('#FFFF00FF')
          .onClick((e: ClickEvent) => {
            // 点击按钮修改storageLink状态管理成员属性
            this.storageLink += '!';
          })

        Text(`stateVar: ${this.stateVar}`)
        Text(`propVar: ${this.propVar}`)
        Text(`linkVar: ${this.linkVar}`)
        Text(`provideVar: ${this.provideVar}`)
        Text(`regVar: ${this.regVar}`)
      }
    }
  }
}

// 导出ArkTS-Dyn动态组件DynamicComp2，展示数组类型状态管理装饰器成员属性的使用
@Component
export struct DynamicComp2 {
  @State stateVar: number[] = [];
  @Link linkVar: number[];
  @Provide provideVar: number[] = [];
  regVar: number[] = [];

  build() {
    Row() {
      Column() {
        Text('----- dynamic array -----')
        Text(`stateVar: ${this.stateVar}`)
        Text(`linkVar: ${this.linkVar}`)
        Text(`provideVar: ${this.provideVar}`)
        Text(`regVar: ${this.regVar}`)
      }
    }
  }
}

// 导出ArkTS-Dyn动态组件DynamicComp3，展示Set类型状态管理装饰器成员属性的使用
@Component
export struct DynamicComp3 {
  @State stateVar: Set<number> = new Set<number>();
  @Link linkVar: Set<number>;
  @Provide provideVar: Set<number> = new Set<number>();
  regVar: Set<number> = new Set<number>();

  build() {
    Row() {
      Column() {
        Text('----- dynamic set -----')
        Text(`stateVar: ${this.stateVar}`)
        Text(`linkVar: ${this.linkVar}`)
        Text(`provideVar: ${this.provideVar}`)
        Text(`regVar: ${this.regVar}`)
      }
    }
  }
}

// 导出ArkTS-Dyn动态组件DynamicComp4，展示Date类型状态管理装饰器成员属性的使用
@Component
export struct DynamicComp4 {
  @State stateVar: Date = new Date('2022-02-02');
  @Link linkVar: Date;
  @Provide provideVar: Date = new Date('2022-02-02');
  regVar: Date = new Date('2022-02-02');

  build() {
    Row() {
      Column() {
        Text('----- dynamic date -----')
        Text(`stateVar: ${this.stateVar}`)
        Text(`linkVar: ${this.linkVar}`)
        Text(`provideVar: ${this.provideVar}`)
        Text(`regVar: ${this.regVar}`)
      }
    }
  }
}

// 导出ArkTS-Dyn主组件DynamicComp5，调用ArkTS-Sta模块中的MainPage01组件
@Component
export struct DynamicComp5 {
  build() {
    Row() {
      Column() {
        MainPage01()
      }
    }
  }
}
