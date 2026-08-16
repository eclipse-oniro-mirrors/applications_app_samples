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

// LazyForEach迁移Repeat示例：模板渲染（由开发者实现模板渲染能力）
// [Start lazyforeach_to_repeat_template_custom]
import { hilog } from '@kit.PerformanceAnalysisKit';
const TAG = '[Sample_RenderingControl]';
const DOMAIN = 0xF811;

export class StringData {
  public message: string;
  public type: number;

  constructor(message: string, type: number) {
    this.message = message;
    this.type = type;
  }

  getType(): number {
    if (this.type >= 1) {
      return 1;
    } else {
      return 0;
    }
  }
}

@Entry
@ComponentV2
export struct MyComponent {
  @Local data: StringData[] = [];

  aboutToAppear() {
    for (let i = 0; i <= 200; i++) {
      this.data.push(new StringData(`Hello${i}`, i % 2));
    }
  }

  build() {
    List({ space: 3 }) {
      Repeat(this.data)
        .each((repeatItem) => {
          ListItem() {
            // 开发者自己实现逻辑判断，为不同的数据项选择不同的渲染模板
            if (repeatItem.item.getType() == 0) {
              ChildComponentA({ data: repeatItem.item }) // 模板A
                .onAppear(() => {
                  hilog.info(DOMAIN, TAG, `type A onAppear: ${repeatItem.item.message}`);
                })
            } else {
              ChildComponentB({ data: repeatItem.item }) // 模板B
                .onAppear(() => {
                  hilog.info(DOMAIN, TAG, `type B onAppear: ${repeatItem.item.message}`);
                })
            }
          }
        })
        .key((item: StringData, index: number) => index.toString())
        .virtualScroll({ reusable: false }) // 关闭Repeat自身的复用功能（API 18），避免渲染异常
    }.cachedCount(5)
  }
}

// 使用@ReusableV2实现组件复用（API version 18开始支持使用）
@ReusableV2
@ComponentV2
export struct ChildComponentA {
  @Param data: StringData = new StringData('', 0);

  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, `type A aboutToAppear: ${this.data.message}`);
  }

  aboutToRecycle(): void {
    hilog.info(DOMAIN, TAG, `type A aboutToRecycle: ${this.data.message}`);
  }

  aboutToReuse(): void {
    hilog.info(DOMAIN, TAG, `type A aboutToReuse: ${this.data.message}`);
  }

  build() {
    Row() {
      Text(this.data.message).fontSize(50)
      Button('Type A')
    }
  }
}

@ReusableV2
@ComponentV2
export struct ChildComponentB {
  @Param data: StringData = new StringData('', 0);

  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, `type B aboutToAppear: ${this.data.message}`);
  }

  aboutToRecycle(): void {
    hilog.info(DOMAIN, TAG, `type B aboutToRecycle: ${this.data.message}`);
  }

  aboutToReuse(): void {
    hilog.info(DOMAIN, TAG, `type B aboutToReuse: ${this.data.message}`);
  }

  build() {
    Row() {
      Text(this.data.message).fontSize(50).fontColor(Color.Gray)
      Text('Type B')
    }
  }
}
// [End lazyforeach_to_repeat_template_custom]
