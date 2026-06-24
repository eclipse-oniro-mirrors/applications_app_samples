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
// [Start CustomEnvSupportAddMonitor]
import { Entry, Row, Component, Column, Text, Button, CustomEnv, CustomEnvKey, UIUtils, IMonitorDecoratedVariable, IMonitor, State } from '@kit.ArkUI';
import { WithEnv, WithEnvAttribute } from '@ohos.arkui.WithEnv';

const custom = CustomEnvKey.create<string>();

@Entry
@Component
struct Test {
  @State defaultMessage: string = 'the nearest WithEnv';

  build() {
    Row() {
      Column() {
        Text(`Index message is : ${this.defaultMessage}`)
        WithEnv() {
          Child()
        }.customEnv(custom, this.defaultMessage)

        Button('change')
          .onClick(() => {
            this.defaultMessage = 'Hello World';
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct Child {
  @CustomEnv('custom') message: string = 'Hello';
  valueMonitor?: IMonitorDecoratedVariable;

  onChange(m: IMonitor) {
    m.dirty.forEach((path: string) => {
      console.info(`[CustomEnv] value ${path} has changed from ${m.value<string>(path)?.before} to ${m.value<string>(path)?.now}`);
    })
  }

  aboutToAppear() {
    this.valueMonitor = UIUtils.addMonitor(() => this.message, this.onChange);
  }

  build() {
    Column() {
      Text(`Child message is : ${this.message}`)
    }
  }
}

// [End CustomEnvSupportAddMonitor]
@Builder
export function localArray(): void {
  NavDestination() {
    Test();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.ce_add_monitor_title'))
}