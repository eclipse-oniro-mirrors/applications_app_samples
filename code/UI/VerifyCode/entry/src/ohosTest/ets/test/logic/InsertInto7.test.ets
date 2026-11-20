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
import { insertInto } from '../model/VerifyCodeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VerifyCode]';
const BUNDLE: string = 'VerifyCode_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for insertInto (30 cases). */
export default function insertInto7Test(): void {
  describe('InsertInto7Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0577
     * @tc.name      VerifyCode_InsertInto_0577
     * @tc.desc      insertInto(codeText="123", text="a_1") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0577', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0577 begin`);
      const actual: string = insertInto('123', 'a_1');
      logInfo(`insertInto(codeText="123", text="a_1"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0577 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0578
     * @tc.name      VerifyCode_InsertInto_0578
     * @tc.desc      insertInto(codeText="123", text="xa") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0578', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0578 begin`);
      const actual: string = insertInto('123', 'xa');
      logInfo(`insertInto(codeText="123", text="xa"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0578 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0579
     * @tc.name      VerifyCode_InsertInto_0579
     * @tc.desc      insertInto(codeText="123", text=" abc ") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0579', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0579 begin`);
      const actual: string = insertInto('123', ' abc ');
      logInfo(`insertInto(codeText="123", text=" abc "): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0579 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0580
     * @tc.name      VerifyCode_InsertInto_0580
     * @tc.desc      insertInto(codeText="123", text="abcabc") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0580', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0580 begin`);
      const actual: string = insertInto('123', 'abcabc');
      logInfo(`insertInto(codeText="123", text="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0580 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0581
     * @tc.name      VerifyCode_InsertInto_0581
     * @tc.desc      insertInto(codeText="123", text="abc_1") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0581', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0581 begin`);
      const actual: string = insertInto('123', 'abc_1');
      logInfo(`insertInto(codeText="123", text="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0581 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0582
     * @tc.name      VerifyCode_InsertInto_0582
     * @tc.desc      insertInto(codeText="123", text="xabc") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0582', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0582 begin`);
      const actual: string = insertInto('123', 'xabc');
      logInfo(`insertInto(codeText="123", text="xabc"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0582 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0583
     * @tc.name      VerifyCode_InsertInto_0583
     * @tc.desc      insertInto(codeText="123", text=" Hello World ") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0583', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0583 begin`);
      const actual: string = insertInto('123', ' Hello World ');
      logInfo(`insertInto(codeText="123", text=" Hello W...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0583 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0584
     * @tc.name      VerifyCode_InsertInto_0584
     * @tc.desc      insertInto(codeText="123", text="Hello WorldHello World") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0584', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0584 begin`);
      const actual: string = insertInto('123', 'Hello WorldHello World');
      logInfo(`insertInto(codeText="123", text="Hello Wo...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0584 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0585
     * @tc.name      VerifyCode_InsertInto_0585
     * @tc.desc      insertInto(codeText="123", text="Hello World_1") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0585', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0585 begin`);
      const actual: string = insertInto('123', 'Hello World_1');
      logInfo(`insertInto(codeText="123", text="Hello Wo...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0585 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0586
     * @tc.name      VerifyCode_InsertInto_0586
     * @tc.desc      insertInto(codeText="123", text="xHello World") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0586', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0586 begin`);
      const actual: string = insertInto('123', 'xHello World');
      logInfo(`insertInto(codeText="123", text="xHello W...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0586 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0587
     * @tc.name      VerifyCode_InsertInto_0587
     * @tc.desc      insertInto(codeText=" 123456 ", text="hello world") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0587', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0587 begin`);
      const actual: string = insertInto(' 123456 ', 'hello world');
      logInfo(`insertInto(codeText=" 123456 ", text="hel...: actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0587 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0588
     * @tc.name      VerifyCode_InsertInto_0588
     * @tc.desc      insertInto(codeText=" 123456 ", text="") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0588', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0588 begin`);
      const actual: string = insertInto(' 123456 ', '');
      logInfo(`insertInto(codeText=" 123456 ", text=""): actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0588 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0589
     * @tc.name      VerifyCode_InsertInto_0589
     * @tc.desc      insertInto(codeText=" 123456 ", text=" ") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0589', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0589 begin`);
      const actual: string = insertInto(' 123456 ', ' ');
      logInfo(`insertInto(codeText=" 123456 ", text=" "): actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0589 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0590
     * @tc.name      VerifyCode_InsertInto_0590
     * @tc.desc      insertInto(codeText=" 123456 ", text="A") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0590', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0590 begin`);
      const actual: string = insertInto(' 123456 ', 'A');
      logInfo(`insertInto(codeText=" 123456 ", text="A"): actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0590 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0591
     * @tc.name      VerifyCode_InsertInto_0591
     * @tc.desc      insertInto(codeText=" 123456 ", text="Sample Title 123") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0591', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0591 begin`);
      const actual: string = insertInto(' 123456 ', 'Sample Title 123');
      logInfo(`insertInto(codeText=" 123456 ", text="Sam...: actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0591 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0592
     * @tc.name      VerifyCode_InsertInto_0592
     * @tc.desc      insertInto(codeText=" 123456 ", text="??") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0592', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0592 begin`);
      const actual: string = insertInto(' 123456 ', '\u4e2d\u6587');
      logInfo(`insertInto(codeText=" 123456 ", text="??"): actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0592 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0593
     * @tc.name      VerifyCode_InsertInto_0593
     * @tc.desc      insertInto(codeText=" 123456 ", text="a") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0593', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0593 begin`);
      const actual: string = insertInto(' 123456 ', 'a');
      logInfo(`insertInto(codeText=" 123456 ", text="a"): actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0593 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0594
     * @tc.name      VerifyCode_InsertInto_0594
     * @tc.desc      insertInto(codeText=" 123456 ", text="abc") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0594', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0594 begin`);
      const actual: string = insertInto(' 123456 ', 'abc');
      logInfo(`insertInto(codeText=" 123456 ", text="abc"): actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0594 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0595
     * @tc.name      VerifyCode_InsertInto_0595
     * @tc.desc      insertInto(codeText=" 123456 ", text="Hello World") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0595', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0595 begin`);
      const actual: string = insertInto(' 123456 ', 'Hello World');
      logInfo(`insertInto(codeText=" 123456 ", text="Hel...: actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0595 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0596
     * @tc.name      VerifyCode_InsertInto_0596
     * @tc.desc      insertInto(codeText=" 123456 ", text="123") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0596', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0596 begin`);
      const actual: string = insertInto(' 123456 ', '123');
      logInfo(`insertInto(codeText=" 123456 ", text="123"): actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0596 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0597
     * @tc.name      VerifyCode_InsertInto_0597
     * @tc.desc      insertInto(codeText=" 123456 ", text=" Hello ") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0597', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0597 begin`);
      const actual: string = insertInto(' 123456 ', ' Hello ');
      logInfo(`insertInto(codeText=" 123456 ", text=" He...: actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0597 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0598
     * @tc.name      VerifyCode_InsertInto_0598
     * @tc.desc      insertInto(codeText=" 123456 ", text="HelloHello") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0598', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0598 begin`);
      const actual: string = insertInto(' 123456 ', 'HelloHello');
      logInfo(`insertInto(codeText=" 123456 ", text="Hel...: actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0598 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0599
     * @tc.name      VerifyCode_InsertInto_0599
     * @tc.desc      insertInto(codeText=" 123456 ", text="Hello_1") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0599', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0599 begin`);
      const actual: string = insertInto(' 123456 ', 'Hello_1');
      logInfo(`insertInto(codeText=" 123456 ", text="Hel...: actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0599 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0600
     * @tc.name      VerifyCode_InsertInto_0600
     * @tc.desc      insertInto(codeText=" 123456 ", text="xHello") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0600 begin`);
      const actual: string = insertInto(' 123456 ', 'xHello');
      logInfo(`insertInto(codeText=" 123456 ", text="xHe...: actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0600 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0601
     * @tc.name      VerifyCode_InsertInto_0601
     * @tc.desc      insertInto(codeText=" 123456 ", text=" hello world ") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0601 begin`);
      const actual: string = insertInto(' 123456 ', ' hello world ');
      logInfo(`insertInto(codeText=" 123456 ", text=" he...: actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0601 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0602
     * @tc.name      VerifyCode_InsertInto_0602
     * @tc.desc      insertInto(codeText=" 123456 ", text="hello worldhello world") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0602', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0602 begin`);
      const actual: string = insertInto(' 123456 ', 'hello worldhello world');
      logInfo(`insertInto(codeText=" 123456 ", text="hel...: actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0602 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0603
     * @tc.name      VerifyCode_InsertInto_0603
     * @tc.desc      insertInto(codeText=" 123456 ", text="hello world_1") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0603', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0603 begin`);
      const actual: string = insertInto(' 123456 ', 'hello world_1');
      logInfo(`insertInto(codeText=" 123456 ", text="hel...: actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0603 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0604
     * @tc.name      VerifyCode_InsertInto_0604
     * @tc.desc      insertInto(codeText=" 123456 ", text="xhello world") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0604', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0604 begin`);
      const actual: string = insertInto(' 123456 ', 'xhello world');
      logInfo(`insertInto(codeText=" 123456 ", text="xhe...: actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0604 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0605
     * @tc.name      VerifyCode_InsertInto_0605
     * @tc.desc      insertInto(codeText=" 123456 ", text="   ") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0605', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0605 begin`);
      const actual: string = insertInto(' 123456 ', '   ');
      logInfo(`insertInto(codeText=" 123456 ", text="   "): actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0605 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0606
     * @tc.name      VerifyCode_InsertInto_0606
     * @tc.desc      insertInto(codeText=" 123456 ", text="  ") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0606', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0606 begin`);
      const actual: string = insertInto(' 123456 ', '  ');
      logInfo(`insertInto(codeText=" 123456 ", text="  "): actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0606 end`);
    });
  });
}
