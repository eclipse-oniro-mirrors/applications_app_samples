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

class DemoEntry {
  public title: Resource;
  public url: string;

  constructor(title: Resource, url: string) {
    this.title = title;
    this.url = url;
  }
}

@Entry
@Component
struct Index {
  private entries: DemoEntry[] = [
    new DemoEntry($r('app.string.step_state_value_change'), 'pages/StateValueChangePage'),
    new DemoEntry($r('app.string.step_observability_v1'), 'pages/ObservabilityPage'),
    new DemoEntry($r('app.string.step_observability_v2'), 'pages/ObservabilityV2Page'),
    new DemoEntry($r('app.string.step_foreach_sync'), 'pages/ForEachSyncPage'),
    new DemoEntry($r('app.string.step_render_update'), 'pages/RenderUpdatePage'),
  ];

  build() {
    Column() {
      Text($r('app.string.title_main'))
        .fontSize(22)
        .margin(20)

      List({ space: 12 }) {
        ForEach(this.entries, (entry: DemoEntry) => {
          ListItem() {
            Button(entry.title)
              .fontSize(12)
              .width('100%')
              .height(48)
              .onClick(() => {
                this.getUIContext().getRouter().pushUrl({ url: entry.url });
              })
          }
        }, (entry: DemoEntry) => entry.url)
      }
      .width('90%')
    }
    .width('100%')
    .height('100%')
  }
}
