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

/** Logic checks for FormRequestState.fail (34 cases). */
export default function formRequestStateFail3Test(): void {
  describe('FormRequestStateFail3Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0147
     * @tc.name      RequestAddForm_FormRequestStateFail_0147
     * @tc.desc      FormRequestState.fail(message="o9S5dys") yields "RequestPublishForm failed : o9S5dys"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0147 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('o9S5dys');
      logInfo(`fail(message="o9S5dys"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : o9S5dys');
      logInfo(`fail(message="o9S5dys") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : o9S5dys');
      logInfo(`fail(message="o9S5dys") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0147 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0148
     * @tc.name      RequestAddForm_FormRequestStateFail_0148
     * @tc.desc      FormRequestState.fail(message="o4kmvU") yields "RequestPublishForm failed : o4kmvU"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0148 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('o4kmvU');
      logInfo(`fail(message="o4kmvU"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : o4kmvU');
      logInfo(`fail(message="o4kmvU") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : o4kmvU');
      logInfo(`fail(message="o4kmvU") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0148 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0149
     * @tc.name      RequestAddForm_FormRequestStateFail_0149
     * @tc.desc      FormRequestState.fail(message="dplG3RngbYY") yields "RequestPublishForm failed : dplG3RngbYY"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0149 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('dplG3RngbYY');
      logInfo(`fail(message="dplG3RngbYY"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : dplG3RngbYY');
      logInfo(`fail(message="dplG3RngbYY") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : dplG3RngbYY');
      logInfo(`fail(message="dplG3RngbYY") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0149 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0150
     * @tc.name      RequestAddForm_FormRequestStateFail_0150
     * @tc.desc      FormRequestState.fail(message="62jwo8fhw") yields "RequestPublishForm failed : 62jwo8fhw"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0150 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('62jwo8fhw');
      logInfo(`fail(message="62jwo8fhw"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 62jwo8fhw');
      logInfo(`fail(message="62jwo8fhw") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 62jwo8fhw');
      logInfo(`fail(message="62jwo8fhw") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0150 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0151
     * @tc.name      RequestAddForm_FormRequestStateFail_0151
     * @tc.desc      FormRequestState.fail(message="vvIL9Oy5M") yields "RequestPublishForm failed : vvIL9Oy5M"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0151 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('vvIL9Oy5M');
      logInfo(`fail(message="vvIL9Oy5M"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : vvIL9Oy5M');
      logInfo(`fail(message="vvIL9Oy5M") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : vvIL9Oy5M');
      logInfo(`fail(message="vvIL9Oy5M") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0151 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0152
     * @tc.name      RequestAddForm_FormRequestStateFail_0152
     * @tc.desc      FormRequestState.fail(message="lryGn5oK85X") yields "RequestPublishForm failed : lryGn5oK85X"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0152 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('lryGn5oK85X');
      logInfo(`fail(message="lryGn5oK85X"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : lryGn5oK85X');
      logInfo(`fail(message="lryGn5oK85X") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : lryGn5oK85X');
      logInfo(`fail(message="lryGn5oK85X") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0152 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0153
     * @tc.name      RequestAddForm_FormRequestStateFail_0153
     * @tc.desc      FormRequestState.fail(message="l6") yields "RequestPublishForm failed : l6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0153 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('l6');
      logInfo(`fail(message="l6"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : l6');
      logInfo(`fail(message="l6") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : l6');
      logInfo(`fail(message="l6") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0153 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0154
     * @tc.name      RequestAddForm_FormRequestStateFail_0154
     * @tc.desc      FormRequestState.fail(message="yDtsHsIX") yields "RequestPublishForm failed : yDtsHsIX"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0154 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('yDtsHsIX');
      logInfo(`fail(message="yDtsHsIX"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : yDtsHsIX');
      logInfo(`fail(message="yDtsHsIX") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : yDtsHsIX');
      logInfo(`fail(message="yDtsHsIX") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0154 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0155
     * @tc.name      RequestAddForm_FormRequestStateFail_0155
     * @tc.desc      FormRequestState.fail(message="iJx") yields "RequestPublishForm failed : iJx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0155 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('iJx');
      logInfo(`fail(message="iJx"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : iJx');
      logInfo(`fail(message="iJx") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : iJx');
      logInfo(`fail(message="iJx") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0155 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0156
     * @tc.name      RequestAddForm_FormRequestStateFail_0156
     * @tc.desc      FormRequestState.fail(message="ExIOCVyJb") yields "RequestPublishForm failed : ExIOCVyJb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0156 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('ExIOCVyJb');
      logInfo(`fail(message="ExIOCVyJb"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : ExIOCVyJb');
      logInfo(`fail(message="ExIOCVyJb") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : ExIOCVyJb');
      logInfo(`fail(message="ExIOCVyJb") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0156 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0157
     * @tc.name      RequestAddForm_FormRequestStateFail_0157
     * @tc.desc      FormRequestState.fail(message="R") yields "RequestPublishForm failed : R"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0157 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('R');
      logInfo(`fail(message="R"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : R');
      logInfo(`fail(message="R") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : R');
      logInfo(`fail(message="R") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0157 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0158
     * @tc.name      RequestAddForm_FormRequestStateFail_0158
     * @tc.desc      FormRequestState.fail(message="bnS2SIBm1PUb") yields "RequestPublishForm failed : bnS2SIBm1PUb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0158 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('bnS2SIBm1PUb');
      logInfo(`fail(message="bnS2SIBm1PUb"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : bnS2SIBm1PUb');
      logInfo(`fail(message="bnS2SIBm1PUb") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : bnS2SIBm1PUb');
      logInfo(`fail(message="bnS2SIBm1PUb") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0158 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0159
     * @tc.name      RequestAddForm_FormRequestStateFail_0159
     * @tc.desc      FormRequestState.fail(message="htP6uojaY") yields "RequestPublishForm failed : htP6uojaY"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0159 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('htP6uojaY');
      logInfo(`fail(message="htP6uojaY"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : htP6uojaY');
      logInfo(`fail(message="htP6uojaY") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : htP6uojaY');
      logInfo(`fail(message="htP6uojaY") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0159 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0160
     * @tc.name      RequestAddForm_FormRequestStateFail_0160
     * @tc.desc      FormRequestState.fail(message="E") yields "RequestPublishForm failed : E"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0160 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('E');
      logInfo(`fail(message="E"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : E');
      logInfo(`fail(message="E") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : E');
      logInfo(`fail(message="E") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0160 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0161
     * @tc.name      RequestAddForm_FormRequestStateFail_0161
     * @tc.desc      FormRequestState.fail(message="76") yields "RequestPublishForm failed : 76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0161 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('76');
      logInfo(`fail(message="76"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 76');
      logInfo(`fail(message="76") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 76');
      logInfo(`fail(message="76") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0161 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0162
     * @tc.name      RequestAddForm_FormRequestStateFail_0162
     * @tc.desc      FormRequestState.fail(message="5vtP") yields "RequestPublishForm failed : 5vtP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0162 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('5vtP');
      logInfo(`fail(message="5vtP"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 5vtP');
      logInfo(`fail(message="5vtP") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 5vtP');
      logInfo(`fail(message="5vtP") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0162 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0163
     * @tc.name      RequestAddForm_FormRequestStateFail_0163
     * @tc.desc      FormRequestState.fail(message="QCS864GqULG") yields "RequestPublishForm failed : QCS864GqULG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0163 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('QCS864GqULG');
      logInfo(`fail(message="QCS864GqULG"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : QCS864GqULG');
      logInfo(`fail(message="QCS864GqULG") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : QCS864GqULG');
      logInfo(`fail(message="QCS864GqULG") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0163 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0164
     * @tc.name      RequestAddForm_FormRequestStateFail_0164
     * @tc.desc      FormRequestState.fail(message="g3hwOV") yields "RequestPublishForm failed : g3hwOV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0164 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('g3hwOV');
      logInfo(`fail(message="g3hwOV"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : g3hwOV');
      logInfo(`fail(message="g3hwOV") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : g3hwOV');
      logInfo(`fail(message="g3hwOV") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0164 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0165
     * @tc.name      RequestAddForm_FormRequestStateFail_0165
     * @tc.desc      FormRequestState.fail(message="oE1FbFWi") yields "RequestPublishForm failed : oE1FbFWi"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0165 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('oE1FbFWi');
      logInfo(`fail(message="oE1FbFWi"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : oE1FbFWi');
      logInfo(`fail(message="oE1FbFWi") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : oE1FbFWi');
      logInfo(`fail(message="oE1FbFWi") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0165 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0166
     * @tc.name      RequestAddForm_FormRequestStateFail_0166
     * @tc.desc      FormRequestState.fail(message="4MLHgah") yields "RequestPublishForm failed : 4MLHgah"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0166 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('4MLHgah');
      logInfo(`fail(message="4MLHgah"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 4MLHgah');
      logInfo(`fail(message="4MLHgah") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 4MLHgah');
      logInfo(`fail(message="4MLHgah") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0166 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0167
     * @tc.name      RequestAddForm_FormRequestStateFail_0167
     * @tc.desc      FormRequestState.fail(message="LpQHNISq") yields "RequestPublishForm failed : LpQHNISq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0167 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('LpQHNISq');
      logInfo(`fail(message="LpQHNISq"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : LpQHNISq');
      logInfo(`fail(message="LpQHNISq") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : LpQHNISq');
      logInfo(`fail(message="LpQHNISq") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0167 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0168
     * @tc.name      RequestAddForm_FormRequestStateFail_0168
     * @tc.desc      FormRequestState.fail(message="gX6") yields "RequestPublishForm failed : gX6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0168 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('gX6');
      logInfo(`fail(message="gX6"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : gX6');
      logInfo(`fail(message="gX6") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : gX6');
      logInfo(`fail(message="gX6") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0168 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0169
     * @tc.name      RequestAddForm_FormRequestStateFail_0169
     * @tc.desc      FormRequestState.fail(message="V2Q") yields "RequestPublishForm failed : V2Q"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0169 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('V2Q');
      logInfo(`fail(message="V2Q"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : V2Q');
      logInfo(`fail(message="V2Q") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : V2Q');
      logInfo(`fail(message="V2Q") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0169 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0170
     * @tc.name      RequestAddForm_FormRequestStateFail_0170
     * @tc.desc      FormRequestState.fail(message="hVZdQ") yields "RequestPublishForm failed : hVZdQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0170 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('hVZdQ');
      logInfo(`fail(message="hVZdQ"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : hVZdQ');
      logInfo(`fail(message="hVZdQ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : hVZdQ');
      logInfo(`fail(message="hVZdQ") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0170 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0171
     * @tc.name      RequestAddForm_FormRequestStateFail_0171
     * @tc.desc      FormRequestState.fail(message="1oXfxb6r9s") yields "RequestPublishForm failed : 1oXfxb6r9s"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0171 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('1oXfxb6r9s');
      logInfo(`fail(message="1oXfxb6r9s"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 1oXfxb6r9s');
      logInfo(`fail(message="1oXfxb6r9s") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 1oXfxb6r9s');
      logInfo(`fail(message="1oXfxb6r9s") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0171 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0172
     * @tc.name      RequestAddForm_FormRequestStateFail_0172
     * @tc.desc      FormRequestState.fail(message="xTSuiz9l") yields "RequestPublishForm failed : xTSuiz9l"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0172 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('xTSuiz9l');
      logInfo(`fail(message="xTSuiz9l"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : xTSuiz9l');
      logInfo(`fail(message="xTSuiz9l") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : xTSuiz9l');
      logInfo(`fail(message="xTSuiz9l") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0172 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0173
     * @tc.name      RequestAddForm_FormRequestStateFail_0173
     * @tc.desc      FormRequestState.fail(message="uOfyzg89xRFw") yields "RequestPublishForm failed : uOfyzg89xRFw"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0173 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('uOfyzg89xRFw');
      logInfo(`fail(message="uOfyzg89xRFw"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : uOfyzg89xRFw');
      logInfo(`fail(message="uOfyzg89xRFw") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : uOfyzg89xRFw');
      logInfo(`fail(message="uOfyzg89xRFw") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0173 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0174
     * @tc.name      RequestAddForm_FormRequestStateFail_0174
     * @tc.desc      FormRequestState.fail(message="uGr7a2su") yields "RequestPublishForm failed : uGr7a2su"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0174 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('uGr7a2su');
      logInfo(`fail(message="uGr7a2su"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : uGr7a2su');
      logInfo(`fail(message="uGr7a2su") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : uGr7a2su');
      logInfo(`fail(message="uGr7a2su") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0174 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0175
     * @tc.name      RequestAddForm_FormRequestStateFail_0175
     * @tc.desc      FormRequestState.fail(message="UTkt5kW") yields "RequestPublishForm failed : UTkt5kW"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0175 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('UTkt5kW');
      logInfo(`fail(message="UTkt5kW"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : UTkt5kW');
      logInfo(`fail(message="UTkt5kW") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : UTkt5kW');
      logInfo(`fail(message="UTkt5kW") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0175 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0176
     * @tc.name      RequestAddForm_FormRequestStateFail_0176
     * @tc.desc      FormRequestState.fail(message="4") yields "RequestPublishForm failed : 4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0176 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('4');
      logInfo(`fail(message="4"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 4');
      logInfo(`fail(message="4") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 4');
      logInfo(`fail(message="4") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0176 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0177
     * @tc.name      RequestAddForm_FormRequestStateFail_0177
     * @tc.desc      FormRequestState.fail(message="iLZC9mFaV") yields "RequestPublishForm failed : iLZC9mFaV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0177 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('iLZC9mFaV');
      logInfo(`fail(message="iLZC9mFaV"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : iLZC9mFaV');
      logInfo(`fail(message="iLZC9mFaV") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : iLZC9mFaV');
      logInfo(`fail(message="iLZC9mFaV") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0177 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0178
     * @tc.name      RequestAddForm_FormRequestStateFail_0178
     * @tc.desc      FormRequestState.fail(message="LTJuRROZ5tI") yields "RequestPublishForm failed : LTJuRROZ5tI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0178 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('LTJuRROZ5tI');
      logInfo(`fail(message="LTJuRROZ5tI"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : LTJuRROZ5tI');
      logInfo(`fail(message="LTJuRROZ5tI") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : LTJuRROZ5tI');
      logInfo(`fail(message="LTJuRROZ5tI") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0178 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0179
     * @tc.name      RequestAddForm_FormRequestStateFail_0179
     * @tc.desc      FormRequestState.fail(message="kCl5jCtN") yields "RequestPublishForm failed : kCl5jCtN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0179 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('kCl5jCtN');
      logInfo(`fail(message="kCl5jCtN"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : kCl5jCtN');
      logInfo(`fail(message="kCl5jCtN") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : kCl5jCtN');
      logInfo(`fail(message="kCl5jCtN") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0179 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0180
     * @tc.name      RequestAddForm_FormRequestStateFail_0180
     * @tc.desc      FormRequestState.fail(message="Az0l") yields "RequestPublishForm failed : Az0l"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0180 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('Az0l');
      logInfo(`fail(message="Az0l"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : Az0l');
      logInfo(`fail(message="Az0l") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Az0l');
      logInfo(`fail(message="Az0l") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0180 end`);
    });
  });
}
