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

// LazyForEach迁移Repeat示例：数据首次渲染
// [Start lazyforeach_to_repeat_initial_rendering]
import { hilog } from '@kit.PerformanceAnalysisKit';
const TAG = '[Sample_RenderingControl]';
const DOMAIN = 0xF811;

@Entry
@ComponentV2 // 使用状态管理V2
export struct MyComponent {
  @Local data: Array<string> = []; // 数据源为状态管理V2装饰的数组

  aboutToAppear() {
    for (let i = 0; i <= 20; i++) {
      this.data.push(`Hello ${i}`);
    }
  }

  build() {
    List({ space: 3 }) {
      Repeat(this.data) // 使用Repeat
        .each((repeatItem: RepeatItem<string>) => { // 组件生成函数
          ListItem() {
            Row() {
              Text(repeatItem.item).fontSize(50)
                .onAppear(() => {
                  hilog.info(DOMAIN, TAG, `appear: ${repeatItem.item}`);
                })
            }.margin({ left: 10, right: 10 })
          }
        })
        .key((item: string) => item) // 键值生成函数
        .virtualScroll() // 使能懒加载
    }.cachedCount(5)
  }
}
// [End lazyforeach_to_repeat_initial_rendering]
