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

/** Logic checks for VerifyCodeState flow (59 cases). */
export default function verifyCodeStateFlowTest(): void {
  describe('VerifyCodeStateFlowTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0001
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0001
     * @tc.desc      VerifyCodeState call flow attach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_VerifyCodeStateFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0001 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.insert('Ukk0LQ23K60');
      logInfo(`step2 insert("Ukk0LQ23K60"): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`attach>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0002
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0002
     * @tc.desc      VerifyCodeState call flow attach > insert > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_VerifyCodeStateFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0002 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.insert('T9');
      logInfo(`step2 insert("T9"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`attach>insert>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>insert>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>insert>attach final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0003
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0003
     * @tc.desc      VerifyCodeState call flow attach > insert > insert > attach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0003 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.insert('hello world');
      logInfo(`step2 insert("hello world"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.insert('n45zGr');
      logInfo(`step3 insert("n45zGr"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.insert('qv');
      logInfo(`step5 insert("qv"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`attach>insert>insert>attach>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>insert>insert>attach>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>insert>insert>attach>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(3);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0004
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0004
     * @tc.desc      VerifyCodeState call flow deleteLeft > detach > backPress > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0004 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0005
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0005
     * @tc.desc      VerifyCodeState call flow deleteLeft > detach > attach > detach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0005 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.detach();
      const step5: string = subject.insert('bOg');
      logInfo(`step5 insert("bOg"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0006
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0006
     * @tc.desc      VerifyCodeState call flow attach > detach > detach > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0006 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.detach();
      subject.detach();
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0007
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0007
     * @tc.desc      VerifyCodeState call flow backPress > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0007 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`backPress>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0008
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0008
     * @tc.desc      VerifyCodeState call flow insert > backPress > insert > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0008 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('A');
      logInfo(`step1 insert("A"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: string = subject.insert('xSample Title 123');
      logInfo(`step3 insert("xSample Title 123"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.insert('GvIDW');
      logInfo(`step4 insert("GvIDW"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0009
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0009
     * @tc.desc      VerifyCodeState call flow deleteLeft > deleteLeft > detach > detach > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0009 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.detach();
      subject.detach();
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0010
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0010
     * @tc.desc      VerifyCodeState call flow deleteLeft > deleteLeft > insert > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0010 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.insert('zcExy0FqTb');
      logInfo(`step3 insert("zcExy0FqTb"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0011
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0011
     * @tc.desc      VerifyCodeState call flow deleteLeft > backPress > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0011 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: string = subject.insert('yl6rGmPErbJ');
      logInfo(`step3 insert("yl6rGmPErbJ"): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0012
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0012
     * @tc.desc      VerifyCodeState call flow attach > backPress > attach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0012 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('hideKeyboard');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`attach>backPress>attach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>backPress>attach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0013
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0013
     * @tc.desc      VerifyCodeState call flow backPress > insert > deleteLeft > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0013 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.insert('\u4e2d\u6587');
      logInfo(`step2 insert("??"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0014
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0014
     * @tc.desc      VerifyCodeState call flow insert > deleteLeft > insert > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0014 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('geSE0cF0TN6Q');
      logInfo(`step1 insert("geSE0cF0TN6Q"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.insert('Ow');
      logInfo(`step3 insert("Ow"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0015
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0015
     * @tc.desc      VerifyCodeState call flow deleteLeft > backPress > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0015 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0016
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0016
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > attach > attach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0016 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.insert('Ow');
      logInfo(`step5 insert("Ow"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`attach>deleteLeft>attach>attach>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>deleteLeft>attach>attach>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>deleteLeft>attach>attach>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0017
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0017
     * @tc.desc      VerifyCodeState call flow insert > detach > attach > deleteLeft > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0017 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('T9');
      logInfo(`step1 insert("T9"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('hideKeyboard');
      logInfo(`insert>detach>attach>deleteLeft>backPress...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0018
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0018
     * @tc.desc      VerifyCodeState call flow detach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0018 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`detach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0019
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0019
     * @tc.desc      VerifyCodeState call flow attach > attach > detach > insert > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0019 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertFalse();
      subject.detach();
      const step4: string = subject.insert('x123');
      logInfo(`step4 insert("x123"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0020
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0020
     * @tc.desc      VerifyCodeState call flow insert > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0020 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('SY');
      logInfo(`step1 insert("SY"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0021
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0021
     * @tc.desc      VerifyCodeState call flow attach > attach > deleteLeft > detach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0021 begin`);
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
      subject.detach();
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0022
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0022
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0022 begin`);
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
      logInfo(`attach>deleteLeft>backPress final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0023
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0023
     * @tc.desc      VerifyCodeState call flow attach > attach > backPress > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0023 begin`);
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
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      logInfo(`attach>attach>backPress>backPress final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0024
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0024
     * @tc.desc      VerifyCodeState call flow attach > detach > detach > attach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0024 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.detach();
      subject.detach();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`attach>detach>detach>attach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>detach>detach>attach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0025
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0025
     * @tc.desc      VerifyCodeState call flow detach > insert > attach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0025 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.insert('\u4e2d\u6587');
      logInfo(`step2 insert("??"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`detach>insert>attach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>insert>attach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0026
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0026
     * @tc.desc      VerifyCodeState call flow backPress > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0026 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0027
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0027
     * @tc.desc      VerifyCodeState call flow detach > attach > backPress > backPress > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0027 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
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
      logInfo(`detach>attach>backPress>backPress>attach ...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>attach>backPress>backPress>attach ...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0028
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0028
     * @tc.desc      VerifyCodeState call flow insert > backPress > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0028 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('hMSwhZMXq');
      logInfo(`step1 insert("hMSwhZMXq"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`insert>backPress>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>backPress>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0029
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0029
     * @tc.desc      VerifyCodeState call flow detach > attach > deleteLeft > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0029 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0030
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0030
     * @tc.desc      VerifyCodeState call flow deleteLeft > attach > insert > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0030 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.insert('geSE0cF0TN6Q');
      logInfo(`step3 insert("geSE0cF0TN6Q"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('hideKeyboard');
      logInfo(`deleteLeft>attach>insert>backPress final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`deleteLeft>attach>insert>backPress final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0031
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0031
     * @tc.desc      VerifyCodeState call flow detach > insert > detach > attach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0031 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.insert('rIaRqqjTBw');
      logInfo(`step2 insert("rIaRqqjTBw"): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.detach();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.insert('SY');
      logInfo(`step5 insert("SY"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`detach>insert>detach>attach>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>insert>detach>attach>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`detach>insert>detach>attach>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0032
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0032
     * @tc.desc      VerifyCodeState call flow insert > insert > detach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0032 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('qKiOfmxM');
      logInfo(`step1 insert("qKiOfmxM"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.insert('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`step2 insert("????"): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.detach();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`insert>insert>detach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>insert>detach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0033
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0033
     * @tc.desc      VerifyCodeState call flow detach > backPress > attach > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0033 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('hideKeyboard');
      logInfo(`detach>backPress>attach>backPress final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0034
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0034
     * @tc.desc      VerifyCodeState call flow detach > detach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0034 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      subject.detach();
      const step3: string = subject.insert('tB');
      logInfo(`step3 insert("tB"): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0035
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0035
     * @tc.desc      VerifyCodeState call flow backPress > deleteLeft > deleteLeft > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0035 begin`);
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
      const step4: string = subject.insert('2O8YdemXFn');
      logInfo(`step4 insert("2O8YdemXFn"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0036
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0036
     * @tc.desc      VerifyCodeState call flow detach > detach > insert > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0036 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      subject.detach();
      const step3: string = subject.insert('A_1');
      logInfo(`step3 insert("A_1"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.insert('4');
      logInfo(`step4 insert("4"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0037
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0037
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > deleteLeft > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0037 begin`);
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
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0038
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0038
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0038 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`attach>deleteLeft final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>deleteLeft final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0039
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0039
     * @tc.desc      VerifyCodeState call flow detach > attach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0039 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.insert(' hello world ');
      logInfo(`step3 insert(" hello world "): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`detach>attach>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>attach>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`detach>attach>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0040
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0040
     * @tc.desc      VerifyCodeState call flow detach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0040 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0041
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0041
     * @tc.desc      VerifyCodeState call flow backPress > attach > insert > detach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0041 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.insert('OK1dw');
      logInfo(`step3 insert("OK1dw"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      const step5: string = subject.insert(' Hello ');
      logInfo(`step5 insert(" Hello "): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`backPress>attach>insert>detach>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0042
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0042
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > detach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0042 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.detach();
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0043
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0043
     * @tc.desc      VerifyCodeState call flow backPress > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0043 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0044
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0044
     * @tc.desc      VerifyCodeState call flow insert > detach > insert > detach > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0044 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('VHZ0E');
      logInfo(`step1 insert("VHZ0E"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      const step3: string = subject.insert('lX');
      logInfo(`step3 insert("lX"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0045
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0045
     * @tc.desc      VerifyCodeState call flow deleteLeft > insert > insert > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0045 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.insert('fo7Au');
      logInfo(`step2 insert("fo7Au"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.insert('n');
      logInfo(`step3 insert("n"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.insert('Hello World');
      logInfo(`step4 insert("Hello World"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0046
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0046
     * @tc.desc      VerifyCodeState call flow insert > attach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0046 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('WdSlvp');
      logInfo(`step1 insert("WdSlvp"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`insert>attach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>attach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0047
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0047
     * @tc.desc      VerifyCodeState call flow backPress > attach > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0047 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0048
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0048
     * @tc.desc      VerifyCodeState call flow insert > detach > deleteLeft > backPress > deleteLeft keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0048 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('LU');
      logInfo(`step1 insert("LU"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0049
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0049
     * @tc.desc      VerifyCodeState call flow backPress > insert > deleteLeft > insert > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0049 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.insert('jDmYVO4Lj');
      logInfo(`step2 insert("jDmYVO4Lj"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.insert('IBMVhvfQ');
      logInfo(`step4 insert("IBMVhvfQ"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`backPress>insert>deleteLeft>insert>attach...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>insert>deleteLeft>insert>attach...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0050
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0050
     * @tc.desc      VerifyCodeState call flow detach > deleteLeft > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0050 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`detach>deleteLeft>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>deleteLeft>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0051
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0051
     * @tc.desc      VerifyCodeState call flow insert > detach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0051 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('cgMS');
      logInfo(`step1 insert("cgMS"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      const step3: string = subject.insert('hello worldhello world');
      logInfo(`step3 insert("hello worldhello world"): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0052
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0052
     * @tc.desc      VerifyCodeState call flow insert > deleteLeft > insert > deleteLeft > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0052 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert(' _1');
      logInfo(`step1 insert(" _1"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.insert('x\u4e2d\u6587');
      logInfo(`step3 insert("x??"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`insert>deleteLeft>insert>deleteLeft>attac...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>deleteLeft>insert>deleteLeft>attac...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0053
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0053
     * @tc.desc      VerifyCodeState call flow attach > attach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0053 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.insert('fj');
      logInfo(`step3 insert("fj"): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`attach>attach>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>attach>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>attach>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0054
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0054
     * @tc.desc      VerifyCodeState call flow backPress > insert > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0054 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.insert('   ');
      logInfo(`step2 insert("   "): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0055
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0055
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > insert > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0055 begin`);
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
      const step4: string = subject.insert('xHello World');
      logInfo(`step4 insert("xHello World"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`attach>deleteLeft>insert>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>deleteLeft>insert>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>deleteLeft>insert>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(2);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0056
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0056
     * @tc.desc      VerifyCodeState call flow insert > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0056 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('sZD');
      logInfo(`step1 insert("sZD"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0057
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0057
     * @tc.desc      VerifyCodeState call flow backPress > backPress > backPress > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0057 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: string = subject.insert('rFlz');
      logInfo(`step4 insert("rFlz"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0058
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0058
     * @tc.desc      VerifyCodeState call flow backPress > detach > attach > deleteLeft > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0058 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      subject.detach();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0059
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0059
     * @tc.desc      VerifyCodeState call flow insert > detach > attach > attach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0059 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('AA');
      logInfo(`step1 insert("AA"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`insert>detach>attach>attach>deleteLeft final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>detach>attach>attach>deleteLeft final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0059 end`);
    });
  });
}
