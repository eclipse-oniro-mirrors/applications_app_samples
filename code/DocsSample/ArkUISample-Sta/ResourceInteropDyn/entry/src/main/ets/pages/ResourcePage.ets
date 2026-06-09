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

// [Start res_interop]
// entry/src/main/ets/pages/ResourcePage.ets
import { createResource } from 'library';

@Entry
@Component
struct ResourcePage {
  // $r("app.string.res")需替换为开发者所需要的资源
  @State resText: Resource = $r("app.string.res");
  // $r("app.color.start_window_background"需替换为开发者所需要的资源
  @State resTextColor: Resource = $r("app.color.start_window_background");

  build() {
    Column() {
      Button("createResource").height(35)
        .onClick((e: ClickEvent) => {
          let res = createResource() as Resource;
          this.resText = res;
        })
      Text(this.resText).backgroundColor(this.resTextColor).height(70)
    }
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }
}
// [End res_interop]
