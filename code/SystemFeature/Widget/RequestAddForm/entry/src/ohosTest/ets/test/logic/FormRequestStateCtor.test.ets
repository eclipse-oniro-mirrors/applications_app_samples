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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { FormRequestState } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new FormRequestState (1 cases). */
export default function formRequestStateCtorTest(): void {
  describe('FormRequestStateCtorTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_CTOR_0001
     * @tc.name      RequestAddForm_FormRequestStateCtor_0001
     * @tc.desc      new FormRequestState() initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_FormRequestStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormRequestStateCtor_0001 begin`);
      const subject: FormRequestState = new FormRequestState();
      logInfo(`new FormRequestState(): subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(0);
      logInfo(`new FormRequestState(): subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('');
      logInfo(`new FormRequestState(): subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('');
      logInfo(`new FormRequestState(): subject.published=${subject.published}`);
      expect(subject.published).assertEqual(0);
      logInfo(`new FormRequestState(): subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(0);
      logInfo(`${BUNDLE}FormRequestStateCtor_0001 end`);
    });
  });
}
