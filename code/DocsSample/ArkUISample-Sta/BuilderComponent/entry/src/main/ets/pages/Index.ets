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

import { Entry, Component, Scroll, Column, ForEach, Button } from '@kit.ArkUI';

export interface RouterInfo {
  path: string,
  name: string
}

@Entry
@Component
struct Index {
  routerInfo: RouterInfo[] = [
    { name: 'BuilderPrivate', path: 'pages/BuilderPrivate' },
    { name: 'BuilderGlobal', path: 'pages/BuilderGlobal' },
    { name: 'BuilderMakeBinding', path: 'pages/BuilderMakeBinding' },
    { name: 'BuilderByReference', path: 'pages/BuilderByReference' },
    { name: 'BuilderByValue', path: 'pages/BuilderByValue' },
    { name: 'BuilderInCustomComponent', path: 'pages/BuilderInCustomComponent' },
    { name: 'BuilderGlobalScene', path: 'pages/BuilderGlobalScene' },
    { name: 'BuilderDecoratorRefresh', path: 'pages/BuilderDecoratorRefresh' },
    { name: 'BuilderAsCustomBuilder', path: 'pages/BuilderAsCustomBuilder' },
    { name: 'BuilderNested', path: 'pages/BuilderNested' },
    { name: 'BuilderCombinedV2', path: 'pages/BuilderCombinedV2' },
    { name: 'BuilderCombinedLocal', path: 'pages/BuilderCombinedLocal' },
    { name: 'BuilderAcrossComponents', path: 'pages/BuilderAcrossComponents' },
    { name: 'BuilderVariable', path: 'pages/BuilderVariable' },
    { name: 'BuilderGeneric', path: 'pages/BuilderGeneric' },
    { name: 'BuilderStateRefresh', path: 'pages/BuilderStateRefresh' },
    { name: 'BuilderOneParam', path: 'pages/BuilderOneParam' },
    { name: 'BuilderComponentV2Refresh', path: 'pages/BuilderComponentV2Refresh' },
    { name: 'BuilderModifyParamPositive', path: 'pages/BuilderModifyParamPositive' },
    { name: 'BuilderComponentParam', path: 'pages/BuilderComponentParam' },
    { name: 'BuilderMutableBindingNoSetter', path: 'pages/BuilderMutableBindingNoSetter' },
    { name: 'BuilderChangeVariableRight', path: 'pages/BuilderChangeVariableRight' },
    { name: 'BuilderCallInWatch', path: 'pages/BuilderCallInWatch' },
  ]

  build() {
    Scroll() {
      Column() {
        ForEach(this.routerInfo, (item: RouterInfo) => {
          Button(item.name)
            .onClick(() => {
              this.getUIContext().getRouter().pushUrl({ url: item.path })
            })
        }, (item: RouterInfo) => item.name)
      }
      .width('100%')
    }
  }
}
