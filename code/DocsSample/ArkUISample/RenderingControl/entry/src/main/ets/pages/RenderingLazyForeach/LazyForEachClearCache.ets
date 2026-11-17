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

// [Start lazyforeach_clearcache]
// BasicDataSource代码见文档末尾BasicDataSource示例代码: string类型数组的BasicDataSource代码。
import { BasicDataSource } from './BasicDataSource';

class DataSource extends BasicDataSource {
  public dataArray: string[] = [];
  public totalCount(): number {
    return this.dataArray.length;
  }
  public getData(index: number): string {
    return this.dataArray[index];
  }
  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}

@Component
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
@Component
struct ClearCacheDemo {
  private data: DataSource = new DataSource();
  // 创建LazyForEachController对象
  private controller: LazyForEachController = new LazyForEachController();

  aboutToAppear(): void {
    for (let i = 0; i < 100; i++) {
      this.data.pushData(`item ${i}`);
    }
  }

  build() {
    Column() {
      List() {
        // 通过LazyForEachOptions的controller字段绑定控制器
        LazyForEach(this.data,
          (item: string, index: number) => {
            ListItem() {
              ChildComponent()
            }
          },
          (item: string, index: number) => item,
          { controller: this.controller }
        )
      }
      .cachedCount(5)
      .height('80%')

      Button('Clear')
        .onClick(() => {
          // 主动清理LazyForEach预加载的子组件
          this.controller.clearCache();
        })
    }
  }
}
// [End lazyforeach_clearcache]
