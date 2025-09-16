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

'use static';
import { Entry, Text, Column, Component, Scroll, Button, ClickEvent, compatibleWrappedBuilder } from '@ohos.arkui.component';
import { State, Link, Provide, StorageLink } from '@ohos.arkui.stateManagement';
import { DynamicComp1, DynamicComp2, DynamicComp3, DynamicComp4, DynamicComp5, myBuilder, globalBuilder } from 'har_dynamic';
import hilog from '@ohos.hilog';

@Entry
@Component
struct Parent {
  @State primState: string = 'stateVar';
  @State arrState: number[] = [1.0, 2.0, 3.0];
  @State setState: Set<number> = new Set<number>([1.0, 2.0, 3.0]);
  @State dateState: Date = new Date('2025-08-08');

  @Provide provideStr: string = 'provideVar';
  @StorageLink('keyA') storageLink: string = 'storageLinkVar';

  build() {
    Column() {
      Text('----- static -----')

      Button(`provideStr: ${this.provideStr}`)
        .onClick((e: ClickEvent) => {
          this.provideStr += '~';
        })
      Button(`storageLink: ${this.storageLink}`)
        .onClick((e: ClickEvent) => {
          this.storageLink += '~';
        })
      myBuilder({a: 'BuilderA', b: this.primState})
      let params = ESValue.instantiateEmptyObject()
      params.setProperty('a', 'WrappedBuilderA')
      params.setProperty('b', this.primState)
      compatibleWrappedBuilder(globalBuilder, params)

      Child({ primLink: this.primState, arrLink: this.arrState, setLink: this.setState, dateLink: this.dateState })
    }
  }
}

@Component
struct Child {
  @Link primLink: string;
  @Link arrLink: number[];
  @Link setLink: Set<number>;
  @Link dateLink: Date;

  build() {
    Scroll(){
      Column(){
        DynamicComp1({ stateVar: this.primLink, propVar: this.primLink, linkVar: this.primLink,
          provideVar: this.primLink, regVar: this.primLink})
        DynamicComp2({ stateVar: this.arrLink, linkVar: this.arrLink, provideVar: this.arrLink, regVar: this.arrLink})
        DynamicComp3({ stateVar: this.setLink, linkVar: this.setLink, provideVar: this.setLink, regVar: this.setLink})
        DynamicComp4({ stateVar: this.dateLink, linkVar: this.dateLink, provideVar: this.dateLink, regVar: this.dateLink})
        DynamicComp5()
      }
    }.width('100%')
  }
}