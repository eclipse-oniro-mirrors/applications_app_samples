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
import { uint8JsonOf } from '../model/SppSerialLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SerialCommunication]';
const BUNDLE: string = 'SerialCommunication_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for uint8JsonOf (8 cases). */
export default function uint8JsonOfTest(): void {
  describe('Uint8JsonOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UINT8_JSON_OF_0001
     * @tc.name      SerialCommunication_Uint8JsonOf_0001
     * @tc.desc      uint8JsonOf(bytes=[]) returns "{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_Uint8JsonOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Uint8JsonOf_0001 begin`);
      const actual: string = uint8JsonOf([]);
      logInfo(`uint8JsonOf(bytes=[]): actual=${actual}`);
      expect(actual).assertEqual('{}');
      logInfo(`${BUNDLE}Uint8JsonOf_0001 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UINT8_JSON_OF_0002
     * @tc.name      SerialCommunication_Uint8JsonOf_0002
     * @tc.desc      uint8JsonOf(bytes=[0]) returns "{?"0?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_Uint8JsonOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Uint8JsonOf_0002 begin`);
      const actual: string = uint8JsonOf([0]);
      logInfo(`uint8JsonOf(bytes=[0]): actual=${actual}`);
      expect(actual).assertEqual('{"0":0}');
      logInfo(`${BUNDLE}Uint8JsonOf_0002 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UINT8_JSON_OF_0003
     * @tc.name      SerialCommunication_Uint8JsonOf_0003
     * @tc.desc      uint8JsonOf(bytes=[0, -1]) returns "{?"0?":0,?"1?":255}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Uint8JsonOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Uint8JsonOf_0003 begin`);
      const actual: string = uint8JsonOf([0, -1]);
      logInfo(`uint8JsonOf(bytes=[0, -1]): actual=${actual}`);
      expect(actual).assertEqual('{"0":0,"1":255}');
      logInfo(`${BUNDLE}Uint8JsonOf_0003 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UINT8_JSON_OF_0004
     * @tc.name      SerialCommunication_Uint8JsonOf_0004
     * @tc.desc      uint8JsonOf(bytes=[-1, 0, 1]) returns "{?"0?":255,?"1?":0,?"2?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Uint8JsonOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Uint8JsonOf_0004 begin`);
      const actual: string = uint8JsonOf([-1, 0, 1]);
      logInfo(`uint8JsonOf(bytes=[-1, 0, 1]): actual=${actual}`);
      expect(actual).assertEqual('{"0":255,"1":0,"2":1}');
      logInfo(`${BUNDLE}Uint8JsonOf_0004 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UINT8_JSON_OF_0005
     * @tc.name      SerialCommunication_Uint8JsonOf_0005
     * @tc.desc      uint8JsonOf(bytes=[1, 1]) returns "{?"0?":1,?"1?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Uint8JsonOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Uint8JsonOf_0005 begin`);
      const actual: string = uint8JsonOf([1, 1]);
      logInfo(`uint8JsonOf(bytes=[1, 1]): actual=${actual}`);
      expect(actual).assertEqual('{"0":1,"1":1}');
      logInfo(`${BUNDLE}Uint8JsonOf_0005 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UINT8_JSON_OF_0006
     * @tc.name      SerialCommunication_Uint8JsonOf_0006
     * @tc.desc      uint8JsonOf(bytes=[0, -1, 1, 255, 254]) returns "{?"0?":0,?"1?":255,?"2?":1,?"3?":255,?"4?":254}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Uint8JsonOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Uint8JsonOf_0006 begin`);
      const actual: string = uint8JsonOf([0, -1, 1, 255, 254]);
      logInfo(`uint8JsonOf(bytes=[0, -1, 1, 255, 254]): actual=${actual}`);
      expect(actual).assertEqual('{"0":0,"1":255,"2":1,"3":255,"4":254}');
      logInfo(`${BUNDLE}Uint8JsonOf_0006 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UINT8_JSON_OF_0007
     * @tc.name      SerialCommunication_Uint8JsonOf_0007
     * @tc.desc      uint8JsonOf(bytes=[255, -1, 254, -1, 256]) returns "{?"0?":255,?"1?":255,?"2?":254,?"3?":255,?"4...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Uint8JsonOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Uint8JsonOf_0007 begin`);
      const actual: string = uint8JsonOf([255, -1, 254, -1, 256]);
      logInfo(`uint8JsonOf(bytes=[255, -1, 254, -1, 256]): actual=${actual}`);
      expect(actual).assertEqual('{"0":255,"1":255,"2":254,"3":255,"4":0}');
      logInfo(`${BUNDLE}Uint8JsonOf_0007 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UINT8_JSON_OF_0008
     * @tc.name      SerialCommunication_Uint8JsonOf_0008
     * @tc.desc      uint8JsonOf(bytes=[256, 254, 255, 1, -1, 0]) returns "{?"0?":0,?"1?":254,?"2?":255,?"3?":1,?"4?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Uint8JsonOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Uint8JsonOf_0008 begin`);
      const actual: string = uint8JsonOf([256, 254, 255, 1, -1, 0]);
      logInfo(`uint8JsonOf(bytes=[256, 254, 255, 1, -1, 0]): actual=${actual}`);
      expect(actual).assertEqual('{"0":0,"1":254,"2":255,"3":1,"4":255,"5":0}');
      logInfo(`${BUNDLE}Uint8JsonOf_0008 end`);
    });
  });
}
