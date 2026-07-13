'use static'

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
import { NavDestination, $r } from '@kit.ArkUI';
// [Start WatchCustomComponent]
import { Entry, Component, Column, Button, ClickEvent, Text, State, Watch, PropRef } from '@kit.ArkUI';

@Component
struct TotalView {
  @PropRef @Watch('onCountUpdated') count: number = 0;
  @State total: number = 0;
  // @Watch 回调
  onCountUpdated(propName: string): void {
    this.total += this.count;
  }

  build() {
    Text(`Total: ${this.total}`)
      .fontSize(20)
      .margin(10)
  }
}

@Entry
@Component
struct CountModifier {
  @State count: number = 0;

  build() {
    Column() {
      Button('add to basket')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.count++;
        })
      TotalView({ count: this.count })
    }
    .width('100%')
  }
}
// [End WatchCustomComponent]

@Builder
export function watchCustomComponent(): void {
  NavDestination() {
    CountModifier();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.watch_custom_component_title'))
}