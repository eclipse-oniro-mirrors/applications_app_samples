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

/** Logic checks for FormRequestState.succeed (34 cases). */
export default function formRequestStateSucceed3Test(): void {
  describe('FormRequestStateSucceed3Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0147
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0147
     * @tc.desc      FormRequestState.succeed(formId="Y8AN4") yields "RequestPublishForm success : Y8AN4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0147 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('Y8AN4');
      logInfo(`succeed(formId="Y8AN4"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Y8AN4');
      logInfo(`succeed(formId="Y8AN4") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Y8AN4');
      logInfo(`succeed(formId="Y8AN4") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0147 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0148
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0148
     * @tc.desc      FormRequestState.succeed(formId="6BMyamDpxz") yields "RequestPublishForm success : 6BMyamDpxz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0148 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('6BMyamDpxz');
      logInfo(`succeed(formId="6BMyamDpxz"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 6BMyamDpxz');
      logInfo(`succeed(formId="6BMyamDpxz") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 6BMyamDpxz');
      logInfo(`succeed(formId="6BMyamDpxz") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0148 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0149
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0149
     * @tc.desc      FormRequestState.succeed(formId="X") yields "RequestPublishForm success : X"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0149 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('X');
      logInfo(`succeed(formId="X"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : X');
      logInfo(`succeed(formId="X") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : X');
      logInfo(`succeed(formId="X") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0149 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0150
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0150
     * @tc.desc      FormRequestState.succeed(formId="rRBS7Sz") yields "RequestPublishForm success : rRBS7Sz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0150 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('rRBS7Sz');
      logInfo(`succeed(formId="rRBS7Sz"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : rRBS7Sz');
      logInfo(`succeed(formId="rRBS7Sz") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : rRBS7Sz');
      logInfo(`succeed(formId="rRBS7Sz") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0150 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0151
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0151
     * @tc.desc      FormRequestState.succeed(formId="y") yields "RequestPublishForm success : y"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0151 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('y');
      logInfo(`succeed(formId="y"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : y');
      logInfo(`succeed(formId="y") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : y');
      logInfo(`succeed(formId="y") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0151 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0152
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0152
     * @tc.desc      FormRequestState.succeed(formId="lcgeja") yields "RequestPublishForm success : lcgeja"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0152 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('lcgeja');
      logInfo(`succeed(formId="lcgeja"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : lcgeja');
      logInfo(`succeed(formId="lcgeja") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : lcgeja');
      logInfo(`succeed(formId="lcgeja") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0152 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0153
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0153
     * @tc.desc      FormRequestState.succeed(formId="ZKhoamZt3Itz") yields "RequestPublishForm success : ZKhoamZt3Itz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0153 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('ZKhoamZt3Itz');
      logInfo(`succeed(formId="ZKhoamZt3Itz"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : ZKhoamZt3Itz');
      logInfo(`succeed(formId="ZKhoamZt3Itz") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : ZKhoamZt3Itz');
      logInfo(`succeed(formId="ZKhoamZt3Itz") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0153 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0154
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0154
     * @tc.desc      FormRequestState.succeed(formId="Hv") yields "RequestPublishForm success : Hv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0154 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('Hv');
      logInfo(`succeed(formId="Hv"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Hv');
      logInfo(`succeed(formId="Hv") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Hv');
      logInfo(`succeed(formId="Hv") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0154 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0155
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0155
     * @tc.desc      FormRequestState.succeed(formId="bm") yields "RequestPublishForm success : bm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0155 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('bm');
      logInfo(`succeed(formId="bm"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : bm');
      logInfo(`succeed(formId="bm") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : bm');
      logInfo(`succeed(formId="bm") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0155 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0156
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0156
     * @tc.desc      FormRequestState.succeed(formId="7YG6") yields "RequestPublishForm success : 7YG6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0156 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('7YG6');
      logInfo(`succeed(formId="7YG6"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 7YG6');
      logInfo(`succeed(formId="7YG6") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 7YG6');
      logInfo(`succeed(formId="7YG6") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0156 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0157
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0157
     * @tc.desc      FormRequestState.succeed(formId="IFn2LmlG") yields "RequestPublishForm success : IFn2LmlG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0157 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('IFn2LmlG');
      logInfo(`succeed(formId="IFn2LmlG"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : IFn2LmlG');
      logInfo(`succeed(formId="IFn2LmlG") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : IFn2LmlG');
      logInfo(`succeed(formId="IFn2LmlG") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0157 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0158
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0158
     * @tc.desc      FormRequestState.succeed(formId="IVgEZ9CBFeCm") yields "RequestPublishForm success : IVgEZ9CBFeCm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0158 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('IVgEZ9CBFeCm');
      logInfo(`succeed(formId="IVgEZ9CBFeCm"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : IVgEZ9CBFeCm');
      logInfo(`succeed(formId="IVgEZ9CBFeCm") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : IVgEZ9CBFeCm');
      logInfo(`succeed(formId="IVgEZ9CBFeCm") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0158 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0159
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0159
     * @tc.desc      FormRequestState.succeed(formId="rVmZq") yields "RequestPublishForm success : rVmZq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0159 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('rVmZq');
      logInfo(`succeed(formId="rVmZq"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : rVmZq');
      logInfo(`succeed(formId="rVmZq") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : rVmZq');
      logInfo(`succeed(formId="rVmZq") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0159 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0160
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0160
     * @tc.desc      FormRequestState.succeed(formId="scHdaM") yields "RequestPublishForm success : scHdaM"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0160 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('scHdaM');
      logInfo(`succeed(formId="scHdaM"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : scHdaM');
      logInfo(`succeed(formId="scHdaM") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : scHdaM');
      logInfo(`succeed(formId="scHdaM") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0160 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0161
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0161
     * @tc.desc      FormRequestState.succeed(formId="YLVStOQ87i") yields "RequestPublishForm success : YLVStOQ87i"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0161 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('YLVStOQ87i');
      logInfo(`succeed(formId="YLVStOQ87i"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : YLVStOQ87i');
      logInfo(`succeed(formId="YLVStOQ87i") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : YLVStOQ87i');
      logInfo(`succeed(formId="YLVStOQ87i") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0161 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0162
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0162
     * @tc.desc      FormRequestState.succeed(formId="8") yields "RequestPublishForm success : 8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0162 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('8');
      logInfo(`succeed(formId="8"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 8');
      logInfo(`succeed(formId="8") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 8');
      logInfo(`succeed(formId="8") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0162 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0163
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0163
     * @tc.desc      FormRequestState.succeed(formId="dogxW") yields "RequestPublishForm success : dogxW"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0163 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('dogxW');
      logInfo(`succeed(formId="dogxW"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : dogxW');
      logInfo(`succeed(formId="dogxW") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : dogxW');
      logInfo(`succeed(formId="dogxW") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0163 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0164
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0164
     * @tc.desc      FormRequestState.succeed(formId="7rqsK") yields "RequestPublishForm success : 7rqsK"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0164 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('7rqsK');
      logInfo(`succeed(formId="7rqsK"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 7rqsK');
      logInfo(`succeed(formId="7rqsK") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 7rqsK');
      logInfo(`succeed(formId="7rqsK") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0164 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0165
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0165
     * @tc.desc      FormRequestState.succeed(formId="AlNzoasZntZO") yields "RequestPublishForm success : AlNzoasZntZO"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0165 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('AlNzoasZntZO');
      logInfo(`succeed(formId="AlNzoasZntZO"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : AlNzoasZntZO');
      logInfo(`succeed(formId="AlNzoasZntZO") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : AlNzoasZntZO');
      logInfo(`succeed(formId="AlNzoasZntZO") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0165 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0166
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0166
     * @tc.desc      FormRequestState.succeed(formId="czEO8MXkfwT") yields "RequestPublishForm success : czEO8MXkfwT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0166 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('czEO8MXkfwT');
      logInfo(`succeed(formId="czEO8MXkfwT"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : czEO8MXkfwT');
      logInfo(`succeed(formId="czEO8MXkfwT") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : czEO8MXkfwT');
      logInfo(`succeed(formId="czEO8MXkfwT") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0166 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0167
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0167
     * @tc.desc      FormRequestState.succeed(formId="lmdG2u5cjoTs") yields "RequestPublishForm success : lmdG2u5cjoTs"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0167 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('lmdG2u5cjoTs');
      logInfo(`succeed(formId="lmdG2u5cjoTs"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : lmdG2u5cjoTs');
      logInfo(`succeed(formId="lmdG2u5cjoTs") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : lmdG2u5cjoTs');
      logInfo(`succeed(formId="lmdG2u5cjoTs") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0167 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0168
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0168
     * @tc.desc      FormRequestState.succeed(formId="Yym") yields "RequestPublishForm success : Yym"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0168 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('Yym');
      logInfo(`succeed(formId="Yym"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Yym');
      logInfo(`succeed(formId="Yym") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Yym');
      logInfo(`succeed(formId="Yym") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0168 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0169
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0169
     * @tc.desc      FormRequestState.succeed(formId="wxir") yields "RequestPublishForm success : wxir"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0169 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('wxir');
      logInfo(`succeed(formId="wxir"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : wxir');
      logInfo(`succeed(formId="wxir") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : wxir');
      logInfo(`succeed(formId="wxir") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0169 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0170
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0170
     * @tc.desc      FormRequestState.succeed(formId="S") yields "RequestPublishForm success : S"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0170 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('S');
      logInfo(`succeed(formId="S"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : S');
      logInfo(`succeed(formId="S") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : S');
      logInfo(`succeed(formId="S") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0170 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0171
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0171
     * @tc.desc      FormRequestState.succeed(formId="rq3") yields "RequestPublishForm success : rq3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0171 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('rq3');
      logInfo(`succeed(formId="rq3"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : rq3');
      logInfo(`succeed(formId="rq3") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : rq3');
      logInfo(`succeed(formId="rq3") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0171 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0172
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0172
     * @tc.desc      FormRequestState.succeed(formId="mfGsHMK") yields "RequestPublishForm success : mfGsHMK"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0172 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('mfGsHMK');
      logInfo(`succeed(formId="mfGsHMK"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : mfGsHMK');
      logInfo(`succeed(formId="mfGsHMK") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : mfGsHMK');
      logInfo(`succeed(formId="mfGsHMK") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0172 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0173
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0173
     * @tc.desc      FormRequestState.succeed(formId="HaqlmHtC4oU") yields "RequestPublishForm success : HaqlmHtC4oU"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0173 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('HaqlmHtC4oU');
      logInfo(`succeed(formId="HaqlmHtC4oU"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : HaqlmHtC4oU');
      logInfo(`succeed(formId="HaqlmHtC4oU") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : HaqlmHtC4oU');
      logInfo(`succeed(formId="HaqlmHtC4oU") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0173 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0174
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0174
     * @tc.desc      FormRequestState.succeed(formId="vdsItCe2m") yields "RequestPublishForm success : vdsItCe2m"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0174 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('vdsItCe2m');
      logInfo(`succeed(formId="vdsItCe2m"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : vdsItCe2m');
      logInfo(`succeed(formId="vdsItCe2m") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : vdsItCe2m');
      logInfo(`succeed(formId="vdsItCe2m") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0174 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0175
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0175
     * @tc.desc      FormRequestState.succeed(formId="8o4Hy99Yie") yields "RequestPublishForm success : 8o4Hy99Yie"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0175 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('8o4Hy99Yie');
      logInfo(`succeed(formId="8o4Hy99Yie"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 8o4Hy99Yie');
      logInfo(`succeed(formId="8o4Hy99Yie") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 8o4Hy99Yie');
      logInfo(`succeed(formId="8o4Hy99Yie") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0175 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0176
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0176
     * @tc.desc      FormRequestState.succeed(formId="1zcq9fW6t") yields "RequestPublishForm success : 1zcq9fW6t"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0176 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('1zcq9fW6t');
      logInfo(`succeed(formId="1zcq9fW6t"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 1zcq9fW6t');
      logInfo(`succeed(formId="1zcq9fW6t") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 1zcq9fW6t');
      logInfo(`succeed(formId="1zcq9fW6t") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0176 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0177
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0177
     * @tc.desc      FormRequestState.succeed(formId="XG4zaQg86uk") yields "RequestPublishForm success : XG4zaQg86uk"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0177 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('XG4zaQg86uk');
      logInfo(`succeed(formId="XG4zaQg86uk"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : XG4zaQg86uk');
      logInfo(`succeed(formId="XG4zaQg86uk") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : XG4zaQg86uk');
      logInfo(`succeed(formId="XG4zaQg86uk") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0177 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0178
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0178
     * @tc.desc      FormRequestState.succeed(formId="fyakCI") yields "RequestPublishForm success : fyakCI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0178 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('fyakCI');
      logInfo(`succeed(formId="fyakCI"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : fyakCI');
      logInfo(`succeed(formId="fyakCI") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : fyakCI');
      logInfo(`succeed(formId="fyakCI") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0178 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0179
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0179
     * @tc.desc      FormRequestState.succeed(formId="kVYu9") yields "RequestPublishForm success : kVYu9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0179 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('kVYu9');
      logInfo(`succeed(formId="kVYu9"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : kVYu9');
      logInfo(`succeed(formId="kVYu9") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : kVYu9');
      logInfo(`succeed(formId="kVYu9") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0179 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0180
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0180
     * @tc.desc      FormRequestState.succeed(formId="96d00eDs") yields "RequestPublishForm success : 96d00eDs"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0180 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('96d00eDs');
      logInfo(`succeed(formId="96d00eDs"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 96d00eDs');
      logInfo(`succeed(formId="96d00eDs") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 96d00eDs');
      logInfo(`succeed(formId="96d00eDs") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0180 end`);
    });
  });
}
