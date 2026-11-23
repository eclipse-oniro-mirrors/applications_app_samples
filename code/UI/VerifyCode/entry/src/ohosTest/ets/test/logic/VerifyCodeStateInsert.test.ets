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

/** Logic checks for VerifyCodeState.insert (30 cases). */
export default function verifyCodeStateInsertTest(): void {
  describe('VerifyCodeStateInsertTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0001
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0001
     * @tc.desc      VerifyCodeState.insert(text="Hello") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_VerifyCodeStateInsert_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0001 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('Hello');
      logInfo(`insert(text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0001 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0002
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0002
     * @tc.desc      VerifyCodeState.insert(text="hello world") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_VerifyCodeStateInsert_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0002 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('hello world');
      logInfo(`insert(text="hello world"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0002 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0003
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0003
     * @tc.desc      VerifyCodeState.insert(text="") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_VerifyCodeStateInsert_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0003 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('');
      logInfo(`insert(text=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0003 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0004
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0004
     * @tc.desc      VerifyCodeState.insert(text=" ") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateInsert_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0004 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert(' ');
      logInfo(`insert(text=" "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0004 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0005
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0005
     * @tc.desc      VerifyCodeState.insert(text="A") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateInsert_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0005 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('A');
      logInfo(`insert(text="A"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0005 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0006
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0006
     * @tc.desc      VerifyCodeState.insert(text="Sample Title 123") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateInsert_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0006 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('Sample Title 123');
      logInfo(`insert(text="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0006 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0007
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0007
     * @tc.desc      VerifyCodeState.insert(text="??") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateInsert_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0007 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('\u4e2d\u6587');
      logInfo(`insert(text="??"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0007 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0008
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0008
     * @tc.desc      VerifyCodeState.insert(text="a") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateInsert_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0008 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('a');
      logInfo(`insert(text="a"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0008 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0009
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0009
     * @tc.desc      VerifyCodeState.insert(text="abc") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateInsert_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0009 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('abc');
      logInfo(`insert(text="abc"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0009 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0010
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0010
     * @tc.desc      VerifyCodeState.insert(text="Hello World") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateInsert_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0010 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('Hello World');
      logInfo(`insert(text="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0010 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0011
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0011
     * @tc.desc      VerifyCodeState.insert(text="123") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateInsert_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0011 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('123');
      logInfo(`insert(text="123"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0011 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0012
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0012
     * @tc.desc      VerifyCodeState.insert(text=" Hello ") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_VerifyCodeStateInsert_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0012 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert(' Hello ');
      logInfo(`insert(text=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0012 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0013
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0013
     * @tc.desc      VerifyCodeState.insert(text="HelloHello") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateInsert_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0013 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('HelloHello');
      logInfo(`insert(text="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0013 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0014
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0014
     * @tc.desc      VerifyCodeState.insert(text="Hello_1") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateInsert_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0014 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('Hello_1');
      logInfo(`insert(text="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0014 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0015
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0015
     * @tc.desc      VerifyCodeState.insert(text="xHello") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_VerifyCodeStateInsert_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0015 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('xHello');
      logInfo(`insert(text="xHello"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0015 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0016
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0016
     * @tc.desc      VerifyCodeState.insert(text=" hello world ") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_VerifyCodeStateInsert_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0016 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert(' hello world ');
      logInfo(`insert(text=" hello world "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0016 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0017
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0017
     * @tc.desc      VerifyCodeState.insert(text="hello worldhello world") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateInsert_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0017 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('hello worldhello world');
      logInfo(`insert(text="hello worldhello world"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0017 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0018
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0018
     * @tc.desc      VerifyCodeState.insert(text="hello world_1") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateInsert_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0018 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('hello world_1');
      logInfo(`insert(text="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0018 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0019
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0019
     * @tc.desc      VerifyCodeState.insert(text="xhello world") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_VerifyCodeStateInsert_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0019 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('xhello world');
      logInfo(`insert(text="xhello world"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0019 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0020
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0020
     * @tc.desc      VerifyCodeState.insert(text="   ") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_VerifyCodeStateInsert_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0020 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('   ');
      logInfo(`insert(text="   "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0020 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0021
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0021
     * @tc.desc      VerifyCodeState.insert(text="  ") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateInsert_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0021 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('  ');
      logInfo(`insert(text="  "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0021 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0022
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0022
     * @tc.desc      VerifyCodeState.insert(text=" _1") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateInsert_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0022 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert(' _1');
      logInfo(`insert(text=" _1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0022 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0023
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0023
     * @tc.desc      VerifyCodeState.insert(text="x ") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_VerifyCodeStateInsert_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0023 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('x ');
      logInfo(`insert(text="x "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0023 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0024
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0024
     * @tc.desc      VerifyCodeState.insert(text=" A ") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_VerifyCodeStateInsert_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0024 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert(' A ');
      logInfo(`insert(text=" A "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0024 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0025
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0025
     * @tc.desc      VerifyCodeState.insert(text="AA") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateInsert_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0025 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('AA');
      logInfo(`insert(text="AA"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0025 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0026
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0026
     * @tc.desc      VerifyCodeState.insert(text="A_1") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateInsert_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0026 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('A_1');
      logInfo(`insert(text="A_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0026 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0027
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0027
     * @tc.desc      VerifyCodeState.insert(text="xA") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_VerifyCodeStateInsert_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0027 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('xA');
      logInfo(`insert(text="xA"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0027 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0028
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0028
     * @tc.desc      VerifyCodeState.insert(text=" Sample Title 123 ") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_VerifyCodeStateInsert_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0028 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert(' Sample Title 123 ');
      logInfo(`insert(text=" Sample Title 123 "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0028 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0029
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0029
     * @tc.desc      VerifyCodeState.insert(text="Sample Title 123Sample Title 123") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateInsert_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0029 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('Sample Title 123Sample Title 123');
      logInfo(`insert(text="Sample Title 123Sample Title...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0029 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_INSERT_0030
     * @tc.name      VerifyCode_VerifyCodeStateInsert_0030
     * @tc.desc      VerifyCodeState.insert(text="Sample Title 123_1") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_VerifyCodeStateInsert_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0030 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.insert('Sample Title 123_1');
      logInfo(`insert(text="Sample Title 123_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateInsert_0030 end`);
    });
  });
}
