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

/** Logic checks for FormRequestState.request (2 cases). */
export default function formRequestStateRequestTest(): void {
  describe('FormRequestStateRequestTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_REQUEST_0001
     * @tc.name      RequestAddForm_FormRequestStateRequest_0001
     * @tc.desc      FormRequestState.request(isArkTsCard=true) yields len174
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_FormRequestStateRequest_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormRequestStateRequest_0001 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.request(true);
      logInfo(`request(isArkTsCard=true): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`request(isArkTsCard=true): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`request(isArkTsCard=true): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`request(isArkTsCard=true) state: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request(isArkTsCard=true) state: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('widget');
      logInfo(`${BUNDLE}FormRequestStateRequest_0001 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_REQUEST_0002
     * @tc.name      RequestAddForm_FormRequestStateRequest_0002
     * @tc.desc      FormRequestState.request(isArkTsCard=false) yields len176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_FormRequestStateRequest_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormRequestStateRequest_0002 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.request(false);
      logInfo(`request(isArkTsCard=false): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(176);
      logInfo(`request(isArkTsCard=false): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`request(isArkTsCard=false): actual.substring(144)=${actual.substring(144)}`);
      expect(actual.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`request(isArkTsCard=false) state: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`request(isArkTsCard=false) state: subject.lastFormName=${subject.lastFormName}`);
      expect(subject.lastFormName).assertEqual('JsWidget');
      logInfo(`${BUNDLE}FormRequestStateRequest_0002 end`);
    });
  });
}
