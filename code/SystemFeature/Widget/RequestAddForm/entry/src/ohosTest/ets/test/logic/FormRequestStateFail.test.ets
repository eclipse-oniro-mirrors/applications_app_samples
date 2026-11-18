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
export default function formRequestStateFailTest(): void {
  describe('FormRequestStateFailTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0001
     * @tc.name      RequestAddForm_FormRequestStateFail_0001
     * @tc.desc      FormRequestState.fail(message="Hello") yields "RequestPublishForm failed : Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_FormRequestStateFail_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0001 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('Hello');
      logInfo(`fail(message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : Hello');
      logInfo(`fail(message="Hello") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Hello');
      logInfo(`fail(message="Hello") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0001 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0002
     * @tc.name      RequestAddForm_FormRequestStateFail_0002
     * @tc.desc      FormRequestState.fail(message="hello world") yields "RequestPublishForm failed : hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_FormRequestStateFail_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0002 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('hello world');
      logInfo(`fail(message="hello world"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : hello world');
      logInfo(`fail(message="hello world") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : hello world');
      logInfo(`fail(message="hello world") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0002 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0003
     * @tc.name      RequestAddForm_FormRequestStateFail_0003
     * @tc.desc      FormRequestState.fail(message="") yields "RequestPublishForm failed : "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0003 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('');
      logInfo(`fail(message=""): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : ');
      logInfo(`fail(message="") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : ');
      logInfo(`fail(message="") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0003 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0004
     * @tc.name      RequestAddForm_FormRequestStateFail_0004
     * @tc.desc      FormRequestState.fail(message=" ") yields "RequestPublishForm failed :  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0004 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail(' ');
      logInfo(`fail(message=" "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :  ');
      logInfo(`fail(message=" ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  ');
      logInfo(`fail(message=" ") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0004 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0005
     * @tc.name      RequestAddForm_FormRequestStateFail_0005
     * @tc.desc      FormRequestState.fail(message="A") yields "RequestPublishForm failed : A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0005 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('A');
      logInfo(`fail(message="A"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : A');
      logInfo(`fail(message="A") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : A');
      logInfo(`fail(message="A") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0005 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0006
     * @tc.name      RequestAddForm_FormRequestStateFail_0006
     * @tc.desc      FormRequestState.fail(message="Sample Title 123") yields "RequestPublishForm failed : Sample Tit...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0006 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('Sample Title 123');
      logInfo(`fail(message="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : Sample Title 123');
      logInfo(`fail(message="Sample Title 123") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Sample Title 123');
      logInfo(`fail(message="Sample Title 123") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0006 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0007
     * @tc.name      RequestAddForm_FormRequestStateFail_0007
     * @tc.desc      FormRequestState.fail(message="??") yields "RequestPublishForm failed : ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0007 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('\u4e2d\u6587');
      logInfo(`fail(message="??"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : \u4e2d\u6587');
      logInfo(`fail(message="??") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : \u4e2d\u6587');
      logInfo(`fail(message="??") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0007 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0008
     * @tc.name      RequestAddForm_FormRequestStateFail_0008
     * @tc.desc      FormRequestState.fail(message="a") yields "RequestPublishForm failed : a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0008 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('a');
      logInfo(`fail(message="a"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : a');
      logInfo(`fail(message="a") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : a');
      logInfo(`fail(message="a") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0008 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0009
     * @tc.name      RequestAddForm_FormRequestStateFail_0009
     * @tc.desc      FormRequestState.fail(message="abc") yields "RequestPublishForm failed : abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0009 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('abc');
      logInfo(`fail(message="abc"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : abc');
      logInfo(`fail(message="abc") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : abc');
      logInfo(`fail(message="abc") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0009 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0010
     * @tc.name      RequestAddForm_FormRequestStateFail_0010
     * @tc.desc      FormRequestState.fail(message="Hello World") yields "RequestPublishForm failed : Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0010 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('Hello World');
      logInfo(`fail(message="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : Hello World');
      logInfo(`fail(message="Hello World") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Hello World');
      logInfo(`fail(message="Hello World") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0010 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0011
     * @tc.name      RequestAddForm_FormRequestStateFail_0011
     * @tc.desc      FormRequestState.fail(message="123") yields "RequestPublishForm failed : 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0011 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('123');
      logInfo(`fail(message="123"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 123');
      logInfo(`fail(message="123") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 123');
      logInfo(`fail(message="123") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0011 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0012
     * @tc.name      RequestAddForm_FormRequestStateFail_0012
     * @tc.desc      FormRequestState.fail(message=" Hello ") yields "RequestPublishForm failed :  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0012 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail(' Hello ');
      logInfo(`fail(message=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :  Hello ');
      logInfo(`fail(message=" Hello ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  Hello ');
      logInfo(`fail(message=" Hello ") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0012 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0013
     * @tc.name      RequestAddForm_FormRequestStateFail_0013
     * @tc.desc      FormRequestState.fail(message="HelloHello") yields "RequestPublishForm failed : HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0013 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('HelloHello');
      logInfo(`fail(message="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : HelloHello');
      logInfo(`fail(message="HelloHello") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : HelloHello');
      logInfo(`fail(message="HelloHello") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0013 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0014
     * @tc.name      RequestAddForm_FormRequestStateFail_0014
     * @tc.desc      FormRequestState.fail(message="Hello_1") yields "RequestPublishForm failed : Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0014 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('Hello_1');
      logInfo(`fail(message="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : Hello_1');
      logInfo(`fail(message="Hello_1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Hello_1');
      logInfo(`fail(message="Hello_1") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0014 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0015
     * @tc.name      RequestAddForm_FormRequestStateFail_0015
     * @tc.desc      FormRequestState.fail(message="xHello") yields "RequestPublishForm failed : xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0015 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('xHello');
      logInfo(`fail(message="xHello"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : xHello');
      logInfo(`fail(message="xHello") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : xHello');
      logInfo(`fail(message="xHello") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0015 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0016
     * @tc.name      RequestAddForm_FormRequestStateFail_0016
     * @tc.desc      FormRequestState.fail(message=" hello world ") yields "RequestPublishForm failed :  hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0016 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail(' hello world ');
      logInfo(`fail(message=" hello world "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :  hello world ');
      logInfo(`fail(message=" hello world ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  hello world ');
      logInfo(`fail(message=" hello world ") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0016 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0017
     * @tc.name      RequestAddForm_FormRequestStateFail_0017
     * @tc.desc      FormRequestState.fail(message="hello worldhello world") yields "RequestPublishForm failed : hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0017 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('hello worldhello world');
      logInfo(`fail(message="hello worldhello world"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : hello worldhello world');
      logInfo(`fail(message="hello worldhello world") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : hello worldhello world');
      logInfo(`fail(message="hello worldhello world") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0017 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0018
     * @tc.name      RequestAddForm_FormRequestStateFail_0018
     * @tc.desc      FormRequestState.fail(message="hello world_1") yields "RequestPublishForm failed : hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0018 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('hello world_1');
      logInfo(`fail(message="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : hello world_1');
      logInfo(`fail(message="hello world_1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : hello world_1');
      logInfo(`fail(message="hello world_1") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0018 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0019
     * @tc.name      RequestAddForm_FormRequestStateFail_0019
     * @tc.desc      FormRequestState.fail(message="xhello world") yields "RequestPublishForm failed : xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0019 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('xhello world');
      logInfo(`fail(message="xhello world"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : xhello world');
      logInfo(`fail(message="xhello world") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : xhello world');
      logInfo(`fail(message="xhello world") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0019 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0020
     * @tc.name      RequestAddForm_FormRequestStateFail_0020
     * @tc.desc      FormRequestState.fail(message="   ") yields "RequestPublishForm failed :    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0020 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('   ');
      logInfo(`fail(message="   "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :    ');
      logInfo(`fail(message="   ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :    ');
      logInfo(`fail(message="   ") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0020 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0021
     * @tc.name      RequestAddForm_FormRequestStateFail_0021
     * @tc.desc      FormRequestState.fail(message="  ") yields "RequestPublishForm failed :   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0021 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('  ');
      logInfo(`fail(message="  "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :   ');
      logInfo(`fail(message="  ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :   ');
      logInfo(`fail(message="  ") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0021 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0022
     * @tc.name      RequestAddForm_FormRequestStateFail_0022
     * @tc.desc      FormRequestState.fail(message=" _1") yields "RequestPublishForm failed :  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0022 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail(' _1');
      logInfo(`fail(message=" _1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :  _1');
      logInfo(`fail(message=" _1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  _1');
      logInfo(`fail(message=" _1") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0022 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0023
     * @tc.name      RequestAddForm_FormRequestStateFail_0023
     * @tc.desc      FormRequestState.fail(message="x ") yields "RequestPublishForm failed : x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0023 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('x ');
      logInfo(`fail(message="x "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : x ');
      logInfo(`fail(message="x ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : x ');
      logInfo(`fail(message="x ") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0023 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0024
     * @tc.name      RequestAddForm_FormRequestStateFail_0024
     * @tc.desc      FormRequestState.fail(message=" A ") yields "RequestPublishForm failed :  A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0024 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail(' A ');
      logInfo(`fail(message=" A "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :  A ');
      logInfo(`fail(message=" A ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  A ');
      logInfo(`fail(message=" A ") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0024 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0025
     * @tc.name      RequestAddForm_FormRequestStateFail_0025
     * @tc.desc      FormRequestState.fail(message="AA") yields "RequestPublishForm failed : AA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0025 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('AA');
      logInfo(`fail(message="AA"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : AA');
      logInfo(`fail(message="AA") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : AA');
      logInfo(`fail(message="AA") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0025 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0026
     * @tc.name      RequestAddForm_FormRequestStateFail_0026
     * @tc.desc      FormRequestState.fail(message="A_1") yields "RequestPublishForm failed : A_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0026 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('A_1');
      logInfo(`fail(message="A_1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : A_1');
      logInfo(`fail(message="A_1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : A_1');
      logInfo(`fail(message="A_1") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0026 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0027
     * @tc.name      RequestAddForm_FormRequestStateFail_0027
     * @tc.desc      FormRequestState.fail(message="xA") yields "RequestPublishForm failed : xA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0027 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('xA');
      logInfo(`fail(message="xA"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : xA');
      logInfo(`fail(message="xA") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : xA');
      logInfo(`fail(message="xA") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0027 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0028
     * @tc.name      RequestAddForm_FormRequestStateFail_0028
     * @tc.desc      FormRequestState.fail(message=" Sample Title 123 ") yields "RequestPublishForm failed :  Sample ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0028 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail(' Sample Title 123 ');
      logInfo(`fail(message=" Sample Title 123 "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :  Sample Title 123 ');
      logInfo(`fail(message=" Sample Title 123 ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  Sample Title 123 ');
      logInfo(`fail(message=" Sample Title 123 ") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0028 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0029
     * @tc.name      RequestAddForm_FormRequestStateFail_0029
     * @tc.desc      FormRequestState.fail(message="Sample Title 123Sample Title 123") yields "RequestPublishForm fai...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0029 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('Sample Title 123Sample Title 123');
      logInfo(`fail(message="Sample Title 123Sample Titl...: actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : Sample Title 123Sample Title 123');
      logInfo(`fail(message="Sample Title 123Sample Titl...: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Sample Title 123Sample Title 123');
      logInfo(`fail(message="Sample Title 123Sample Titl...: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0029 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0030
     * @tc.name      RequestAddForm_FormRequestStateFail_0030
     * @tc.desc      FormRequestState.fail(message="Sample Title 123_1") yields "RequestPublishForm failed : Sample T...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0030 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('Sample Title 123_1');
      logInfo(`fail(message="Sample Title 123_1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : Sample Title 123_1');
      logInfo(`fail(message="Sample Title 123_1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Sample Title 123_1');
      logInfo(`fail(message="Sample Title 123_1") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0030 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0031
     * @tc.name      RequestAddForm_FormRequestStateFail_0031
     * @tc.desc      FormRequestState.fail(message="xSample Title 123") yields "RequestPublishForm failed : xSample T...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0031 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('xSample Title 123');
      logInfo(`fail(message="xSample Title 123"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : xSample Title 123');
      logInfo(`fail(message="xSample Title 123") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : xSample Title 123');
      logInfo(`fail(message="xSample Title 123") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0031 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0032
     * @tc.name      RequestAddForm_FormRequestStateFail_0032
     * @tc.desc      FormRequestState.fail(message=" ?? ") yields "RequestPublishForm failed :  ?? "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0032 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail(' \u4e2d\u6587 ');
      logInfo(`fail(message=" ?? "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :  \u4e2d\u6587 ');
      logInfo(`fail(message=" ?? ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  \u4e2d\u6587 ');
      logInfo(`fail(message=" ?? ") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0032 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0033
     * @tc.name      RequestAddForm_FormRequestStateFail_0033
     * @tc.desc      FormRequestState.fail(message="????") yields "RequestPublishForm failed : ????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0033 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`fail(message="????"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : \u4e2d\u6587\u4e2d\u6587');
      logInfo(`fail(message="????") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : \u4e2d\u6587\u4e2d\u6587');
      logInfo(`fail(message="????") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0033 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0034
     * @tc.name      RequestAddForm_FormRequestStateFail_0034
     * @tc.desc      FormRequestState.fail(message="??_1") yields "RequestPublishForm failed : ??_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0034 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('\u4e2d\u6587_1');
      logInfo(`fail(message="??_1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : \u4e2d\u6587_1');
      logInfo(`fail(message="??_1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : \u4e2d\u6587_1');
      logInfo(`fail(message="??_1") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0034 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0035
     * @tc.name      RequestAddForm_FormRequestStateFail_0035
     * @tc.desc      FormRequestState.fail(message="x??") yields "RequestPublishForm failed : x??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0035 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('x\u4e2d\u6587');
      logInfo(`fail(message="x??"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : x\u4e2d\u6587');
      logInfo(`fail(message="x??") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : x\u4e2d\u6587');
      logInfo(`fail(message="x??") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0035 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0036
     * @tc.name      RequestAddForm_FormRequestStateFail_0036
     * @tc.desc      FormRequestState.fail(message=" a ") yields "RequestPublishForm failed :  a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0036 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail(' a ');
      logInfo(`fail(message=" a "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :  a ');
      logInfo(`fail(message=" a ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  a ');
      logInfo(`fail(message=" a ") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0036 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0037
     * @tc.name      RequestAddForm_FormRequestStateFail_0037
     * @tc.desc      FormRequestState.fail(message="aa") yields "RequestPublishForm failed : aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0037 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('aa');
      logInfo(`fail(message="aa"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : aa');
      logInfo(`fail(message="aa") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : aa');
      logInfo(`fail(message="aa") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0037 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0038
     * @tc.name      RequestAddForm_FormRequestStateFail_0038
     * @tc.desc      FormRequestState.fail(message="a_1") yields "RequestPublishForm failed : a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0038 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('a_1');
      logInfo(`fail(message="a_1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : a_1');
      logInfo(`fail(message="a_1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : a_1');
      logInfo(`fail(message="a_1") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0038 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0039
     * @tc.name      RequestAddForm_FormRequestStateFail_0039
     * @tc.desc      FormRequestState.fail(message="xa") yields "RequestPublishForm failed : xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0039 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('xa');
      logInfo(`fail(message="xa"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : xa');
      logInfo(`fail(message="xa") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : xa');
      logInfo(`fail(message="xa") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0039 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0040
     * @tc.name      RequestAddForm_FormRequestStateFail_0040
     * @tc.desc      FormRequestState.fail(message=" abc ") yields "RequestPublishForm failed :  abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0040 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail(' abc ');
      logInfo(`fail(message=" abc "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :  abc ');
      logInfo(`fail(message=" abc ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  abc ');
      logInfo(`fail(message=" abc ") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0040 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0041
     * @tc.name      RequestAddForm_FormRequestStateFail_0041
     * @tc.desc      FormRequestState.fail(message="abcabc") yields "RequestPublishForm failed : abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0041 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('abcabc');
      logInfo(`fail(message="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : abcabc');
      logInfo(`fail(message="abcabc") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : abcabc');
      logInfo(`fail(message="abcabc") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0041 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0042
     * @tc.name      RequestAddForm_FormRequestStateFail_0042
     * @tc.desc      FormRequestState.fail(message="abc_1") yields "RequestPublishForm failed : abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0042 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('abc_1');
      logInfo(`fail(message="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : abc_1');
      logInfo(`fail(message="abc_1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : abc_1');
      logInfo(`fail(message="abc_1") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0042 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0043
     * @tc.name      RequestAddForm_FormRequestStateFail_0043
     * @tc.desc      FormRequestState.fail(message="xabc") yields "RequestPublishForm failed : xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0043 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('xabc');
      logInfo(`fail(message="xabc"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : xabc');
      logInfo(`fail(message="xabc") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : xabc');
      logInfo(`fail(message="xabc") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0043 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0044
     * @tc.name      RequestAddForm_FormRequestStateFail_0044
     * @tc.desc      FormRequestState.fail(message=" Hello World ") yields "RequestPublishForm failed :  Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0044 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail(' Hello World ');
      logInfo(`fail(message=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :  Hello World ');
      logInfo(`fail(message=" Hello World ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  Hello World ');
      logInfo(`fail(message=" Hello World ") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0044 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0045
     * @tc.name      RequestAddForm_FormRequestStateFail_0045
     * @tc.desc      FormRequestState.fail(message="Hello WorldHello World") yields "RequestPublishForm failed : Hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0045 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('Hello WorldHello World');
      logInfo(`fail(message="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : Hello WorldHello World');
      logInfo(`fail(message="Hello WorldHello World") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Hello WorldHello World');
      logInfo(`fail(message="Hello WorldHello World") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0045 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0046
     * @tc.name      RequestAddForm_FormRequestStateFail_0046
     * @tc.desc      FormRequestState.fail(message="Hello World_1") yields "RequestPublishForm failed : Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0046 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('Hello World_1');
      logInfo(`fail(message="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : Hello World_1');
      logInfo(`fail(message="Hello World_1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Hello World_1');
      logInfo(`fail(message="Hello World_1") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0046 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0047
     * @tc.name      RequestAddForm_FormRequestStateFail_0047
     * @tc.desc      FormRequestState.fail(message="xHello World") yields "RequestPublishForm failed : xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0047 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('xHello World');
      logInfo(`fail(message="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : xHello World');
      logInfo(`fail(message="xHello World") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : xHello World');
      logInfo(`fail(message="xHello World") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0047 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0048
     * @tc.name      RequestAddForm_FormRequestStateFail_0048
     * @tc.desc      FormRequestState.fail(message=" 123 ") yields "RequestPublishForm failed :  123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0048 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail(' 123 ');
      logInfo(`fail(message=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed :  123 ');
      logInfo(`fail(message=" 123 ") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed :  123 ');
      logInfo(`fail(message=" 123 ") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0048 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0049
     * @tc.name      RequestAddForm_FormRequestStateFail_0049
     * @tc.desc      FormRequestState.fail(message="123123") yields "RequestPublishForm failed : 123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0049 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('123123');
      logInfo(`fail(message="123123"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 123123');
      logInfo(`fail(message="123123") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 123123');
      logInfo(`fail(message="123123") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0049 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0050
     * @tc.name      RequestAddForm_FormRequestStateFail_0050
     * @tc.desc      FormRequestState.fail(message="123_1") yields "RequestPublishForm failed : 123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0050 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('123_1');
      logInfo(`fail(message="123_1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 123_1');
      logInfo(`fail(message="123_1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 123_1');
      logInfo(`fail(message="123_1") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0050 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0051
     * @tc.name      RequestAddForm_FormRequestStateFail_0051
     * @tc.desc      FormRequestState.fail(message="x123") yields "RequestPublishForm failed : x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_FormRequestStateFail_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0051 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('x123');
      logInfo(`fail(message="x123"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : x123');
      logInfo(`fail(message="x123") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : x123');
      logInfo(`fail(message="x123") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0051 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0052
     * @tc.name      RequestAddForm_FormRequestStateFail_0052
     * @tc.desc      FormRequestState.fail(message="Tc9") yields "RequestPublishForm failed : Tc9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0052 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('Tc9');
      logInfo(`fail(message="Tc9"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : Tc9');
      logInfo(`fail(message="Tc9") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : Tc9');
      logInfo(`fail(message="Tc9") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0052 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0053
     * @tc.name      RequestAddForm_FormRequestStateFail_0053
     * @tc.desc      FormRequestState.fail(message="v8KM5") yields "RequestPublishForm failed : v8KM5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0053 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('v8KM5');
      logInfo(`fail(message="v8KM5"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : v8KM5');
      logInfo(`fail(message="v8KM5") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : v8KM5');
      logInfo(`fail(message="v8KM5") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0053 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0054
     * @tc.name      RequestAddForm_FormRequestStateFail_0054
     * @tc.desc      FormRequestState.fail(message="aDxy5h") yields "RequestPublishForm failed : aDxy5h"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0054 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('aDxy5h');
      logInfo(`fail(message="aDxy5h"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : aDxy5h');
      logInfo(`fail(message="aDxy5h") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : aDxy5h');
      logInfo(`fail(message="aDxy5h") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0054 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0055
     * @tc.name      RequestAddForm_FormRequestStateFail_0055
     * @tc.desc      FormRequestState.fail(message="HhG") yields "RequestPublishForm failed : HhG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0055 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('HhG');
      logInfo(`fail(message="HhG"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : HhG');
      logInfo(`fail(message="HhG") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : HhG');
      logInfo(`fail(message="HhG") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0055 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0056
     * @tc.name      RequestAddForm_FormRequestStateFail_0056
     * @tc.desc      FormRequestState.fail(message="jcLFGS") yields "RequestPublishForm failed : jcLFGS"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0056 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('jcLFGS');
      logInfo(`fail(message="jcLFGS"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : jcLFGS');
      logInfo(`fail(message="jcLFGS") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : jcLFGS');
      logInfo(`fail(message="jcLFGS") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0056 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0057
     * @tc.name      RequestAddForm_FormRequestStateFail_0057
     * @tc.desc      FormRequestState.fail(message="ZfGq") yields "RequestPublishForm failed : ZfGq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0057 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('ZfGq');
      logInfo(`fail(message="ZfGq"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : ZfGq');
      logInfo(`fail(message="ZfGq") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : ZfGq');
      logInfo(`fail(message="ZfGq") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0057 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0058
     * @tc.name      RequestAddForm_FormRequestStateFail_0058
     * @tc.desc      FormRequestState.fail(message="spGgQa") yields "RequestPublishForm failed : spGgQa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0058 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('spGgQa');
      logInfo(`fail(message="spGgQa"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : spGgQa');
      logInfo(`fail(message="spGgQa") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : spGgQa');
      logInfo(`fail(message="spGgQa") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0058 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0059
     * @tc.name      RequestAddForm_FormRequestStateFail_0059
     * @tc.desc      FormRequestState.fail(message="uklq") yields "RequestPublishForm failed : uklq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0059 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('uklq');
      logInfo(`fail(message="uklq"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : uklq');
      logInfo(`fail(message="uklq") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : uklq');
      logInfo(`fail(message="uklq") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0059 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0060
     * @tc.name      RequestAddForm_FormRequestStateFail_0060
     * @tc.desc      FormRequestState.fail(message="pUpeNHII1") yields "RequestPublishForm failed : pUpeNHII1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0060 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('pUpeNHII1');
      logInfo(`fail(message="pUpeNHII1"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : pUpeNHII1');
      logInfo(`fail(message="pUpeNHII1") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : pUpeNHII1');
      logInfo(`fail(message="pUpeNHII1") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0060 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0061
     * @tc.name      RequestAddForm_FormRequestStateFail_0061
     * @tc.desc      FormRequestState.fail(message="GloSBj5N6wnm") yields "RequestPublishForm failed : GloSBj5N6wnm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0061 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('GloSBj5N6wnm');
      logInfo(`fail(message="GloSBj5N6wnm"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : GloSBj5N6wnm');
      logInfo(`fail(message="GloSBj5N6wnm") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : GloSBj5N6wnm');
      logInfo(`fail(message="GloSBj5N6wnm") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0061 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0062
     * @tc.name      RequestAddForm_FormRequestStateFail_0062
     * @tc.desc      FormRequestState.fail(message="BOYeDo3kYd") yields "RequestPublishForm failed : BOYeDo3kYd"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0062 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('BOYeDo3kYd');
      logInfo(`fail(message="BOYeDo3kYd"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : BOYeDo3kYd');
      logInfo(`fail(message="BOYeDo3kYd") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : BOYeDo3kYd');
      logInfo(`fail(message="BOYeDo3kYd") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0062 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0063
     * @tc.name      RequestAddForm_FormRequestStateFail_0063
     * @tc.desc      FormRequestState.fail(message="8X0b0DnCfbSl") yields "RequestPublishForm failed : 8X0b0DnCfbSl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0063 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('8X0b0DnCfbSl');
      logInfo(`fail(message="8X0b0DnCfbSl"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : 8X0b0DnCfbSl');
      logInfo(`fail(message="8X0b0DnCfbSl") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : 8X0b0DnCfbSl');
      logInfo(`fail(message="8X0b0DnCfbSl") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0063 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0064
     * @tc.name      RequestAddForm_FormRequestStateFail_0064
     * @tc.desc      FormRequestState.fail(message="PQt5CuQOl") yields "RequestPublishForm failed : PQt5CuQOl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0064 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('PQt5CuQOl');
      logInfo(`fail(message="PQt5CuQOl"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : PQt5CuQOl');
      logInfo(`fail(message="PQt5CuQOl") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : PQt5CuQOl');
      logInfo(`fail(message="PQt5CuQOl") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0064 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0065
     * @tc.name      RequestAddForm_FormRequestStateFail_0065
     * @tc.desc      FormRequestState.fail(message="hCCpq") yields "RequestPublishForm failed : hCCpq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0065 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('hCCpq');
      logInfo(`fail(message="hCCpq"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : hCCpq');
      logInfo(`fail(message="hCCpq") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : hCCpq');
      logInfo(`fail(message="hCCpq") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0065 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0066
     * @tc.name      RequestAddForm_FormRequestStateFail_0066
     * @tc.desc      FormRequestState.fail(message="dM5z71ef") yields "RequestPublishForm failed : dM5z71ef"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0066 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('dM5z71ef');
      logInfo(`fail(message="dM5z71ef"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : dM5z71ef');
      logInfo(`fail(message="dM5z71ef") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : dM5z71ef');
      logInfo(`fail(message="dM5z71ef") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0066 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0067
     * @tc.name      RequestAddForm_FormRequestStateFail_0067
     * @tc.desc      FormRequestState.fail(message="RiwXI") yields "RequestPublishForm failed : RiwXI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0067 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('RiwXI');
      logInfo(`fail(message="RiwXI"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : RiwXI');
      logInfo(`fail(message="RiwXI") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : RiwXI');
      logInfo(`fail(message="RiwXI") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0067 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0068
     * @tc.name      RequestAddForm_FormRequestStateFail_0068
     * @tc.desc      FormRequestState.fail(message="mhPL") yields "RequestPublishForm failed : mhPL"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0068 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('mhPL');
      logInfo(`fail(message="mhPL"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : mhPL');
      logInfo(`fail(message="mhPL") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : mhPL');
      logInfo(`fail(message="mhPL") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0068 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0069
     * @tc.name      RequestAddForm_FormRequestStateFail_0069
     * @tc.desc      FormRequestState.fail(message="GTk4mr0") yields "RequestPublishForm failed : GTk4mr0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0069 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('GTk4mr0');
      logInfo(`fail(message="GTk4mr0"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : GTk4mr0');
      logInfo(`fail(message="GTk4mr0") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : GTk4mr0');
      logInfo(`fail(message="GTk4mr0") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0069 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0070
     * @tc.name      RequestAddForm_FormRequestStateFail_0070
     * @tc.desc      FormRequestState.fail(message="X837J") yields "RequestPublishForm failed : X837J"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0070 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('X837J');
      logInfo(`fail(message="X837J"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : X837J');
      logInfo(`fail(message="X837J") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : X837J');
      logInfo(`fail(message="X837J") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0070 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0071
     * @tc.name      RequestAddForm_FormRequestStateFail_0071
     * @tc.desc      FormRequestState.fail(message="b") yields "RequestPublishForm failed : b"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0071 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('b');
      logInfo(`fail(message="b"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : b');
      logInfo(`fail(message="b") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : b');
      logInfo(`fail(message="b") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0071 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0072
     * @tc.name      RequestAddForm_FormRequestStateFail_0072
     * @tc.desc      FormRequestState.fail(message="w") yields "RequestPublishForm failed : w"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0072 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('w');
      logInfo(`fail(message="w"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : w');
      logInfo(`fail(message="w") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : w');
      logInfo(`fail(message="w") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0072 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_REQUEST_STATE_FAIL_0073
     * @tc.name      RequestAddForm_FormRequestStateFail_0073
     * @tc.desc      FormRequestState.fail(message="gLFA6kilKLS") yields "RequestPublishForm failed : gLFA6kilKLS"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormRequestStateFail_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRequestStateFail_0073 begin`);
      const subject: FormRequestState = new FormRequestState();
      const actual: string = subject.fail('gLFA6kilKLS');
      logInfo(`fail(message="gLFA6kilKLS"): actual=${actual}`);
      expect(actual).assertEqual('RequestPublishForm failed : gLFA6kilKLS');
      logInfo(`fail(message="gLFA6kilKLS") state: subject.lastLog=${subject.lastLog}`);
      expect(subject.lastLog).assertEqual('RequestPublishForm failed : gLFA6kilKLS');
      logInfo(`fail(message="gLFA6kilKLS") state: subject.failed=${subject.failed}`);
      expect(subject.failed).assertEqual(1);
      logInfo(`${BUNDLE}FormRequestStateFail_0073 end`);
    });
  });
}
