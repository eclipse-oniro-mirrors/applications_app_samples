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

// [Start ComponentActivePreRender]
import { ComponentActive, ComponentInactive } from '@kit.ArkUI';
import { MyDataSource } from './BasicDataSource';

@Entry
@Component
struct Index {
  @State dataSource: MyDataSource<string> = new MyDataSource();
  @State changeShow: boolean = false;

  aboutToAppear(): void {
    for (let index = 1; index <= 50; index++) {
      this.dataSource.pushData('page - ' + index);
    }
  }

  build() {
    Column() {
      Button('change')
        .margin(10)
        .onClick(() => {
          // 控制List的创建和销毁
          this.changeShow = !this.changeShow;
        })
      if (this.changeShow) {
        List({ space: 10 }) {
          LazyForEach(this.dataSource, (item: string, index: number) => {
            ListItem() {
              Child({ item: item.toString(), index: index.toString() })
            }
            .backgroundColor(Color.Pink)
            .width('100%')
            .height('15%')
          }, (item: string) => item.toString())
        }
        .width('80%')
        .height('60%')
        // 预加载区域可容纳节点数量为5
        .cachedCount(5, false)
      }
    }
    .width('100%')
  }
}

@Component
struct Child {
  @State index: string = '';
  @State item: string = '';
  @ComponentActive
  myActive() {
    // 组件从非激活状态变为激活状态时触发
    console.info(`Child myActive, index: ${this.index}`);
  }
  @ComponentInactive
  myInactive() {
    // 组件从激活状态变为非激活状态时触发
    console.info(`Child myInactive, index: ${this.index}`);
  }
  build() {
    Column() {
      Text(`Item ${this.item}`)
    }
  }
}
// [End ComponentActivePreRender]

@Builder
export function componentActivePreRender() {
  NavDestination() {
    Index()
  }
}
