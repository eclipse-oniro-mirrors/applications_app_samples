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

// [Start StaDynDeclSpecV1]
// entry/src/main/ets/pages/StaDynDeclSpecV1.ets
import { Entry, Column, Component } from '@ohos.arkui.component';
import { State, Provide } from '@ohos.arkui.stateManagement';
import { ChildV1, Person } from 'dynamic_module';

@Entry
@Component
struct Parent {
  @State stateVar: string = 'Parent';
  @Provide consumeVar: string = 'consumeVar';
  @State person: Person = new Person();

  build() {
    Column() {
      ChildV1({
        linkVar: this.stateVar,
        person: this.person
      })
    }
  }
}
// [End StaDynDeclSpecV1]
