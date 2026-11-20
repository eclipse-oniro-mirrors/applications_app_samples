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
import { typeSequence } from '../model/VerifyCodeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VerifyCode]';
const BUNDLE: string = 'VerifyCode_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for typeSequence (8 cases). */
export default function typeSequenceTest(): void {
  describe('TypeSequenceTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_TYPE_SEQUENCE_0001
     * @tc.name      VerifyCode_TypeSequence_0001
     * @tc.desc      typeSequence(texts=[]) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_TypeSequence_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TypeSequence_0001 begin`);
      const actual: string = typeSequence([]);
      logInfo(`typeSequence(texts=[]): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TypeSequence_0001 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_TYPE_SEQUENCE_0002
     * @tc.name      VerifyCode_TypeSequence_0002
     * @tc.desc      typeSequence(texts=[""]) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_TypeSequence_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TypeSequence_0002 begin`);
      const actual: string = typeSequence(['']);
      logInfo(`typeSequence(texts=[""]): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TypeSequence_0002 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_TYPE_SEQUENCE_0003
     * @tc.name      VerifyCode_TypeSequence_0003
     * @tc.desc      typeSequence(texts=["", "x"]) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_TypeSequence_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TypeSequence_0003 begin`);
      const actual: string = typeSequence(['', 'x']);
      logInfo(`typeSequence(texts=["", "x"]): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TypeSequence_0003 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_TYPE_SEQUENCE_0004
     * @tc.name      VerifyCode_TypeSequence_0004
     * @tc.desc      typeSequence(texts=["x", "", "Hello"]) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_TypeSequence_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TypeSequence_0004 begin`);
      const actual: string = typeSequence(['x', '', 'Hello']);
      logInfo(`typeSequence(texts=["x", "", "Hello"]): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TypeSequence_0004 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_TYPE_SEQUENCE_0005
     * @tc.name      VerifyCode_TypeSequence_0005
     * @tc.desc      typeSequence(texts=["Hello", "Hello"]) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_TypeSequence_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TypeSequence_0005 begin`);
      const actual: string = typeSequence(['Hello', 'Hello']);
      logInfo(`typeSequence(texts=["Hello", "Hello"]): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TypeSequence_0005 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_TYPE_SEQUENCE_0006
     * @tc.name      VerifyCode_TypeSequence_0006
     * @tc.desc      typeSequence(texts=["", "x", "Hello", "hello world", " "]) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_TypeSequence_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TypeSequence_0006 begin`);
      const actual: string = typeSequence(['', 'x', 'Hello', 'hello world', ' ']);
      logInfo(`typeSequence(texts=["", "x", "Hello", "he...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TypeSequence_0006 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_TYPE_SEQUENCE_0007
     * @tc.name      VerifyCode_TypeSequence_0007
     * @tc.desc      typeSequence(texts=["hello world", "x", " ", "x", "A"]) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_TypeSequence_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TypeSequence_0007 begin`);
      const actual: string = typeSequence(['hello world', 'x', ' ', 'x', 'A']);
      logInfo(`typeSequence(texts=["hello world", "x", "...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TypeSequence_0007 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_TYPE_SEQUENCE_0008
     * @tc.name      VerifyCode_TypeSequence_0008
     * @tc.desc      typeSequence(texts=["A", " ", "hello world", "Hello", "x", ""]) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_TypeSequence_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TypeSequence_0008 begin`);
      const actual: string = typeSequence(['A', ' ', 'hello world', 'Hello', 'x', '']);
      logInfo(`typeSequence(texts=["A", " ", "hello worl...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TypeSequence_0008 end`);
    });
  });
}
