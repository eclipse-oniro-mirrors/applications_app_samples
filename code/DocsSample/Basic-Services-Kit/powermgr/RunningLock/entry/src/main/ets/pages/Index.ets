/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     `http://www.apache.org/licenses/LICENSE-2.0`
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { UserIdleTask } from './UserIdleTask';
import { common } from '@kit.AbilityKit';
// [Start import_module]
// 导入runningLock、commonEventManager、BusinessError模块
import { runningLock } from '@kit.BasicServicesKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import { BusinessError } from '@kit.BasicServicesKit';
// [End import_module]

@Entry
@Component
struct Index {
  build() {
    Column({ space: 10 }) {
      Button('UserIdleTask')
        .onClick(() => {
          let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
          AppStorage.setOrCreate<string>("filesDirPath",context.filesDir)
          let task: UserIdleTask = new UserIdleTask();
          task.init()
            .then(() => {
              task.runUserIdleTask();
            })
            .catch((error: BusinessError) => {
              console.error(`UserIdleTask init failed, code is ${error.code}, message is ${error.message}`);
            });
        })
    }.height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}