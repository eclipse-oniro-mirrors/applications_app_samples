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

/** Logic checks for FormRequestState.fail (73 cases). */
export default function formRequestStateFail2Test(): void {
  describe('FormRequestStateFail2Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0074
     * @tc.name      RequestAddForm_FormRequestStateFail_0074
     * @tc.desc      FormRequestState.fail(message="yElGZy217") yields "RequestPublishForm failed : yElGZy217"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0074 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('yElGZy217');
      logInfo(`fail(message="yElGZy217"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : yElGZy217');
      logInfo(`fail(message="yElGZy217") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : yElGZy217');
      logInfo(`fail(message="yElGZy217") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0074 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0075
     * @tc.name      RequestAddForm_FormRequestStateFail_0075
     * @tc.desc      FormRequestState.fail(message="N") yields "RequestPublishForm failed : N"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0075 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('N');
      logInfo(`fail(message="N"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : N');
      logInfo(`fail(message="N") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : N');
      logInfo(`fail(message="N") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0075 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0076
     * @tc.name      RequestAddForm_FormRequestStateFail_0076
     * @tc.desc      FormRequestState.fail(message="dVX4hDth") yields "RequestPublishForm failed : dVX4hDth"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0076 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('dVX4hDth');
      logInfo(`fail(message="dVX4hDth"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : dVX4hDth');
      logInfo(`fail(message="dVX4hDth") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : dVX4hDth');
      logInfo(`fail(message="dVX4hDth") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0076 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0077
     * @tc.name      RequestAddForm_FormRequestStateFail_0077
     * @tc.desc      FormRequestState.fail(message="zzLDFhyu") yields "RequestPublishForm failed : zzLDFhyu"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0077 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('zzLDFhyu');
      logInfo(`fail(message="zzLDFhyu"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : zzLDFhyu');
      logInfo(`fail(message="zzLDFhyu") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : zzLDFhyu');
      logInfo(`fail(message="zzLDFhyu") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0077 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0078
     * @tc.name      RequestAddForm_FormRequestStateFail_0078
     * @tc.desc      FormRequestState.fail(message="jLhLPiS6nU") yields "RequestPublishForm failed : jLhLPiS6nU"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0078 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('jLhLPiS6nU');
      logInfo(`fail(message="jLhLPiS6nU"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : jLhLPiS6nU');
      logInfo(`fail(message="jLhLPiS6nU") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : jLhLPiS6nU');
      logInfo(`fail(message="jLhLPiS6nU") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0078 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0079
     * @tc.name      RequestAddForm_FormRequestStateFail_0079
     * @tc.desc      FormRequestState.fail(message="acr") yields "RequestPublishForm failed : acr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0079 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('acr');
      logInfo(`fail(message="acr"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : acr');
      logInfo(`fail(message="acr") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : acr');
      logInfo(`fail(message="acr") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0079 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0080
     * @tc.name      RequestAddForm_FormRequestStateFail_0080
     * @tc.desc      FormRequestState.fail(message="7JGj5l2xb") yields "RequestPublishForm failed : 7JGj5l2xb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0080 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('7JGj5l2xb');
      logInfo(`fail(message="7JGj5l2xb"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 7JGj5l2xb');
      logInfo(`fail(message="7JGj5l2xb") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 7JGj5l2xb');
      logInfo(`fail(message="7JGj5l2xb") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0080 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0081
     * @tc.name      RequestAddForm_FormRequestStateFail_0081
     * @tc.desc      FormRequestState.fail(message="5OFlyQm") yields "RequestPublishForm failed : 5OFlyQm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0081 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('5OFlyQm');
      logInfo(`fail(message="5OFlyQm"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 5OFlyQm');
      logInfo(`fail(message="5OFlyQm") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 5OFlyQm');
      logInfo(`fail(message="5OFlyQm") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0081 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0082
     * @tc.name      RequestAddForm_FormRequestStateFail_0082
     * @tc.desc      FormRequestState.fail(message="XwartGyB") yields "RequestPublishForm failed : XwartGyB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0082 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('XwartGyB');
      logInfo(`fail(message="XwartGyB"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : XwartGyB');
      logInfo(`fail(message="XwartGyB") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : XwartGyB');
      logInfo(`fail(message="XwartGyB") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0082 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0083
     * @tc.name      RequestAddForm_FormRequestStateFail_0083
     * @tc.desc      FormRequestState.fail(message="3KFZt7NXwn1") yields "RequestPublishForm failed : 3KFZt7NXwn1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0083 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('3KFZt7NXwn1');
      logInfo(`fail(message="3KFZt7NXwn1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 3KFZt7NXwn1');
      logInfo(`fail(message="3KFZt7NXwn1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 3KFZt7NXwn1');
      logInfo(`fail(message="3KFZt7NXwn1") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0083 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0084
     * @tc.name      RequestAddForm_FormRequestStateFail_0084
     * @tc.desc      FormRequestState.fail(message="9U3Z") yields "RequestPublishForm failed : 9U3Z"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0084 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('9U3Z');
      logInfo(`fail(message="9U3Z"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 9U3Z');
      logInfo(`fail(message="9U3Z") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 9U3Z');
      logInfo(`fail(message="9U3Z") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0084 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0085
     * @tc.name      RequestAddForm_FormRequestStateFail_0085
     * @tc.desc      FormRequestState.fail(message="GdvcMW") yields "RequestPublishForm failed : GdvcMW"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0085 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('GdvcMW');
      logInfo(`fail(message="GdvcMW"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : GdvcMW');
      logInfo(`fail(message="GdvcMW") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : GdvcMW');
      logInfo(`fail(message="GdvcMW") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0085 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0086
     * @tc.name      RequestAddForm_FormRequestStateFail_0086
     * @tc.desc      FormRequestState.fail(message="SeD6") yields "RequestPublishForm failed : SeD6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0086 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('SeD6');
      logInfo(`fail(message="SeD6"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : SeD6');
      logInfo(`fail(message="SeD6") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : SeD6');
      logInfo(`fail(message="SeD6") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0086 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0087
     * @tc.name      RequestAddForm_FormRequestStateFail_0087
     * @tc.desc      FormRequestState.fail(message="e0iIF4PsT8") yields "RequestPublishForm failed : e0iIF4PsT8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0087 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('e0iIF4PsT8');
      logInfo(`fail(message="e0iIF4PsT8"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : e0iIF4PsT8');
      logInfo(`fail(message="e0iIF4PsT8") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : e0iIF4PsT8');
      logInfo(`fail(message="e0iIF4PsT8") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0087 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0088
     * @tc.name      RequestAddForm_FormRequestStateFail_0088
     * @tc.desc      FormRequestState.fail(message="VC3F8Kfju7") yields "RequestPublishForm failed : VC3F8Kfju7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0088 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('VC3F8Kfju7');
      logInfo(`fail(message="VC3F8Kfju7"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : VC3F8Kfju7');
      logInfo(`fail(message="VC3F8Kfju7") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : VC3F8Kfju7');
      logInfo(`fail(message="VC3F8Kfju7") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0088 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0089
     * @tc.name      RequestAddForm_FormRequestStateFail_0089
     * @tc.desc      FormRequestState.fail(message="fUuuMtT") yields "RequestPublishForm failed : fUuuMtT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0089 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('fUuuMtT');
      logInfo(`fail(message="fUuuMtT"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : fUuuMtT');
      logInfo(`fail(message="fUuuMtT") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : fUuuMtT');
      logInfo(`fail(message="fUuuMtT") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0089 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0090
     * @tc.name      RequestAddForm_FormRequestStateFail_0090
     * @tc.desc      FormRequestState.fail(message="MrYPQo") yields "RequestPublishForm failed : MrYPQo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0090 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('MrYPQo');
      logInfo(`fail(message="MrYPQo"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : MrYPQo');
      logInfo(`fail(message="MrYPQo") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : MrYPQo');
      logInfo(`fail(message="MrYPQo") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0090 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0091
     * @tc.name      RequestAddForm_FormRequestStateFail_0091
     * @tc.desc      FormRequestState.fail(message="zNyj70GL") yields "RequestPublishForm failed : zNyj70GL"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0091 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('zNyj70GL');
      logInfo(`fail(message="zNyj70GL"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : zNyj70GL');
      logInfo(`fail(message="zNyj70GL") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : zNyj70GL');
      logInfo(`fail(message="zNyj70GL") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0091 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0092
     * @tc.name      RequestAddForm_FormRequestStateFail_0092
     * @tc.desc      FormRequestState.fail(message="BQxhNq") yields "RequestPublishForm failed : BQxhNq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0092 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('BQxhNq');
      logInfo(`fail(message="BQxhNq"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : BQxhNq');
      logInfo(`fail(message="BQxhNq") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : BQxhNq');
      logInfo(`fail(message="BQxhNq") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0092 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0093
     * @tc.name      RequestAddForm_FormRequestStateFail_0093
     * @tc.desc      FormRequestState.fail(message="wATCoH") yields "RequestPublishForm failed : wATCoH"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0093 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('wATCoH');
      logInfo(`fail(message="wATCoH"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : wATCoH');
      logInfo(`fail(message="wATCoH") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : wATCoH');
      logInfo(`fail(message="wATCoH") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0093 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0094
     * @tc.name      RequestAddForm_FormRequestStateFail_0094
     * @tc.desc      FormRequestState.fail(message="5c3al4PNTk") yields "RequestPublishForm failed : 5c3al4PNTk"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0094 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('5c3al4PNTk');
      logInfo(`fail(message="5c3al4PNTk"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 5c3al4PNTk');
      logInfo(`fail(message="5c3al4PNTk") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 5c3al4PNTk');
      logInfo(`fail(message="5c3al4PNTk") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0094 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0095
     * @tc.name      RequestAddForm_FormRequestStateFail_0095
     * @tc.desc      FormRequestState.fail(message="twL7fp8GL75Z") yields "RequestPublishForm failed : twL7fp8GL75Z"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0095 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('twL7fp8GL75Z');
      logInfo(`fail(message="twL7fp8GL75Z"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : twL7fp8GL75Z');
      logInfo(`fail(message="twL7fp8GL75Z") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : twL7fp8GL75Z');
      logInfo(`fail(message="twL7fp8GL75Z") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0095 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0096
     * @tc.name      RequestAddForm_FormRequestStateFail_0096
     * @tc.desc      FormRequestState.fail(message="m9HcmF3a") yields "RequestPublishForm failed : m9HcmF3a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0096 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('m9HcmF3a');
      logInfo(`fail(message="m9HcmF3a"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : m9HcmF3a');
      logInfo(`fail(message="m9HcmF3a") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : m9HcmF3a');
      logInfo(`fail(message="m9HcmF3a") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0096 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0097
     * @tc.name      RequestAddForm_FormRequestStateFail_0097
     * @tc.desc      FormRequestState.fail(message="6tLCzfX6H") yields "RequestPublishForm failed : 6tLCzfX6H"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0097 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('6tLCzfX6H');
      logInfo(`fail(message="6tLCzfX6H"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 6tLCzfX6H');
      logInfo(`fail(message="6tLCzfX6H") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 6tLCzfX6H');
      logInfo(`fail(message="6tLCzfX6H") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0097 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0098
     * @tc.name      RequestAddForm_FormRequestStateFail_0098
     * @tc.desc      FormRequestState.fail(message="Qf1BZP21av") yields "RequestPublishForm failed : Qf1BZP21av"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0098 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('Qf1BZP21av');
      logInfo(`fail(message="Qf1BZP21av"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : Qf1BZP21av');
      logInfo(`fail(message="Qf1BZP21av") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Qf1BZP21av');
      logInfo(`fail(message="Qf1BZP21av") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0098 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0099
     * @tc.name      RequestAddForm_FormRequestStateFail_0099
     * @tc.desc      FormRequestState.fail(message="ij") yields "RequestPublishForm failed : ij"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0099 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('ij');
      logInfo(`fail(message="ij"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : ij');
      logInfo(`fail(message="ij") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : ij');
      logInfo(`fail(message="ij") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0099 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0100
     * @tc.name      RequestAddForm_FormRequestStateFail_0100
     * @tc.desc      FormRequestState.fail(message="rxEk64Yr") yields "RequestPublishForm failed : rxEk64Yr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0100 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('rxEk64Yr');
      logInfo(`fail(message="rxEk64Yr"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : rxEk64Yr');
      logInfo(`fail(message="rxEk64Yr") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : rxEk64Yr');
      logInfo(`fail(message="rxEk64Yr") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0100 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0101
     * @tc.name      RequestAddForm_FormRequestStateFail_0101
     * @tc.desc      FormRequestState.fail(message="JcoNFd") yields "RequestPublishForm failed : JcoNFd"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0101 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('JcoNFd');
      logInfo(`fail(message="JcoNFd"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : JcoNFd');
      logInfo(`fail(message="JcoNFd") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : JcoNFd');
      logInfo(`fail(message="JcoNFd") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0101 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0102
     * @tc.name      RequestAddForm_FormRequestStateFail_0102
     * @tc.desc      FormRequestState.fail(message="etO") yields "RequestPublishForm failed : etO"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0102 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('etO');
      logInfo(`fail(message="etO"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : etO');
      logInfo(`fail(message="etO") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : etO');
      logInfo(`fail(message="etO") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0102 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0103
     * @tc.name      RequestAddForm_FormRequestStateFail_0103
     * @tc.desc      FormRequestState.fail(message="Fo") yields "RequestPublishForm failed : Fo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0103 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('Fo');
      logInfo(`fail(message="Fo"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : Fo');
      logInfo(`fail(message="Fo") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Fo');
      logInfo(`fail(message="Fo") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0103 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0104
     * @tc.name      RequestAddForm_FormRequestStateFail_0104
     * @tc.desc      FormRequestState.fail(message="t1J") yields "RequestPublishForm failed : t1J"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0104 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('t1J');
      logInfo(`fail(message="t1J"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : t1J');
      logInfo(`fail(message="t1J") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : t1J');
      logInfo(`fail(message="t1J") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0104 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0105
     * @tc.name      RequestAddForm_FormRequestStateFail_0105
     * @tc.desc      FormRequestState.fail(message="fVP9EV3") yields "RequestPublishForm failed : fVP9EV3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0105 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('fVP9EV3');
      logInfo(`fail(message="fVP9EV3"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : fVP9EV3');
      logInfo(`fail(message="fVP9EV3") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : fVP9EV3');
      logInfo(`fail(message="fVP9EV3") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0105 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0106
     * @tc.name      RequestAddForm_FormRequestStateFail_0106
     * @tc.desc      FormRequestState.fail(message="y8GEuwNWmz") yields "RequestPublishForm failed : y8GEuwNWmz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0106 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('y8GEuwNWmz');
      logInfo(`fail(message="y8GEuwNWmz"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : y8GEuwNWmz');
      logInfo(`fail(message="y8GEuwNWmz") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : y8GEuwNWmz');
      logInfo(`fail(message="y8GEuwNWmz") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0106 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0107
     * @tc.name      RequestAddForm_FormRequestStateFail_0107
     * @tc.desc      FormRequestState.fail(message="Fn9ncPZjxyUs") yields "RequestPublishForm failed : Fn9ncPZjxyUs"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0107 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('Fn9ncPZjxyUs');
      logInfo(`fail(message="Fn9ncPZjxyUs"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : Fn9ncPZjxyUs');
      logInfo(`fail(message="Fn9ncPZjxyUs") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Fn9ncPZjxyUs');
      logInfo(`fail(message="Fn9ncPZjxyUs") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0107 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0108
     * @tc.name      RequestAddForm_FormRequestStateFail_0108
     * @tc.desc      FormRequestState.fail(message="gCRs") yields "RequestPublishForm failed : gCRs"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0108 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('gCRs');
      logInfo(`fail(message="gCRs"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : gCRs');
      logInfo(`fail(message="gCRs") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : gCRs');
      logInfo(`fail(message="gCRs") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0108 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0109
     * @tc.name      RequestAddForm_FormRequestStateFail_0109
     * @tc.desc      FormRequestState.fail(message="KjRvj7zZP") yields "RequestPublishForm failed : KjRvj7zZP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0109 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('KjRvj7zZP');
      logInfo(`fail(message="KjRvj7zZP"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : KjRvj7zZP');
      logInfo(`fail(message="KjRvj7zZP") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : KjRvj7zZP');
      logInfo(`fail(message="KjRvj7zZP") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0109 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0110
     * @tc.name      RequestAddForm_FormRequestStateFail_0110
     * @tc.desc      FormRequestState.fail(message="k") yields "RequestPublishForm failed : k"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0110 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('k');
      logInfo(`fail(message="k"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : k');
      logInfo(`fail(message="k") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : k');
      logInfo(`fail(message="k") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0110 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0111
     * @tc.name      RequestAddForm_FormRequestStateFail_0111
     * @tc.desc      FormRequestState.fail(message="IS") yields "RequestPublishForm failed : IS"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0111 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('IS');
      logInfo(`fail(message="IS"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : IS');
      logInfo(`fail(message="IS") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : IS');
      logInfo(`fail(message="IS") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0111 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0112
     * @tc.name      RequestAddForm_FormRequestStateFail_0112
     * @tc.desc      FormRequestState.fail(message="bl8gY") yields "RequestPublishForm failed : bl8gY"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0112 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('bl8gY');
      logInfo(`fail(message="bl8gY"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : bl8gY');
      logInfo(`fail(message="bl8gY") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : bl8gY');
      logInfo(`fail(message="bl8gY") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0112 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0113
     * @tc.name      RequestAddForm_FormRequestStateFail_0113
     * @tc.desc      FormRequestState.fail(message="NqImHRIp") yields "RequestPublishForm failed : NqImHRIp"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0113 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('NqImHRIp');
      logInfo(`fail(message="NqImHRIp"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : NqImHRIp');
      logInfo(`fail(message="NqImHRIp") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : NqImHRIp');
      logInfo(`fail(message="NqImHRIp") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0113 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0114
     * @tc.name      RequestAddForm_FormRequestStateFail_0114
     * @tc.desc      FormRequestState.fail(message="rwInt") yields "RequestPublishForm failed : rwInt"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0114 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('rwInt');
      logInfo(`fail(message="rwInt"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : rwInt');
      logInfo(`fail(message="rwInt") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : rwInt');
      logInfo(`fail(message="rwInt") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0114 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0115
     * @tc.name      RequestAddForm_FormRequestStateFail_0115
     * @tc.desc      FormRequestState.fail(message="Pf5Bcy0cd1MQ") yields "RequestPublishForm failed : Pf5Bcy0cd1MQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0115 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('Pf5Bcy0cd1MQ');
      logInfo(`fail(message="Pf5Bcy0cd1MQ"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : Pf5Bcy0cd1MQ');
      logInfo(`fail(message="Pf5Bcy0cd1MQ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Pf5Bcy0cd1MQ');
      logInfo(`fail(message="Pf5Bcy0cd1MQ") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0115 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0116
     * @tc.name      RequestAddForm_FormRequestStateFail_0116
     * @tc.desc      FormRequestState.fail(message="ksDYAI93d") yields "RequestPublishForm failed : ksDYAI93d"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0116 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('ksDYAI93d');
      logInfo(`fail(message="ksDYAI93d"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : ksDYAI93d');
      logInfo(`fail(message="ksDYAI93d") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : ksDYAI93d');
      logInfo(`fail(message="ksDYAI93d") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0116 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0117
     * @tc.name      RequestAddForm_FormRequestStateFail_0117
     * @tc.desc      FormRequestState.fail(message="N4oSx") yields "RequestPublishForm failed : N4oSx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0117 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('N4oSx');
      logInfo(`fail(message="N4oSx"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : N4oSx');
      logInfo(`fail(message="N4oSx") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : N4oSx');
      logInfo(`fail(message="N4oSx") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0117 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0118
     * @tc.name      RequestAddForm_FormRequestStateFail_0118
     * @tc.desc      FormRequestState.fail(message="d") yields "RequestPublishForm failed : d"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0118 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('d');
      logInfo(`fail(message="d"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : d');
      logInfo(`fail(message="d") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : d');
      logInfo(`fail(message="d") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0118 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0119
     * @tc.name      RequestAddForm_FormRequestStateFail_0119
     * @tc.desc      FormRequestState.fail(message="1IX5dqEwOPoI") yields "RequestPublishForm failed : 1IX5dqEwOPoI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0119 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('1IX5dqEwOPoI');
      logInfo(`fail(message="1IX5dqEwOPoI"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 1IX5dqEwOPoI');
      logInfo(`fail(message="1IX5dqEwOPoI") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 1IX5dqEwOPoI');
      logInfo(`fail(message="1IX5dqEwOPoI") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0119 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0120
     * @tc.name      RequestAddForm_FormRequestStateFail_0120
     * @tc.desc      FormRequestState.fail(message="y") yields "RequestPublishForm failed : y"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0120 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('y');
      logInfo(`fail(message="y"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : y');
      logInfo(`fail(message="y") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : y');
      logInfo(`fail(message="y") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0120 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0121
     * @tc.name      RequestAddForm_FormRequestStateFail_0121
     * @tc.desc      FormRequestState.fail(message="NtEWY8iB") yields "RequestPublishForm failed : NtEWY8iB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0121 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('NtEWY8iB');
      logInfo(`fail(message="NtEWY8iB"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : NtEWY8iB');
      logInfo(`fail(message="NtEWY8iB") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : NtEWY8iB');
      logInfo(`fail(message="NtEWY8iB") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0121 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0122
     * @tc.name      RequestAddForm_FormRequestStateFail_0122
     * @tc.desc      FormRequestState.fail(message="3") yields "RequestPublishForm failed : 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0122 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('3');
      logInfo(`fail(message="3"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 3');
      logInfo(`fail(message="3") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 3');
      logInfo(`fail(message="3") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0122 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0123
     * @tc.name      RequestAddForm_FormRequestStateFail_0123
     * @tc.desc      FormRequestState.fail(message="EL8") yields "RequestPublishForm failed : EL8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0123 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('EL8');
      logInfo(`fail(message="EL8"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : EL8');
      logInfo(`fail(message="EL8") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : EL8');
      logInfo(`fail(message="EL8") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0123 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0124
     * @tc.name      RequestAddForm_FormRequestStateFail_0124
     * @tc.desc      FormRequestState.fail(message="93pFbAIaso06") yields "RequestPublishForm failed : 93pFbAIaso06"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0124 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('93pFbAIaso06');
      logInfo(`fail(message="93pFbAIaso06"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 93pFbAIaso06');
      logInfo(`fail(message="93pFbAIaso06") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 93pFbAIaso06');
      logInfo(`fail(message="93pFbAIaso06") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0124 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0125
     * @tc.name      RequestAddForm_FormRequestStateFail_0125
     * @tc.desc      FormRequestState.fail(message="0Re") yields "RequestPublishForm failed : 0Re"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0125 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('0Re');
      logInfo(`fail(message="0Re"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 0Re');
      logInfo(`fail(message="0Re") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 0Re');
      logInfo(`fail(message="0Re") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0125 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0126
     * @tc.name      RequestAddForm_FormRequestStateFail_0126
     * @tc.desc      FormRequestState.fail(message="a09") yields "RequestPublishForm failed : a09"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0126 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('a09');
      logInfo(`fail(message="a09"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : a09');
      logInfo(`fail(message="a09") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : a09');
      logInfo(`fail(message="a09") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0126 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0127
     * @tc.name      RequestAddForm_FormRequestStateFail_0127
     * @tc.desc      FormRequestState.fail(message="i4DFl0JfB") yields "RequestPublishForm failed : i4DFl0JfB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0127 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('i4DFl0JfB');
      logInfo(`fail(message="i4DFl0JfB"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : i4DFl0JfB');
      logInfo(`fail(message="i4DFl0JfB") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : i4DFl0JfB');
      logInfo(`fail(message="i4DFl0JfB") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0127 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0128
     * @tc.name      RequestAddForm_FormRequestStateFail_0128
     * @tc.desc      FormRequestState.fail(message="cBOz") yields "RequestPublishForm failed : cBOz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0128 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('cBOz');
      logInfo(`fail(message="cBOz"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : cBOz');
      logInfo(`fail(message="cBOz") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : cBOz');
      logInfo(`fail(message="cBOz") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0128 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0129
     * @tc.name      RequestAddForm_FormRequestStateFail_0129
     * @tc.desc      FormRequestState.fail(message="txke0J2bB95") yields "RequestPublishForm failed : txke0J2bB95"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0129 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('txke0J2bB95');
      logInfo(`fail(message="txke0J2bB95"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : txke0J2bB95');
      logInfo(`fail(message="txke0J2bB95") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : txke0J2bB95');
      logInfo(`fail(message="txke0J2bB95") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0129 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0130
     * @tc.name      RequestAddForm_FormRequestStateFail_0130
     * @tc.desc      FormRequestState.fail(message="4JrJq") yields "RequestPublishForm failed : 4JrJq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0130 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('4JrJq');
      logInfo(`fail(message="4JrJq"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 4JrJq');
      logInfo(`fail(message="4JrJq") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 4JrJq');
      logInfo(`fail(message="4JrJq") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0130 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0131
     * @tc.name      RequestAddForm_FormRequestStateFail_0131
     * @tc.desc      FormRequestState.fail(message="FnEe5CTm") yields "RequestPublishForm failed : FnEe5CTm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0131 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('FnEe5CTm');
      logInfo(`fail(message="FnEe5CTm"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : FnEe5CTm');
      logInfo(`fail(message="FnEe5CTm") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : FnEe5CTm');
      logInfo(`fail(message="FnEe5CTm") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0131 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0132
     * @tc.name      RequestAddForm_FormRequestStateFail_0132
     * @tc.desc      FormRequestState.fail(message="lG") yields "RequestPublishForm failed : lG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0132 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('lG');
      logInfo(`fail(message="lG"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : lG');
      logInfo(`fail(message="lG") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : lG');
      logInfo(`fail(message="lG") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0132 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0133
     * @tc.name      RequestAddForm_FormRequestStateFail_0133
     * @tc.desc      FormRequestState.fail(message="PzHRQIJiT") yields "RequestPublishForm failed : PzHRQIJiT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0133 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('PzHRQIJiT');
      logInfo(`fail(message="PzHRQIJiT"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : PzHRQIJiT');
      logInfo(`fail(message="PzHRQIJiT") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : PzHRQIJiT');
      logInfo(`fail(message="PzHRQIJiT") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0133 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0134
     * @tc.name      RequestAddForm_FormRequestStateFail_0134
     * @tc.desc      FormRequestState.fail(message="9oBhbLIJzW") yields "RequestPublishForm failed : 9oBhbLIJzW"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0134 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('9oBhbLIJzW');
      logInfo(`fail(message="9oBhbLIJzW"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 9oBhbLIJzW');
      logInfo(`fail(message="9oBhbLIJzW") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 9oBhbLIJzW');
      logInfo(`fail(message="9oBhbLIJzW") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0134 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0135
     * @tc.name      RequestAddForm_FormRequestStateFail_0135
     * @tc.desc      FormRequestState.fail(message="h4vpu9II") yields "RequestPublishForm failed : h4vpu9II"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0135 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('h4vpu9II');
      logInfo(`fail(message="h4vpu9II"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : h4vpu9II');
      logInfo(`fail(message="h4vpu9II") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : h4vpu9II');
      logInfo(`fail(message="h4vpu9II") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0135 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0136
     * @tc.name      RequestAddForm_FormRequestStateFail_0136
     * @tc.desc      FormRequestState.fail(message="Xhi9EuynLU") yields "RequestPublishForm failed : Xhi9EuynLU"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0136 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('Xhi9EuynLU');
      logInfo(`fail(message="Xhi9EuynLU"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : Xhi9EuynLU');
      logInfo(`fail(message="Xhi9EuynLU") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Xhi9EuynLU');
      logInfo(`fail(message="Xhi9EuynLU") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0136 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0137
     * @tc.name      RequestAddForm_FormRequestStateFail_0137
     * @tc.desc      FormRequestState.fail(message="f6p") yields "RequestPublishForm failed : f6p"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0137 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('f6p');
      logInfo(`fail(message="f6p"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : f6p');
      logInfo(`fail(message="f6p") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : f6p');
      logInfo(`fail(message="f6p") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0137 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0138
     * @tc.name      RequestAddForm_FormRequestStateFail_0138
     * @tc.desc      FormRequestState.fail(message="tjS0FdFlMrUI") yields "RequestPublishForm failed : tjS0FdFlMrUI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0138 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('tjS0FdFlMrUI');
      logInfo(`fail(message="tjS0FdFlMrUI"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : tjS0FdFlMrUI');
      logInfo(`fail(message="tjS0FdFlMrUI") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : tjS0FdFlMrUI');
      logInfo(`fail(message="tjS0FdFlMrUI") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0138 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0139
     * @tc.name      RequestAddForm_FormRequestStateFail_0139
     * @tc.desc      FormRequestState.fail(message="16jaiaGRK") yields "RequestPublishForm failed : 16jaiaGRK"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0139 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('16jaiaGRK');
      logInfo(`fail(message="16jaiaGRK"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 16jaiaGRK');
      logInfo(`fail(message="16jaiaGRK") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 16jaiaGRK');
      logInfo(`fail(message="16jaiaGRK") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0139 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0140
     * @tc.name      RequestAddForm_FormRequestStateFail_0140
     * @tc.desc      FormRequestState.fail(message="8Hei") yields "RequestPublishForm failed : 8Hei"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0140 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('8Hei');
      logInfo(`fail(message="8Hei"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 8Hei');
      logInfo(`fail(message="8Hei") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 8Hei');
      logInfo(`fail(message="8Hei") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0140 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0141
     * @tc.name      RequestAddForm_FormRequestStateFail_0141
     * @tc.desc      FormRequestState.fail(message="ZE7OH3t67pk") yields "RequestPublishForm failed : ZE7OH3t67pk"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0141 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('ZE7OH3t67pk');
      logInfo(`fail(message="ZE7OH3t67pk"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : ZE7OH3t67pk');
      logInfo(`fail(message="ZE7OH3t67pk") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : ZE7OH3t67pk');
      logInfo(`fail(message="ZE7OH3t67pk") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0141 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0142
     * @tc.name      RequestAddForm_FormRequestStateFail_0142
     * @tc.desc      FormRequestState.fail(message="kyyM8") yields "RequestPublishForm failed : kyyM8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0142 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('kyyM8');
      logInfo(`fail(message="kyyM8"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : kyyM8');
      logInfo(`fail(message="kyyM8") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : kyyM8');
      logInfo(`fail(message="kyyM8") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0142 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0143
     * @tc.name      RequestAddForm_FormRequestStateFail_0143
     * @tc.desc      FormRequestState.fail(message="4AXmmQqg3c") yields "RequestPublishForm failed : 4AXmmQqg3c"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0143 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('4AXmmQqg3c');
      logInfo(`fail(message="4AXmmQqg3c"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 4AXmmQqg3c');
      logInfo(`fail(message="4AXmmQqg3c") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 4AXmmQqg3c');
      logInfo(`fail(message="4AXmmQqg3c") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0143 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0144
     * @tc.name      RequestAddForm_FormRequestStateFail_0144
     * @tc.desc      FormRequestState.fail(message="T6CYEWMl") yields "RequestPublishForm failed : T6CYEWMl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0144 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('T6CYEWMl');
      logInfo(`fail(message="T6CYEWMl"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : T6CYEWMl');
      logInfo(`fail(message="T6CYEWMl") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : T6CYEWMl');
      logInfo(`fail(message="T6CYEWMl") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0144 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0145
     * @tc.name      RequestAddForm_FormRequestStateFail_0145
     * @tc.desc      FormRequestState.fail(message="jhyNJsA57") yields "RequestPublishForm failed : jhyNJsA57"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0145 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('jhyNJsA57');
      logInfo(`fail(message="jhyNJsA57"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : jhyNJsA57');
      logInfo(`fail(message="jhyNJsA57") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : jhyNJsA57');
      logInfo(`fail(message="jhyNJsA57") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0145 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0146
     * @tc.name      RequestAddForm_FormRequestStateFail_0146
     * @tc.desc      FormRequestState.fail(message="6lcdhjnkcDZ") yields "RequestPublishForm failed : 6lcdhjnkcDZ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0146 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('6lcdhjnkcDZ');
      logInfo(`fail(message="6lcdhjnkcDZ"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 6lcdhjnkcDZ');
      logInfo(`fail(message="6lcdhjnkcDZ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 6lcdhjnkcDZ');
      logInfo(`fail(message="6lcdhjnkcDZ") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0146 end`);
    });
  });
}
