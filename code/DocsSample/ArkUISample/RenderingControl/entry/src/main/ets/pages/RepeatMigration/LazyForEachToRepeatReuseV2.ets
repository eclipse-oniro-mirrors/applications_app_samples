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

// LazyForEach迁移Repeat示例：组件复用（使用@ReusableV2装饰器）
// [Start lazyforeach_to_repeat_reuse_v2]
import { hilog } from '@kit.PerformanceAnalysisKit';
const TAG = '[Sample_RenderingControl]';
const DOMAIN = 0xF811;

export class StringData {
  public message: string;

  constructor(message: string) {
    this.message = message;
  }
}

@Entry
@ComponentV2
export struct MyComponent {
  @Local data: StringData[] = [];

  aboutToAppear() {
    for (let i = 0; i <= 30; i++) {
      this.data.push(new StringData(`Hello${i}`));
    }
  }

  build() {
    List({ space: 3 }) {
      Repeat(this.data)
        .each((repeatItem) => {
          ListItem() {
            ChildComponent({ data: repeatItem.item })
              .onAppear(() => {
                hilog.info(DOMAIN, TAG, `onAppear: ${repeatItem.item.message}`);
              })
          }
        })
        .key((item: StringData, index: number) => index.toString())
        .virtualScroll({ reusable: false }) // 关闭Repeat自身的复用功能（API 18）
    }.cachedCount(5)
  }
}

// 使用@ReusableV2实现组件复用（API 18）
@ReusableV2
@ComponentV2
export struct ChildComponent {
  @Param data: StringData = new StringData('');

  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, `aboutToAppear: ${this.data.message}`);
  }

  aboutToRecycle(): void {
    hilog.info(DOMAIN, TAG, `aboutToRecycle: ${this.data.message}`);
  }

  aboutToReuse(): void {
    hilog.info(DOMAIN, TAG, `aboutToReuse: ${this.data.message}`);
  }

  build() {
    Row() {
      Text(this.data.message).fontSize(50)
    }
  }
}
// [End lazyforeach_to_repeat_reuse_v2]
