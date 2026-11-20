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

// [Start Computed_Sync_Access]
@Entry
@ComponentV2
struct ComputedSyncAccess {
  @Local count: number = 1;

  // 使用@Computed缓存计算数据
  @Computed
  get computedDouble(): number {
    return this.count * 2;
  }

  // 使用getter直接计算数据
  get normalDouble(): number {
    return this.count * 2;
  }

  build() {
    Column() {
      Text(`count: ${this.count}`)
        .fontSize(20)
        .margin(10)
      Text(`double: ${this.computedDouble}`)
        .fontSize(20)
        .margin(10)
      Button('change count')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.count = 10;
          // 同步获取普通getter函数的值，获取的是20
          console.info('Normal double: ' + this.normalDouble);
          // 同步获取@Computed的值，获取的是修改前的缓存值2，而非20
          console.info('Computed double: ' + this.computedDouble);
        })
    }
    .width('100%')
  }
}
// [End Computed_Sync_Access]

@Builder
export function ComputedSyncAccessFunc() {
  NavDestination() {
    ComputedSyncAccess()
  }
  .backgroundColor('#f1f2f3')
  // 请将$r('app.string.computed_title_4')替换为实际资源文件，在本示例中该资源文件的value值为"去除@Computed同步获取计算值"
  .title($r('app.string.computed_title_4'))
}
