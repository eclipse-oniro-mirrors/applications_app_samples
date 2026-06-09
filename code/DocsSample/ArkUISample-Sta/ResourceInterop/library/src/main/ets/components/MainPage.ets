/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start create_resource]
// library/src/main/ets/components/MainPage.ets
export function createResource(): Resource {
  // $r("app.string.page_show")需替换为开发者所需要的资源
  let res = $r("app.string.page_show");
  return res;
}

// [end create_resource]

// [Start ui_information]
@Component
struct UIInformation {
  build(): void {
    Column({space: 8}) {
      Text("UI Information")
        .fontWeight(FontWeight.Bold)
        .fontSize(26)
      Button("px2lpx").onClick((event: ClickEvent) => {
        // [Start px2lpx]
        const result = this.getUIContext().px2lpx(100);
        // [End px2lpx]
        console.info(`px2lpx result: ${result}`)
      })
      Button("lpx2px").onClick((event: ClickEvent) => {
        // [Start lpx2px]
        const result = this.getUIContext().lpx2px(100);
        // [End lpx2px]
        console.info(`lpx2px result: ${result}`)
      })
      Button("px2fp").onClick((event: ClickEvent) => {
        // [Start px2fp]
        const result = this.getUIContext().px2fp(100);
        // [End px2fp]
        console.info(`px2fp result: ${result}`)
      })
      Button("fp2px").onClick((event: ClickEvent) => {
        // [Start fp2px]
        const result = this.getUIContext().fp2px(100);
        // [End fp2px]
        console.info(`fp2px result: ${result}`)
      })
      Button("px2vp").onClick((event: ClickEvent) => {
        // [Start px2vp]
        const result = this.getUIContext().px2vp(100);
        // [End px2vp]
        console.info(`px2vp result: ${result}`)
      })
      Button("vp2px").onClick((event: ClickEvent) => {
        // [Start vp2px]
        const result = this.getUIContext().vp2px(100);
        // [End vp2px]
        console.info(`vp2px result: ${result}`)
      })
    }
  }
}
// [End ui_information]

// [Start page_one]
@Component
export struct PageOne {
  build() {
    NavDestination() {
      Text('this is PageOne')
        .fontSize(28)
        .fontWeight(700)
        .margin({ top: 50 })
    }
  }
}
// [End page_one]
