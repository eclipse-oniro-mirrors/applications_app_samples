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

/** Logic checks for VerifyCodeState flow (54 cases). */
export default function verifyCodeStateFlow9Test(): void {
  describe('VerifyCodeStateFlow9Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0439
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0439
     * @tc.desc      VerifyCodeState call flow attach > backPress > backPress > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0439 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('hideKeyboard');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0439 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0440
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0440
     * @tc.desc      VerifyCodeState call flow backPress > backPress > backPress > detach > backPress keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0440 begin`);
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
      subject.detach();
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0440 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0441
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0441
     * @tc.desc      VerifyCodeState call flow backPress > insert > detach > attach > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0441 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.insert('exK0Styd');
      logInfo(`step2 insert("exK0Styd"): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.detach();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('hideKeyboard');
      logInfo(`backPress>insert>detach>attach>backPress ...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0441 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0442
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0442
     * @tc.desc      VerifyCodeState call flow insert > detach > insert > attach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0442 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('9Tk');
      logInfo(`step1 insert("9Tk"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      const step3: string = subject.insert('FbV');
      logInfo(`step3 insert("FbV"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`insert>detach>insert>attach>deleteLeft final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>detach>insert>attach>deleteLeft final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0442 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0443
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0443
     * @tc.desc      VerifyCodeState call flow backPress > detach > attach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0443 begin`);
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
      logInfo(`backPress>detach>attach>deleteLeft final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>detach>attach>deleteLeft final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0443 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0444
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0444
     * @tc.desc      VerifyCodeState call flow detach > backPress > deleteLeft > deleteLeft > attach keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0444 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`detach>backPress>deleteLeft>deleteLeft>at...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>backPress>deleteLeft>deleteLeft>at...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0444 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0445
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0445
     * @tc.desc      VerifyCodeState call flow backPress > attach > insert > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0445 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.insert('t2ZxIOT');
      logInfo(`step3 insert("t2ZxIOT"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`backPress>attach>insert>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>attach>insert>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`backPress>attach>insert>attach final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0445 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0446
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0446
     * @tc.desc      VerifyCodeState call flow deleteLeft > detach > backPress > deleteLeft > insert keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0446 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.insert('IBMVhvfQ');
      logInfo(`step5 insert("IBMVhvfQ"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0446 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0447
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0447
     * @tc.desc      VerifyCodeState call flow detach > deleteLeft > attach > insert > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0447 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.insert('n');
      logInfo(`step4 insert("n"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.insert('Sample Title 123Sample Title 123');
      logInfo(`step5 insert("Sample Title 123Sample Titl...: step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`detach>deleteLeft>attach>insert>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>deleteLeft>attach>insert>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`detach>deleteLeft>attach>insert>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(2);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0447 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0448
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0448
     * @tc.desc      VerifyCodeState call flow attach > backPress > backPress > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0448 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('hideKeyboard');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`attach>backPress>backPress>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>backPress>backPress>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0448 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0449
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0449
     * @tc.desc      VerifyCodeState call flow attach > detach > attach > attach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0449 begin`);
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
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`attach>detach>attach>attach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>detach>attach>attach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0449 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0450
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0450
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > backPress > deleteLeft > insert keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0450 begin`);
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
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.insert('xHello');
      logInfo(`step5 insert("xHello"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`attach>deleteLeft>backPress>deleteLeft>in...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>deleteLeft>backPress>deleteLeft>in...: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0450 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0451
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0451
     * @tc.desc      VerifyCodeState call flow detach > attach > deleteLeft > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0451 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`detach>attach>deleteLeft>deleteLeft final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>attach>deleteLeft>deleteLeft final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0451 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0452
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0452
     * @tc.desc      VerifyCodeState call flow backPress > attach > insert > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0452 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.insert('IBMVhvfQ');
      logInfo(`step3 insert("IBMVhvfQ"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      logInfo(`backPress>attach>insert>detach final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0452 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0453
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0453
     * @tc.desc      VerifyCodeState call flow backPress > insert > attach > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0453 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.insert('fsVnoIdtr');
      logInfo(`step2 insert("fsVnoIdtr"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0453 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0454
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0454
     * @tc.desc      VerifyCodeState call flow detach > attach > insert > detach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0454 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.insert('exK0Styd');
      logInfo(`step3 insert("exK0Styd"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`detach>attach>insert>detach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>attach>insert>detach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`detach>attach>insert>detach>attach final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0454 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0455
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0455
     * @tc.desc      VerifyCodeState call flow attach > attach > attach > detach > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0455 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertFalse();
      subject.detach();
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0455 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0456
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0456
     * @tc.desc      VerifyCodeState call flow attach > detach > insert > detach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0456 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.detach();
      const step3: string = subject.insert('a_1');
      logInfo(`step3 insert("a_1"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      const step5: string = subject.insert('qG3zSDMkBTcU');
      logInfo(`step5 insert("qG3zSDMkBTcU"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0456 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0457
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0457
     * @tc.desc      VerifyCodeState call flow detach > backPress > backPress > deleteLeft > insert keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0457 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.insert('l');
      logInfo(`step5 insert("l"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0457 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0458
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0458
     * @tc.desc      VerifyCodeState call flow insert > attach > backPress > deleteLeft > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0458 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('Ukk0LQ23K60');
      logInfo(`step1 insert("Ukk0LQ23K60"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('hideKeyboard');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0458 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0459
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0459
     * @tc.desc      VerifyCodeState call flow backPress > insert > insert > backPress > backPress keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0459 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.insert('\u4e2d\u6587_1');
      logInfo(`step2 insert("??_1"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.insert('HelloHello');
      logInfo(`step3 insert("HelloHello"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0459 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0460
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0460
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > insert > attach > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0460 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.insert('\u4e2d\u6587');
      logInfo(`step3 insert("??"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('hideKeyboard');
      logInfo(`attach>deleteLeft>insert>attach>backPress...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>deleteLeft>insert>attach>backPress...: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0460 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0461
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0461
     * @tc.desc      VerifyCodeState call flow deleteLeft > attach > attach > backPress > deleteLeft keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0461 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('hideKeyboard');
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`deleteLeft>attach>attach>backPress>delete...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0461 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0462
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0462
     * @tc.desc      VerifyCodeState call flow deleteLeft > insert > deleteLeft > detach > backPress keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0462 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.insert('L1KY8');
      logInfo(`step2 insert("L1KY8"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0462 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0463
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0463
     * @tc.desc      VerifyCodeState call flow insert > deleteLeft > detach > backPress > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0463 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('123123');
      logInfo(`step1 insert("123123"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.detach();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`insert>deleteLeft>detach>backPress>attach...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>deleteLeft>detach>backPress>attach...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0463 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0464
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0464
     * @tc.desc      VerifyCodeState call flow insert > detach > insert > detach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0464 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('8Nc');
      logInfo(`step1 insert("8Nc"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      const step3: string = subject.insert('5');
      logInfo(`step3 insert("5"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`insert>detach>insert>detach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>detach>insert>detach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0464 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0465
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0465
     * @tc.desc      VerifyCodeState call flow insert > detach > attach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0465 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('pjOjwvJ8ayUn');
      logInfo(`step1 insert("pjOjwvJ8ayUn"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.insert('WduGmZ62n');
      logInfo(`step4 insert("WduGmZ62n"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`insert>detach>attach>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>detach>attach>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`insert>detach>attach>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0465 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0466
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0466
     * @tc.desc      VerifyCodeState call flow insert > insert > attach > deleteLeft > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0466 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('2Rrf0UI');
      logInfo(`step1 insert("2Rrf0UI"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.insert('FbV');
      logInfo(`step2 insert("FbV"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0466 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0467
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0467
     * @tc.desc      VerifyCodeState call flow backPress > backPress > deleteLeft > backPress > deleteLeft keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0467 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0467 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0468
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0468
     * @tc.desc      VerifyCodeState call flow insert > backPress > insert > detach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0468 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('HelloHello');
      logInfo(`step1 insert("HelloHello"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: string = subject.insert('XF8ba0GGpO');
      logInfo(`step3 insert("XF8ba0GGpO"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      const step5: string = subject.insert('NZn6xL9PqE');
      logInfo(`step5 insert("NZn6xL9PqE"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0468 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0469
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0469
     * @tc.desc      VerifyCodeState call flow attach > detach > insert > attach > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0469 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.detach();
      const step3: string = subject.insert('v');
      logInfo(`step3 insert("v"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('hideKeyboard');
      logInfo(`attach>detach>insert>attach>backPress final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0469 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0470
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0470
     * @tc.desc      VerifyCodeState call flow attach > insert > detach > deleteLeft > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0470 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.insert('lV6M2FRn2QZ5');
      logInfo(`step2 insert("lV6M2FRn2QZ5"): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.detach();
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`attach>insert>detach>deleteLeft>deleteLef...: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0470 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0471
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0471
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > attach > deleteLeft > backPress keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0471 begin`);
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
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('hideKeyboard');
      logInfo(`attach>deleteLeft>attach>deleteLeft>backP...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0471 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0472
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0472
     * @tc.desc      VerifyCodeState call flow detach > detach > backPress > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0472 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      subject.detach();
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0472 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0473
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0473
     * @tc.desc      VerifyCodeState call flow detach > insert > deleteLeft > detach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0473 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.insert('5');
      logInfo(`step2 insert("5"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`detach>insert>deleteLeft>detach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>insert>deleteLeft>detach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0473 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0474
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0474
     * @tc.desc      VerifyCodeState call flow backPress > attach > deleteLeft > backPress > backPress keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0474 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('hideKeyboard');
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`backPress>attach>deleteLeft>backPress>bac...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0474 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0475
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0475
     * @tc.desc      VerifyCodeState call flow deleteLeft > deleteLeft > detach > detach > deleteLeft keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0475 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.detach();
      subject.detach();
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0475 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0476
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0476
     * @tc.desc      VerifyCodeState call flow detach > backPress > attach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0476 begin`);
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
      logInfo(`detach>backPress>attach>deleteLeft final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>backPress>attach>deleteLeft final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0476 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0477
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0477
     * @tc.desc      VerifyCodeState call flow deleteLeft > backPress > detach > backPress > insert keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0477 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      subject.detach();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      const step5: string = subject.insert('fg');
      logInfo(`step5 insert("fg"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0477 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0478
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0478
     * @tc.desc      VerifyCodeState call flow attach > insert > backPress > insert > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0478 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.insert('x\u4e2d\u6587');
      logInfo(`step2 insert("x??"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('hideKeyboard');
      const step4: string = subject.insert('hello world');
      logInfo(`step4 insert("hello world"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`attach>insert>backPress>insert>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>insert>backPress>insert>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>insert>backPress>insert>attach final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(2);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0478 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0479
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0479
     * @tc.desc      VerifyCodeState call flow insert > attach > insert > deleteLeft > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0479 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('LU');
      logInfo(`step1 insert("LU"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.insert('\u4e2d\u6587_1');
      logInfo(`step3 insert("??_1"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`insert>attach>insert>deleteLeft>deleteLef...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>attach>insert>deleteLeft>deleteLef...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`insert>attach>insert>deleteLeft>deleteLef...: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0479 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0480
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0480
     * @tc.desc      VerifyCodeState call flow deleteLeft > insert > detach > backPress > backPress keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0480 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.insert('B0866R8lBh');
      logInfo(`step2 insert("B0866R8lBh"): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.detach();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0480 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0481
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0481
     * @tc.desc      VerifyCodeState call flow detach > deleteLeft > attach > backPress > backPress keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0481 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
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
      logInfo(`detach>deleteLeft>attach>backPress>backPr...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0481 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0482
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0482
     * @tc.desc      VerifyCodeState call flow attach > insert > detach > attach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0482 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.insert('md');
      logInfo(`step2 insert("md"): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.detach();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.insert('bOg');
      logInfo(`step5 insert("bOg"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`attach>insert>detach>attach>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>insert>detach>attach>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>insert>detach>attach>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(2);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0482 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0483
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0483
     * @tc.desc      VerifyCodeState call flow detach > deleteLeft > deleteLeft > detach > deleteLeft keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0483 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0483 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0484
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0484
     * @tc.desc      VerifyCodeState call flow insert > detach > detach > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0484 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('9Tk');
      logInfo(`step1 insert("9Tk"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      subject.detach();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0484 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0485
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0485
     * @tc.desc      VerifyCodeState call flow detach > deleteLeft > backPress > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0485 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`detach>deleteLeft>backPress>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>deleteLeft>backPress>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0485 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0486
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0486
     * @tc.desc      VerifyCodeState call flow attach > detach > insert > insert > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0486 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.detach();
      const step3: string = subject.insert('IBMVhvfQ');
      logInfo(`step3 insert("IBMVhvfQ"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.insert('2Rrf0UI');
      logInfo(`step4 insert("2Rrf0UI"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0486 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0487
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0487
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > attach > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0487 begin`);
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
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('hideKeyboard');
      logInfo(`attach>deleteLeft>attach>backPress final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0487 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0488
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0488
     * @tc.desc      VerifyCodeState call flow detach > detach > attach > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0488 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      subject.detach();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0488 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0489
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0489
     * @tc.desc      VerifyCodeState call flow attach > backPress > deleteLeft > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0489 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('hideKeyboard');
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.insert('PZOVWNj');
      logInfo(`step4 insert("PZOVWNj"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`attach>backPress>deleteLeft>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>backPress>deleteLeft>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0489 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0490
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0490
     * @tc.desc      VerifyCodeState call flow backPress > detach > deleteLeft > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0490 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      subject.detach();
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`backPress>detach>deleteLeft>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>detach>deleteLeft>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0490 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0491
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0491
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > insert > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0491 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.insert('2Rrf0UI');
      logInfo(`step3 insert("2Rrf0UI"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      logInfo(`attach>deleteLeft>insert>detach final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0491 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0492
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0492
     * @tc.desc      VerifyCodeState call flow detach > insert > deleteLeft > deleteLeft > backPress keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0492 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.insert(' hello world ');
      logInfo(`step2 insert(" hello world "): step2=${step2}`);
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
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0492 end`);
    });
  });
}
