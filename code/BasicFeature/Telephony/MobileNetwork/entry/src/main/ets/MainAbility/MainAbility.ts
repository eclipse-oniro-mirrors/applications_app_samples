/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import Logger from '../model/Logger'
import {
  UIAbility, Want, AbilityConstant, abilityAccessCtrl, Permissions, PermissionRequestResult
} from '@kit.AbilityKit'
import type window from '@ohos.window'

const TAG: string = '[Sample_MobileNetwork]'

export default class MainAbility extends UIAbility {
  async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): Promise<void> {
    Logger.info(TAG, `[Demo] MainAbility onCreate`)
    const PERMISSIONS: Permissions[] = ['ohos.permission.GET_NETWORK_INFO']

    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager()
    try {
      atManager.requestPermissionsFromUser(this.context, PERMISSIONS).then((data: PermissionRequestResult) => {
        Logger.info(TAG, `data: ${JSON.stringify(data)}`)
      }).catch((err: Error) => {
        Logger.info(TAG, `err: ${JSON.stringify(err)}`)
      })
    } catch (err) {
      Logger.info(TAG, `catch err->${JSON.stringify(err)}`)
    }
  }

  onDestroy(): void {
    Logger.info(TAG, `[Demo] MainAbility onDestroy`)
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    Logger.info(TAG, `[Demo] MainAbility onWindowStageCreate`)

    windowStage.loadContent('pages/Index')
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    Logger.info(TAG, `[Demo] MainAbility onWindowStageDestroy`)
  }

  onForeground(): void {
    // Ability has brought to foreground
    Logger.info(TAG, `[Demo] MainAbility onForeground`)
  }

  onBackground(): void {
    // Ability has back to background
    Logger.info(TAG, `[Demo] MainAbility onBackground`)
  }
}
