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

export interface Ary {
  path: string,
  name: string
}

@Entry
@Component
struct Index {
  ary: Ary[] = [
    {
      name: 'Component',
      path: 'pages/Component'
    },
    {
      name: 'BuilderByCallback',
      path: 'pages/BuilderByCallback'
    },
    {
      name: 'BuilderByRef',
      path: 'pages/BuilderByRef'
    },
    {
      name: 'BuilderByValue',
      path: 'pages/BuilderByValue'
    },
    {
      name: 'WrappedBuilderByRef',
      path: 'pages/WrappedBuilderByRef'
    },
    {
      name: 'WrappedBuilderByValue',
      path: 'pages/WrappedBuilderByValue'
    },
    {
      name: 'BuilderParamByRef',
      path: 'pages/BuilderParamByRef'
    },
    {
      name: 'BuilderParamByValue',
      path: 'pages/BuilderParamByValue'
    },
    {
      name: 'DeclarationSpec',
      path: 'pages/DeclarationSpec'
    },
    {
      name: 'DeclarationSpecV2',
      path: 'pages/DeclarationSpecV2'
    },
    {
      name: 'DeclarationSpecBuilder',
      path: 'pages/DeclarationSpecBuilder'
    },
    {
      name: 'ESArray',
      path: 'pages/ESArray'
    },
    {
      name: 'STArray',
      path: 'pages/STArray'
    },
        {
      name: 'ESMap',
      path: 'pages/ESMap'
    },
    {
      name: 'STMap',
      path: 'pages/STMap'
    },
        {
      name: 'ESSet',
      path: 'pages/ESSet'
    },
    {
      name: 'STSet',
      path: 'pages/STSet'
    },
  ]

  build() {
    Scroll() {
      Column() {
        ForEach(this.ary, (item: Ary) => {
          Button(item.name)
            .onClick(() => {
              this.getUIContext().getRouter().pushUrl({ url: item.path })
            })
        }, (item: Ary) => item.name)
      }
      .width('100%')
    }
  }
}