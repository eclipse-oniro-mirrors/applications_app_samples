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
import { yieldToEventLoop } from '../EventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  NAME_BUFFER_SIZE, PAGE_OFFSET, PAGE_OFFSET_64, RAW_CONTENT, RAW_CONTENT_64, RAW_FILE, RAW_FILE_64
} from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for NdkRawfileLogic (7 cases). */
export default function ndkRawfileLogicConstantsTest(): void {
  describe('NdkRawfileLogicConstantsTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_LOGIC_CONSTANTS_0001
     * @tc.name      NdkRawfile_NdkRawfileLogicConstants_0001
     * @tc.desc      RAW_FILE keeps value "rawfile.txt"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_NdkRawfileLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NdkRawfileLogicConstants_0001 begin`);
      const actual: string = RAW_FILE;
      logInfo(`RAW_FILE: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt');
      logInfo(`${BUNDLE}NdkRawfileLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_LOGIC_CONSTANTS_0002
     * @tc.name      NdkRawfile_NdkRawfileLogicConstants_0002
     * @tc.desc      RAW_FILE_64 keeps value "rawfile1.txt"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_NdkRawfileLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NdkRawfileLogicConstants_0002 begin`);
      const actual: string = RAW_FILE_64;
      logInfo(`RAW_FILE_64: actual=${actual}`);
      expect(actual).assertEqual('rawfile1.txt');
      logInfo(`${BUNDLE}NdkRawfileLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_LOGIC_CONSTANTS_0003
     * @tc.name      NdkRawfile_NdkRawfileLogicConstants_0003
     * @tc.desc      RAW_CONTENT keeps value "rawfile1 content"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_NdkRawfileLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkRawfileLogicConstants_0003 begin`);
      const actual: string = RAW_CONTENT;
      logInfo(`RAW_CONTENT: actual=${actual}`);
      expect(actual).assertEqual('rawfile1 content');
      logInfo(`${BUNDLE}NdkRawfileLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_LOGIC_CONSTANTS_0004
     * @tc.name      NdkRawfile_NdkRawfileLogicConstants_0004
     * @tc.desc      RAW_CONTENT_64 keeps value "rawfile content for 64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_NdkRawfileLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkRawfileLogicConstants_0004 begin`);
      const actual: string = RAW_CONTENT_64;
      logInfo(`RAW_CONTENT_64: actual=${actual}`);
      expect(actual).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}NdkRawfileLogicConstants_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_LOGIC_CONSTANTS_0005
     * @tc.name      NdkRawfile_NdkRawfileLogicConstants_0005
     * @tc.desc      PAGE_OFFSET keeps value 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_NdkRawfileLogicConstants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkRawfileLogicConstants_0005 begin`);
      const actual: number = PAGE_OFFSET;
      logInfo(`PAGE_OFFSET: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NdkRawfileLogicConstants_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_LOGIC_CONSTANTS_0006
     * @tc.name      NdkRawfile_NdkRawfileLogicConstants_0006
     * @tc.desc      PAGE_OFFSET_64 keeps value 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_NdkRawfileLogicConstants_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkRawfileLogicConstants_0006 begin`);
      const actual: number = PAGE_OFFSET_64;
      logInfo(`PAGE_OFFSET_64: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}NdkRawfileLogicConstants_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_LOGIC_CONSTANTS_0007
     * @tc.name      NdkRawfile_NdkRawfileLogicConstants_0007
     * @tc.desc      NAME_BUFFER_SIZE keeps value 256
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_NdkRawfileLogicConstants_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkRawfileLogicConstants_0007 begin`);
      const actual: number = NAME_BUFFER_SIZE;
      logInfo(`NAME_BUFFER_SIZE: actual=${actual}`);
      expect(actual).assertEqual(256);
      logInfo(`${BUNDLE}NdkRawfileLogicConstants_0007 end`);
    });
  });
}
