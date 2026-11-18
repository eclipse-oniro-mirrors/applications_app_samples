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
import { describe, expect, it } from '@ohos/hypium';
import { assessment } from '@kit.AutomaticSceneConfigurationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_Assessment]';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'Assessment_';
// The capability is unavailable when the device does not support the assessment service.
const CODE_CAPABILITY_NOT_SUPPORT: number = 801;
const CODE_PERMISSION_DENIED: number = 201;
// SysCap of the assessment APIs, it is absent from an image without the assessment service,
// where the whole namespace is undefined instead of throwing a business error.
const SYSCAP_ASSESSMENT: string = 'SystemCapability.Customization.AssessmentConfiguration';

/**
 * Checks whether the device image provides the assessment service.
 *
 * @returns true when the assessment SysCap is declared by the running image.
 */
function isAssessmentSupported(): boolean {
  const supported: boolean = canIUse(SYSCAP_ASSESSMENT);
  if (!supported) {
    hilog.warn(DOMAIN, TAG, '%{public}s is absent on this image, the API case is skipped', SYSCAP_ASSESSMENT);
  }
  return supported;
}

export default function assessmentTest() {
  describe('AssessmentTest', () => {
    /**
     * Scenario: query the assessment state with assessment.isActive.
     * Expectation: the API returns a boolean, or throws 201/801 when the device
     * does not grant the permission or does not support the capability.
     * The case is skipped when the running image has no assessment service at all.
     */
    it(BUNDLE + 'IsActive_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'IsActive_001, begin');
      if (!isAssessmentSupported()) {
        hilog.warn(DOMAIN, TAG, BUNDLE + 'IsActive_001, skipped, no assessment service');
        return;
      }
      let result: boolean = false;
      let valid: boolean = true;
      try {
        result = assessment.isActive();
        hilog.info(DOMAIN, TAG, BUNDLE + 'IsActive_001, isActive: %{public}s', `${result}`);
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, BUNDLE + 'IsActive_001, code: %{public}s, message: %{public}s',
          `${err.code}`, `${err.message}`);
        valid = err.code === CODE_PERMISSION_DENIED || err.code === CODE_CAPABILITY_NOT_SUPPORT;
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'IsActive_001, assert the result is a boolean');
      expect(typeof result).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, BUNDLE + 'IsActive_001, assert the error code is documented');
      expect(valid).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'IsActive_001, end');
    });

    /**
     * Scenario: query the assessment configuration with assessment.getConfiguration
     * before an assessment session is started.
     * Expectation: the API returns an AssessmentConfig whose duration is a number and
     * whose allowedApps is an array, or throws a documented business error.
     * The case is skipped when the running image has no assessment service at all.
     */
    it(BUNDLE + 'GetConfiguration_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'GetConfiguration_001, begin');
      if (!isAssessmentSupported()) {
        hilog.warn(DOMAIN, TAG, BUNDLE + 'GetConfiguration_001, skipped, no assessment service');
        return;
      }
      let valid: boolean = true;
      let duration: number = 0;
      let appsCount: number = 0;
      try {
        const config: assessment.AssessmentConfig = assessment.getConfiguration();
        duration = config.duration;
        appsCount = config.allowedApps.length;
        hilog.info(DOMAIN, TAG, BUNDLE + 'GetConfiguration_001, duration: %{public}d, apps: %{public}d',
          duration, appsCount);
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, BUNDLE + 'GetConfiguration_001, code: %{public}s, message: %{public}s',
          `${err.code}`, `${err.message}`);
        valid = err.code === CODE_PERMISSION_DENIED || err.code === CODE_CAPABILITY_NOT_SUPPORT;
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'GetConfiguration_001, assert the duration is not negative');
      expect(duration >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'GetConfiguration_001, assert the whitelist is not negative');
      expect(appsCount >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'GetConfiguration_001, assert the error code is documented');
      expect(valid).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'GetConfiguration_001, end');
    });
  });
}
