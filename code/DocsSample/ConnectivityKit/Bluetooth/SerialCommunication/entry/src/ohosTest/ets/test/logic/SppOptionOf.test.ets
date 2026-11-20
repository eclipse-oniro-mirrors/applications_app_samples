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
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SppOptionValue, sppOptionOf } from '../model/SppSerialLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SerialCommunication]';
const BUNDLE: string = 'SerialCommunication_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for sppOptionOf (77 cases). */
export default function sppOptionOfTest(): void {
  describe('SppOptionOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0001
     * @tc.name      SerialCommunication_SppOptionOf_0001
     * @tc.desc      sppOptionOf(uuid="") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SppOptionOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SppOptionOf_0001 begin`);
      const actual: SppOptionValue = sppOptionOf('');
      logInfo(`sppOptionOf(uuid=""): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('');
      logInfo(`sppOptionOf(uuid=""): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid=""): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0001 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0002
     * @tc.name      SerialCommunication_SppOptionOf_0002
     * @tc.desc      sppOptionOf(uuid="a") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_SppOptionOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SppOptionOf_0002 begin`);
      const actual: SppOptionValue = sppOptionOf('a');
      logInfo(`sppOptionOf(uuid="a"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('a');
      logInfo(`sppOptionOf(uuid="a"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="a"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0002 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0003
     * @tc.name      SerialCommunication_SppOptionOf_0003
     * @tc.desc      sppOptionOf(uuid="abc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0003 begin`);
      const actual: SppOptionValue = sppOptionOf('abc');
      logInfo(`sppOptionOf(uuid="abc"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('abc');
      logInfo(`sppOptionOf(uuid="abc"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="abc"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0003 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0004
     * @tc.name      SerialCommunication_SppOptionOf_0004
     * @tc.desc      sppOptionOf(uuid="Hello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0004 begin`);
      const actual: SppOptionValue = sppOptionOf('Hello World');
      logInfo(`sppOptionOf(uuid="Hello World"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('Hello World');
      logInfo(`sppOptionOf(uuid="Hello World"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="Hello World"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0004 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0005
     * @tc.name      SerialCommunication_SppOptionOf_0005
     * @tc.desc      sppOptionOf(uuid=" ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0005 begin`);
      const actual: SppOptionValue = sppOptionOf(' ');
      logInfo(`sppOptionOf(uuid=" "): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual(' ');
      logInfo(`sppOptionOf(uuid=" "): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid=" "): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0005 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0006
     * @tc.name      SerialCommunication_SppOptionOf_0006
     * @tc.desc      sppOptionOf(uuid="123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0006 begin`);
      const actual: SppOptionValue = sppOptionOf('123');
      logInfo(`sppOptionOf(uuid="123"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('123');
      logInfo(`sppOptionOf(uuid="123"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="123"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0006 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0007
     * @tc.name      SerialCommunication_SppOptionOf_0007
     * @tc.desc      sppOptionOf(uuid=" a ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppOptionOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppOptionOf_0007 begin`);
      const actual: SppOptionValue = sppOptionOf(' a ');
      logInfo(`sppOptionOf(uuid=" a "): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual(' a ');
      logInfo(`sppOptionOf(uuid=" a "): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid=" a "): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0007 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0008
     * @tc.name      SerialCommunication_SppOptionOf_0008
     * @tc.desc      sppOptionOf(uuid="aa") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0008 begin`);
      const actual: SppOptionValue = sppOptionOf('aa');
      logInfo(`sppOptionOf(uuid="aa"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('aa');
      logInfo(`sppOptionOf(uuid="aa"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="aa"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0008 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0009
     * @tc.name      SerialCommunication_SppOptionOf_0009
     * @tc.desc      sppOptionOf(uuid="a_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0009 begin`);
      const actual: SppOptionValue = sppOptionOf('a_1');
      logInfo(`sppOptionOf(uuid="a_1"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('a_1');
      logInfo(`sppOptionOf(uuid="a_1"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="a_1"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0009 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0010
     * @tc.name      SerialCommunication_SppOptionOf_0010
     * @tc.desc      sppOptionOf(uuid="xa") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppOptionOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppOptionOf_0010 begin`);
      const actual: SppOptionValue = sppOptionOf('xa');
      logInfo(`sppOptionOf(uuid="xa"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('xa');
      logInfo(`sppOptionOf(uuid="xa"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="xa"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0010 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0011
     * @tc.name      SerialCommunication_SppOptionOf_0011
     * @tc.desc      sppOptionOf(uuid=" abc ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppOptionOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppOptionOf_0011 begin`);
      const actual: SppOptionValue = sppOptionOf(' abc ');
      logInfo(`sppOptionOf(uuid=" abc "): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual(' abc ');
      logInfo(`sppOptionOf(uuid=" abc "): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid=" abc "): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0011 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0012
     * @tc.name      SerialCommunication_SppOptionOf_0012
     * @tc.desc      sppOptionOf(uuid="abcabc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0012 begin`);
      const actual: SppOptionValue = sppOptionOf('abcabc');
      logInfo(`sppOptionOf(uuid="abcabc"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('abcabc');
      logInfo(`sppOptionOf(uuid="abcabc"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="abcabc"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0012 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0013
     * @tc.name      SerialCommunication_SppOptionOf_0013
     * @tc.desc      sppOptionOf(uuid="abc_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0013 begin`);
      const actual: SppOptionValue = sppOptionOf('abc_1');
      logInfo(`sppOptionOf(uuid="abc_1"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('abc_1');
      logInfo(`sppOptionOf(uuid="abc_1"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="abc_1"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0013 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0014
     * @tc.name      SerialCommunication_SppOptionOf_0014
     * @tc.desc      sppOptionOf(uuid="xabc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppOptionOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppOptionOf_0014 begin`);
      const actual: SppOptionValue = sppOptionOf('xabc');
      logInfo(`sppOptionOf(uuid="xabc"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('xabc');
      logInfo(`sppOptionOf(uuid="xabc"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="xabc"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0014 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0015
     * @tc.name      SerialCommunication_SppOptionOf_0015
     * @tc.desc      sppOptionOf(uuid=" Hello World ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppOptionOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppOptionOf_0015 begin`);
      const actual: SppOptionValue = sppOptionOf(' Hello World ');
      logInfo(`sppOptionOf(uuid=" Hello World "): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual(' Hello World ');
      logInfo(`sppOptionOf(uuid=" Hello World "): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid=" Hello World "): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0015 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0016
     * @tc.name      SerialCommunication_SppOptionOf_0016
     * @tc.desc      sppOptionOf(uuid="Hello WorldHello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0016 begin`);
      const actual: SppOptionValue = sppOptionOf('Hello WorldHello World');
      logInfo(`sppOptionOf(uuid="Hello WorldHello World"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('Hello WorldHello World');
      logInfo(`sppOptionOf(uuid="Hello WorldHello World"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="Hello WorldHello World"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0016 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0017
     * @tc.name      SerialCommunication_SppOptionOf_0017
     * @tc.desc      sppOptionOf(uuid="Hello World_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0017 begin`);
      const actual: SppOptionValue = sppOptionOf('Hello World_1');
      logInfo(`sppOptionOf(uuid="Hello World_1"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('Hello World_1');
      logInfo(`sppOptionOf(uuid="Hello World_1"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="Hello World_1"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0017 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0018
     * @tc.name      SerialCommunication_SppOptionOf_0018
     * @tc.desc      sppOptionOf(uuid="xHello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppOptionOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppOptionOf_0018 begin`);
      const actual: SppOptionValue = sppOptionOf('xHello World');
      logInfo(`sppOptionOf(uuid="xHello World"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('xHello World');
      logInfo(`sppOptionOf(uuid="xHello World"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="xHello World"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0018 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0019
     * @tc.name      SerialCommunication_SppOptionOf_0019
     * @tc.desc      sppOptionOf(uuid="   ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppOptionOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppOptionOf_0019 begin`);
      const actual: SppOptionValue = sppOptionOf('   ');
      logInfo(`sppOptionOf(uuid="   "): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('   ');
      logInfo(`sppOptionOf(uuid="   "): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="   "): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0019 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0020
     * @tc.name      SerialCommunication_SppOptionOf_0020
     * @tc.desc      sppOptionOf(uuid="  ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0020 begin`);
      const actual: SppOptionValue = sppOptionOf('  ');
      logInfo(`sppOptionOf(uuid="  "): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('  ');
      logInfo(`sppOptionOf(uuid="  "): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="  "): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0020 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0021
     * @tc.name      SerialCommunication_SppOptionOf_0021
     * @tc.desc      sppOptionOf(uuid=" _1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0021 begin`);
      const actual: SppOptionValue = sppOptionOf(' _1');
      logInfo(`sppOptionOf(uuid=" _1"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual(' _1');
      logInfo(`sppOptionOf(uuid=" _1"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid=" _1"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0021 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0022
     * @tc.name      SerialCommunication_SppOptionOf_0022
     * @tc.desc      sppOptionOf(uuid="x ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppOptionOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppOptionOf_0022 begin`);
      const actual: SppOptionValue = sppOptionOf('x ');
      logInfo(`sppOptionOf(uuid="x "): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('x ');
      logInfo(`sppOptionOf(uuid="x "): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="x "): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0022 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0023
     * @tc.name      SerialCommunication_SppOptionOf_0023
     * @tc.desc      sppOptionOf(uuid=" 123 ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppOptionOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppOptionOf_0023 begin`);
      const actual: SppOptionValue = sppOptionOf(' 123 ');
      logInfo(`sppOptionOf(uuid=" 123 "): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual(' 123 ');
      logInfo(`sppOptionOf(uuid=" 123 "): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid=" 123 "): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0023 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0024
     * @tc.name      SerialCommunication_SppOptionOf_0024
     * @tc.desc      sppOptionOf(uuid="123123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0024 begin`);
      const actual: SppOptionValue = sppOptionOf('123123');
      logInfo(`sppOptionOf(uuid="123123"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('123123');
      logInfo(`sppOptionOf(uuid="123123"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="123123"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0024 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0025
     * @tc.name      SerialCommunication_SppOptionOf_0025
     * @tc.desc      sppOptionOf(uuid="123_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0025 begin`);
      const actual: SppOptionValue = sppOptionOf('123_1');
      logInfo(`sppOptionOf(uuid="123_1"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('123_1');
      logInfo(`sppOptionOf(uuid="123_1"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="123_1"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0025 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0026
     * @tc.name      SerialCommunication_SppOptionOf_0026
     * @tc.desc      sppOptionOf(uuid="x123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_SppOptionOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SppOptionOf_0026 begin`);
      const actual: SppOptionValue = sppOptionOf('x123');
      logInfo(`sppOptionOf(uuid="x123"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('x123');
      logInfo(`sppOptionOf(uuid="x123"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="x123"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0026 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0027
     * @tc.name      SerialCommunication_SppOptionOf_0027
     * @tc.desc      sppOptionOf(uuid="jI") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0027 begin`);
      const actual: SppOptionValue = sppOptionOf('jI');
      logInfo(`sppOptionOf(uuid="jI"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('jI');
      logInfo(`sppOptionOf(uuid="jI"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="jI"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0027 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0028
     * @tc.name      SerialCommunication_SppOptionOf_0028
     * @tc.desc      sppOptionOf(uuid="PahwCrI") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0028 begin`);
      const actual: SppOptionValue = sppOptionOf('PahwCrI');
      logInfo(`sppOptionOf(uuid="PahwCrI"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('PahwCrI');
      logInfo(`sppOptionOf(uuid="PahwCrI"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="PahwCrI"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0028 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0029
     * @tc.name      SerialCommunication_SppOptionOf_0029
     * @tc.desc      sppOptionOf(uuid="D") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0029 begin`);
      const actual: SppOptionValue = sppOptionOf('D');
      logInfo(`sppOptionOf(uuid="D"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('D');
      logInfo(`sppOptionOf(uuid="D"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="D"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0029 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0030
     * @tc.name      SerialCommunication_SppOptionOf_0030
     * @tc.desc      sppOptionOf(uuid="2qPGaYDJTd") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0030 begin`);
      const actual: SppOptionValue = sppOptionOf('2qPGaYDJTd');
      logInfo(`sppOptionOf(uuid="2qPGaYDJTd"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('2qPGaYDJTd');
      logInfo(`sppOptionOf(uuid="2qPGaYDJTd"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="2qPGaYDJTd"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0030 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0031
     * @tc.name      SerialCommunication_SppOptionOf_0031
     * @tc.desc      sppOptionOf(uuid="Rw4tvYz") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0031 begin`);
      const actual: SppOptionValue = sppOptionOf('Rw4tvYz');
      logInfo(`sppOptionOf(uuid="Rw4tvYz"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('Rw4tvYz');
      logInfo(`sppOptionOf(uuid="Rw4tvYz"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="Rw4tvYz"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0031 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0032
     * @tc.name      SerialCommunication_SppOptionOf_0032
     * @tc.desc      sppOptionOf(uuid="F") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0032 begin`);
      const actual: SppOptionValue = sppOptionOf('F');
      logInfo(`sppOptionOf(uuid="F"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('F');
      logInfo(`sppOptionOf(uuid="F"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="F"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0032 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0033
     * @tc.name      SerialCommunication_SppOptionOf_0033
     * @tc.desc      sppOptionOf(uuid="eUcMaLYMGh") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0033 begin`);
      const actual: SppOptionValue = sppOptionOf('eUcMaLYMGh');
      logInfo(`sppOptionOf(uuid="eUcMaLYMGh"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('eUcMaLYMGh');
      logInfo(`sppOptionOf(uuid="eUcMaLYMGh"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="eUcMaLYMGh"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0033 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0034
     * @tc.name      SerialCommunication_SppOptionOf_0034
     * @tc.desc      sppOptionOf(uuid="X") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0034 begin`);
      const actual: SppOptionValue = sppOptionOf('X');
      logInfo(`sppOptionOf(uuid="X"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('X');
      logInfo(`sppOptionOf(uuid="X"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="X"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0034 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0035
     * @tc.name      SerialCommunication_SppOptionOf_0035
     * @tc.desc      sppOptionOf(uuid="L0hMIt7sBOv") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0035 begin`);
      const actual: SppOptionValue = sppOptionOf('L0hMIt7sBOv');
      logInfo(`sppOptionOf(uuid="L0hMIt7sBOv"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('L0hMIt7sBOv');
      logInfo(`sppOptionOf(uuid="L0hMIt7sBOv"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="L0hMIt7sBOv"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0035 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0036
     * @tc.name      SerialCommunication_SppOptionOf_0036
     * @tc.desc      sppOptionOf(uuid="MIZ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0036 begin`);
      const actual: SppOptionValue = sppOptionOf('MIZ');
      logInfo(`sppOptionOf(uuid="MIZ"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('MIZ');
      logInfo(`sppOptionOf(uuid="MIZ"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="MIZ"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0036 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0037
     * @tc.name      SerialCommunication_SppOptionOf_0037
     * @tc.desc      sppOptionOf(uuid="93Lnm2k") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0037 begin`);
      const actual: SppOptionValue = sppOptionOf('93Lnm2k');
      logInfo(`sppOptionOf(uuid="93Lnm2k"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('93Lnm2k');
      logInfo(`sppOptionOf(uuid="93Lnm2k"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="93Lnm2k"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0037 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0038
     * @tc.name      SerialCommunication_SppOptionOf_0038
     * @tc.desc      sppOptionOf(uuid="jR91") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0038 begin`);
      const actual: SppOptionValue = sppOptionOf('jR91');
      logInfo(`sppOptionOf(uuid="jR91"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('jR91');
      logInfo(`sppOptionOf(uuid="jR91"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="jR91"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0038 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0039
     * @tc.name      SerialCommunication_SppOptionOf_0039
     * @tc.desc      sppOptionOf(uuid="GMx2z") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0039 begin`);
      const actual: SppOptionValue = sppOptionOf('GMx2z');
      logInfo(`sppOptionOf(uuid="GMx2z"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('GMx2z');
      logInfo(`sppOptionOf(uuid="GMx2z"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="GMx2z"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0039 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0040
     * @tc.name      SerialCommunication_SppOptionOf_0040
     * @tc.desc      sppOptionOf(uuid="teIUE2uWH") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0040 begin`);
      const actual: SppOptionValue = sppOptionOf('teIUE2uWH');
      logInfo(`sppOptionOf(uuid="teIUE2uWH"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('teIUE2uWH');
      logInfo(`sppOptionOf(uuid="teIUE2uWH"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="teIUE2uWH"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0040 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0041
     * @tc.name      SerialCommunication_SppOptionOf_0041
     * @tc.desc      sppOptionOf(uuid="rq") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0041 begin`);
      const actual: SppOptionValue = sppOptionOf('rq');
      logInfo(`sppOptionOf(uuid="rq"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('rq');
      logInfo(`sppOptionOf(uuid="rq"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="rq"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0041 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0042
     * @tc.name      SerialCommunication_SppOptionOf_0042
     * @tc.desc      sppOptionOf(uuid="xXt") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0042 begin`);
      const actual: SppOptionValue = sppOptionOf('xXt');
      logInfo(`sppOptionOf(uuid="xXt"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('xXt');
      logInfo(`sppOptionOf(uuid="xXt"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="xXt"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0042 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0043
     * @tc.name      SerialCommunication_SppOptionOf_0043
     * @tc.desc      sppOptionOf(uuid="TVh") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0043 begin`);
      const actual: SppOptionValue = sppOptionOf('TVh');
      logInfo(`sppOptionOf(uuid="TVh"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('TVh');
      logInfo(`sppOptionOf(uuid="TVh"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="TVh"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0043 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0044
     * @tc.name      SerialCommunication_SppOptionOf_0044
     * @tc.desc      sppOptionOf(uuid="BGd") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0044 begin`);
      const actual: SppOptionValue = sppOptionOf('BGd');
      logInfo(`sppOptionOf(uuid="BGd"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('BGd');
      logInfo(`sppOptionOf(uuid="BGd"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="BGd"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0044 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0045
     * @tc.name      SerialCommunication_SppOptionOf_0045
     * @tc.desc      sppOptionOf(uuid="1YgWiDc0MM3") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0045 begin`);
      const actual: SppOptionValue = sppOptionOf('1YgWiDc0MM3');
      logInfo(`sppOptionOf(uuid="1YgWiDc0MM3"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('1YgWiDc0MM3');
      logInfo(`sppOptionOf(uuid="1YgWiDc0MM3"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="1YgWiDc0MM3"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0045 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0046
     * @tc.name      SerialCommunication_SppOptionOf_0046
     * @tc.desc      sppOptionOf(uuid="bkzxctb") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0046 begin`);
      const actual: SppOptionValue = sppOptionOf('bkzxctb');
      logInfo(`sppOptionOf(uuid="bkzxctb"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('bkzxctb');
      logInfo(`sppOptionOf(uuid="bkzxctb"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="bkzxctb"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0046 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0047
     * @tc.name      SerialCommunication_SppOptionOf_0047
     * @tc.desc      sppOptionOf(uuid="nnh5EIUT7FyL") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0047 begin`);
      const actual: SppOptionValue = sppOptionOf('nnh5EIUT7FyL');
      logInfo(`sppOptionOf(uuid="nnh5EIUT7FyL"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('nnh5EIUT7FyL');
      logInfo(`sppOptionOf(uuid="nnh5EIUT7FyL"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="nnh5EIUT7FyL"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0047 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0048
     * @tc.name      SerialCommunication_SppOptionOf_0048
     * @tc.desc      sppOptionOf(uuid="Nhbp") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0048 begin`);
      const actual: SppOptionValue = sppOptionOf('Nhbp');
      logInfo(`sppOptionOf(uuid="Nhbp"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('Nhbp');
      logInfo(`sppOptionOf(uuid="Nhbp"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="Nhbp"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0048 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0049
     * @tc.name      SerialCommunication_SppOptionOf_0049
     * @tc.desc      sppOptionOf(uuid="8z") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0049 begin`);
      const actual: SppOptionValue = sppOptionOf('8z');
      logInfo(`sppOptionOf(uuid="8z"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('8z');
      logInfo(`sppOptionOf(uuid="8z"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="8z"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0049 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0050
     * @tc.name      SerialCommunication_SppOptionOf_0050
     * @tc.desc      sppOptionOf(uuid="FGBBpHn") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0050 begin`);
      const actual: SppOptionValue = sppOptionOf('FGBBpHn');
      logInfo(`sppOptionOf(uuid="FGBBpHn"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('FGBBpHn');
      logInfo(`sppOptionOf(uuid="FGBBpHn"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="FGBBpHn"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0050 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0051
     * @tc.name      SerialCommunication_SppOptionOf_0051
     * @tc.desc      sppOptionOf(uuid="8nar") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0051 begin`);
      const actual: SppOptionValue = sppOptionOf('8nar');
      logInfo(`sppOptionOf(uuid="8nar"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('8nar');
      logInfo(`sppOptionOf(uuid="8nar"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="8nar"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0051 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0052
     * @tc.name      SerialCommunication_SppOptionOf_0052
     * @tc.desc      sppOptionOf(uuid="mv") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0052 begin`);
      const actual: SppOptionValue = sppOptionOf('mv');
      logInfo(`sppOptionOf(uuid="mv"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('mv');
      logInfo(`sppOptionOf(uuid="mv"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="mv"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0052 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0053
     * @tc.name      SerialCommunication_SppOptionOf_0053
     * @tc.desc      sppOptionOf(uuid="cD") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0053 begin`);
      const actual: SppOptionValue = sppOptionOf('cD');
      logInfo(`sppOptionOf(uuid="cD"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('cD');
      logInfo(`sppOptionOf(uuid="cD"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="cD"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0053 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0054
     * @tc.name      SerialCommunication_SppOptionOf_0054
     * @tc.desc      sppOptionOf(uuid="s4fN") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0054 begin`);
      const actual: SppOptionValue = sppOptionOf('s4fN');
      logInfo(`sppOptionOf(uuid="s4fN"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('s4fN');
      logInfo(`sppOptionOf(uuid="s4fN"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="s4fN"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0054 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0055
     * @tc.name      SerialCommunication_SppOptionOf_0055
     * @tc.desc      sppOptionOf(uuid="Sy") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0055 begin`);
      const actual: SppOptionValue = sppOptionOf('Sy');
      logInfo(`sppOptionOf(uuid="Sy"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('Sy');
      logInfo(`sppOptionOf(uuid="Sy"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="Sy"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0055 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0056
     * @tc.name      SerialCommunication_SppOptionOf_0056
     * @tc.desc      sppOptionOf(uuid="hxbHSs8E") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0056 begin`);
      const actual: SppOptionValue = sppOptionOf('hxbHSs8E');
      logInfo(`sppOptionOf(uuid="hxbHSs8E"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('hxbHSs8E');
      logInfo(`sppOptionOf(uuid="hxbHSs8E"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="hxbHSs8E"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0056 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0057
     * @tc.name      SerialCommunication_SppOptionOf_0057
     * @tc.desc      sppOptionOf(uuid="mR9W1yTv") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0057 begin`);
      const actual: SppOptionValue = sppOptionOf('mR9W1yTv');
      logInfo(`sppOptionOf(uuid="mR9W1yTv"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('mR9W1yTv');
      logInfo(`sppOptionOf(uuid="mR9W1yTv"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="mR9W1yTv"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0057 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0058
     * @tc.name      SerialCommunication_SppOptionOf_0058
     * @tc.desc      sppOptionOf(uuid="i1tTOb1s") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0058 begin`);
      const actual: SppOptionValue = sppOptionOf('i1tTOb1s');
      logInfo(`sppOptionOf(uuid="i1tTOb1s"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('i1tTOb1s');
      logInfo(`sppOptionOf(uuid="i1tTOb1s"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="i1tTOb1s"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0058 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0059
     * @tc.name      SerialCommunication_SppOptionOf_0059
     * @tc.desc      sppOptionOf(uuid="8n2") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0059 begin`);
      const actual: SppOptionValue = sppOptionOf('8n2');
      logInfo(`sppOptionOf(uuid="8n2"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('8n2');
      logInfo(`sppOptionOf(uuid="8n2"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="8n2"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0059 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0060
     * @tc.name      SerialCommunication_SppOptionOf_0060
     * @tc.desc      sppOptionOf(uuid="V1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0060 begin`);
      const actual: SppOptionValue = sppOptionOf('V1');
      logInfo(`sppOptionOf(uuid="V1"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('V1');
      logInfo(`sppOptionOf(uuid="V1"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="V1"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0060 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0061
     * @tc.name      SerialCommunication_SppOptionOf_0061
     * @tc.desc      sppOptionOf(uuid="f7zu8pZbhc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0061 begin`);
      const actual: SppOptionValue = sppOptionOf('f7zu8pZbhc');
      logInfo(`sppOptionOf(uuid="f7zu8pZbhc"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('f7zu8pZbhc');
      logInfo(`sppOptionOf(uuid="f7zu8pZbhc"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="f7zu8pZbhc"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0061 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0062
     * @tc.name      SerialCommunication_SppOptionOf_0062
     * @tc.desc      sppOptionOf(uuid="LYvfj5kncU4C") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0062 begin`);
      const actual: SppOptionValue = sppOptionOf('LYvfj5kncU4C');
      logInfo(`sppOptionOf(uuid="LYvfj5kncU4C"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('LYvfj5kncU4C');
      logInfo(`sppOptionOf(uuid="LYvfj5kncU4C"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="LYvfj5kncU4C"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0062 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0063
     * @tc.name      SerialCommunication_SppOptionOf_0063
     * @tc.desc      sppOptionOf(uuid="u4oKdSg") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0063 begin`);
      const actual: SppOptionValue = sppOptionOf('u4oKdSg');
      logInfo(`sppOptionOf(uuid="u4oKdSg"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('u4oKdSg');
      logInfo(`sppOptionOf(uuid="u4oKdSg"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="u4oKdSg"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0063 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0064
     * @tc.name      SerialCommunication_SppOptionOf_0064
     * @tc.desc      sppOptionOf(uuid="Va9") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0064 begin`);
      const actual: SppOptionValue = sppOptionOf('Va9');
      logInfo(`sppOptionOf(uuid="Va9"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('Va9');
      logInfo(`sppOptionOf(uuid="Va9"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="Va9"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0064 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0065
     * @tc.name      SerialCommunication_SppOptionOf_0065
     * @tc.desc      sppOptionOf(uuid="Qd4Pxhnr") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0065 begin`);
      const actual: SppOptionValue = sppOptionOf('Qd4Pxhnr');
      logInfo(`sppOptionOf(uuid="Qd4Pxhnr"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('Qd4Pxhnr');
      logInfo(`sppOptionOf(uuid="Qd4Pxhnr"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="Qd4Pxhnr"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0065 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0066
     * @tc.name      SerialCommunication_SppOptionOf_0066
     * @tc.desc      sppOptionOf(uuid="suLPN4XPiUPP") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0066 begin`);
      const actual: SppOptionValue = sppOptionOf('suLPN4XPiUPP');
      logInfo(`sppOptionOf(uuid="suLPN4XPiUPP"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('suLPN4XPiUPP');
      logInfo(`sppOptionOf(uuid="suLPN4XPiUPP"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="suLPN4XPiUPP"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0066 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0067
     * @tc.name      SerialCommunication_SppOptionOf_0067
     * @tc.desc      sppOptionOf(uuid="7rQncicis") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0067 begin`);
      const actual: SppOptionValue = sppOptionOf('7rQncicis');
      logInfo(`sppOptionOf(uuid="7rQncicis"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('7rQncicis');
      logInfo(`sppOptionOf(uuid="7rQncicis"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="7rQncicis"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0067 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0068
     * @tc.name      SerialCommunication_SppOptionOf_0068
     * @tc.desc      sppOptionOf(uuid="CZY") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0068 begin`);
      const actual: SppOptionValue = sppOptionOf('CZY');
      logInfo(`sppOptionOf(uuid="CZY"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('CZY');
      logInfo(`sppOptionOf(uuid="CZY"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="CZY"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0068 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0069
     * @tc.name      SerialCommunication_SppOptionOf_0069
     * @tc.desc      sppOptionOf(uuid="mWZbgVXEqztY") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0069 begin`);
      const actual: SppOptionValue = sppOptionOf('mWZbgVXEqztY');
      logInfo(`sppOptionOf(uuid="mWZbgVXEqztY"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('mWZbgVXEqztY');
      logInfo(`sppOptionOf(uuid="mWZbgVXEqztY"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="mWZbgVXEqztY"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0069 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0070
     * @tc.name      SerialCommunication_SppOptionOf_0070
     * @tc.desc      sppOptionOf(uuid="3NK") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0070 begin`);
      const actual: SppOptionValue = sppOptionOf('3NK');
      logInfo(`sppOptionOf(uuid="3NK"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('3NK');
      logInfo(`sppOptionOf(uuid="3NK"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="3NK"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0070 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0071
     * @tc.name      SerialCommunication_SppOptionOf_0071
     * @tc.desc      sppOptionOf(uuid="Zy") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0071 begin`);
      const actual: SppOptionValue = sppOptionOf('Zy');
      logInfo(`sppOptionOf(uuid="Zy"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('Zy');
      logInfo(`sppOptionOf(uuid="Zy"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="Zy"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0071 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0072
     * @tc.name      SerialCommunication_SppOptionOf_0072
     * @tc.desc      sppOptionOf(uuid="oZ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0072 begin`);
      const actual: SppOptionValue = sppOptionOf('oZ');
      logInfo(`sppOptionOf(uuid="oZ"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('oZ');
      logInfo(`sppOptionOf(uuid="oZ"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="oZ"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0072 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0073
     * @tc.name      SerialCommunication_SppOptionOf_0073
     * @tc.desc      sppOptionOf(uuid="8l") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0073 begin`);
      const actual: SppOptionValue = sppOptionOf('8l');
      logInfo(`sppOptionOf(uuid="8l"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('8l');
      logInfo(`sppOptionOf(uuid="8l"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="8l"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0073 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0074
     * @tc.name      SerialCommunication_SppOptionOf_0074
     * @tc.desc      sppOptionOf(uuid="A7iMWTDPP6") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0074 begin`);
      const actual: SppOptionValue = sppOptionOf('A7iMWTDPP6');
      logInfo(`sppOptionOf(uuid="A7iMWTDPP6"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('A7iMWTDPP6');
      logInfo(`sppOptionOf(uuid="A7iMWTDPP6"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="A7iMWTDPP6"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0074 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0075
     * @tc.name      SerialCommunication_SppOptionOf_0075
     * @tc.desc      sppOptionOf(uuid="Xm") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0075 begin`);
      const actual: SppOptionValue = sppOptionOf('Xm');
      logInfo(`sppOptionOf(uuid="Xm"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('Xm');
      logInfo(`sppOptionOf(uuid="Xm"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="Xm"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0075 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0076
     * @tc.name      SerialCommunication_SppOptionOf_0076
     * @tc.desc      sppOptionOf(uuid="R09i") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0076 begin`);
      const actual: SppOptionValue = sppOptionOf('R09i');
      logInfo(`sppOptionOf(uuid="R09i"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('R09i');
      logInfo(`sppOptionOf(uuid="R09i"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="R09i"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0076 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0077
     * @tc.name      SerialCommunication_SppOptionOf_0077
     * @tc.desc      sppOptionOf(uuid="RJQ4h") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0077 begin`);
      const actual: SppOptionValue = sppOptionOf('RJQ4h');
      logInfo(`sppOptionOf(uuid="RJQ4h"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('RJQ4h');
      logInfo(`sppOptionOf(uuid="RJQ4h"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="RJQ4h"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0077 end`);
    });
  });
}
