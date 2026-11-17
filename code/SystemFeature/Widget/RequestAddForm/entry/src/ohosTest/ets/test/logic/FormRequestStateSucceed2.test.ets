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

/** Logic checks for FormRequestState.succeed (73 cases). */
export default function formRequestStateSucceed2Test(): void {
  describe('FormRequestStateSucceed2Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0074
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0074
     * @tc.desc      FormRequestState.succeed(formId="9NjIbrR") yields "RequestPublishForm success : 9NjIbrR"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0074 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('9NjIbrR');
      logInfo(`succeed(formId="9NjIbrR"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 9NjIbrR');
      logInfo(`succeed(formId="9NjIbrR") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 9NjIbrR');
      logInfo(`succeed(formId="9NjIbrR") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0074 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0075
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0075
     * @tc.desc      FormRequestState.succeed(formId="9hlv") yields "RequestPublishForm success : 9hlv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0075 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('9hlv');
      logInfo(`succeed(formId="9hlv"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 9hlv');
      logInfo(`succeed(formId="9hlv") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 9hlv');
      logInfo(`succeed(formId="9hlv") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0075 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0076
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0076
     * @tc.desc      FormRequestState.succeed(formId="DtSFoqMuV") yields "RequestPublishForm success : DtSFoqMuV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0076 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('DtSFoqMuV');
      logInfo(`succeed(formId="DtSFoqMuV"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : DtSFoqMuV');
      logInfo(`succeed(formId="DtSFoqMuV") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : DtSFoqMuV');
      logInfo(`succeed(formId="DtSFoqMuV") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0076 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0077
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0077
     * @tc.desc      FormRequestState.succeed(formId="9tOhPNx") yields "RequestPublishForm success : 9tOhPNx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0077 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('9tOhPNx');
      logInfo(`succeed(formId="9tOhPNx"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 9tOhPNx');
      logInfo(`succeed(formId="9tOhPNx") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 9tOhPNx');
      logInfo(`succeed(formId="9tOhPNx") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0077 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0078
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0078
     * @tc.desc      FormRequestState.succeed(formId="vZGcw") yields "RequestPublishForm success : vZGcw"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0078 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('vZGcw');
      logInfo(`succeed(formId="vZGcw"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : vZGcw');
      logInfo(`succeed(formId="vZGcw") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : vZGcw');
      logInfo(`succeed(formId="vZGcw") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0078 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0079
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0079
     * @tc.desc      FormRequestState.succeed(formId="J2KJ95XEE39V") yields "RequestPublishForm success : J2KJ95XEE39V"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0079 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('J2KJ95XEE39V');
      logInfo(`succeed(formId="J2KJ95XEE39V"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : J2KJ95XEE39V');
      logInfo(`succeed(formId="J2KJ95XEE39V") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : J2KJ95XEE39V');
      logInfo(`succeed(formId="J2KJ95XEE39V") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0079 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0080
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0080
     * @tc.desc      FormRequestState.succeed(formId="MU1zu63tq7") yields "RequestPublishForm success : MU1zu63tq7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0080 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('MU1zu63tq7');
      logInfo(`succeed(formId="MU1zu63tq7"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : MU1zu63tq7');
      logInfo(`succeed(formId="MU1zu63tq7") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : MU1zu63tq7');
      logInfo(`succeed(formId="MU1zu63tq7") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0080 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0081
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0081
     * @tc.desc      FormRequestState.succeed(formId="mPzaFnTQ3PNw") yields "RequestPublishForm success : mPzaFnTQ3PNw"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0081 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('mPzaFnTQ3PNw');
      logInfo(`succeed(formId="mPzaFnTQ3PNw"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : mPzaFnTQ3PNw');
      logInfo(`succeed(formId="mPzaFnTQ3PNw") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : mPzaFnTQ3PNw');
      logInfo(`succeed(formId="mPzaFnTQ3PNw") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0081 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0082
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0082
     * @tc.desc      FormRequestState.succeed(formId="5Pi") yields "RequestPublishForm success : 5Pi"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0082 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('5Pi');
      logInfo(`succeed(formId="5Pi"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 5Pi');
      logInfo(`succeed(formId="5Pi") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 5Pi');
      logInfo(`succeed(formId="5Pi") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0082 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0083
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0083
     * @tc.desc      FormRequestState.succeed(formId="1CIgo5uwSL3p") yields "RequestPublishForm success : 1CIgo5uwSL3p"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0083 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('1CIgo5uwSL3p');
      logInfo(`succeed(formId="1CIgo5uwSL3p"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 1CIgo5uwSL3p');
      logInfo(`succeed(formId="1CIgo5uwSL3p") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 1CIgo5uwSL3p');
      logInfo(`succeed(formId="1CIgo5uwSL3p") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0083 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0084
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0084
     * @tc.desc      FormRequestState.succeed(formId="71f") yields "RequestPublishForm success : 71f"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0084 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('71f');
      logInfo(`succeed(formId="71f"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 71f');
      logInfo(`succeed(formId="71f") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 71f');
      logInfo(`succeed(formId="71f") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0084 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0085
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0085
     * @tc.desc      FormRequestState.succeed(formId="wI") yields "RequestPublishForm success : wI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0085 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('wI');
      logInfo(`succeed(formId="wI"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : wI');
      logInfo(`succeed(formId="wI") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : wI');
      logInfo(`succeed(formId="wI") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0085 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0086
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0086
     * @tc.desc      FormRequestState.succeed(formId="soK3RCMXa9") yields "RequestPublishForm success : soK3RCMXa9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0086 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('soK3RCMXa9');
      logInfo(`succeed(formId="soK3RCMXa9"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : soK3RCMXa9');
      logInfo(`succeed(formId="soK3RCMXa9") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : soK3RCMXa9');
      logInfo(`succeed(formId="soK3RCMXa9") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0086 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0087
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0087
     * @tc.desc      FormRequestState.succeed(formId="K80cZObUF") yields "RequestPublishForm success : K80cZObUF"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0087 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('K80cZObUF');
      logInfo(`succeed(formId="K80cZObUF"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : K80cZObUF');
      logInfo(`succeed(formId="K80cZObUF") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : K80cZObUF');
      logInfo(`succeed(formId="K80cZObUF") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0087 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0088
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0088
     * @tc.desc      FormRequestState.succeed(formId="Cb6QsK") yields "RequestPublishForm success : Cb6QsK"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0088 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('Cb6QsK');
      logInfo(`succeed(formId="Cb6QsK"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Cb6QsK');
      logInfo(`succeed(formId="Cb6QsK") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Cb6QsK');
      logInfo(`succeed(formId="Cb6QsK") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0088 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0089
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0089
     * @tc.desc      FormRequestState.succeed(formId="t") yields "RequestPublishForm success : t"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0089 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('t');
      logInfo(`succeed(formId="t"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : t');
      logInfo(`succeed(formId="t") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : t');
      logInfo(`succeed(formId="t") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0089 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0090
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0090
     * @tc.desc      FormRequestState.succeed(formId="dykCMLqvC") yields "RequestPublishForm success : dykCMLqvC"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0090 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('dykCMLqvC');
      logInfo(`succeed(formId="dykCMLqvC"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : dykCMLqvC');
      logInfo(`succeed(formId="dykCMLqvC") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : dykCMLqvC');
      logInfo(`succeed(formId="dykCMLqvC") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0090 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0091
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0091
     * @tc.desc      FormRequestState.succeed(formId="H7dK") yields "RequestPublishForm success : H7dK"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0091 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('H7dK');
      logInfo(`succeed(formId="H7dK"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : H7dK');
      logInfo(`succeed(formId="H7dK") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : H7dK');
      logInfo(`succeed(formId="H7dK") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0091 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0092
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0092
     * @tc.desc      FormRequestState.succeed(formId="6kl8y66k1rb") yields "RequestPublishForm success : 6kl8y66k1rb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0092 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('6kl8y66k1rb');
      logInfo(`succeed(formId="6kl8y66k1rb"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 6kl8y66k1rb');
      logInfo(`succeed(formId="6kl8y66k1rb") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 6kl8y66k1rb');
      logInfo(`succeed(formId="6kl8y66k1rb") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0092 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0093
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0093
     * @tc.desc      FormRequestState.succeed(formId="Mxz3XSj8Uf") yields "RequestPublishForm success : Mxz3XSj8Uf"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0093 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('Mxz3XSj8Uf');
      logInfo(`succeed(formId="Mxz3XSj8Uf"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Mxz3XSj8Uf');
      logInfo(`succeed(formId="Mxz3XSj8Uf") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Mxz3XSj8Uf');
      logInfo(`succeed(formId="Mxz3XSj8Uf") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0093 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0094
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0094
     * @tc.desc      FormRequestState.succeed(formId="oUTpjMECU8Z") yields "RequestPublishForm success : oUTpjMECU8Z"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0094 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('oUTpjMECU8Z');
      logInfo(`succeed(formId="oUTpjMECU8Z"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : oUTpjMECU8Z');
      logInfo(`succeed(formId="oUTpjMECU8Z") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : oUTpjMECU8Z');
      logInfo(`succeed(formId="oUTpjMECU8Z") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0094 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0095
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0095
     * @tc.desc      FormRequestState.succeed(formId="Id4FjurEe1") yields "RequestPublishForm success : Id4FjurEe1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0095 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('Id4FjurEe1');
      logInfo(`succeed(formId="Id4FjurEe1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Id4FjurEe1');
      logInfo(`succeed(formId="Id4FjurEe1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Id4FjurEe1');
      logInfo(`succeed(formId="Id4FjurEe1") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0095 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0096
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0096
     * @tc.desc      FormRequestState.succeed(formId="FMklXRrTF2Jp") yields "RequestPublishForm success : FMklXRrTF2Jp"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0096 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('FMklXRrTF2Jp');
      logInfo(`succeed(formId="FMklXRrTF2Jp"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : FMklXRrTF2Jp');
      logInfo(`succeed(formId="FMklXRrTF2Jp") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : FMklXRrTF2Jp');
      logInfo(`succeed(formId="FMklXRrTF2Jp") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0096 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0097
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0097
     * @tc.desc      FormRequestState.succeed(formId="xJGUvtBLeN") yields "RequestPublishForm success : xJGUvtBLeN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0097 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('xJGUvtBLeN');
      logInfo(`succeed(formId="xJGUvtBLeN"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : xJGUvtBLeN');
      logInfo(`succeed(formId="xJGUvtBLeN") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : xJGUvtBLeN');
      logInfo(`succeed(formId="xJGUvtBLeN") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0097 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0098
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0098
     * @tc.desc      FormRequestState.succeed(formId="DPaWgyRHMtW") yields "RequestPublishForm success : DPaWgyRHMtW"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0098 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('DPaWgyRHMtW');
      logInfo(`succeed(formId="DPaWgyRHMtW"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : DPaWgyRHMtW');
      logInfo(`succeed(formId="DPaWgyRHMtW") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : DPaWgyRHMtW');
      logInfo(`succeed(formId="DPaWgyRHMtW") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0098 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0099
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0099
     * @tc.desc      FormRequestState.succeed(formId="trhY") yields "RequestPublishForm success : trhY"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0099 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('trhY');
      logInfo(`succeed(formId="trhY"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : trhY');
      logInfo(`succeed(formId="trhY") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : trhY');
      logInfo(`succeed(formId="trhY") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0099 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0100
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0100
     * @tc.desc      FormRequestState.succeed(formId="OJ1") yields "RequestPublishForm success : OJ1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0100 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('OJ1');
      logInfo(`succeed(formId="OJ1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : OJ1');
      logInfo(`succeed(formId="OJ1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : OJ1');
      logInfo(`succeed(formId="OJ1") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0100 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0101
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0101
     * @tc.desc      FormRequestState.succeed(formId="f") yields "RequestPublishForm success : f"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0101 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('f');
      logInfo(`succeed(formId="f"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : f');
      logInfo(`succeed(formId="f") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : f');
      logInfo(`succeed(formId="f") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0101 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0102
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0102
     * @tc.desc      FormRequestState.succeed(formId="ZUX") yields "RequestPublishForm success : ZUX"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0102 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('ZUX');
      logInfo(`succeed(formId="ZUX"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : ZUX');
      logInfo(`succeed(formId="ZUX") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : ZUX');
      logInfo(`succeed(formId="ZUX") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0102 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0103
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0103
     * @tc.desc      FormRequestState.succeed(formId="c") yields "RequestPublishForm success : c"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0103 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('c');
      logInfo(`succeed(formId="c"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : c');
      logInfo(`succeed(formId="c") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : c');
      logInfo(`succeed(formId="c") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0103 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0104
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0104
     * @tc.desc      FormRequestState.succeed(formId="2rlaxeMw") yields "RequestPublishForm success : 2rlaxeMw"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0104 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('2rlaxeMw');
      logInfo(`succeed(formId="2rlaxeMw"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 2rlaxeMw');
      logInfo(`succeed(formId="2rlaxeMw") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 2rlaxeMw');
      logInfo(`succeed(formId="2rlaxeMw") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0104 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0105
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0105
     * @tc.desc      FormRequestState.succeed(formId="3M") yields "RequestPublishForm success : 3M"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0105 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('3M');
      logInfo(`succeed(formId="3M"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 3M');
      logInfo(`succeed(formId="3M") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 3M');
      logInfo(`succeed(formId="3M") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0105 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0106
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0106
     * @tc.desc      FormRequestState.succeed(formId="VDSQhcZbb6MQ") yields "RequestPublishForm success : VDSQhcZbb6MQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0106 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('VDSQhcZbb6MQ');
      logInfo(`succeed(formId="VDSQhcZbb6MQ"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : VDSQhcZbb6MQ');
      logInfo(`succeed(formId="VDSQhcZbb6MQ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : VDSQhcZbb6MQ');
      logInfo(`succeed(formId="VDSQhcZbb6MQ") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0106 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0107
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0107
     * @tc.desc      FormRequestState.succeed(formId="MQm") yields "RequestPublishForm success : MQm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0107 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('MQm');
      logInfo(`succeed(formId="MQm"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : MQm');
      logInfo(`succeed(formId="MQm") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : MQm');
      logInfo(`succeed(formId="MQm") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0107 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0108
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0108
     * @tc.desc      FormRequestState.succeed(formId="i2qDo6fDXj") yields "RequestPublishForm success : i2qDo6fDXj"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0108 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('i2qDo6fDXj');
      logInfo(`succeed(formId="i2qDo6fDXj"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : i2qDo6fDXj');
      logInfo(`succeed(formId="i2qDo6fDXj") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : i2qDo6fDXj');
      logInfo(`succeed(formId="i2qDo6fDXj") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0108 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0109
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0109
     * @tc.desc      FormRequestState.succeed(formId="8MBhooa") yields "RequestPublishForm success : 8MBhooa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0109 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('8MBhooa');
      logInfo(`succeed(formId="8MBhooa"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 8MBhooa');
      logInfo(`succeed(formId="8MBhooa") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 8MBhooa');
      logInfo(`succeed(formId="8MBhooa") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0109 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0110
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0110
     * @tc.desc      FormRequestState.succeed(formId="mrpmKRU") yields "RequestPublishForm success : mrpmKRU"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0110 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('mrpmKRU');
      logInfo(`succeed(formId="mrpmKRU"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : mrpmKRU');
      logInfo(`succeed(formId="mrpmKRU") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : mrpmKRU');
      logInfo(`succeed(formId="mrpmKRU") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0110 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0111
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0111
     * @tc.desc      FormRequestState.succeed(formId="pCYH") yields "RequestPublishForm success : pCYH"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0111 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('pCYH');
      logInfo(`succeed(formId="pCYH"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : pCYH');
      logInfo(`succeed(formId="pCYH") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : pCYH');
      logInfo(`succeed(formId="pCYH") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0111 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0112
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0112
     * @tc.desc      FormRequestState.succeed(formId="7Dz") yields "RequestPublishForm success : 7Dz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0112 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('7Dz');
      logInfo(`succeed(formId="7Dz"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 7Dz');
      logInfo(`succeed(formId="7Dz") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 7Dz');
      logInfo(`succeed(formId="7Dz") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0112 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0113
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0113
     * @tc.desc      FormRequestState.succeed(formId="EvkwW") yields "RequestPublishForm success : EvkwW"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0113 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('EvkwW');
      logInfo(`succeed(formId="EvkwW"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : EvkwW');
      logInfo(`succeed(formId="EvkwW") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : EvkwW');
      logInfo(`succeed(formId="EvkwW") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0113 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0114
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0114
     * @tc.desc      FormRequestState.succeed(formId="eCt9f") yields "RequestPublishForm success : eCt9f"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0114 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('eCt9f');
      logInfo(`succeed(formId="eCt9f"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : eCt9f');
      logInfo(`succeed(formId="eCt9f") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : eCt9f');
      logInfo(`succeed(formId="eCt9f") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0114 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0115
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0115
     * @tc.desc      FormRequestState.succeed(formId="TO") yields "RequestPublishForm success : TO"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0115 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('TO');
      logInfo(`succeed(formId="TO"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : TO');
      logInfo(`succeed(formId="TO") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : TO');
      logInfo(`succeed(formId="TO") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0115 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0116
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0116
     * @tc.desc      FormRequestState.succeed(formId="i0rw7FVk") yields "RequestPublishForm success : i0rw7FVk"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0116 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('i0rw7FVk');
      logInfo(`succeed(formId="i0rw7FVk"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : i0rw7FVk');
      logInfo(`succeed(formId="i0rw7FVk") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : i0rw7FVk');
      logInfo(`succeed(formId="i0rw7FVk") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0116 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0117
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0117
     * @tc.desc      FormRequestState.succeed(formId="SKmtxyC") yields "RequestPublishForm success : SKmtxyC"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0117 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('SKmtxyC');
      logInfo(`succeed(formId="SKmtxyC"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : SKmtxyC');
      logInfo(`succeed(formId="SKmtxyC") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : SKmtxyC');
      logInfo(`succeed(formId="SKmtxyC") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0117 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0118
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0118
     * @tc.desc      FormRequestState.succeed(formId="npYj") yields "RequestPublishForm success : npYj"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0118 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('npYj');
      logInfo(`succeed(formId="npYj"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : npYj');
      logInfo(`succeed(formId="npYj") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : npYj');
      logInfo(`succeed(formId="npYj") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0118 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0119
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0119
     * @tc.desc      FormRequestState.succeed(formId="Hs64") yields "RequestPublishForm success : Hs64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0119 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('Hs64');
      logInfo(`succeed(formId="Hs64"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Hs64');
      logInfo(`succeed(formId="Hs64") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Hs64');
      logInfo(`succeed(formId="Hs64") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0119 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0120
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0120
     * @tc.desc      FormRequestState.succeed(formId="7UNA9Kx4R6Ug") yields "RequestPublishForm success : 7UNA9Kx4R6Ug"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0120 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('7UNA9Kx4R6Ug');
      logInfo(`succeed(formId="7UNA9Kx4R6Ug"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 7UNA9Kx4R6Ug');
      logInfo(`succeed(formId="7UNA9Kx4R6Ug") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 7UNA9Kx4R6Ug');
      logInfo(`succeed(formId="7UNA9Kx4R6Ug") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0120 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0121
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0121
     * @tc.desc      FormRequestState.succeed(formId="U1KEDYD1JJ") yields "RequestPublishForm success : U1KEDYD1JJ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0121 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('U1KEDYD1JJ');
      logInfo(`succeed(formId="U1KEDYD1JJ"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : U1KEDYD1JJ');
      logInfo(`succeed(formId="U1KEDYD1JJ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : U1KEDYD1JJ');
      logInfo(`succeed(formId="U1KEDYD1JJ") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0121 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0122
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0122
     * @tc.desc      FormRequestState.succeed(formId="Y") yields "RequestPublishForm success : Y"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0122 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('Y');
      logInfo(`succeed(formId="Y"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Y');
      logInfo(`succeed(formId="Y") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Y');
      logInfo(`succeed(formId="Y") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0122 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0123
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0123
     * @tc.desc      FormRequestState.succeed(formId="tt") yields "RequestPublishForm success : tt"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0123 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('tt');
      logInfo(`succeed(formId="tt"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : tt');
      logInfo(`succeed(formId="tt") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : tt');
      logInfo(`succeed(formId="tt") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0123 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0124
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0124
     * @tc.desc      FormRequestState.succeed(formId="zPR6Z5g5v") yields "RequestPublishForm success : zPR6Z5g5v"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0124 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('zPR6Z5g5v');
      logInfo(`succeed(formId="zPR6Z5g5v"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : zPR6Z5g5v');
      logInfo(`succeed(formId="zPR6Z5g5v") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : zPR6Z5g5v');
      logInfo(`succeed(formId="zPR6Z5g5v") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0124 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0125
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0125
     * @tc.desc      FormRequestState.succeed(formId="CuIg") yields "RequestPublishForm success : CuIg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0125 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('CuIg');
      logInfo(`succeed(formId="CuIg"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : CuIg');
      logInfo(`succeed(formId="CuIg") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : CuIg');
      logInfo(`succeed(formId="CuIg") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0125 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0126
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0126
     * @tc.desc      FormRequestState.succeed(formId="Y0MWVUaV") yields "RequestPublishForm success : Y0MWVUaV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0126 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('Y0MWVUaV');
      logInfo(`succeed(formId="Y0MWVUaV"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Y0MWVUaV');
      logInfo(`succeed(formId="Y0MWVUaV") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Y0MWVUaV');
      logInfo(`succeed(formId="Y0MWVUaV") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0126 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0127
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0127
     * @tc.desc      FormRequestState.succeed(formId="c94Np") yields "RequestPublishForm success : c94Np"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0127 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('c94Np');
      logInfo(`succeed(formId="c94Np"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : c94Np');
      logInfo(`succeed(formId="c94Np") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : c94Np');
      logInfo(`succeed(formId="c94Np") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0127 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0128
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0128
     * @tc.desc      FormRequestState.succeed(formId="lWAylOlWjP") yields "RequestPublishForm success : lWAylOlWjP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0128 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('lWAylOlWjP');
      logInfo(`succeed(formId="lWAylOlWjP"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : lWAylOlWjP');
      logInfo(`succeed(formId="lWAylOlWjP") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : lWAylOlWjP');
      logInfo(`succeed(formId="lWAylOlWjP") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0128 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0129
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0129
     * @tc.desc      FormRequestState.succeed(formId="UJGxw2FFw") yields "RequestPublishForm success : UJGxw2FFw"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0129 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('UJGxw2FFw');
      logInfo(`succeed(formId="UJGxw2FFw"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : UJGxw2FFw');
      logInfo(`succeed(formId="UJGxw2FFw") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : UJGxw2FFw');
      logInfo(`succeed(formId="UJGxw2FFw") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0129 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0130
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0130
     * @tc.desc      FormRequestState.succeed(formId="v2a") yields "RequestPublishForm success : v2a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0130 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('v2a');
      logInfo(`succeed(formId="v2a"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : v2a');
      logInfo(`succeed(formId="v2a") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : v2a');
      logInfo(`succeed(formId="v2a") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0130 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0131
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0131
     * @tc.desc      FormRequestState.succeed(formId="l7cB25UpUdm") yields "RequestPublishForm success : l7cB25UpUdm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0131 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('l7cB25UpUdm');
      logInfo(`succeed(formId="l7cB25UpUdm"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : l7cB25UpUdm');
      logInfo(`succeed(formId="l7cB25UpUdm") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : l7cB25UpUdm');
      logInfo(`succeed(formId="l7cB25UpUdm") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0131 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0132
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0132
     * @tc.desc      FormRequestState.succeed(formId="TC") yields "RequestPublishForm success : TC"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0132 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('TC');
      logInfo(`succeed(formId="TC"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : TC');
      logInfo(`succeed(formId="TC") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : TC');
      logInfo(`succeed(formId="TC") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0132 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0133
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0133
     * @tc.desc      FormRequestState.succeed(formId="zJqWwM4") yields "RequestPublishForm success : zJqWwM4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0133 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('zJqWwM4');
      logInfo(`succeed(formId="zJqWwM4"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : zJqWwM4');
      logInfo(`succeed(formId="zJqWwM4") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : zJqWwM4');
      logInfo(`succeed(formId="zJqWwM4") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0133 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0134
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0134
     * @tc.desc      FormRequestState.succeed(formId="fhKSMs") yields "RequestPublishForm success : fhKSMs"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0134 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('fhKSMs');
      logInfo(`succeed(formId="fhKSMs"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : fhKSMs');
      logInfo(`succeed(formId="fhKSMs") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : fhKSMs');
      logInfo(`succeed(formId="fhKSMs") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0134 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0135
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0135
     * @tc.desc      FormRequestState.succeed(formId="oMX") yields "RequestPublishForm success : oMX"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0135 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('oMX');
      logInfo(`succeed(formId="oMX"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : oMX');
      logInfo(`succeed(formId="oMX") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : oMX');
      logInfo(`succeed(formId="oMX") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0135 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0136
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0136
     * @tc.desc      FormRequestState.succeed(formId="0I5DwKP") yields "RequestPublishForm success : 0I5DwKP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0136 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('0I5DwKP');
      logInfo(`succeed(formId="0I5DwKP"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 0I5DwKP');
      logInfo(`succeed(formId="0I5DwKP") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 0I5DwKP');
      logInfo(`succeed(formId="0I5DwKP") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0136 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0137
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0137
     * @tc.desc      FormRequestState.succeed(formId="HnHlcedci") yields "RequestPublishForm success : HnHlcedci"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0137 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('HnHlcedci');
      logInfo(`succeed(formId="HnHlcedci"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : HnHlcedci');
      logInfo(`succeed(formId="HnHlcedci") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : HnHlcedci');
      logInfo(`succeed(formId="HnHlcedci") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0137 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0138
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0138
     * @tc.desc      FormRequestState.succeed(formId="FNRCf") yields "RequestPublishForm success : FNRCf"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0138 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('FNRCf');
      logInfo(`succeed(formId="FNRCf"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : FNRCf');
      logInfo(`succeed(formId="FNRCf") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : FNRCf');
      logInfo(`succeed(formId="FNRCf") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0138 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0139
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0139
     * @tc.desc      FormRequestState.succeed(formId="hh9axShw3oz") yields "RequestPublishForm success : hh9axShw3oz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0139 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('hh9axShw3oz');
      logInfo(`succeed(formId="hh9axShw3oz"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : hh9axShw3oz');
      logInfo(`succeed(formId="hh9axShw3oz") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : hh9axShw3oz');
      logInfo(`succeed(formId="hh9axShw3oz") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0139 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0140
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0140
     * @tc.desc      FormRequestState.succeed(formId="23AfCZgGj5O") yields "RequestPublishForm success : 23AfCZgGj5O"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0140 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('23AfCZgGj5O');
      logInfo(`succeed(formId="23AfCZgGj5O"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 23AfCZgGj5O');
      logInfo(`succeed(formId="23AfCZgGj5O") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 23AfCZgGj5O');
      logInfo(`succeed(formId="23AfCZgGj5O") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0140 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0141
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0141
     * @tc.desc      FormRequestState.succeed(formId="9lNp2Z") yields "RequestPublishForm success : 9lNp2Z"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0141 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('9lNp2Z');
      logInfo(`succeed(formId="9lNp2Z"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 9lNp2Z');
      logInfo(`succeed(formId="9lNp2Z") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 9lNp2Z');
      logInfo(`succeed(formId="9lNp2Z") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0141 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0142
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0142
     * @tc.desc      FormRequestState.succeed(formId="qWxr") yields "RequestPublishForm success : qWxr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0142 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('qWxr');
      logInfo(`succeed(formId="qWxr"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : qWxr');
      logInfo(`succeed(formId="qWxr") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : qWxr');
      logInfo(`succeed(formId="qWxr") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0142 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0143
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0143
     * @tc.desc      FormRequestState.succeed(formId="uRaGiSN") yields "RequestPublishForm success : uRaGiSN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0143 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('uRaGiSN');
      logInfo(`succeed(formId="uRaGiSN"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : uRaGiSN');
      logInfo(`succeed(formId="uRaGiSN") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : uRaGiSN');
      logInfo(`succeed(formId="uRaGiSN") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0143 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0144
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0144
     * @tc.desc      FormRequestState.succeed(formId="5VVgVT") yields "RequestPublishForm success : 5VVgVT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0144 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('5VVgVT');
      logInfo(`succeed(formId="5VVgVT"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 5VVgVT');
      logInfo(`succeed(formId="5VVgVT") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 5VVgVT');
      logInfo(`succeed(formId="5VVgVT") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0144 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0145
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0145
     * @tc.desc      FormRequestState.succeed(formId="SVSfErFh5") yields "RequestPublishForm success : SVSfErFh5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0145 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('SVSfErFh5');
      logInfo(`succeed(formId="SVSfErFh5"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : SVSfErFh5');
      logInfo(`succeed(formId="SVSfErFh5") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : SVSfErFh5');
      logInfo(`succeed(formId="SVSfErFh5") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0145 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0146
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0146
     * @tc.desc      FormRequestState.succeed(formId="3NI") yields "RequestPublishForm success : 3NI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0146 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('3NI');
      logInfo(`succeed(formId="3NI"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 3NI');
      logInfo(`succeed(formId="3NI") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 3NI');
      logInfo(`succeed(formId="3NI") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0146 end`);
    });
  });
}
