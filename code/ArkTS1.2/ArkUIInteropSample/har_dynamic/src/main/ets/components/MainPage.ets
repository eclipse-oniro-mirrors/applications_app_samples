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

@Builder
export function myBuilder(param: Data){
  Column() {
    Text('myBuilder')
    Text(`param.a: ${param.a}`)
    Text(`param.b: ${param.b}`)
  }
}

export const globalBuilder: WrappedBuilder<[Data]> = wrapBuilder(myBuilder);

@Component
export struct DynamicComp1 {
  @Consume provideStr: string = 'consumeVar';
  @StorageLink('keyA') storageLink: string = 'temp';

  @State stateVar: string = '';
  @Link propVar: string;
  @Link linkVar: string;
  @Provide provideVar: string = '';
  regVar: string = '';

  build() {
    Row() {
      Column() {
        Text('----- dynamic primitive-----')

        Button(`provideStr: ${this.provideStr}`).backgroundColor('#FFFF00FF')
          .onClick(() => {
            this.provideStr = 'consumeVar';
          })
        Button(`storageLink: ${this.storageLink}`).backgroundColor('#FFFF00FF')
          .onClick((e: ClickEvent) => {
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
