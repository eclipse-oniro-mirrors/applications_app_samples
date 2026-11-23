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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestExecution';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { VerifyCodeState } from '../model/VerifyCodeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VerifyCode]';
const BUNDLE: string = 'VerifyCode_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for VerifyCodeState flow (56 cases). */
export default function verifyCodeStateFlow2Test(): void {
  describe('VerifyCodeStateFlow2Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0060
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0060
     * @tc.desc      VerifyCodeState call flow backPress > insert > backPress > detach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0060 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.insert('zcExy0FqTb');
      logInfo(`step2 insert("zcExy0FqTb"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      subject.detach();
      const step5: string = subject.insert('8fbTIfUxBH');
      logInfo(`step5 insert("8fbTIfUxBH"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0061
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0061
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > insert > insert > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0061 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.insert('hcQVzXjf');
      logInfo(`step3 insert("hcQVzXjf"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.insert('fo7Au');
      logInfo(`step4 insert("fo7Au"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.insert('fg');
      logInfo(`step5 insert("fg"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`attach>deleteLeft>insert>insert>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>deleteLeft>insert>insert>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>deleteLeft>insert>insert>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(3);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0062
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0062
     * @tc.desc      VerifyCodeState call flow backPress > insert > backPress > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0062 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.insert('MIpAa6');
      logInfo(`step2 insert("MIpAa6"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0063
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0063
     * @tc.desc      VerifyCodeState call flow insert > attach > backPress > backPress > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0063 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('l6y');
      logInfo(`step1 insert("l6y"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('hideKeyboard');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`insert>attach>backPress>backPress>attach ...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>attach>backPress>backPress>attach ...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0064
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0064
     * @tc.desc      VerifyCodeState call flow backPress > detach > backPress > detach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0064 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      subject.detach();
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      subject.detach();
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`backPress>detach>backPress>detach>attach ...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>detach>backPress>detach>attach ...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0065
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0065
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0065 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.insert('WQxJBW');
      logInfo(`step3 insert("WQxJBW"): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`attach>deleteLeft>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>deleteLeft>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>deleteLeft>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0066
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0066
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > insert > backPress > backPress keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0066 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.insert('B0866R8lBh');
      logInfo(`step3 insert("B0866R8lBh"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('hideKeyboard');
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`attach>deleteLeft>insert>backPress>backPr...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>deleteLeft>insert>backPress>backPr...: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0067
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0067
     * @tc.desc      VerifyCodeState call flow insert > detach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0067 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('OaJFZTW');
      logInfo(`step1 insert("OaJFZTW"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`insert>detach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>detach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0068
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0068
     * @tc.desc      VerifyCodeState call flow backPress > deleteLeft > backPress > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0068 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0069
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0069
     * @tc.desc      VerifyCodeState call flow attach > detach > attach > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0069 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.detach();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('hideKeyboard');
      logInfo(`attach>detach>attach>backPress final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0070
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0070
     * @tc.desc      VerifyCodeState call flow insert > insert > deleteLeft > deleteLeft > backPress keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0070 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('2O8YdemXFn');
      logInfo(`step1 insert("2O8YdemXFn"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.insert('Hello World_1');
      logInfo(`step2 insert("Hello World_1"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0071
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0071
     * @tc.desc      VerifyCodeState call flow insert > backPress > detach > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0071 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('2O8YdemXFn');
      logInfo(`step1 insert("2O8YdemXFn"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      subject.detach();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0072
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0072
     * @tc.desc      VerifyCodeState call flow attach > detach > attach > attach > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0072 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.detach();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0073
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0073
     * @tc.desc      VerifyCodeState call flow attach > backPress > insert > deleteLeft > deleteLeft keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0073 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('hideKeyboard');
      const step3: string = subject.insert('Rud4cjyJU3');
      logInfo(`step3 insert("Rud4cjyJU3"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`attach>backPress>insert>deleteLeft>delete...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>backPress>insert>deleteLeft>delete...: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0074
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0074
     * @tc.desc      VerifyCodeState call flow detach > insert > detach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0074 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.insert('Hello World');
      logInfo(`step2 insert("Hello World"): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.detach();
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0075
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0075
     * @tc.desc      VerifyCodeState call flow backPress > deleteLeft > attach > attach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0075 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`backPress>deleteLeft>attach>attach>attach...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>deleteLeft>attach>attach>attach...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0076
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0076
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > backPress > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0076 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('hideKeyboard');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`attach>deleteLeft>backPress>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>deleteLeft>backPress>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0077
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0077
     * @tc.desc      VerifyCodeState call flow backPress > deleteLeft > deleteLeft > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0077 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0078
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0078
     * @tc.desc      VerifyCodeState call flow detach > backPress > attach > deleteLeft > deleteLeft keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0078 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`detach>backPress>attach>deleteLeft>delete...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>backPress>attach>deleteLeft>delete...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0079
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0079
     * @tc.desc      VerifyCodeState call flow backPress > backPress > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0079 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`backPress>backPress>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>backPress>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0080
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0080
     * @tc.desc      VerifyCodeState call flow deleteLeft > deleteLeft > attach > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0080 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('hideKeyboard');
      logInfo(`deleteLeft>deleteLeft>attach>backPress final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0081
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0081
     * @tc.desc      VerifyCodeState call flow insert > attach > detach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0081 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('n45zGr');
      logInfo(`step1 insert("n45zGr"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.detach();
      const step4: string = subject.insert('lV6M2FRn2QZ5');
      logInfo(`step4 insert("lV6M2FRn2QZ5"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0082
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0082
     * @tc.desc      VerifyCodeState call flow attach > attach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0082 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`attach>attach>deleteLeft final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>attach>deleteLeft final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0083
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0083
     * @tc.desc      VerifyCodeState call flow detach > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0083 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0084
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0084
     * @tc.desc      VerifyCodeState call flow attach > backPress > detach > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0084 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('hideKeyboard');
      subject.detach();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0085
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0085
     * @tc.desc      VerifyCodeState call flow attach > attach > insert > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0085 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.insert('x123');
      logInfo(`step3 insert("x123"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('hideKeyboard');
      logInfo(`attach>attach>insert>backPress final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>attach>insert>backPress final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0086
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0086
     * @tc.desc      VerifyCodeState call flow detach > insert > insert > attach > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0086 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.insert('a');
      logInfo(`step2 insert("a"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.insert('Tuk6Dn');
      logInfo(`step3 insert("Tuk6Dn"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0087
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0087
     * @tc.desc      VerifyCodeState call flow deleteLeft > deleteLeft > insert > attach > backPress keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0087 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.insert('VHZ0E');
      logInfo(`step3 insert("VHZ0E"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('hideKeyboard');
      logInfo(`deleteLeft>deleteLeft>insert>attach>backP...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0088
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0088
     * @tc.desc      VerifyCodeState call flow backPress > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0088 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0089
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0089
     * @tc.desc      VerifyCodeState call flow detach > attach > detach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0089 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.detach();
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0090
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0090
     * @tc.desc      VerifyCodeState call flow attach > insert > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0090 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.insert('OK1dw');
      logInfo(`step2 insert("OK1dw"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.insert(' ');
      logInfo(`step3 insert(" "): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`attach>insert>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>insert>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>insert>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(2);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0091
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0091
     * @tc.desc      VerifyCodeState call flow backPress > attach > insert > insert > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0091 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.insert('1XovwF5gCVt');
      logInfo(`step3 insert("1XovwF5gCVt"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.insert('FbV');
      logInfo(`step4 insert("FbV"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.insert('VHZ0E');
      logInfo(`step5 insert("VHZ0E"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`backPress>attach>insert>insert>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>attach>insert>insert>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`backPress>attach>insert>insert>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(3);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0092
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0092
     * @tc.desc      VerifyCodeState call flow detach > insert > attach > attach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0092 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.insert('De');
      logInfo(`step2 insert("De"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`detach>insert>attach>attach>deleteLeft final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>insert>attach>attach>deleteLeft final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0093
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0093
     * @tc.desc      VerifyCodeState call flow deleteLeft > deleteLeft > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0093 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`deleteLeft>deleteLeft>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`deleteLeft>deleteLeft>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0094
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0094
     * @tc.desc      VerifyCodeState call flow detach > attach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0094 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`detach>attach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>attach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0095
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0095
     * @tc.desc      VerifyCodeState call flow deleteLeft > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0095 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`deleteLeft>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`deleteLeft>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0096
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0096
     * @tc.desc      VerifyCodeState call flow insert > deleteLeft > attach > attach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0096 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('n');
      logInfo(`step1 insert("n"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`insert>deleteLeft>attach>attach>deleteLef...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>deleteLeft>attach>attach>deleteLef...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0097
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0097
     * @tc.desc      VerifyCodeState call flow detach > insert > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0097 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.insert('cDPsP3Rs');
      logInfo(`step2 insert("cDPsP3Rs"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0098
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0098
     * @tc.desc      VerifyCodeState call flow backPress > insert > backPress > backPress > attach keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0098 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.insert('i6h');
      logInfo(`step2 insert("i6h"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`backPress>insert>backPress>backPress>atta...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>insert>backPress>backPress>atta...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0099
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0099
     * @tc.desc      VerifyCodeState call flow backPress > detach > detach > deleteLeft > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0099 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      subject.detach();
      subject.detach();
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.insert('oLMq');
      logInfo(`step5 insert("oLMq"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0100
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0100
     * @tc.desc      VerifyCodeState call flow detach > deleteLeft > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0100 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.insert('5');
      logInfo(`step3 insert("5"): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0101
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0101
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > deleteLeft > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0101 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('hideKeyboard');
      logInfo(`attach>deleteLeft>deleteLeft>backPress final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0102
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0102
     * @tc.desc      VerifyCodeState call flow backPress > deleteLeft > attach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0102 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`backPress>deleteLeft>attach>deleteLeft final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>deleteLeft>attach>deleteLeft final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0103
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0103
     * @tc.desc      VerifyCodeState call flow detach > insert > deleteLeft > deleteLeft > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0103 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.insert('b');
      logInfo(`step2 insert("b"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`detach>insert>deleteLeft>deleteLeft>attac...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>insert>deleteLeft>deleteLeft>attac...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0104
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0104
     * @tc.desc      VerifyCodeState call flow attach > backPress > insert > insert > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0104 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('hideKeyboard');
      const step3: string = subject.insert('NZn6xL9PqE');
      logInfo(`step3 insert("NZn6xL9PqE"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.insert('cgMS');
      logInfo(`step4 insert("cgMS"): step4=${step4}`);
      expect(step4).assertEqual('');
      subject.detach();
      logInfo(`attach>backPress>insert>insert>detach final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(2);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0105
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0105
     * @tc.desc      VerifyCodeState call flow insert > insert > detach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0105 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('l');
      logInfo(`step1 insert("l"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.insert('NZn6xL9PqE');
      logInfo(`step2 insert("NZn6xL9PqE"): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.detach();
      const step4: string = subject.insert('AA');
      logInfo(`step4 insert("AA"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0106
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0106
     * @tc.desc      VerifyCodeState call flow insert > insert > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0106 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('vv');
      logInfo(`step1 insert("vv"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.insert('o17bKkH');
      logInfo(`step2 insert("o17bKkH"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0107
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0107
     * @tc.desc      VerifyCodeState call flow detach > detach > attach > attach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0107 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      subject.detach();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.insert('iGeOFcc6qOn');
      logInfo(`step5 insert("iGeOFcc6qOn"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`detach>detach>attach>attach>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>detach>attach>attach>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`detach>detach>attach>attach>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0108
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0108
     * @tc.desc      VerifyCodeState call flow deleteLeft > insert > attach > backPress > backPress keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0108 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.insert('4');
      logInfo(`step2 insert("4"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('hideKeyboard');
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`deleteLeft>insert>attach>backPress>backPr...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0109
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0109
     * @tc.desc      VerifyCodeState call flow attach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0109 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.insert('1');
      logInfo(`step2 insert("1"): step2=${step2}`);
      expect(step2).assertEqual('1');
      logInfo(`attach>insert final: subject.codeText=${subject.codeText}`);
      expect(subject.codeText).assertEqual('1');
      logInfo(`attach>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0110
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0110
     * @tc.desc      VerifyCodeState call flow detach > backPress > detach > deleteLeft > backPress keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0110 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      subject.detach();
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0111
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0111
     * @tc.desc      VerifyCodeState call flow attach > detach > attach > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0111 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.detach();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0112
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0112
     * @tc.desc      VerifyCodeState call flow attach > attach > backPress > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0112 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('hideKeyboard');
      const step4: string = subject.insert('o17bKkH');
      logInfo(`step4 insert("o17bKkH"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`attach>attach>backPress>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>attach>backPress>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0113
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0113
     * @tc.desc      VerifyCodeState call flow insert > backPress > detach > insert > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0113 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('WQxJBW');
      logInfo(`step1 insert("WQxJBW"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      subject.detach();
      const step4: string = subject.insert('pQBKy73DI');
      logInfo(`step4 insert("pQBKy73DI"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0114
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0114
     * @tc.desc      VerifyCodeState call flow detach > backPress > detach > insert > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0114 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      subject.detach();
      const step4: string = subject.insert(' hello world ');
      logInfo(`step4 insert(" hello world "): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.insert('bOg');
      logInfo(`step5 insert("bOg"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0115
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0115
     * @tc.desc      VerifyCodeState call flow detach > backPress > insert > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0115 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: string = subject.insert(' A ');
      logInfo(`step3 insert(" A "): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0115 end`);
    });
  });
}
