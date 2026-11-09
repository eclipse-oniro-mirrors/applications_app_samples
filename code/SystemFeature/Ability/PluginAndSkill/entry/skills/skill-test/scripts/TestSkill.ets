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

import { scriptManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PluginAndSkill]';

export default class TestSkill {
  public async getTestMessage(info: scriptManager.ArkTSScriptInfo, ...argv: string[]): Promise<void> {
    const data: Record<string, Object> = {
      'message': 'PluginAndSkill test skill is ready',
      'argumentCount': argv.length
    };
    const payload: Record<string, Object> = {
      'type': 'result',
      'status': 'success',
      'data': data
    };
    const result: scriptManager.ExecuteResult = { code: 0, result: payload };
    try {
      await scriptManager.completeArkTSScriptInApp(info.context, info.requestCode, result);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, 'Failed to complete test skill. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    }
  }
}
