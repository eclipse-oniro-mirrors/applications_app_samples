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
import hilog from '@ohos.hilog';
import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

export default function assessmentAbilityTest() {
  describe('AssessmentAbility_Test', () => {
    let runnerReady: boolean = false;

    beforeAll(() => {
      // The ability suite runs before the UI suites, it only proves that the hypium runner of
      // the test ability and the runtime of the sample are healthy.
      runnerReady = true;
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentAbility_Test, beforeAll');
    });

    afterAll(() => {
      runnerReady = false;
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentAbility_Test, afterAll');
    });

    /**
     * Scenario: the hypium runner of the assessment sample answers a plain assertion.
     * Expectation: the string operations that the sample relies on behave as documented,
     * which proves that the test ability and the runtime of the sample are healthy.
     */
    it('Assessment_AssertContain_001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssertContain_001, begin');
      const sample: string = 'assessment';
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssertContain_001, the runner is alive');
      expect(runnerReady).assertTrue();
      expect(sample).assertContain('assess');
      expect(sample).assertEqual('assessment');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssertContain_001, end');
    });

    /**
     * Scenario: the tag of the sample is used as the prefix of every log entry.
     * Expectation: the tag is a non empty string that contains the sample name, so the log
     * entries of the sample can be filtered on the device.
     */
    it('Assessment_LogTag_002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LogTag_002, begin');
      expect(TAG.length > 0).assertTrue();
      expect(TAG.includes('Sample')).assertTrue();
      expect(TAG.includes('Assessment')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LogTag_002, end');
    });

    /**
     * Scenario: reserve the async form of a case, it is the shape every asynchronous case of
     * this suite uses.
     * Expectation: the callback of the asynchronous case runs and reports the result once.
     */
    it('Assessment_AsyncCase_003', 0, async (done: () => void) => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AsyncCase_003, begin');
      let finished: boolean = false;
      await new Promise<void>((resolve: () => void) => {
        setTimeout(() => {
          finished = true;
          resolve();
        }, 10);
      });
      expect(finished).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AsyncCase_003, end');
      done();
    });
  });
}
