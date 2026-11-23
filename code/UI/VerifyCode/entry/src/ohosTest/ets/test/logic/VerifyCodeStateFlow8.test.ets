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

/** Logic checks for VerifyCodeState flow (53 cases). */
export default function verifyCodeStateFlow8Test(): void {
  describe('VerifyCodeStateFlow8Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0386
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0386
     * @tc.desc      VerifyCodeState call flow attach > attach > deleteLeft > insert > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0386 begin`);
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
      const step4: string = subject.insert('DU0qGKQFe');
      logInfo(`step4 insert("DU0qGKQFe"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`attach>attach>deleteLeft>insert>deleteLef...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>attach>deleteLeft>insert>deleteLef...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>attach>deleteLeft>insert>deleteLef...: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0386 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0387
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0387
     * @tc.desc      VerifyCodeState call flow attach > attach > insert > detach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0387 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.insert('Hello WorldHello World');
      logInfo(`step3 insert("Hello WorldHello World"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      const step5: string = subject.insert(' _1');
      logInfo(`step5 insert(" _1"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`attach>attach>insert>detach>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0387 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0388
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0388
     * @tc.desc      VerifyCodeState call flow deleteLeft > attach > backPress > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0388 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('hideKeyboard');
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0388 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0389
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0389
     * @tc.desc      VerifyCodeState call flow detach > deleteLeft > detach > backPress > backPress keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0389 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.detach();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0389 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0390
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0390
     * @tc.desc      VerifyCodeState call flow attach > insert > attach > backPress > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0390 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.insert('wzRyRj54dhQ');
      logInfo(`step2 insert("wzRyRj54dhQ"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('hideKeyboard');
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`attach>insert>attach>backPress>backPress ...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>insert>attach>backPress>backPress ...: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0390 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0391
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0391
     * @tc.desc      VerifyCodeState call flow attach > insert > backPress > backPress > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0391 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.insert('4');
      logInfo(`step2 insert("4"): step2=${step2}`);
      expect(step2).assertEqual('4');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('hideKeyboard');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      subject.detach();
      logInfo(`attach>insert>backPress>backPress>detach ...: subject.codeText=${subject.codeText}`);
      expect(subject.codeText).assertEqual('4');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0391 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0392
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0392
     * @tc.desc      VerifyCodeState call flow detach > attach > attach > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0392 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertFalse();
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0392 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0393
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0393
     * @tc.desc      VerifyCodeState call flow deleteLeft > attach > attach > insert > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0393 begin`);
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
      const step4: string = subject.insert('qv');
      logInfo(`step4 insert("qv"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.insert('123_1');
      logInfo(`step5 insert("123_1"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`deleteLeft>attach>attach>insert>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`deleteLeft>attach>attach>insert>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`deleteLeft>attach>attach>insert>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(2);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0393 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0394
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0394
     * @tc.desc      VerifyCodeState call flow insert > backPress > backPress > backPress > detach keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0394 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('Erfy4x');
      logInfo(`step1 insert("Erfy4x"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0394 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0395
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0395
     * @tc.desc      VerifyCodeState call flow attach > attach > attach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0395 begin`);
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
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`attach>attach>attach>deleteLeft final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>attach>attach>deleteLeft final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0395 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0396
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0396
     * @tc.desc      VerifyCodeState call flow detach > detach > backPress > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0396 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      subject.detach();
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`detach>detach>backPress>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>detach>backPress>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0396 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0397
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0397
     * @tc.desc      VerifyCodeState call flow attach > detach > backPress > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0397 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.detach();
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0397 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0398
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0398
     * @tc.desc      VerifyCodeState call flow backPress > attach > detach > backPress > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0398 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.detach();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`backPress>attach>detach>backPress>attach ...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>attach>detach>backPress>attach ...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0398 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0399
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0399
     * @tc.desc      VerifyCodeState call flow backPress > detach > insert > detach > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0399 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      subject.detach();
      const step3: string = subject.insert('XF8ba0GGpO');
      logInfo(`step3 insert("XF8ba0GGpO"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0399 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0400
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0400
     * @tc.desc      VerifyCodeState call flow deleteLeft > detach > insert > detach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0400 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      const step3: string = subject.insert('A_1');
      logInfo(`step3 insert("A_1"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      const step5: string = subject.insert('tB');
      logInfo(`step5 insert("tB"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0400 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0401
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0401
     * @tc.desc      VerifyCodeState call flow detach > attach > backPress > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0401 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('hideKeyboard');
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0401 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0402
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0402
     * @tc.desc      VerifyCodeState call flow insert > detach > attach > insert > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0402 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('qE3nyEvGSv');
      logInfo(`step1 insert("qE3nyEvGSv"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.insert('M1V');
      logInfo(`step4 insert("M1V"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`insert>detach>attach>insert>deleteLeft final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>detach>attach>insert>deleteLeft final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`insert>detach>attach>insert>deleteLeft final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0402 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0403
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0403
     * @tc.desc      VerifyCodeState call flow backPress > attach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0403 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`backPress>attach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>attach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0403 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0404
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0404
     * @tc.desc      VerifyCodeState call flow backPress > backPress > detach > deleteLeft > attach keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0404 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      subject.detach();
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`backPress>backPress>detach>deleteLeft>att...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>backPress>detach>deleteLeft>att...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0404 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0405
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0405
     * @tc.desc      VerifyCodeState call flow insert > attach > deleteLeft > attach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0405 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('ckCAk');
      logInfo(`step1 insert("ckCAk"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`insert>attach>deleteLeft>attach>deleteLef...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>attach>deleteLeft>attach>deleteLef...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0405 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0406
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0406
     * @tc.desc      VerifyCodeState call flow attach > detach > deleteLeft > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0406 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.detach();
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0406 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0407
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0407
     * @tc.desc      VerifyCodeState call flow backPress > deleteLeft > backPress > deleteLeft > insert keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0407 begin`);
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
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.insert('hello world_1');
      logInfo(`step5 insert("hello world_1"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0407 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0408
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0408
     * @tc.desc      VerifyCodeState call flow deleteLeft > deleteLeft > attach > attach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0408 begin`);
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
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.insert('NZn6xL9PqE');
      logInfo(`step5 insert("NZn6xL9PqE"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`deleteLeft>deleteLeft>attach>attach>inser...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`deleteLeft>deleteLeft>attach>attach>inser...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`deleteLeft>deleteLeft>attach>attach>inser...: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0408 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0409
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0409
     * @tc.desc      VerifyCodeState call flow backPress > backPress > backPress > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0409 begin`);
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
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0409 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0410
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0410
     * @tc.desc      VerifyCodeState call flow backPress > backPress > insert > detach > backPress keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0410 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: string = subject.insert('5');
      logInfo(`step3 insert("5"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0410 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0411
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0411
     * @tc.desc      VerifyCodeState call flow attach > attach > attach > detach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0411 begin`);
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
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0411 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0412
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0412
     * @tc.desc      VerifyCodeState call flow attach > detach > detach > attach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0412 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.detach();
      subject.detach();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.insert('IL3');
      logInfo(`step5 insert("IL3"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`attach>detach>detach>attach>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>detach>detach>attach>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>detach>detach>attach>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0412 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0413
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0413
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > attach > backPress > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0413 begin`);
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
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`attach>deleteLeft>attach>backPress>attach...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>deleteLeft>attach>backPress>attach...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0413 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0414
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0414
     * @tc.desc      VerifyCodeState call flow detach > backPress > insert > insert > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0414 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: string = subject.insert('oye0FvI7y');
      logInfo(`step3 insert("oye0FvI7y"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.insert('md');
      logInfo(`step4 insert("md"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.insert('L1KY8');
      logInfo(`step5 insert("L1KY8"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0414 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0415
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0415
     * @tc.desc      VerifyCodeState call flow insert > insert > backPress > deleteLeft > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0415 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('vE3zi');
      logInfo(`step1 insert("vE3zi"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.insert('Hello_1');
      logInfo(`step2 insert("Hello_1"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`insert>insert>backPress>deleteLeft>attach...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>insert>backPress>deleteLeft>attach...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0415 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0416
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0416
     * @tc.desc      VerifyCodeState call flow backPress > detach > attach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0416 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      subject.detach();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`backPress>detach>attach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>detach>attach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0416 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0417
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0417
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > attach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0417 begin`);
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
      logInfo(`attach>deleteLeft>attach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>deleteLeft>attach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0417 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0418
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0418
     * @tc.desc      VerifyCodeState call flow backPress > attach > attach > attach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0418 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`backPress>attach>attach>attach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>attach>attach>attach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0418 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0419
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0419
     * @tc.desc      VerifyCodeState call flow attach > attach > backPress > backPress > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0419 begin`);
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
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0419 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0420
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0420
     * @tc.desc      VerifyCodeState call flow backPress > backPress > deleteLeft > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0420 begin`);
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
      const step4: string = subject.insert('9Tk');
      logInfo(`step4 insert("9Tk"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0420 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0421
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0421
     * @tc.desc      VerifyCodeState call flow insert > backPress > attach > attach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0421 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('4');
      logInfo(`step1 insert("4"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`insert>backPress>attach>attach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>backPress>attach>attach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0421 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0422
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0422
     * @tc.desc      VerifyCodeState call flow attach > backPress > backPress > deleteLeft > backPress keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0422 begin`);
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
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`attach>backPress>backPress>deleteLeft>bac...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0422 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0423
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0423
     * @tc.desc      VerifyCodeState call flow backPress > deleteLeft > attach > attach > backPress keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0423 begin`);
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
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('hideKeyboard');
      logInfo(`backPress>deleteLeft>attach>attach>backPr...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0423 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0424
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0424
     * @tc.desc      VerifyCodeState call flow backPress > attach > deleteLeft > backPress > deleteLeft keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0424 begin`);
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
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`backPress>attach>deleteLeft>backPress>del...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0424 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0425
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0425
     * @tc.desc      VerifyCodeState call flow attach > backPress > backPress > backPress > detach keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0425 begin`);
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
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0425 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0426
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0426
     * @tc.desc      VerifyCodeState call flow insert > detach > detach > attach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0426 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('Hello');
      logInfo(`step1 insert("Hello"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      subject.detach();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`insert>detach>detach>attach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>detach>detach>attach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0426 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0427
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0427
     * @tc.desc      VerifyCodeState call flow detach > insert > attach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0427 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.insert('pjOjwvJ8ayUn');
      logInfo(`step2 insert("pjOjwvJ8ayUn"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.insert('2O8YdemXFn');
      logInfo(`step4 insert("2O8YdemXFn"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`detach>insert>attach>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>insert>attach>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`detach>insert>attach>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0427 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0428
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0428
     * @tc.desc      VerifyCodeState call flow insert > attach > deleteLeft > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0428 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('qv');
      logInfo(`step1 insert("qv"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('hideKeyboard');
      logInfo(`insert>attach>deleteLeft>backPress final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0428 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0429
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0429
     * @tc.desc      VerifyCodeState call flow attach > backPress > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0429 begin`);
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
      logInfo(`attach>backPress>backPress final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0429 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0430
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0430
     * @tc.desc      VerifyCodeState call flow detach > detach > backPress > detach > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0430 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      subject.detach();
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      subject.detach();
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0430 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0431
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0431
     * @tc.desc      VerifyCodeState call flow attach > attach > backPress > detach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0431 begin`);
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
      subject.detach();
      const step5: string = subject.insert('Rv');
      logInfo(`step5 insert("Rv"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0431 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0432
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0432
     * @tc.desc      VerifyCodeState call flow deleteLeft > backPress > attach > detach > deleteLeft keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0432 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.detach();
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0432 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0433
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0433
     * @tc.desc      VerifyCodeState call flow backPress > attach > insert > attach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0433 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.insert('T9IkB');
      logInfo(`step3 insert("T9IkB"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`backPress>attach>insert>attach>deleteLeft...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>attach>insert>attach>deleteLeft...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`backPress>attach>insert>attach>deleteLeft...: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0433 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0434
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0434
     * @tc.desc      VerifyCodeState call flow detach > attach > attach > detach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0434 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertFalse();
      subject.detach();
      const step5: string = subject.insert('oye0FvI7y');
      logInfo(`step5 insert("oye0FvI7y"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0434 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0435
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0435
     * @tc.desc      VerifyCodeState call flow attach > insert > backPress > backPress > backPress keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0435 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.insert('n45zGr');
      logInfo(`step2 insert("n45zGr"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('hideKeyboard');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`attach>insert>backPress>backPress>backPre...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>insert>backPress>backPress>backPre...: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0435 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0436
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0436
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > backPress > attach > backPress keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0436 begin`);
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
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('hideKeyboard');
      logInfo(`attach>deleteLeft>backPress>attach>backPr...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0436 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0437
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0437
     * @tc.desc      VerifyCodeState call flow backPress > backPress > deleteLeft > attach > detach keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0437 begin`);
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
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0437 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0438
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0438
     * @tc.desc      VerifyCodeState call flow deleteLeft > attach > attach > detach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0438 begin`);
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
      subject.detach();
      const step5: string = subject.insert('XF8ba0GGpO');
      logInfo(`step5 insert("XF8ba0GGpO"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0438 end`);
    });
  });
}
