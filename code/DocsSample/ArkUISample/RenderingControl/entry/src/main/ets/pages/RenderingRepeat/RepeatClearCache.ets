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

// [Start repeat_clearcache]
@ComponentV2
struct ChildComponent {
  aboutToAppear() {
    console.info('ChildComponent aboutToAppear');
  }
  aboutToDisappear() {
    console.info('ChildComponent aboutToDisappear');
  }
  build() {
    Text('ChildComponent')
  }
}

@Entry
@ComponentV2
struct ClearCacheDemo {
  @Local data: Array<number> = [];
  // 创建RepeatController对象
  private controller: RepeatController = new RepeatController();
  private scroller: Scroller = new Scroller();

  aboutToAppear(): void {
    for (let i = 0; i < 100; i++) {
      this.data.push(i);
    }
  }

  build() {
    Column() {
      List({ scroller: this.scroller }) {
        // 通过RepeatOptions的controller字段绑定控制器
        Repeat<number>(this.data, { controller: this.controller })
          .each((repeatItem: RepeatItem<number>) => {
            ListItem() {
              ChildComponent()
            }
          })
          .virtualScroll()
      }
      .cachedCount(5)
      .height('80%')

      Button('Scroll')
        .onClick(() => {
          // 点击按钮触发列表跳转，旧组件进入缓存池
          this.scroller.scrollToIndex(30);
        })

      Button('Clear')
        .onClick(() => {
          // 主动清理Repeat缓存池中的空闲节点
          this.controller.clearCache();
        })
    }
  }
}
// [End repeat_clearcache]
