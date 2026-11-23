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

/** Logic checks for VerifyCodeState flow (55 cases). */
export default function verifyCodeStateFlow6Test(): void {
  describe('VerifyCodeStateFlow6Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0279
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0279
     * @tc.desc      VerifyCodeState call flow deleteLeft > detach > attach > deleteLeft > deleteLeft keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0279 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`deleteLeft>detach>attach>deleteLeft>delet...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`deleteLeft>detach>attach>deleteLeft>delet...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0279 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0280
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0280
     * @tc.desc      VerifyCodeState call flow attach > backPress > detach > deleteLeft > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0280 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('hideKeyboard');
      subject.detach();
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0280 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0281
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0281
     * @tc.desc      VerifyCodeState call flow insert > attach > insert > insert > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0281 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('7OdY8qdwrpvt');
      logInfo(`step1 insert("7OdY8qdwrpvt"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.insert('zYY');
      logInfo(`step3 insert("zYY"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.insert('GvIDW');
      logInfo(`step4 insert("GvIDW"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.insert('Hello_1');
      logInfo(`step5 insert("Hello_1"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`insert>attach>insert>insert>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>attach>insert>insert>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`insert>attach>insert>insert>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(3);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0281 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0282
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0282
     * @tc.desc      VerifyCodeState call flow detach > attach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0282 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`detach>attach>deleteLeft final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>attach>deleteLeft final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0282 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0283
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0283
     * @tc.desc      VerifyCodeState call flow attach > detach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0283 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.detach();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`attach>detach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>detach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0283 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0284
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0284
     * @tc.desc      VerifyCodeState call flow detach > backPress > backPress > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0284 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`detach>backPress>backPress>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>backPress>backPress>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0284 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0285
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0285
     * @tc.desc      VerifyCodeState call flow backPress > attach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0285 begin`);
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
      logInfo(`backPress>attach>deleteLeft final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>attach>deleteLeft final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0285 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0286
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0286
     * @tc.desc      VerifyCodeState call flow backPress > attach > backPress > backPress > insert keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0286 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('hideKeyboard');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      const step5: string = subject.insert('hello worldhello world');
      logInfo(`step5 insert("hello worldhello world"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`backPress>attach>backPress>backPress>inse...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`backPress>attach>backPress>backPress>inse...: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0286 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0287
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0287
     * @tc.desc      VerifyCodeState call flow deleteLeft > attach > attach > attach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0287 begin`);
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
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.insert('123_1');
      logInfo(`step5 insert("123_1"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`deleteLeft>attach>attach>attach>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`deleteLeft>attach>attach>attach>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`deleteLeft>attach>attach>attach>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0287 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0288
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0288
     * @tc.desc      VerifyCodeState call flow insert > deleteLeft > backPress > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0288 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('B0866R8lBh');
      logInfo(`step1 insert("B0866R8lBh"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0288 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0289
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0289
     * @tc.desc      VerifyCodeState call flow backPress > attach > backPress > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0289 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('hideKeyboard');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`backPress>attach>backPress>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>attach>backPress>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0289 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0290
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0290
     * @tc.desc      VerifyCodeState call flow detach > backPress > deleteLeft > detach > deleteLeft keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0290 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0290 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0291
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0291
     * @tc.desc      VerifyCodeState call flow attach > detach > detach > backPress > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0291 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.detach();
      subject.detach();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      const step5: string = subject.insert('V8EFgJ');
      logInfo(`step5 insert("V8EFgJ"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0291 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0292
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0292
     * @tc.desc      VerifyCodeState call flow backPress > detach > insert > detach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0292 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      subject.detach();
      const step3: string = subject.insert('WDkoEyD');
      logInfo(`step3 insert("WDkoEyD"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`backPress>detach>insert>detach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>detach>insert>detach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0292 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0293
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0293
     * @tc.desc      VerifyCodeState call flow detach > attach > backPress > attach > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0293 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('hideKeyboard');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0293 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0294
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0294
     * @tc.desc      VerifyCodeState call flow insert > backPress > attach > attach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0294 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('0OrRrt');
      logInfo(`step1 insert("0OrRrt"): step1=${step1}`);
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
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`insert>backPress>attach>attach>deleteLeft...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>backPress>attach>attach>deleteLeft...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0294 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0295
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0295
     * @tc.desc      VerifyCodeState call flow deleteLeft > deleteLeft > deleteLeft > detach > attach keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0295 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`deleteLeft>deleteLeft>deleteLeft>detach>a...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`deleteLeft>deleteLeft>deleteLeft>detach>a...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0295 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0296
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0296
     * @tc.desc      VerifyCodeState call flow backPress > detach > detach > backPress > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0296 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      subject.detach();
      subject.detach();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      const step5: string = subject.insert('LnwFgXugMkca');
      logInfo(`step5 insert("LnwFgXugMkca"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0296 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0297
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0297
     * @tc.desc      VerifyCodeState call flow insert > attach > insert > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0297 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('123123');
      logInfo(`step1 insert("123123"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.insert('7A40MOPsV');
      logInfo(`step3 insert("7A40MOPsV"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      logInfo(`insert>attach>insert>detach final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0297 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0298
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0298
     * @tc.desc      VerifyCodeState call flow insert > insert > attach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0298 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('9Tk');
      logInfo(`step1 insert("9Tk"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.insert('xabc');
      logInfo(`step2 insert("xabc"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`insert>insert>attach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`insert>insert>attach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0298 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0299
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0299
     * @tc.desc      VerifyCodeState call flow detach > deleteLeft > backPress > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0299 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.deleteLeft();
      logInfo(`step2 deleteLeft(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0299 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0300
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0300
     * @tc.desc      VerifyCodeState call flow backPress > detach > deleteLeft > deleteLeft > insert keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0300 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      subject.detach();
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.insert('123');
      logInfo(`step5 insert("123"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0300 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0301
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0301
     * @tc.desc      VerifyCodeState call flow attach > insert > detach > backPress > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0301 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.insert('md');
      logInfo(`step2 insert("md"): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.detach();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`attach>insert>detach>backPress>deleteLeft...: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0301 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0302
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0302
     * @tc.desc      VerifyCodeState call flow detach > detach > attach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0302 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      subject.detach();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.insert('ujAXMb3g9g8o');
      logInfo(`step4 insert("ujAXMb3g9g8o"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`detach>detach>attach>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>detach>attach>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`detach>detach>attach>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0302 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0303
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0303
     * @tc.desc      VerifyCodeState call flow attach > detach > detach > deleteLeft > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0303 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.detach();
      subject.detach();
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0303 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0304
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0304
     * @tc.desc      VerifyCodeState call flow backPress > deleteLeft > attach > backPress > attach keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0304 begin`);
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
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('hideKeyboard');
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`backPress>deleteLeft>attach>backPress>att...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>deleteLeft>attach>backPress>att...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0304 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0305
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0305
     * @tc.desc      VerifyCodeState call flow backPress > backPress > attach > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0305 begin`);
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
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0305 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0306
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0306
     * @tc.desc      VerifyCodeState call flow detach > detach > deleteLeft > deleteLeft > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0306 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      subject.detach();
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.insert('hello world');
      logInfo(`step5 insert("hello world"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0306 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0307
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0307
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > attach > detach > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0307 begin`);
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
      subject.detach();
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0307 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0308
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0308
     * @tc.desc      VerifyCodeState call flow deleteLeft > insert > attach > detach > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0308 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.insert('s2XnK');
      logInfo(`step2 insert("s2XnK"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.detach();
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0308 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0309
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0309
     * @tc.desc      VerifyCodeState call flow detach > insert > detach > insert > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0309 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.insert('8Nc');
      logInfo(`step2 insert("8Nc"): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.detach();
      const step4: string = subject.insert('8');
      logInfo(`step4 insert("8"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.insert('rFlz');
      logInfo(`step5 insert("rFlz"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0309 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0310
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0310
     * @tc.desc      VerifyCodeState call flow backPress > detach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0310 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      subject.detach();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`backPress>detach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>detach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0310 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0311
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0311
     * @tc.desc      VerifyCodeState call flow detach > detach > attach > deleteLeft keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0311 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      subject.detach();
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`detach>detach>attach>deleteLeft final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>detach>attach>deleteLeft final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0311 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0312
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0312
     * @tc.desc      VerifyCodeState call flow detach > backPress > detach > backPress > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0312 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      subject.detach();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`detach>backPress>detach>backPress>attach ...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>backPress>detach>backPress>attach ...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0312 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0313
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0313
     * @tc.desc      VerifyCodeState call flow attach > deleteLeft > attach > detach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0313 begin`);
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
      subject.detach();
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`attach>deleteLeft>attach>detach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>deleteLeft>attach>detach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0313 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0314
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0314
     * @tc.desc      VerifyCodeState call flow backPress > detach > insert > backPress > detach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0314 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      subject.detach();
      const step3: string = subject.insert('Sample Title 123Sample Title 123');
      logInfo(`step3 insert("Sample Title 123Sample Titl...: step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      subject.detach();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0314 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0315
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0315
     * @tc.desc      VerifyCodeState call flow detach > attach > deleteLeft > detach > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0315 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.deleteLeft();
      logInfo(`step3 deleteLeft(): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0315 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0316
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0316
     * @tc.desc      VerifyCodeState call flow attach > insert > attach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0316 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.insert('tB');
      logInfo(`step2 insert("tB"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`attach>insert>attach>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`attach>insert>attach>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>insert>attach>attach final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0316 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0317
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0317
     * @tc.desc      VerifyCodeState call flow deleteLeft > detach > backPress > detach > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0317 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      subject.detach();
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`deleteLeft>detach>backPress>detach>attach...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`deleteLeft>detach>backPress>detach>attach...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0317 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0318
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0318
     * @tc.desc      VerifyCodeState call flow insert > detach > detach > detach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0318 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('907wOvfA');
      logInfo(`step1 insert("907wOvfA"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      subject.detach();
      subject.detach();
      const step5: string = subject.insert(' Hello ');
      logInfo(`step5 insert(" Hello "): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0318 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0319
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0319
     * @tc.desc      VerifyCodeState call flow detach > detach > insert > detach > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0319 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      subject.detach();
      const step3: string = subject.insert('  ');
      logInfo(`step3 insert("  "): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.detach();
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0319 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0320
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0320
     * @tc.desc      VerifyCodeState call flow backPress > insert > detach > backPress > deleteLeft keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0320 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.insert('lV6M2FRn2QZ5');
      logInfo(`step2 insert("lV6M2FRn2QZ5"): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.detach();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0320 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0321
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0321
     * @tc.desc      VerifyCodeState call flow backPress > backPress > attach > insert > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0321 begin`);
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
      const step4: string = subject.insert('rFlz');
      logInfo(`step4 insert("rFlz"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`backPress>backPress>attach>insert>attach ...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>backPress>attach>insert>attach ...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`backPress>backPress>attach>insert>attach ...: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0321 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0322
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0322
     * @tc.desc      VerifyCodeState call flow insert > detach > insert > deleteLeft > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0322 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.insert('fg');
      logInfo(`step1 insert("fg"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.detach();
      const step3: string = subject.insert('wzRyRj54dhQ');
      logInfo(`step3 insert("wzRyRj54dhQ"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.deleteLeft();
      logInfo(`step4 deleteLeft(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0322 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0323
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0323
     * @tc.desc      VerifyCodeState call flow deleteLeft > backPress > attach > insert > deleteLeft keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0323 begin`);
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
      const step4: string = subject.insert('x ');
      logInfo(`step4 insert("x "): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`deleteLeft>backPress>attach>insert>delete...: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`deleteLeft>backPress>attach>insert>delete...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`deleteLeft>backPress>attach>insert>delete...: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0323 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0324
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0324
     * @tc.desc      VerifyCodeState call flow attach > attach > detach > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0324 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertFalse();
      subject.detach();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0324 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0325
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0325
     * @tc.desc      VerifyCodeState call flow backPress > detach > backPress > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0325 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      subject.detach();
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`backPress>detach>backPress>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>detach>backPress>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0325 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0326
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0326
     * @tc.desc      VerifyCodeState call flow deleteLeft > insert > backPress > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0326 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.deleteLeft();
      logInfo(`step1 deleteLeft(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.insert('vE3zi');
      logInfo(`step2 insert("vE3zi"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`deleteLeft>insert>backPress>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`deleteLeft>insert>backPress>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0326 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0327
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0327
     * @tc.desc      VerifyCodeState call flow backPress > insert > backPress > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0327 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: string = subject.insert('DU0qGKQFe');
      logInfo(`step2 insert("DU0qGKQFe"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.backPress();
      logInfo(`step3 backPress(): step3=${step3}`);
      expect(step3).assertEqual('popRouter');
      const step4: boolean = subject.attach();
      logInfo(`step4 attach(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`backPress>insert>backPress>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>insert>backPress>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0327 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0328
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0328
     * @tc.desc      VerifyCodeState call flow backPress > attach > deleteLeft > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0328 begin`);
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
      logInfo(`backPress>attach>deleteLeft>backPress final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0328 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0329
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0329
     * @tc.desc      VerifyCodeState call flow backPress > attach > insert keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0329 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.insert('oye0FvI7y');
      logInfo(`step3 insert("oye0FvI7y"): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`backPress>attach>insert final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`backPress>attach>insert final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`backPress>attach>insert final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0329 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0330
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0330
     * @tc.desc      VerifyCodeState call flow attach > attach > detach > insert > backPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0330 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: boolean = subject.attach();
      logInfo(`step1 attach(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.attach();
      logInfo(`step2 attach(): step2=${step2}`);
      expect(step2).assertFalse();
      subject.detach();
      const step4: string = subject.insert('Hello_1');
      logInfo(`step4 insert("Hello_1"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0330 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0331
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0331
     * @tc.desc      VerifyCodeState call flow backPress > detach > detach > backPress > backPress keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0331 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const step1: string = subject.backPress();
      logInfo(`step1 backPress(): step1=${step1}`);
      expect(step1).assertEqual('popRouter');
      subject.detach();
      subject.detach();
      const step4: string = subject.backPress();
      logInfo(`step4 backPress(): step4=${step4}`);
      expect(step4).assertEqual('popRouter');
      const step5: string = subject.backPress();
      logInfo(`step5 backPress(): step5=${step5}`);
      expect(step5).assertEqual('popRouter');
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0331 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0332
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0332
     * @tc.desc      VerifyCodeState call flow detach > backPress > attach > insert > attach keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0332 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      subject.detach();
      const step2: string = subject.backPress();
      logInfo(`step2 backPress(): step2=${step2}`);
      expect(step2).assertEqual('popRouter');
      const step3: boolean = subject.attach();
      logInfo(`step3 attach(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.insert('MIpAa6');
      logInfo(`step4 insert("MIpAa6"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.attach();
      logInfo(`step5 attach(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`detach>backPress>attach>insert>attach final: subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertTrue();
      logInfo(`detach>backPress>attach>insert>attach final: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`detach>backPress>attach>insert>attach final: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0332 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_FLOW_0333
     * @tc.name      VerifyCode_VerifyCodeStateFlow_0333
     * @tc.desc      VerifyCodeState call flow attach > backPress > backPress > insert > deleteLeft keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateFlow_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0333 begin`);
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
      const step4: string = subject.insert('FbV');
      logInfo(`step4 insert("FbV"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.deleteLeft();
      logInfo(`step5 deleteLeft(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`attach>backPress>backPress>insert>deleteL...: subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertTrue();
      logInfo(`attach>backPress>backPress>insert>deleteL...: subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(1);
      logInfo(`${BUNDLE}VerifyCodeStateFlow_0333 end`);
    });
  });
}
