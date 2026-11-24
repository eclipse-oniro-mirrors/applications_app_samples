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

import { CallController } from '../call/CallController';
import { HilogCallLogger, SystemCallService } from '../call/SystemCallService';

@Entry
@Component
struct JumpCall {
  private callController: CallController = new CallController(new SystemCallService(), new HilogCallLogger());

  startCallAbilityExplicit(): void {
    this.callController.start();
  }

  aboutToDisappear(): void {
    this.callController.dispose();
  }

  build() {
    Row() {
      Column() {
        Button('Make Call')
          .id('makeCallButton')
          .onClick(() => {
            this.startCallAbilityExplicit();
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
