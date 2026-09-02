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

interface Ary {
  path: string,
  name: string
}

@Entry
@Component
struct Index {
  ary: Ary[] = [
    { name: 'envInitFlow', path: 'pages/EnvInitFlow' },
    { name: 'envInComponentV2', path: 'pages/EnvInComponentV2' },
    { name: 'envInComponent', path: 'pages/EnvInComponent' },
    { name: 'envBuilderNode', path: 'pages/EnvBuilderNode' },
    { name: 'envBuilderLambda', path: 'pages/EnvBuilderNodeLambda' },
    { name: 'envWatch', path: 'pages/EnvWatch' },
    { name: 'envMonitor', path: 'pages/EnvMonitor' },
  ]

  build() {
    Scroll() {
      Column({ space: 2 }) {
        ForEach(this.ary, (item: Ary) => {
          Button(item.name)
            .onClick(() => this.getUIContext().getRouter().pushUrl({ url: item.path }))
        }, (item: Ary) => item.name)
      }
      .width('100%')
    }
  }
}
