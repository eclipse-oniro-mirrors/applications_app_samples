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

import { router } from '@kit.ArkUI';

interface Ary {
  path: string,
  name: string
}

@Entry
@Component
struct Index {
  ary: Ary[] = [
    {
      name: 'ComponentActiveRecycle',
      path: 'pages/ComponentActiveRecycle'
    },
    {
      name: 'ComponentActiveLazyCreate',
      path: 'pages/ComponentActiveLazyCreate'
    },
    {
      name: 'ComponentActivePreRender',
      path: 'pages/ComponentActivePreRender'
    },
    {
      name: 'ComponentActivePageVisible',
      path: 'pages/ComponentActivePageVisible'
    },
    {
      name: 'ComponentNesting',
      path: 'pages/ComponentNesting'
    },
    {
      name: 'ComponentRecycleReuse',
      path: 'pages/ComponentRecycleReuse'
    },
    {
      name: 'ComponentLifecycleObserver',
      path: 'pages/ComponentLifecycleObserver'
    },
    {
      name: 'LifecycleDifference',
      path: 'pages/LifecycleDifference'
    },
    {
      name: 'ComponentReuseDifference',
      path: 'pages/ComponentReuseDifference'
    }
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
