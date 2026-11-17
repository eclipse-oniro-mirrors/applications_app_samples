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

import { UIAbility } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { window } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: int = 0xF811;
const TAG: string = '[Sample_InAppCustomKeyboard]';

export default class EntryAbility extends UIAbility {
  onWindowStageCreate(stage: window.WindowStage): void {
    stage.loadContent('pages/Index').catch<void>((error: Error): void => {
      hilog.error(DOMAIN, TAG, 'Load keyboard page failed. %{public}s',
        error instanceof BusinessError ? `Code: ${error.code}, message: ${error.message}` : error.message);
    });
  }
}
