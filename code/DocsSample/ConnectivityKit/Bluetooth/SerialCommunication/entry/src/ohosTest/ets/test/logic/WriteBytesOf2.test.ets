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
import { writeBytesOf } from '../model/SppSerialLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SerialCommunication]';
const BUNDLE: string = 'SerialCommunication_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for writeBytesOf (5 cases). */
export default function writeBytesOf2Test(): void {
  describe('WriteBytesOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0086
     * @tc.name      SerialCommunication_WriteBytesOf_0086
     * @tc.desc      writeBytesOf(text="d2vjTWomY") returns [100,50,118,106,84,87,111,109,89]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0086 begin`);
      const actual: number[] = writeBytesOf('d2vjTWomY');
      logInfo(`writeBytesOf(text="d2vjTWomY"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(9);
      logInfo(`writeBytesOf(text="d2vjTWomY"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[100,50,118,106,84,87,111,109,89]');
      logInfo(`${BUNDLE}WriteBytesOf_0086 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0087
     * @tc.name      SerialCommunication_WriteBytesOf_0087
     * @tc.desc      writeBytesOf(text="BgF95nvim") returns [66,103,70,57,53,110,118,105,109]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0087 begin`);
      const actual: number[] = writeBytesOf('BgF95nvim');
      logInfo(`writeBytesOf(text="BgF95nvim"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(9);
      logInfo(`writeBytesOf(text="BgF95nvim"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[66,103,70,57,53,110,118,105,109]');
      logInfo(`${BUNDLE}WriteBytesOf_0087 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0088
     * @tc.name      SerialCommunication_WriteBytesOf_0088
     * @tc.desc      writeBytesOf(text="GRd") returns [71,82,100]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0088 begin`);
      const actual: number[] = writeBytesOf('GRd');
      logInfo(`writeBytesOf(text="GRd"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`writeBytesOf(text="GRd"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[71,82,100]');
      logInfo(`${BUNDLE}WriteBytesOf_0088 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0089
     * @tc.name      SerialCommunication_WriteBytesOf_0089
     * @tc.desc      writeBytesOf(text="5tMobe02") returns [53,116,77,111,98,101,48,50]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0089 begin`);
      const actual: number[] = writeBytesOf('5tMobe02');
      logInfo(`writeBytesOf(text="5tMobe02"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`writeBytesOf(text="5tMobe02"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[53,116,77,111,98,101,48,50]');
      logInfo(`${BUNDLE}WriteBytesOf_0089 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0090
     * @tc.name      SerialCommunication_WriteBytesOf_0090
     * @tc.desc      writeBytesOf(text="??_1") returns [228,184,173,0]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0090 begin`);
      const actual: number[] = writeBytesOf('\u4e2d\u6587_1');
      logInfo(`writeBytesOf(text="??_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`writeBytesOf(text="??_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[228,184,173,0]');
      logInfo(`${BUNDLE}WriteBytesOf_0090 end`);
    });
  });
}
