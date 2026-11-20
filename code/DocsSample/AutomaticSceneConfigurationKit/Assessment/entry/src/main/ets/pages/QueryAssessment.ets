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
// [Start assessment_query]
import { assessment } from '@kit.AutomaticSceneConfigurationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_Assessment]';

try {
  const active: boolean = assessment.isActive();
  hilog.info(DOMAIN, TAG, '%{public}s', `isActive result: ${active}`);
  if (active) {
    const config: assessment.AssessmentConfig = assessment.getConfiguration();
    hilog.info(DOMAIN, TAG, '%{public}s',
      `getConfiguration result, duration: ${config.duration}, allowedApps: ${config.allowedApps.join(',')}`);
  }
} catch (error) {
  const err: BusinessError = error as BusinessError;
  hilog.error(DOMAIN, TAG, '%{public}s', `query failed, code: ${err.code}, message: ${err.message}`);
}
// [End assessment_query]
