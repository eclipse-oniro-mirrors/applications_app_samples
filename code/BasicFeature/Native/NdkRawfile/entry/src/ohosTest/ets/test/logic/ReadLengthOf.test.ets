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
import { readLengthOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for readLengthOf (96 cases). */
export default function readLengthOfTest(): void {
  describe('ReadLengthOfTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0001
     * @tc.name      NdkRawfile_ReadLengthOf_0001
     * @tc.desc      readLengthOf(fileSize=0, offset=-100, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_ReadLengthOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0001 begin`);
      const actual: number = readLengthOf(0, -100, 0);
      logInfo(`readLengthOf(fileSize=0, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0002
     * @tc.name      NdkRawfile_ReadLengthOf_0002
     * @tc.desc      readLengthOf(fileSize=1, offset=-100, length=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_ReadLengthOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0002 begin`);
      const actual: number = readLengthOf(1, -100, 0);
      logInfo(`readLengthOf(fileSize=1, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ReadLengthOf_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0003
     * @tc.name      NdkRawfile_ReadLengthOf_0003
     * @tc.desc      readLengthOf(fileSize=-1, offset=-100, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0003 begin`);
      const actual: number = readLengthOf(-1, -100, 0);
      logInfo(`readLengthOf(fileSize=-1, offset=-100, le...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0004
     * @tc.name      NdkRawfile_ReadLengthOf_0004
     * @tc.desc      readLengthOf(fileSize=2, offset=-100, length=0) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0004 begin`);
      const actual: number = readLengthOf(2, -100, 0);
      logInfo(`readLengthOf(fileSize=2, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0005
     * @tc.name      NdkRawfile_ReadLengthOf_0005
     * @tc.desc      readLengthOf(fileSize=5, offset=-100, length=0) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0005 begin`);
      const actual: number = readLengthOf(5, -100, 0);
      logInfo(`readLengthOf(fileSize=5, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadLengthOf_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0006
     * @tc.name      NdkRawfile_ReadLengthOf_0006
     * @tc.desc      readLengthOf(fileSize=10, offset=-100, length=0) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0006 begin`);
      const actual: number = readLengthOf(10, -100, 0);
      logInfo(`readLengthOf(fileSize=10, offset=-100, le...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ReadLengthOf_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0007
     * @tc.name      NdkRawfile_ReadLengthOf_0007
     * @tc.desc      readLengthOf(fileSize=100, offset=-100, length=0) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0007 begin`);
      const actual: number = readLengthOf(100, -100, 0);
      logInfo(`readLengthOf(fileSize=100, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ReadLengthOf_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0008
     * @tc.name      NdkRawfile_ReadLengthOf_0008
     * @tc.desc      readLengthOf(fileSize=3, offset=-100, length=0) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0008 begin`);
      const actual: number = readLengthOf(3, -100, 0);
      logInfo(`readLengthOf(fileSize=3, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ReadLengthOf_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0009
     * @tc.name      NdkRawfile_ReadLengthOf_0009
     * @tc.desc      readLengthOf(fileSize=15, offset=-100, length=0) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0009 begin`);
      const actual: number = readLengthOf(15, -100, 0);
      logInfo(`readLengthOf(fileSize=15, offset=-100, le...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadLengthOf_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0010
     * @tc.name      NdkRawfile_ReadLengthOf_0010
     * @tc.desc      readLengthOf(fileSize=20, offset=-100, length=0) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0010 begin`);
      const actual: number = readLengthOf(20, -100, 0);
      logInfo(`readLengthOf(fileSize=20, offset=-100, le...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}ReadLengthOf_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0011
     * @tc.name      NdkRawfile_ReadLengthOf_0011
     * @tc.desc      readLengthOf(fileSize=139, offset=-100, length=0) returns 139
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0011 begin`);
      const actual: number = readLengthOf(139, -100, 0);
      logInfo(`readLengthOf(fileSize=139, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(139);
      logInfo(`${BUNDLE}ReadLengthOf_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0012
     * @tc.name      NdkRawfile_ReadLengthOf_0012
     * @tc.desc      readLengthOf(fileSize=176, offset=-100, length=0) returns 176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0012 begin`);
      const actual: number = readLengthOf(176, -100, 0);
      logInfo(`readLengthOf(fileSize=176, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(176);
      logInfo(`${BUNDLE}ReadLengthOf_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0013
     * @tc.name      NdkRawfile_ReadLengthOf_0013
     * @tc.desc      readLengthOf(fileSize=176, offset=-100, length=164) returns 164
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0013 begin`);
      const actual: number = readLengthOf(176, -100, 164);
      logInfo(`readLengthOf(fileSize=176, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(164);
      logInfo(`${BUNDLE}ReadLengthOf_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0014
     * @tc.name      NdkRawfile_ReadLengthOf_0014
     * @tc.desc      readLengthOf(fileSize=139, offset=-100, length=152) returns 152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0014 begin`);
      const actual: number = readLengthOf(139, -100, 152);
      logInfo(`readLengthOf(fileSize=139, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(152);
      logInfo(`${BUNDLE}ReadLengthOf_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0015
     * @tc.name      NdkRawfile_ReadLengthOf_0015
     * @tc.desc      readLengthOf(fileSize=0, offset=-1, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0015 begin`);
      const actual: number = readLengthOf(0, -1, 0);
      logInfo(`readLengthOf(fileSize=0, offset=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0016
     * @tc.name      NdkRawfile_ReadLengthOf_0016
     * @tc.desc      readLengthOf(fileSize=0, offset=0, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0016 begin`);
      const actual: number = readLengthOf(0, 0, 0);
      logInfo(`readLengthOf(fileSize=0, offset=0, length=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0017
     * @tc.name      NdkRawfile_ReadLengthOf_0017
     * @tc.desc      readLengthOf(fileSize=0, offset=1, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0017 begin`);
      const actual: number = readLengthOf(0, 1, 0);
      logInfo(`readLengthOf(fileSize=0, offset=1, length=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0018
     * @tc.name      NdkRawfile_ReadLengthOf_0018
     * @tc.desc      readLengthOf(fileSize=0, offset=50, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0018 begin`);
      const actual: number = readLengthOf(0, 50, 0);
      logInfo(`readLengthOf(fileSize=0, offset=50, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0019
     * @tc.name      NdkRawfile_ReadLengthOf_0019
     * @tc.desc      readLengthOf(fileSize=0, offset=100, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0019 begin`);
      const actual: number = readLengthOf(0, 100, 0);
      logInfo(`readLengthOf(fileSize=0, offset=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0020
     * @tc.name      NdkRawfile_ReadLengthOf_0020
     * @tc.desc      readLengthOf(fileSize=0, offset=2, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0020 begin`);
      const actual: number = readLengthOf(0, 2, 0);
      logInfo(`readLengthOf(fileSize=0, offset=2, length=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0021
     * @tc.name      NdkRawfile_ReadLengthOf_0021
     * @tc.desc      readLengthOf(fileSize=0, offset=3, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0021 begin`);
      const actual: number = readLengthOf(0, 3, 0);
      logInfo(`readLengthOf(fileSize=0, offset=3, length=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0022
     * @tc.name      NdkRawfile_ReadLengthOf_0022
     * @tc.desc      readLengthOf(fileSize=0, offset=10, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0022 begin`);
      const actual: number = readLengthOf(0, 10, 0);
      logInfo(`readLengthOf(fileSize=0, offset=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0023
     * @tc.name      NdkRawfile_ReadLengthOf_0023
     * @tc.desc      readLengthOf(fileSize=0, offset=5, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0023 begin`);
      const actual: number = readLengthOf(0, 5, 0);
      logInfo(`readLengthOf(fileSize=0, offset=5, length=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0024
     * @tc.name      NdkRawfile_ReadLengthOf_0024
     * @tc.desc      readLengthOf(fileSize=0, offset=15, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0024 begin`);
      const actual: number = readLengthOf(0, 15, 0);
      logInfo(`readLengthOf(fileSize=0, offset=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0025
     * @tc.name      NdkRawfile_ReadLengthOf_0025
     * @tc.desc      readLengthOf(fileSize=0, offset=51.07, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0025 begin`);
      const actual: number = readLengthOf(0, 51.07, 0);
      logInfo(`readLengthOf(fileSize=0, offset=51.07, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0026
     * @tc.name      NdkRawfile_ReadLengthOf_0026
     * @tc.desc      readLengthOf(fileSize=0, offset=-100, length=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0026 begin`);
      const actual: number = readLengthOf(0, -100, 1);
      logInfo(`readLengthOf(fileSize=0, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ReadLengthOf_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0027
     * @tc.name      NdkRawfile_ReadLengthOf_0027
     * @tc.desc      readLengthOf(fileSize=0, offset=-100, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0027 begin`);
      const actual: number = readLengthOf(0, -100, -1);
      logInfo(`readLengthOf(fileSize=0, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0028
     * @tc.name      NdkRawfile_ReadLengthOf_0028
     * @tc.desc      readLengthOf(fileSize=0, offset=-100, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0028 begin`);
      const actual: number = readLengthOf(0, -100, 2);
      logInfo(`readLengthOf(fileSize=0, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0029
     * @tc.name      NdkRawfile_ReadLengthOf_0029
     * @tc.desc      readLengthOf(fileSize=0, offset=-100, length=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0029 begin`);
      const actual: number = readLengthOf(0, -100, 5);
      logInfo(`readLengthOf(fileSize=0, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadLengthOf_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0030
     * @tc.name      NdkRawfile_ReadLengthOf_0030
     * @tc.desc      readLengthOf(fileSize=0, offset=-100, length=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0030 begin`);
      const actual: number = readLengthOf(0, -100, 10);
      logInfo(`readLengthOf(fileSize=0, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ReadLengthOf_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0031
     * @tc.name      NdkRawfile_ReadLengthOf_0031
     * @tc.desc      readLengthOf(fileSize=0, offset=-100, length=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0031 begin`);
      const actual: number = readLengthOf(0, -100, 100);
      logInfo(`readLengthOf(fileSize=0, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ReadLengthOf_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0032
     * @tc.name      NdkRawfile_ReadLengthOf_0032
     * @tc.desc      readLengthOf(fileSize=0, offset=-100, length=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0032 begin`);
      const actual: number = readLengthOf(0, -100, 3);
      logInfo(`readLengthOf(fileSize=0, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ReadLengthOf_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0033
     * @tc.name      NdkRawfile_ReadLengthOf_0033
     * @tc.desc      readLengthOf(fileSize=0, offset=-100, length=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0033 begin`);
      const actual: number = readLengthOf(0, -100, 15);
      logInfo(`readLengthOf(fileSize=0, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadLengthOf_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0034
     * @tc.name      NdkRawfile_ReadLengthOf_0034
     * @tc.desc      readLengthOf(fileSize=0, offset=-100, length=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0034 begin`);
      const actual: number = readLengthOf(0, -100, 20);
      logInfo(`readLengthOf(fileSize=0, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}ReadLengthOf_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0035
     * @tc.name      NdkRawfile_ReadLengthOf_0035
     * @tc.desc      readLengthOf(fileSize=0, offset=-100, length=164) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0035 begin`);
      const actual: number = readLengthOf(0, -100, 164);
      logInfo(`readLengthOf(fileSize=0, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0036
     * @tc.name      NdkRawfile_ReadLengthOf_0036
     * @tc.desc      readLengthOf(fileSize=0, offset=-100, length=152) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0036 begin`);
      const actual: number = readLengthOf(0, -100, 152);
      logInfo(`readLengthOf(fileSize=0, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0037
     * @tc.name      NdkRawfile_ReadLengthOf_0037
     * @tc.desc      readLengthOf(fileSize=5, offset=-100, length=164) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0037 begin`);
      const actual: number = readLengthOf(5, -100, 164);
      logInfo(`readLengthOf(fileSize=5, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadLengthOf_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0038
     * @tc.name      NdkRawfile_ReadLengthOf_0038
     * @tc.desc      readLengthOf(fileSize=1, offset=5, length=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0038 begin`);
      const actual: number = readLengthOf(1, 5, 100);
      logInfo(`readLengthOf(fileSize=1, offset=5, length...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ReadLengthOf_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0039
     * @tc.name      NdkRawfile_ReadLengthOf_0039
     * @tc.desc      readLengthOf(fileSize=1, offset=2, length=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0039 begin`);
      const actual: number = readLengthOf(1, 2, 100);
      logInfo(`readLengthOf(fileSize=1, offset=2, length...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ReadLengthOf_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0040
     * @tc.name      NdkRawfile_ReadLengthOf_0040
     * @tc.desc      readLengthOf(fileSize=139, offset=51.07, length=0) returns 139
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0040 begin`);
      const actual: number = readLengthOf(139, 51.07, 0);
      logInfo(`readLengthOf(fileSize=139, offset=51.07, ...: actual=${actual}`);
      expect(actual).assertEqual(139);
      logInfo(`${BUNDLE}ReadLengthOf_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0041
     * @tc.name      NdkRawfile_ReadLengthOf_0041
     * @tc.desc      readLengthOf(fileSize=15, offset=51.07, length=1) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0041 begin`);
      const actual: number = readLengthOf(15, 51.07, 1);
      logInfo(`readLengthOf(fileSize=15, offset=51.07, l...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadLengthOf_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0042
     * @tc.name      NdkRawfile_ReadLengthOf_0042
     * @tc.desc      readLengthOf(fileSize=0, offset=3, length=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0042 begin`);
      const actual: number = readLengthOf(0, 3, 10);
      logInfo(`readLengthOf(fileSize=0, offset=3, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0043
     * @tc.name      NdkRawfile_ReadLengthOf_0043
     * @tc.desc      readLengthOf(fileSize=20, offset=2, length=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0043 begin`);
      const actual: number = readLengthOf(20, 2, 3);
      logInfo(`readLengthOf(fileSize=20, offset=2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ReadLengthOf_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0044
     * @tc.name      NdkRawfile_ReadLengthOf_0044
     * @tc.desc      readLengthOf(fileSize=20, offset=2, length=100) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0044 begin`);
      const actual: number = readLengthOf(20, 2, 100);
      logInfo(`readLengthOf(fileSize=20, offset=2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}ReadLengthOf_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0045
     * @tc.name      NdkRawfile_ReadLengthOf_0045
     * @tc.desc      readLengthOf(fileSize=10, offset=100, length=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0045 begin`);
      const actual: number = readLengthOf(10, 100, 10);
      logInfo(`readLengthOf(fileSize=10, offset=100, len...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ReadLengthOf_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0046
     * @tc.name      NdkRawfile_ReadLengthOf_0046
     * @tc.desc      readLengthOf(fileSize=15, offset=5, length=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0046 begin`);
      const actual: number = readLengthOf(15, 5, 10);
      logInfo(`readLengthOf(fileSize=15, offset=5, lengt...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ReadLengthOf_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0047
     * @tc.name      NdkRawfile_ReadLengthOf_0047
     * @tc.desc      readLengthOf(fileSize=15, offset=15, length=10) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0047 begin`);
      const actual: number = readLengthOf(15, 15, 10);
      logInfo(`readLengthOf(fileSize=15, offset=15, leng...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadLengthOf_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0048
     * @tc.name      NdkRawfile_ReadLengthOf_0048
     * @tc.desc      readLengthOf(fileSize=0, offset=0, length=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0048 begin`);
      const actual: number = readLengthOf(0, 0, 10);
      logInfo(`readLengthOf(fileSize=0, offset=0, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0049
     * @tc.name      NdkRawfile_ReadLengthOf_0049
     * @tc.desc      readLengthOf(fileSize=-1, offset=100, length=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0049 begin`);
      const actual: number = readLengthOf(-1, 100, 10);
      logInfo(`readLengthOf(fileSize=-1, offset=100, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0050
     * @tc.name      NdkRawfile_ReadLengthOf_0050
     * @tc.desc      readLengthOf(fileSize=100, offset=100, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0050 begin`);
      const actual: number = readLengthOf(100, 100, -1);
      logInfo(`readLengthOf(fileSize=100, offset=100, le...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0051
     * @tc.name      NdkRawfile_ReadLengthOf_0051
     * @tc.desc      readLengthOf(fileSize=100, offset=0, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0051 begin`);
      const actual: number = readLengthOf(100, 0, -1);
      logInfo(`readLengthOf(fileSize=100, offset=0, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0052
     * @tc.name      NdkRawfile_ReadLengthOf_0052
     * @tc.desc      readLengthOf(fileSize=10, offset=-1, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0052 begin`);
      const actual: number = readLengthOf(10, -1, -1);
      logInfo(`readLengthOf(fileSize=10, offset=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0053
     * @tc.name      NdkRawfile_ReadLengthOf_0053
     * @tc.desc      readLengthOf(fileSize=100, offset=100, length=10) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0053 begin`);
      const actual: number = readLengthOf(100, 100, 10);
      logInfo(`readLengthOf(fileSize=100, offset=100, le...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ReadLengthOf_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0054
     * @tc.name      NdkRawfile_ReadLengthOf_0054
     * @tc.desc      readLengthOf(fileSize=2, offset=50, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0054 begin`);
      const actual: number = readLengthOf(2, 50, 2);
      logInfo(`readLengthOf(fileSize=2, offset=50, lengt...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0055
     * @tc.name      NdkRawfile_ReadLengthOf_0055
     * @tc.desc      readLengthOf(fileSize=-1, offset=100, length=20) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0055 begin`);
      const actual: number = readLengthOf(-1, 100, 20);
      logInfo(`readLengthOf(fileSize=-1, offset=100, len...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0056
     * @tc.name      NdkRawfile_ReadLengthOf_0056
     * @tc.desc      readLengthOf(fileSize=15, offset=-100, length=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0056 begin`);
      const actual: number = readLengthOf(15, -100, 15);
      logInfo(`readLengthOf(fileSize=15, offset=-100, le...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadLengthOf_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0057
     * @tc.name      NdkRawfile_ReadLengthOf_0057
     * @tc.desc      readLengthOf(fileSize=20, offset=10, length=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0057 begin`);
      const actual: number = readLengthOf(20, 10, 1);
      logInfo(`readLengthOf(fileSize=20, offset=10, leng...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ReadLengthOf_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0058
     * @tc.name      NdkRawfile_ReadLengthOf_0058
     * @tc.desc      readLengthOf(fileSize=10, offset=3, length=152) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0058 begin`);
      const actual: number = readLengthOf(10, 3, 152);
      logInfo(`readLengthOf(fileSize=10, offset=3, lengt...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ReadLengthOf_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0059
     * @tc.name      NdkRawfile_ReadLengthOf_0059
     * @tc.desc      readLengthOf(fileSize=176, offset=50, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0059 begin`);
      const actual: number = readLengthOf(176, 50, 2);
      logInfo(`readLengthOf(fileSize=176, offset=50, len...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0060
     * @tc.name      NdkRawfile_ReadLengthOf_0060
     * @tc.desc      readLengthOf(fileSize=176, offset=51.07, length=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0060 begin`);
      const actual: number = readLengthOf(176, 51.07, 15);
      logInfo(`readLengthOf(fileSize=176, offset=51.07, ...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadLengthOf_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0061
     * @tc.name      NdkRawfile_ReadLengthOf_0061
     * @tc.desc      readLengthOf(fileSize=10, offset=3, length=164) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0061 begin`);
      const actual: number = readLengthOf(10, 3, 164);
      logInfo(`readLengthOf(fileSize=10, offset=3, lengt...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ReadLengthOf_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0062
     * @tc.name      NdkRawfile_ReadLengthOf_0062
     * @tc.desc      readLengthOf(fileSize=2, offset=10, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0062 begin`);
      const actual: number = readLengthOf(2, 10, 2);
      logInfo(`readLengthOf(fileSize=2, offset=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0063
     * @tc.name      NdkRawfile_ReadLengthOf_0063
     * @tc.desc      readLengthOf(fileSize=1, offset=100, length=164) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0063 begin`);
      const actual: number = readLengthOf(1, 100, 164);
      logInfo(`readLengthOf(fileSize=1, offset=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ReadLengthOf_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0064
     * @tc.name      NdkRawfile_ReadLengthOf_0064
     * @tc.desc      readLengthOf(fileSize=100, offset=50, length=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0064 begin`);
      const actual: number = readLengthOf(100, 50, 3);
      logInfo(`readLengthOf(fileSize=100, offset=50, len...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ReadLengthOf_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0065
     * @tc.name      NdkRawfile_ReadLengthOf_0065
     * @tc.desc      readLengthOf(fileSize=139, offset=5, length=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0065 begin`);
      const actual: number = readLengthOf(139, 5, 5);
      logInfo(`readLengthOf(fileSize=139, offset=5, leng...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadLengthOf_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0066
     * @tc.name      NdkRawfile_ReadLengthOf_0066
     * @tc.desc      readLengthOf(fileSize=5, offset=2, length=10) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0066 begin`);
      const actual: number = readLengthOf(5, 2, 10);
      logInfo(`readLengthOf(fileSize=5, offset=2, length...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadLengthOf_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0067
     * @tc.name      NdkRawfile_ReadLengthOf_0067
     * @tc.desc      readLengthOf(fileSize=176, offset=3, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0067 begin`);
      const actual: number = readLengthOf(176, 3, 2);
      logInfo(`readLengthOf(fileSize=176, offset=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0068
     * @tc.name      NdkRawfile_ReadLengthOf_0068
     * @tc.desc      readLengthOf(fileSize=20, offset=0, length=164) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0068 begin`);
      const actual: number = readLengthOf(20, 0, 164);
      logInfo(`readLengthOf(fileSize=20, offset=0, lengt...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}ReadLengthOf_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0069
     * @tc.name      NdkRawfile_ReadLengthOf_0069
     * @tc.desc      readLengthOf(fileSize=10, offset=10, length=15) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0069 begin`);
      const actual: number = readLengthOf(10, 10, 15);
      logInfo(`readLengthOf(fileSize=10, offset=10, leng...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ReadLengthOf_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0070
     * @tc.name      NdkRawfile_ReadLengthOf_0070
     * @tc.desc      readLengthOf(fileSize=-1, offset=-1, length=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0070 begin`);
      const actual: number = readLengthOf(-1, -1, 10);
      logInfo(`readLengthOf(fileSize=-1, offset=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0071
     * @tc.name      NdkRawfile_ReadLengthOf_0071
     * @tc.desc      readLengthOf(fileSize=20, offset=10, length=15) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0071 begin`);
      const actual: number = readLengthOf(20, 10, 15);
      logInfo(`readLengthOf(fileSize=20, offset=10, leng...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}ReadLengthOf_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0072
     * @tc.name      NdkRawfile_ReadLengthOf_0072
     * @tc.desc      readLengthOf(fileSize=0, offset=1, length=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0072 begin`);
      const actual: number = readLengthOf(0, 1, 10);
      logInfo(`readLengthOf(fileSize=0, offset=1, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0073
     * @tc.name      NdkRawfile_ReadLengthOf_0073
     * @tc.desc      readLengthOf(fileSize=-1, offset=-1, length=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0073 begin`);
      const actual: number = readLengthOf(-1, -1, 15);
      logInfo(`readLengthOf(fileSize=-1, offset=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0074
     * @tc.name      NdkRawfile_ReadLengthOf_0074
     * @tc.desc      readLengthOf(fileSize=1, offset=-1, length=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0074 begin`);
      const actual: number = readLengthOf(1, -1, 5);
      logInfo(`readLengthOf(fileSize=1, offset=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ReadLengthOf_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0075
     * @tc.name      NdkRawfile_ReadLengthOf_0075
     * @tc.desc      readLengthOf(fileSize=176, offset=10, length=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0075 begin`);
      const actual: number = readLengthOf(176, 10, 20);
      logInfo(`readLengthOf(fileSize=176, offset=10, len...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}ReadLengthOf_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0076
     * @tc.name      NdkRawfile_ReadLengthOf_0076
     * @tc.desc      readLengthOf(fileSize=15, offset=-1, length=152) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0076 begin`);
      const actual: number = readLengthOf(15, -1, 152);
      logInfo(`readLengthOf(fileSize=15, offset=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadLengthOf_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0077
     * @tc.name      NdkRawfile_ReadLengthOf_0077
     * @tc.desc      readLengthOf(fileSize=15, offset=15, length=20) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0077 begin`);
      const actual: number = readLengthOf(15, 15, 20);
      logInfo(`readLengthOf(fileSize=15, offset=15, leng...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadLengthOf_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0078
     * @tc.name      NdkRawfile_ReadLengthOf_0078
     * @tc.desc      readLengthOf(fileSize=3, offset=15, length=5) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0078 begin`);
      const actual: number = readLengthOf(3, 15, 5);
      logInfo(`readLengthOf(fileSize=3, offset=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ReadLengthOf_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0079
     * @tc.name      NdkRawfile_ReadLengthOf_0079
     * @tc.desc      readLengthOf(fileSize=20, offset=-100, length=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0079 begin`);
      const actual: number = readLengthOf(20, -100, 15);
      logInfo(`readLengthOf(fileSize=20, offset=-100, le...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadLengthOf_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0080
     * @tc.name      NdkRawfile_ReadLengthOf_0080
     * @tc.desc      readLengthOf(fileSize=5, offset=3, length=20) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0080 begin`);
      const actual: number = readLengthOf(5, 3, 20);
      logInfo(`readLengthOf(fileSize=5, offset=3, length...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadLengthOf_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0081
     * @tc.name      NdkRawfile_ReadLengthOf_0081
     * @tc.desc      readLengthOf(fileSize=139, offset=2, length=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0081 begin`);
      const actual: number = readLengthOf(139, 2, 15);
      logInfo(`readLengthOf(fileSize=139, offset=2, leng...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadLengthOf_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0082
     * @tc.name      NdkRawfile_ReadLengthOf_0082
     * @tc.desc      readLengthOf(fileSize=0, offset=3, length=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0082 begin`);
      const actual: number = readLengthOf(0, 3, 1);
      logInfo(`readLengthOf(fileSize=0, offset=3, length=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0083
     * @tc.name      NdkRawfile_ReadLengthOf_0083
     * @tc.desc      readLengthOf(fileSize=100, offset=3, length=152) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0083 begin`);
      const actual: number = readLengthOf(100, 3, 152);
      logInfo(`readLengthOf(fileSize=100, offset=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ReadLengthOf_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0084
     * @tc.name      NdkRawfile_ReadLengthOf_0084
     * @tc.desc      readLengthOf(fileSize=15, offset=15, length=1) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0084 begin`);
      const actual: number = readLengthOf(15, 15, 1);
      logInfo(`readLengthOf(fileSize=15, offset=15, leng...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadLengthOf_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0085
     * @tc.name      NdkRawfile_ReadLengthOf_0085
     * @tc.desc      readLengthOf(fileSize=3, offset=50, length=100) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0085 begin`);
      const actual: number = readLengthOf(3, 50, 100);
      logInfo(`readLengthOf(fileSize=3, offset=50, lengt...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ReadLengthOf_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0086
     * @tc.name      NdkRawfile_ReadLengthOf_0086
     * @tc.desc      readLengthOf(fileSize=0, offset=0, length=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0086 begin`);
      const actual: number = readLengthOf(0, 0, 20);
      logInfo(`readLengthOf(fileSize=0, offset=0, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0087
     * @tc.name      NdkRawfile_ReadLengthOf_0087
     * @tc.desc      readLengthOf(fileSize=2, offset=0, length=5) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0087 begin`);
      const actual: number = readLengthOf(2, 0, 5);
      logInfo(`readLengthOf(fileSize=2, offset=0, length=5): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0088
     * @tc.name      NdkRawfile_ReadLengthOf_0088
     * @tc.desc      readLengthOf(fileSize=20, offset=5, length=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0088 begin`);
      const actual: number = readLengthOf(20, 5, 15);
      logInfo(`readLengthOf(fileSize=20, offset=5, lengt...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadLengthOf_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0089
     * @tc.name      NdkRawfile_ReadLengthOf_0089
     * @tc.desc      readLengthOf(fileSize=-1, offset=2, length=152) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0089 begin`);
      const actual: number = readLengthOf(-1, 2, 152);
      logInfo(`readLengthOf(fileSize=-1, offset=2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0090
     * @tc.name      NdkRawfile_ReadLengthOf_0090
     * @tc.desc      readLengthOf(fileSize=139, offset=0, length=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0090 begin`);
      const actual: number = readLengthOf(139, 0, 15);
      logInfo(`readLengthOf(fileSize=139, offset=0, leng...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadLengthOf_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0091
     * @tc.name      NdkRawfile_ReadLengthOf_0091
     * @tc.desc      readLengthOf(fileSize=139, offset=3, length=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0091 begin`);
      const actual: number = readLengthOf(139, 3, 100);
      logInfo(`readLengthOf(fileSize=139, offset=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ReadLengthOf_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0092
     * @tc.name      NdkRawfile_ReadLengthOf_0092
     * @tc.desc      readLengthOf(fileSize=0, offset=1, length=164) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0092 begin`);
      const actual: number = readLengthOf(0, 1, 164);
      logInfo(`readLengthOf(fileSize=0, offset=1, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0093
     * @tc.name      NdkRawfile_ReadLengthOf_0093
     * @tc.desc      readLengthOf(fileSize=100, offset=5, length=152) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0093 begin`);
      const actual: number = readLengthOf(100, 5, 152);
      logInfo(`readLengthOf(fileSize=100, offset=5, leng...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ReadLengthOf_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0094
     * @tc.name      NdkRawfile_ReadLengthOf_0094
     * @tc.desc      readLengthOf(fileSize=10, offset=-1, length=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0094 begin`);
      const actual: number = readLengthOf(10, -1, 1);
      logInfo(`readLengthOf(fileSize=10, offset=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ReadLengthOf_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0095
     * @tc.name      NdkRawfile_ReadLengthOf_0095
     * @tc.desc      readLengthOf(fileSize=1, offset=1, length=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0095 begin`);
      const actual: number = readLengthOf(1, 1, 1);
      logInfo(`readLengthOf(fileSize=1, offset=1, length=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ReadLengthOf_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0096
     * @tc.name      NdkRawfile_ReadLengthOf_0096
     * @tc.desc      readLengthOf(fileSize=3, offset=15, length=2) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0096 begin`);
      const actual: number = readLengthOf(3, 15, 2);
      logInfo(`readLengthOf(fileSize=3, offset=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ReadLengthOf_0096 end`);
    });
  });
}
