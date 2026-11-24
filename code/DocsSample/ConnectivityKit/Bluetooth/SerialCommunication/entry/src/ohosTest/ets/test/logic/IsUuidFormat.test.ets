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
import { isUuidFormat } from '../model/SppSerialLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SerialCommunication]';
const BUNDLE: string = 'SerialCommunication_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isUuidFormat (30 cases). */
export default function isUuidFormatTest(): void {
  describe('IsUuidFormatTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0001
     * @tc.name      SerialCommunication_IsUuidFormat_0001
     * @tc.desc      isUuidFormat(uuid="") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_IsUuidFormat_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0001 begin`);
      const actual: boolean = isUuidFormat('');
      logInfo(`isUuidFormat(uuid=""): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0001 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0002
     * @tc.name      SerialCommunication_IsUuidFormat_0002
     * @tc.desc      isUuidFormat(uuid="a") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_IsUuidFormat_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0002 begin`);
      const actual: boolean = isUuidFormat('a');
      logInfo(`isUuidFormat(uuid="a"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0002 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0003
     * @tc.name      SerialCommunication_IsUuidFormat_0003
     * @tc.desc      isUuidFormat(uuid="abc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_IsUuidFormat_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0003 begin`);
      const actual: boolean = isUuidFormat('abc');
      logInfo(`isUuidFormat(uuid="abc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0003 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0004
     * @tc.name      SerialCommunication_IsUuidFormat_0004
     * @tc.desc      isUuidFormat(uuid="Hello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_IsUuidFormat_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0004 begin`);
      const actual: boolean = isUuidFormat('Hello World');
      logInfo(`isUuidFormat(uuid="Hello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0004 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0005
     * @tc.name      SerialCommunication_IsUuidFormat_0005
     * @tc.desc      isUuidFormat(uuid=" ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_IsUuidFormat_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0005 begin`);
      const actual: boolean = isUuidFormat(' ');
      logInfo(`isUuidFormat(uuid=" "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0005 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0006
     * @tc.name      SerialCommunication_IsUuidFormat_0006
     * @tc.desc      isUuidFormat(uuid="123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_IsUuidFormat_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0006 begin`);
      const actual: boolean = isUuidFormat('123');
      logInfo(`isUuidFormat(uuid="123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0006 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0007
     * @tc.name      SerialCommunication_IsUuidFormat_0007
     * @tc.desc      isUuidFormat(uuid=" a ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_IsUuidFormat_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0007 begin`);
      const actual: boolean = isUuidFormat(' a ');
      logInfo(`isUuidFormat(uuid=" a "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0007 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0008
     * @tc.name      SerialCommunication_IsUuidFormat_0008
     * @tc.desc      isUuidFormat(uuid="aa") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_IsUuidFormat_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0008 begin`);
      const actual: boolean = isUuidFormat('aa');
      logInfo(`isUuidFormat(uuid="aa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0008 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0009
     * @tc.name      SerialCommunication_IsUuidFormat_0009
     * @tc.desc      isUuidFormat(uuid="a_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_IsUuidFormat_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0009 begin`);
      const actual: boolean = isUuidFormat('a_1');
      logInfo(`isUuidFormat(uuid="a_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0009 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0010
     * @tc.name      SerialCommunication_IsUuidFormat_0010
     * @tc.desc      isUuidFormat(uuid="xa") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_IsUuidFormat_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0010 begin`);
      const actual: boolean = isUuidFormat('xa');
      logInfo(`isUuidFormat(uuid="xa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0010 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0011
     * @tc.name      SerialCommunication_IsUuidFormat_0011
     * @tc.desc      isUuidFormat(uuid=" abc ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_IsUuidFormat_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0011 begin`);
      const actual: boolean = isUuidFormat(' abc ');
      logInfo(`isUuidFormat(uuid=" abc "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0011 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0012
     * @tc.name      SerialCommunication_IsUuidFormat_0012
     * @tc.desc      isUuidFormat(uuid="abcabc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_IsUuidFormat_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0012 begin`);
      const actual: boolean = isUuidFormat('abcabc');
      logInfo(`isUuidFormat(uuid="abcabc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0012 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0013
     * @tc.name      SerialCommunication_IsUuidFormat_0013
     * @tc.desc      isUuidFormat(uuid="abc_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_IsUuidFormat_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0013 begin`);
      const actual: boolean = isUuidFormat('abc_1');
      logInfo(`isUuidFormat(uuid="abc_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0013 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0014
     * @tc.name      SerialCommunication_IsUuidFormat_0014
     * @tc.desc      isUuidFormat(uuid="xabc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_IsUuidFormat_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0014 begin`);
      const actual: boolean = isUuidFormat('xabc');
      logInfo(`isUuidFormat(uuid="xabc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0014 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0015
     * @tc.name      SerialCommunication_IsUuidFormat_0015
     * @tc.desc      isUuidFormat(uuid=" Hello World ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_IsUuidFormat_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0015 begin`);
      const actual: boolean = isUuidFormat(' Hello World ');
      logInfo(`isUuidFormat(uuid=" Hello World "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0015 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0016
     * @tc.name      SerialCommunication_IsUuidFormat_0016
     * @tc.desc      isUuidFormat(uuid="Hello WorldHello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_IsUuidFormat_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0016 begin`);
      const actual: boolean = isUuidFormat('Hello WorldHello World');
      logInfo(`isUuidFormat(uuid="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0016 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0017
     * @tc.name      SerialCommunication_IsUuidFormat_0017
     * @tc.desc      isUuidFormat(uuid="Hello World_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_IsUuidFormat_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0017 begin`);
      const actual: boolean = isUuidFormat('Hello World_1');
      logInfo(`isUuidFormat(uuid="Hello World_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0017 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0018
     * @tc.name      SerialCommunication_IsUuidFormat_0018
     * @tc.desc      isUuidFormat(uuid="xHello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_IsUuidFormat_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0018 begin`);
      const actual: boolean = isUuidFormat('xHello World');
      logInfo(`isUuidFormat(uuid="xHello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0018 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0019
     * @tc.name      SerialCommunication_IsUuidFormat_0019
     * @tc.desc      isUuidFormat(uuid="   ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_IsUuidFormat_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0019 begin`);
      const actual: boolean = isUuidFormat('   ');
      logInfo(`isUuidFormat(uuid="   "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0019 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0020
     * @tc.name      SerialCommunication_IsUuidFormat_0020
     * @tc.desc      isUuidFormat(uuid="  ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_IsUuidFormat_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0020 begin`);
      const actual: boolean = isUuidFormat('  ');
      logInfo(`isUuidFormat(uuid="  "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0020 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0021
     * @tc.name      SerialCommunication_IsUuidFormat_0021
     * @tc.desc      isUuidFormat(uuid=" _1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_IsUuidFormat_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0021 begin`);
      const actual: boolean = isUuidFormat(' _1');
      logInfo(`isUuidFormat(uuid=" _1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0021 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0022
     * @tc.name      SerialCommunication_IsUuidFormat_0022
     * @tc.desc      isUuidFormat(uuid="x ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_IsUuidFormat_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0022 begin`);
      const actual: boolean = isUuidFormat('x ');
      logInfo(`isUuidFormat(uuid="x "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0022 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0023
     * @tc.name      SerialCommunication_IsUuidFormat_0023
     * @tc.desc      isUuidFormat(uuid=" 123 ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_IsUuidFormat_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0023 begin`);
      const actual: boolean = isUuidFormat(' 123 ');
      logInfo(`isUuidFormat(uuid=" 123 "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0023 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0024
     * @tc.name      SerialCommunication_IsUuidFormat_0024
     * @tc.desc      isUuidFormat(uuid="123123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_IsUuidFormat_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0024 begin`);
      const actual: boolean = isUuidFormat('123123');
      logInfo(`isUuidFormat(uuid="123123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0024 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0025
     * @tc.name      SerialCommunication_IsUuidFormat_0025
     * @tc.desc      isUuidFormat(uuid="123_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_IsUuidFormat_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0025 begin`);
      const actual: boolean = isUuidFormat('123_1');
      logInfo(`isUuidFormat(uuid="123_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0025 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0026
     * @tc.name      SerialCommunication_IsUuidFormat_0026
     * @tc.desc      isUuidFormat(uuid="x123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_IsUuidFormat_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0026 begin`);
      const actual: boolean = isUuidFormat('x123');
      logInfo(`isUuidFormat(uuid="x123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0026 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0027
     * @tc.name      SerialCommunication_IsUuidFormat_0027
     * @tc.desc      isUuidFormat(uuid="upg") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_IsUuidFormat_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0027 begin`);
      const actual: boolean = isUuidFormat('upg');
      logInfo(`isUuidFormat(uuid="upg"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0027 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0028
     * @tc.name      SerialCommunication_IsUuidFormat_0028
     * @tc.desc      isUuidFormat(uuid="2vcsp") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_IsUuidFormat_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0028 begin`);
      const actual: boolean = isUuidFormat('2vcsp');
      logInfo(`isUuidFormat(uuid="2vcsp"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0028 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0029
     * @tc.name      SerialCommunication_IsUuidFormat_0029
     * @tc.desc      isUuidFormat(uuid="Dg2F1mOZFwDa") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_IsUuidFormat_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0029 begin`);
      const actual: boolean = isUuidFormat('Dg2F1mOZFwDa');
      logInfo(`isUuidFormat(uuid="Dg2F1mOZFwDa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0029 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_IS_UUID_FORMAT_0030
     * @tc.name      SerialCommunication_IsUuidFormat_0030
     * @tc.desc      isUuidFormat(uuid="SoqIb") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_IsUuidFormat_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsUuidFormat_0030 begin`);
      const actual: boolean = isUuidFormat('SoqIb');
      logInfo(`isUuidFormat(uuid="SoqIb"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsUuidFormat_0030 end`);
    });
  });
}
