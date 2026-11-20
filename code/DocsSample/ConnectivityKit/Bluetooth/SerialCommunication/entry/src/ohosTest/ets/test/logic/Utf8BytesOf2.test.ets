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
import { utf8BytesOf } from '../model/SppSerialLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SerialCommunication]';
const BUNDLE: string = 'SerialCommunication_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for utf8BytesOf (5 cases). */
export default function utf8BytesOf2Test(): void {
  describe('Utf8BytesOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0086
     * @tc.name      SerialCommunication_Utf8BytesOf_0086
     * @tc.desc      utf8BytesOf(text="aa1ckGa") returns [97,97,49,99,107,71,97]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0086 begin`);
      const actual: number[] = utf8BytesOf('aa1ckGa');
      logInfo(`utf8BytesOf(text="aa1ckGa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`utf8BytesOf(text="aa1ckGa"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[97,97,49,99,107,71,97]');
      logInfo(`${BUNDLE}Utf8BytesOf_0086 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0087
     * @tc.name      SerialCommunication_Utf8BytesOf_0087
     * @tc.desc      utf8BytesOf(text="tMBOa") returns [116,77,66,79,97]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0087 begin`);
      const actual: number[] = utf8BytesOf('tMBOa');
      logInfo(`utf8BytesOf(text="tMBOa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`utf8BytesOf(text="tMBOa"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[116,77,66,79,97]');
      logInfo(`${BUNDLE}Utf8BytesOf_0087 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0088
     * @tc.name      SerialCommunication_Utf8BytesOf_0088
     * @tc.desc      utf8BytesOf(text="55DNxZ4l") returns [53,53,68,78,120,90,52,108]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0088 begin`);
      const actual: number[] = utf8BytesOf('55DNxZ4l');
      logInfo(`utf8BytesOf(text="55DNxZ4l"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`utf8BytesOf(text="55DNxZ4l"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[53,53,68,78,120,90,52,108]');
      logInfo(`${BUNDLE}Utf8BytesOf_0088 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0089
     * @tc.name      SerialCommunication_Utf8BytesOf_0089
     * @tc.desc      utf8BytesOf(text="DEd") returns [68,69,100]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0089 begin`);
      const actual: number[] = utf8BytesOf('DEd');
      logInfo(`utf8BytesOf(text="DEd"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`utf8BytesOf(text="DEd"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[68,69,100]');
      logInfo(`${BUNDLE}Utf8BytesOf_0089 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0090
     * @tc.name      SerialCommunication_Utf8BytesOf_0090
     * @tc.desc      utf8BytesOf(text="J") returns [74]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0090 begin`);
      const actual: number[] = utf8BytesOf('J');
      logInfo(`utf8BytesOf(text="J"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`utf8BytesOf(text="J"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[74]');
      logInfo(`${BUNDLE}Utf8BytesOf_0090 end`);
    });
  });
}
