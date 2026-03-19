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

// [Start Index]
import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Entry, Component, State, List, ListItem, Button, ClickEvent, Axis } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;

  build() {
    List({ space: 4 }) {
      ListItem() {
        Button('terminateSelf').onClick(() => {
          this.context.terminateSelf()
        })
          .width('100%')

      }

      ListItem() {
        Button('拉起UIAbilityB')
          .onClick((event: ClickEvent) => {
            let want: Want = {
              bundleName: this.context.abilityInfo.bundleName,
              abilityName: 'UIAbilityB',
            };

            this.context.startAbility(want, (error) => {
              if (error) {
                let err = error as BusinessError;
                console.error(`Failed to startAbility. Code: ${err.code}, message: ${err.message}.`);
              }
            });
          })
          .width('100%')
      }
    }
    .listDirection(Axis.Vertical)
    .backgroundColor(0xDCDCDC).padding(20)
    .margin({ top: 250 })
  }
}

// [End Index]