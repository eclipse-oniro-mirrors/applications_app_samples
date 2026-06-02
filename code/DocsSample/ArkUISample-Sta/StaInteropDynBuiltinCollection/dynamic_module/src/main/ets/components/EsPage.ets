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

// [Start StaDynBuiltinArrayEsMainPage]
// dynamic_module/src/main/ets/components/EsPage.ets

@Component
export struct ArrayEsChild {
  @Link data: Array<string>;

  build() {
    Column() {
      Text(`Child data: ${this.data}`)
      Button('Push element')
        .onClick(() => {
          this.data.push('orange');
        })
      Button('Reset Array')
        .onClick(() => {
          this.data = ['strawberry', 'blueberry'];
        })
    }
  }
}

// 导出创建Array的方法，供ArkTS-Sta使用
export function dynCreateArray(): Array<string> {
  return ['apple', 'banana'];
}
// [End StaDynBuiltinArrayEsMainPage]

// [Start StaDynBuiltinMapEsMainPage]
// dynamic_module/src/main/ets/components/EsPage.ets

@Component
export struct MapEsChild {
  @Link data: Map<string, number>;

  build() {
    Column() {
      ForEach(Array.from(this.data.entries()), (item: [string, number]) => {
        Text(`${item[0]}: ${item[1]}`)
      })
      Button('Set element')
        .onClick(() => {
          this.data.set('orange', 3);
        })
      Button('Reset Map')
        .onClick(() => {
          this.data = new Map<string, number>([['strawberry', 4], ['blueberry', 5]]);
        })
    }
  }
}

// 导出创建Map的方法，供ArkTS-Sta使用
export function dynCreateMap(): Map<string, number> {
  return new Map<string, number>([['apple', 1], ['banana', 2]]);
}
// [End StaDynBuiltinMapEsMainPage]

// [Start StaDynBuiltinSetEsMainPage]
// dynamic_module/src/main/ets/components/EsPage.ets

@Component
export struct SetEsChild {
  @Link data: Set<string>;

  build() {
    Column() {
      ForEach(Array.from(this.data.values()), (item: string) => {
        Text(item)
      })
      Button('Add element')
        .onClick(() => {
          this.data.add('orange');
        })
      Button('Reset Set')
        .onClick(() => {
          this.data = new Set<string>(['strawberry', 'blueberry']);
        })
    }
  }
}

// 导出创建Set的方法，供ArkTS-Sta使用
export function dynCreateSet(): Set<string> {
  return new Set<string>(['apple', 'banana']);
}
// [End StaDynBuiltinSetEsMainPage]
