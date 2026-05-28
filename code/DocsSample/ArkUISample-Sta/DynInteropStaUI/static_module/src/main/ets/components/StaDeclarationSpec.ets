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

// [Start DynInteropStaDeclSpecStaDeclarationSpec]
// static_module/src/main/ets/components/StaDeclarationSpec.ets
import { Text, Column, Component } from '@ohos.arkui.component';
import { Observed, Track, State, PropRef, Link, Provide, Consume, LocalStorageLink, LocalStoragePropRef, StorageLink, StoragePropRef, Watch, ObjectLink } from '@ohos.arkui.stateManagement';

@Observed
export class DeclPerson {
  name: string = 'person';
  @Track age: number = 20;
}

// 状态管理V1装饰器
@Component
export struct DeclChild {
  @State stateVar: string = 'stateVar';
  @PropRef propVar: string = 'propVar';
  @Link linkVar: string;
  @Provide provideVar: string = 'provideVar';
  @Consume consumeVar: string;
  @LocalStorageLink('link1') localStorageLinkVar: number = 11;
  @LocalStoragePropRef('prop1') localStoragePropVar: number = 22;
  @StorageLink('link2') storageLinkVar: number = 33;
  @StoragePropRef('prop2') storagePropVar: number = 44;
  @State @Watch('stateOnChange') watchVar: string = 'Hello World';
  @ObjectLink person: DeclPerson;
  stateOnChange(propName: string): void {}

  build(): void {
    Column() {
      Text(`${this.stateVar}`)
      Text(`${this.propVar}`)
      Text(`${this.linkVar}`)
      Text(`${this.provideVar}`)
      Text(`${this.consumeVar}`)
      Text(`${this.localStorageLinkVar}`)
      Text(`${this.localStoragePropVar}`)
      Text(`${this.storageLinkVar}`)
      Text(`${this.storagePropVar}`)
      Text(`${this.watchVar}`)
      Text(`${this.person.age}`)
    }
  }
}
// [End DynInteropStaDeclSpecStaDeclarationSpec]
