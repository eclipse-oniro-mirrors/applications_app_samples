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
export default function formRequestStateSucceedTest(): void {
  describe('FormRequestStateSucceedTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0001
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0001
     * @tc.desc      FormRequestState.succeed(formId="") yields "RequestPublishForm success : "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_FormRequestStateSucceed_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0001 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('');
      logInfo(`succeed(formId=""): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : ');
      logInfo(`succeed(formId="") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : ');
      logInfo(`succeed(formId="") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0001 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0002
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0002
     * @tc.desc      FormRequestState.succeed(formId="a") yields "RequestPublishForm success : a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_FormRequestStateSucceed_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0002 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('a');
      logInfo(`succeed(formId="a"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : a');
      logInfo(`succeed(formId="a") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : a');
      logInfo(`succeed(formId="a") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0002 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0003
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0003
     * @tc.desc      FormRequestState.succeed(formId="abc") yields "RequestPublishForm success : abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0003 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('abc');
      logInfo(`succeed(formId="abc"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : abc');
      logInfo(`succeed(formId="abc") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : abc');
      logInfo(`succeed(formId="abc") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0003 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0004
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0004
     * @tc.desc      FormRequestState.succeed(formId="Hello World") yields "RequestPublishForm success : Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0004 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('Hello World');
      logInfo(`succeed(formId="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Hello World');
      logInfo(`succeed(formId="Hello World") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Hello World');
      logInfo(`succeed(formId="Hello World") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0004 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0005
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0005
     * @tc.desc      FormRequestState.succeed(formId=" ") yields "RequestPublishForm success :  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0005 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed(' ');
      logInfo(`succeed(formId=" "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success :  ');
      logInfo(`succeed(formId=" ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success :  ');
      logInfo(`succeed(formId=" ") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0005 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0006
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0006
     * @tc.desc      FormRequestState.succeed(formId="123") yields "RequestPublishForm success : 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0006 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('123');
      logInfo(`succeed(formId="123"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 123');
      logInfo(`succeed(formId="123") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 123');
      logInfo(`succeed(formId="123") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0006 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0007
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0007
     * @tc.desc      FormRequestState.succeed(formId=" a ") yields "RequestPublishForm success :  a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateSucceed_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0007 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed(' a ');
      logInfo(`succeed(formId=" a "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success :  a ');
      logInfo(`succeed(formId=" a ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success :  a ');
      logInfo(`succeed(formId=" a ") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0007 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0008
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0008
     * @tc.desc      FormRequestState.succeed(formId="aa") yields "RequestPublishForm success : aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0008 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('aa');
      logInfo(`succeed(formId="aa"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : aa');
      logInfo(`succeed(formId="aa") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : aa');
      logInfo(`succeed(formId="aa") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0008 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0009
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0009
     * @tc.desc      FormRequestState.succeed(formId="a_1") yields "RequestPublishForm success : a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0009 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('a_1');
      logInfo(`succeed(formId="a_1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : a_1');
      logInfo(`succeed(formId="a_1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : a_1');
      logInfo(`succeed(formId="a_1") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0009 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0010
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0010
     * @tc.desc      FormRequestState.succeed(formId="xa") yields "RequestPublishForm success : xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateSucceed_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0010 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('xa');
      logInfo(`succeed(formId="xa"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : xa');
      logInfo(`succeed(formId="xa") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : xa');
      logInfo(`succeed(formId="xa") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0010 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0011
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0011
     * @tc.desc      FormRequestState.succeed(formId=" abc ") yields "RequestPublishForm success :  abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateSucceed_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0011 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed(' abc ');
      logInfo(`succeed(formId=" abc "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success :  abc ');
      logInfo(`succeed(formId=" abc ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success :  abc ');
      logInfo(`succeed(formId=" abc ") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0011 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0012
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0012
     * @tc.desc      FormRequestState.succeed(formId="abcabc") yields "RequestPublishForm success : abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0012 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('abcabc');
      logInfo(`succeed(formId="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : abcabc');
      logInfo(`succeed(formId="abcabc") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : abcabc');
      logInfo(`succeed(formId="abcabc") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0012 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0013
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0013
     * @tc.desc      FormRequestState.succeed(formId="abc_1") yields "RequestPublishForm success : abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0013 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('abc_1');
      logInfo(`succeed(formId="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : abc_1');
      logInfo(`succeed(formId="abc_1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : abc_1');
      logInfo(`succeed(formId="abc_1") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0013 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0014
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0014
     * @tc.desc      FormRequestState.succeed(formId="xabc") yields "RequestPublishForm success : xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateSucceed_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0014 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('xabc');
      logInfo(`succeed(formId="xabc"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : xabc');
      logInfo(`succeed(formId="xabc") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : xabc');
      logInfo(`succeed(formId="xabc") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0014 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0015
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0015
     * @tc.desc      FormRequestState.succeed(formId=" Hello World ") yields "RequestPublishForm success :  Hello Wor...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateSucceed_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0015 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed(' Hello World ');
      logInfo(`succeed(formId=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success :  Hello World ');
      logInfo(`succeed(formId=" Hello World ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success :  Hello World ');
      logInfo(`succeed(formId=" Hello World ") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0015 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0016
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0016
     * @tc.desc      FormRequestState.succeed(formId="Hello WorldHello World") yields "RequestPublishForm success : H...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0016 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('Hello WorldHello World');
      logInfo(`succeed(formId="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Hello WorldHello World');
      logInfo(`succeed(formId="Hello WorldHello World") ...: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Hello WorldHello World');
      logInfo(`succeed(formId="Hello WorldHello World") ...: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0016 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0017
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0017
     * @tc.desc      FormRequestState.succeed(formId="Hello World_1") yields "RequestPublishForm success : Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0017 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('Hello World_1');
      logInfo(`succeed(formId="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Hello World_1');
      logInfo(`succeed(formId="Hello World_1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Hello World_1');
      logInfo(`succeed(formId="Hello World_1") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0017 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0018
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0018
     * @tc.desc      FormRequestState.succeed(formId="xHello World") yields "RequestPublishForm success : xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateSucceed_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0018 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('xHello World');
      logInfo(`succeed(formId="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : xHello World');
      logInfo(`succeed(formId="xHello World") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : xHello World');
      logInfo(`succeed(formId="xHello World") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0018 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0019
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0019
     * @tc.desc      FormRequestState.succeed(formId="   ") yields "RequestPublishForm success :    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateSucceed_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0019 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('   ');
      logInfo(`succeed(formId="   "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success :    ');
      logInfo(`succeed(formId="   ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success :    ');
      logInfo(`succeed(formId="   ") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0019 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0020
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0020
     * @tc.desc      FormRequestState.succeed(formId="  ") yields "RequestPublishForm success :   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0020 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('  ');
      logInfo(`succeed(formId="  "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success :   ');
      logInfo(`succeed(formId="  ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success :   ');
      logInfo(`succeed(formId="  ") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0020 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0021
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0021
     * @tc.desc      FormRequestState.succeed(formId=" _1") yields "RequestPublishForm success :  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0021 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed(' _1');
      logInfo(`succeed(formId=" _1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success :  _1');
      logInfo(`succeed(formId=" _1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success :  _1');
      logInfo(`succeed(formId=" _1") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0021 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0022
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0022
     * @tc.desc      FormRequestState.succeed(formId="x ") yields "RequestPublishForm success : x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateSucceed_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0022 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('x ');
      logInfo(`succeed(formId="x "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : x ');
      logInfo(`succeed(formId="x ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : x ');
      logInfo(`succeed(formId="x ") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0022 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0023
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0023
     * @tc.desc      FormRequestState.succeed(formId=" 123 ") yields "RequestPublishForm success :  123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateSucceed_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0023 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed(' 123 ');
      logInfo(`succeed(formId=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success :  123 ');
      logInfo(`succeed(formId=" 123 ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success :  123 ');
      logInfo(`succeed(formId=" 123 ") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0023 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0024
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0024
     * @tc.desc      FormRequestState.succeed(formId="123123") yields "RequestPublishForm success : 123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0024 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('123123');
      logInfo(`succeed(formId="123123"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 123123');
      logInfo(`succeed(formId="123123") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 123123');
      logInfo(`succeed(formId="123123") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0024 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0025
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0025
     * @tc.desc      FormRequestState.succeed(formId="123_1") yields "RequestPublishForm success : 123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0025 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('123_1');
      logInfo(`succeed(formId="123_1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 123_1');
      logInfo(`succeed(formId="123_1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 123_1');
      logInfo(`succeed(formId="123_1") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0025 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0026
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0026
     * @tc.desc      FormRequestState.succeed(formId="x123") yields "RequestPublishForm success : x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateSucceed_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0026 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('x123');
      logInfo(`succeed(formId="x123"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : x123');
      logInfo(`succeed(formId="x123") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : x123');
      logInfo(`succeed(formId="x123") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0026 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0027
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0027
     * @tc.desc      FormRequestState.succeed(formId="12om5Kfkxn") yields "RequestPublishForm success : 12om5Kfkxn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0027 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('12om5Kfkxn');
      logInfo(`succeed(formId="12om5Kfkxn"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 12om5Kfkxn');
      logInfo(`succeed(formId="12om5Kfkxn") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 12om5Kfkxn');
      logInfo(`succeed(formId="12om5Kfkxn") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0027 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0028
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0028
     * @tc.desc      FormRequestState.succeed(formId="Lp0flCj") yields "RequestPublishForm success : Lp0flCj"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0028 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('Lp0flCj');
      logInfo(`succeed(formId="Lp0flCj"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Lp0flCj');
      logInfo(`succeed(formId="Lp0flCj") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Lp0flCj');
      logInfo(`succeed(formId="Lp0flCj") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0028 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0029
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0029
     * @tc.desc      FormRequestState.succeed(formId="Ce3pzpg") yields "RequestPublishForm success : Ce3pzpg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0029 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('Ce3pzpg');
      logInfo(`succeed(formId="Ce3pzpg"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Ce3pzpg');
      logInfo(`succeed(formId="Ce3pzpg") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Ce3pzpg');
      logInfo(`succeed(formId="Ce3pzpg") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0029 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0030
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0030
     * @tc.desc      FormRequestState.succeed(formId="dnnltodAK") yields "RequestPublishForm success : dnnltodAK"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0030 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('dnnltodAK');
      logInfo(`succeed(formId="dnnltodAK"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : dnnltodAK');
      logInfo(`succeed(formId="dnnltodAK") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : dnnltodAK');
      logInfo(`succeed(formId="dnnltodAK") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0030 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0031
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0031
     * @tc.desc      FormRequestState.succeed(formId="lC0a") yields "RequestPublishForm success : lC0a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0031 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('lC0a');
      logInfo(`succeed(formId="lC0a"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : lC0a');
      logInfo(`succeed(formId="lC0a") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : lC0a');
      logInfo(`succeed(formId="lC0a") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0031 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0032
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0032
     * @tc.desc      FormRequestState.succeed(formId="sg4VPdu") yields "RequestPublishForm success : sg4VPdu"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0032 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('sg4VPdu');
      logInfo(`succeed(formId="sg4VPdu"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : sg4VPdu');
      logInfo(`succeed(formId="sg4VPdu") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : sg4VPdu');
      logInfo(`succeed(formId="sg4VPdu") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0032 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0033
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0033
     * @tc.desc      FormRequestState.succeed(formId="lEh") yields "RequestPublishForm success : lEh"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0033 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('lEh');
      logInfo(`succeed(formId="lEh"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : lEh');
      logInfo(`succeed(formId="lEh") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : lEh');
      logInfo(`succeed(formId="lEh") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0033 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0034
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0034
     * @tc.desc      FormRequestState.succeed(formId="zgPa51H8") yields "RequestPublishForm success : zgPa51H8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0034 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('zgPa51H8');
      logInfo(`succeed(formId="zgPa51H8"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : zgPa51H8');
      logInfo(`succeed(formId="zgPa51H8") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : zgPa51H8');
      logInfo(`succeed(formId="zgPa51H8") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0034 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0035
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0035
     * @tc.desc      FormRequestState.succeed(formId="ekp0NPrmkix") yields "RequestPublishForm success : ekp0NPrmkix"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0035 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('ekp0NPrmkix');
      logInfo(`succeed(formId="ekp0NPrmkix"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : ekp0NPrmkix');
      logInfo(`succeed(formId="ekp0NPrmkix") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : ekp0NPrmkix');
      logInfo(`succeed(formId="ekp0NPrmkix") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0035 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0036
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0036
     * @tc.desc      FormRequestState.succeed(formId="ZpIiJ5") yields "RequestPublishForm success : ZpIiJ5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0036 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('ZpIiJ5');
      logInfo(`succeed(formId="ZpIiJ5"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : ZpIiJ5');
      logInfo(`succeed(formId="ZpIiJ5") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : ZpIiJ5');
      logInfo(`succeed(formId="ZpIiJ5") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0036 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0037
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0037
     * @tc.desc      FormRequestState.succeed(formId="NmX31W") yields "RequestPublishForm success : NmX31W"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0037 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('NmX31W');
      logInfo(`succeed(formId="NmX31W"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : NmX31W');
      logInfo(`succeed(formId="NmX31W") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : NmX31W');
      logInfo(`succeed(formId="NmX31W") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0037 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0038
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0038
     * @tc.desc      FormRequestState.succeed(formId="CuW6") yields "RequestPublishForm success : CuW6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0038 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('CuW6');
      logInfo(`succeed(formId="CuW6"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : CuW6');
      logInfo(`succeed(formId="CuW6") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : CuW6');
      logInfo(`succeed(formId="CuW6") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0038 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0039
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0039
     * @tc.desc      FormRequestState.succeed(formId="Hh") yields "RequestPublishForm success : Hh"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0039 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('Hh');
      logInfo(`succeed(formId="Hh"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Hh');
      logInfo(`succeed(formId="Hh") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Hh');
      logInfo(`succeed(formId="Hh") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0039 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0040
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0040
     * @tc.desc      FormRequestState.succeed(formId="hht5M") yields "RequestPublishForm success : hht5M"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0040 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('hht5M');
      logInfo(`succeed(formId="hht5M"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : hht5M');
      logInfo(`succeed(formId="hht5M") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : hht5M');
      logInfo(`succeed(formId="hht5M") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0040 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0041
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0041
     * @tc.desc      FormRequestState.succeed(formId="Ec1OlBl") yields "RequestPublishForm success : Ec1OlBl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0041 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('Ec1OlBl');
      logInfo(`succeed(formId="Ec1OlBl"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Ec1OlBl');
      logInfo(`succeed(formId="Ec1OlBl") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Ec1OlBl');
      logInfo(`succeed(formId="Ec1OlBl") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0041 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0042
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0042
     * @tc.desc      FormRequestState.succeed(formId="Vni2") yields "RequestPublishForm success : Vni2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0042 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('Vni2');
      logInfo(`succeed(formId="Vni2"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Vni2');
      logInfo(`succeed(formId="Vni2") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Vni2');
      logInfo(`succeed(formId="Vni2") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0042 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0043
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0043
     * @tc.desc      FormRequestState.succeed(formId="C5X5iM3O9ZH") yields "RequestPublishForm success : C5X5iM3O9ZH"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0043 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('C5X5iM3O9ZH');
      logInfo(`succeed(formId="C5X5iM3O9ZH"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : C5X5iM3O9ZH');
      logInfo(`succeed(formId="C5X5iM3O9ZH") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : C5X5iM3O9ZH');
      logInfo(`succeed(formId="C5X5iM3O9ZH") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0043 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0044
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0044
     * @tc.desc      FormRequestState.succeed(formId="FhCpaChfS") yields "RequestPublishForm success : FhCpaChfS"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0044 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('FhCpaChfS');
      logInfo(`succeed(formId="FhCpaChfS"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : FhCpaChfS');
      logInfo(`succeed(formId="FhCpaChfS") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : FhCpaChfS');
      logInfo(`succeed(formId="FhCpaChfS") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0044 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0045
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0045
     * @tc.desc      FormRequestState.succeed(formId="R") yields "RequestPublishForm success : R"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0045 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('R');
      logInfo(`succeed(formId="R"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : R');
      logInfo(`succeed(formId="R") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : R');
      logInfo(`succeed(formId="R") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0045 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0046
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0046
     * @tc.desc      FormRequestState.succeed(formId="OluWJ7PNpjU") yields "RequestPublishForm success : OluWJ7PNpjU"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0046 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('OluWJ7PNpjU');
      logInfo(`succeed(formId="OluWJ7PNpjU"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : OluWJ7PNpjU');
      logInfo(`succeed(formId="OluWJ7PNpjU") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : OluWJ7PNpjU');
      logInfo(`succeed(formId="OluWJ7PNpjU") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0046 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0047
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0047
     * @tc.desc      FormRequestState.succeed(formId="MgvrY1") yields "RequestPublishForm success : MgvrY1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0047 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('MgvrY1');
      logInfo(`succeed(formId="MgvrY1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : MgvrY1');
      logInfo(`succeed(formId="MgvrY1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : MgvrY1');
      logInfo(`succeed(formId="MgvrY1") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0047 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0048
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0048
     * @tc.desc      FormRequestState.succeed(formId="2") yields "RequestPublishForm success : 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0048 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('2');
      logInfo(`succeed(formId="2"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 2');
      logInfo(`succeed(formId="2") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 2');
      logInfo(`succeed(formId="2") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0048 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0049
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0049
     * @tc.desc      FormRequestState.succeed(formId="OCHU4L0D9") yields "RequestPublishForm success : OCHU4L0D9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0049 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('OCHU4L0D9');
      logInfo(`succeed(formId="OCHU4L0D9"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : OCHU4L0D9');
      logInfo(`succeed(formId="OCHU4L0D9") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : OCHU4L0D9');
      logInfo(`succeed(formId="OCHU4L0D9") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0049 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0050
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0050
     * @tc.desc      FormRequestState.succeed(formId="MKUexK7W5") yields "RequestPublishForm success : MKUexK7W5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0050 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('MKUexK7W5');
      logInfo(`succeed(formId="MKUexK7W5"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : MKUexK7W5');
      logInfo(`succeed(formId="MKUexK7W5") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : MKUexK7W5');
      logInfo(`succeed(formId="MKUexK7W5") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0050 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0051
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0051
     * @tc.desc      FormRequestState.succeed(formId="dNkgb5s8") yields "RequestPublishForm success : dNkgb5s8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0051 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('dNkgb5s8');
      logInfo(`succeed(formId="dNkgb5s8"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : dNkgb5s8');
      logInfo(`succeed(formId="dNkgb5s8") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : dNkgb5s8');
      logInfo(`succeed(formId="dNkgb5s8") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0051 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0052
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0052
     * @tc.desc      FormRequestState.succeed(formId="TLef0hnzhXXY") yields "RequestPublishForm success : TLef0hnzhXXY"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0052 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('TLef0hnzhXXY');
      logInfo(`succeed(formId="TLef0hnzhXXY"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : TLef0hnzhXXY');
      logInfo(`succeed(formId="TLef0hnzhXXY") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : TLef0hnzhXXY');
      logInfo(`succeed(formId="TLef0hnzhXXY") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0052 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0053
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0053
     * @tc.desc      FormRequestState.succeed(formId="YxJdjzwIhC6o") yields "RequestPublishForm success : YxJdjzwIhC6o"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0053 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('YxJdjzwIhC6o');
      logInfo(`succeed(formId="YxJdjzwIhC6o"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : YxJdjzwIhC6o');
      logInfo(`succeed(formId="YxJdjzwIhC6o") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : YxJdjzwIhC6o');
      logInfo(`succeed(formId="YxJdjzwIhC6o") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0053 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0054
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0054
     * @tc.desc      FormRequestState.succeed(formId="b2pgrnrbRlCw") yields "RequestPublishForm success : b2pgrnrbRlCw"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0054 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('b2pgrnrbRlCw');
      logInfo(`succeed(formId="b2pgrnrbRlCw"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : b2pgrnrbRlCw');
      logInfo(`succeed(formId="b2pgrnrbRlCw") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : b2pgrnrbRlCw');
      logInfo(`succeed(formId="b2pgrnrbRlCw") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0054 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0055
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0055
     * @tc.desc      FormRequestState.succeed(formId="NBB61CReUUOF") yields "RequestPublishForm success : NBB61CReUUOF"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0055 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('NBB61CReUUOF');
      logInfo(`succeed(formId="NBB61CReUUOF"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : NBB61CReUUOF');
      logInfo(`succeed(formId="NBB61CReUUOF") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : NBB61CReUUOF');
      logInfo(`succeed(formId="NBB61CReUUOF") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0055 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0056
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0056
     * @tc.desc      FormRequestState.succeed(formId="PT9kqqj") yields "RequestPublishForm success : PT9kqqj"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0056 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('PT9kqqj');
      logInfo(`succeed(formId="PT9kqqj"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : PT9kqqj');
      logInfo(`succeed(formId="PT9kqqj") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : PT9kqqj');
      logInfo(`succeed(formId="PT9kqqj") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0056 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0057
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0057
     * @tc.desc      FormRequestState.succeed(formId="ucASXurgn") yields "RequestPublishForm success : ucASXurgn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0057 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('ucASXurgn');
      logInfo(`succeed(formId="ucASXurgn"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : ucASXurgn');
      logInfo(`succeed(formId="ucASXurgn") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : ucASXurgn');
      logInfo(`succeed(formId="ucASXurgn") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0057 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0058
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0058
     * @tc.desc      FormRequestState.succeed(formId="csIBdZM8wgF") yields "RequestPublishForm success : csIBdZM8wgF"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0058 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('csIBdZM8wgF');
      logInfo(`succeed(formId="csIBdZM8wgF"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : csIBdZM8wgF');
      logInfo(`succeed(formId="csIBdZM8wgF") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : csIBdZM8wgF');
      logInfo(`succeed(formId="csIBdZM8wgF") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0058 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0059
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0059
     * @tc.desc      FormRequestState.succeed(formId="ni8gZwo") yields "RequestPublishForm success : ni8gZwo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0059 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('ni8gZwo');
      logInfo(`succeed(formId="ni8gZwo"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : ni8gZwo');
      logInfo(`succeed(formId="ni8gZwo") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : ni8gZwo');
      logInfo(`succeed(formId="ni8gZwo") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0059 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0060
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0060
     * @tc.desc      FormRequestState.succeed(formId="wM") yields "RequestPublishForm success : wM"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0060 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('wM');
      logInfo(`succeed(formId="wM"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : wM');
      logInfo(`succeed(formId="wM") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : wM');
      logInfo(`succeed(formId="wM") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0060 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0061
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0061
     * @tc.desc      FormRequestState.succeed(formId="mhSPHMyrENO") yields "RequestPublishForm success : mhSPHMyrENO"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0061 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('mhSPHMyrENO');
      logInfo(`succeed(formId="mhSPHMyrENO"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : mhSPHMyrENO');
      logInfo(`succeed(formId="mhSPHMyrENO") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : mhSPHMyrENO');
      logInfo(`succeed(formId="mhSPHMyrENO") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0061 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0062
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0062
     * @tc.desc      FormRequestState.succeed(formId="Ox") yields "RequestPublishForm success : Ox"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0062 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('Ox');
      logInfo(`succeed(formId="Ox"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : Ox');
      logInfo(`succeed(formId="Ox") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : Ox');
      logInfo(`succeed(formId="Ox") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0062 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0063
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0063
     * @tc.desc      FormRequestState.succeed(formId="azG9ME43fn5") yields "RequestPublishForm success : azG9ME43fn5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0063 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('azG9ME43fn5');
      logInfo(`succeed(formId="azG9ME43fn5"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : azG9ME43fn5');
      logInfo(`succeed(formId="azG9ME43fn5") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : azG9ME43fn5');
      logInfo(`succeed(formId="azG9ME43fn5") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0063 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0064
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0064
     * @tc.desc      FormRequestState.succeed(formId="BYIy") yields "RequestPublishForm success : BYIy"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0064 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('BYIy');
      logInfo(`succeed(formId="BYIy"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : BYIy');
      logInfo(`succeed(formId="BYIy") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : BYIy');
      logInfo(`succeed(formId="BYIy") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0064 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0065
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0065
     * @tc.desc      FormRequestState.succeed(formId="3ja2BB") yields "RequestPublishForm success : 3ja2BB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0065 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('3ja2BB');
      logInfo(`succeed(formId="3ja2BB"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 3ja2BB');
      logInfo(`succeed(formId="3ja2BB") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 3ja2BB');
      logInfo(`succeed(formId="3ja2BB") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0065 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0066
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0066
     * @tc.desc      FormRequestState.succeed(formId="xi4") yields "RequestPublishForm success : xi4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0066 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('xi4');
      logInfo(`succeed(formId="xi4"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : xi4');
      logInfo(`succeed(formId="xi4") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : xi4');
      logInfo(`succeed(formId="xi4") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0066 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0067
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0067
     * @tc.desc      FormRequestState.succeed(formId="rIhMBDRVa9v0") yields "RequestPublishForm success : rIhMBDRVa9v0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0067 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('rIhMBDRVa9v0');
      logInfo(`succeed(formId="rIhMBDRVa9v0"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : rIhMBDRVa9v0');
      logInfo(`succeed(formId="rIhMBDRVa9v0") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : rIhMBDRVa9v0');
      logInfo(`succeed(formId="rIhMBDRVa9v0") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0067 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0068
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0068
     * @tc.desc      FormRequestState.succeed(formId="jLtYq") yields "RequestPublishForm success : jLtYq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0068 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('jLtYq');
      logInfo(`succeed(formId="jLtYq"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : jLtYq');
      logInfo(`succeed(formId="jLtYq") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : jLtYq');
      logInfo(`succeed(formId="jLtYq") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0068 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0069
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0069
     * @tc.desc      FormRequestState.succeed(formId="CttHbJY") yields "RequestPublishForm success : CttHbJY"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0069 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('CttHbJY');
      logInfo(`succeed(formId="CttHbJY"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : CttHbJY');
      logInfo(`succeed(formId="CttHbJY") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : CttHbJY');
      logInfo(`succeed(formId="CttHbJY") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0069 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0070
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0070
     * @tc.desc      FormRequestState.succeed(formId="tYzRY3u3xO0") yields "RequestPublishForm success : tYzRY3u3xO0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0070 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('tYzRY3u3xO0');
      logInfo(`succeed(formId="tYzRY3u3xO0"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : tYzRY3u3xO0');
      logInfo(`succeed(formId="tYzRY3u3xO0") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : tYzRY3u3xO0');
      logInfo(`succeed(formId="tYzRY3u3xO0") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0070 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0071
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0071
     * @tc.desc      FormRequestState.succeed(formId="XZptyQzyBNV3") yields "RequestPublishForm success : XZptyQzyBNV3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0071 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('XZptyQzyBNV3');
      logInfo(`succeed(formId="XZptyQzyBNV3"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : XZptyQzyBNV3');
      logInfo(`succeed(formId="XZptyQzyBNV3") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : XZptyQzyBNV3');
      logInfo(`succeed(formId="XZptyQzyBNV3") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0071 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0072
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0072
     * @tc.desc      FormRequestState.succeed(formId="3") yields "RequestPublishForm success : 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0072 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('3');
      logInfo(`succeed(formId="3"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : 3');
      logInfo(`succeed(formId="3") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : 3');
      logInfo(`succeed(formId="3") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0072 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_SUCCEED_0073
     * @tc.name      RequestAddForm_FormRequestStateSucceed_0073
     * @tc.desc      FormRequestState.succeed(formId="F5sj") yields "RequestPublishForm success : F5sj"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateSucceed_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateSucceed_0073 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.succeed('F5sj');
      logInfo(`succeed(formId="F5sj"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm success : F5sj');
      logInfo(`succeed(formId="F5sj") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm success : F5sj');
      logInfo(`succeed(formId="F5sj") state: subject.published=${subject.published}`);
      expect(subject.published).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateSucceed_0073 end`);
    });
  });
}
