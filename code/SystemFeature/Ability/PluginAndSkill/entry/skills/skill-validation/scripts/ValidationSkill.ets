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

const DOMAIN = 0x0001;
const TAG = '[Sample_PluginAndSkill]';
const SUCCESS_CODE = 0;
const FAILURE_CODE = -1;

export default class ValidationSkill {
  public async validateText(info: scriptManager.ArkTSScriptInfo, ...argv: string[]): Promise<void> {
    const text = argv.length > 0 ? argv[0].trim() : '';
    if (text.length === 0) {
      const payload: Record<string, Object> = {
        'type': 'result',
        'status': 'failed',
        'errCode': 'ERR_INVALID_PARAMS',
        'errMsg': 'The required text is empty',
        'suggestion': 'Provide a non-empty text argument'
      };
      await this.report(info, { code: FAILURE_CODE, result: payload });
      return;
    }
    const data: Record<string, Object> = {
      'text': text,
      'length': text.length
    };
    const payload: Record<string, Object> = {
      'type': 'result',
      'status': 'success',
      'data': data
    };
    await this.report(info, { code: SUCCESS_CODE, result: payload });
  }

  private async report(info: scriptManager.ArkTSScriptInfo, result: scriptManager.ExecuteResult): Promise<void> {
    try {
      await scriptManager.completeArkTSScriptInApp(info.context, info.requestCode, result);
    } catch (error) {
      const err = error as BusinessError;
      hilog.error(DOMAIN, TAG, 'Failed to complete validation skill. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    }
  }
}
