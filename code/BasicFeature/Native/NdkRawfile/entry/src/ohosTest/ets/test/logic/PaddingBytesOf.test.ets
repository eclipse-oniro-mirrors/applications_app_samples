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
import { paddingBytesOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for paddingBytesOf (96 cases). */
export default function paddingBytesOfTest(): void {
  describe('PaddingBytesOfTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0001
     * @tc.name      NdkRawfile_PaddingBytesOf_0001
     * @tc.desc      paddingBytesOf(fileSize=0, offset=-100, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_PaddingBytesOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0001 begin`);
      const actual: number = paddingBytesOf(0, -100, 0);
      logInfo(`paddingBytesOf(fileSize=0, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0002
     * @tc.name      NdkRawfile_PaddingBytesOf_0002
     * @tc.desc      paddingBytesOf(fileSize=0, offset=-100, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_PaddingBytesOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0002 begin`);
      const actual: number = paddingBytesOf(0, -100, 1);
      logInfo(`paddingBytesOf(fileSize=0, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}PaddingBytesOf_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0003
     * @tc.name      NdkRawfile_PaddingBytesOf_0003
     * @tc.desc      paddingBytesOf(fileSize=0, offset=-100, length=2) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0003 begin`);
      const actual: number = paddingBytesOf(0, -100, 2);
      logInfo(`paddingBytesOf(fileSize=0, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}PaddingBytesOf_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0004
     * @tc.name      NdkRawfile_PaddingBytesOf_0004
     * @tc.desc      paddingBytesOf(fileSize=0, offset=-100, length=5) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0004 begin`);
      const actual: number = paddingBytesOf(0, -100, 5);
      logInfo(`paddingBytesOf(fileSize=0, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}PaddingBytesOf_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0005
     * @tc.name      NdkRawfile_PaddingBytesOf_0005
     * @tc.desc      paddingBytesOf(fileSize=0, offset=-100, length=10) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0005 begin`);
      const actual: number = paddingBytesOf(0, -100, 10);
      logInfo(`paddingBytesOf(fileSize=0, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}PaddingBytesOf_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0006
     * @tc.name      NdkRawfile_PaddingBytesOf_0006
     * @tc.desc      paddingBytesOf(fileSize=0, offset=-100, length=100) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0006 begin`);
      const actual: number = paddingBytesOf(0, -100, 100);
      logInfo(`paddingBytesOf(fileSize=0, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}PaddingBytesOf_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0007
     * @tc.name      NdkRawfile_PaddingBytesOf_0007
     * @tc.desc      paddingBytesOf(fileSize=0, offset=-100, length=3) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0007 begin`);
      const actual: number = paddingBytesOf(0, -100, 3);
      logInfo(`paddingBytesOf(fileSize=0, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}PaddingBytesOf_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0008
     * @tc.name      NdkRawfile_PaddingBytesOf_0008
     * @tc.desc      paddingBytesOf(fileSize=0, offset=-100, length=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0008 begin`);
      const actual: number = paddingBytesOf(0, -100, 15);
      logInfo(`paddingBytesOf(fileSize=0, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}PaddingBytesOf_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0009
     * @tc.name      NdkRawfile_PaddingBytesOf_0009
     * @tc.desc      paddingBytesOf(fileSize=0, offset=-100, length=20) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0009 begin`);
      const actual: number = paddingBytesOf(0, -100, 20);
      logInfo(`paddingBytesOf(fileSize=0, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}PaddingBytesOf_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0010
     * @tc.name      NdkRawfile_PaddingBytesOf_0010
     * @tc.desc      paddingBytesOf(fileSize=0, offset=-100, length=18.1) returns -18.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0010 begin`);
      const actual: number = paddingBytesOf(0, -100, 18.1);
      logInfo(`paddingBytesOf(fileSize=0, offset=-100, l...: actual=${actual}`);
      expect(actual).assertClose(-18.1, PRECISION);
      logInfo(`${BUNDLE}PaddingBytesOf_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0011
     * @tc.name      NdkRawfile_PaddingBytesOf_0011
     * @tc.desc      paddingBytesOf(fileSize=100, offset=3, length=-1) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0011 begin`);
      const actual: number = paddingBytesOf(100, 3, -1);
      logInfo(`paddingBytesOf(fileSize=100, offset=3, le...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}PaddingBytesOf_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0012
     * @tc.name      NdkRawfile_PaddingBytesOf_0012
     * @tc.desc      paddingBytesOf(fileSize=20, offset=0, length=5) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0012 begin`);
      const actual: number = paddingBytesOf(20, 0, 5);
      logInfo(`paddingBytesOf(fileSize=20, offset=0, len...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}PaddingBytesOf_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0013
     * @tc.name      NdkRawfile_PaddingBytesOf_0013
     * @tc.desc      paddingBytesOf(fileSize=2, offset=0, length=-1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0013 begin`);
      const actual: number = paddingBytesOf(2, 0, -1);
      logInfo(`paddingBytesOf(fileSize=2, offset=0, leng...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}PaddingBytesOf_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0014
     * @tc.name      NdkRawfile_PaddingBytesOf_0014
     * @tc.desc      paddingBytesOf(fileSize=15, offset=2, length=10) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0014 begin`);
      const actual: number = paddingBytesOf(15, 2, 10);
      logInfo(`paddingBytesOf(fileSize=15, offset=2, len...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}PaddingBytesOf_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0015
     * @tc.name      NdkRawfile_PaddingBytesOf_0015
     * @tc.desc      paddingBytesOf(fileSize=2, offset=1, length=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0015 begin`);
      const actual: number = paddingBytesOf(2, 1, 1);
      logInfo(`paddingBytesOf(fileSize=2, offset=1, leng...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}PaddingBytesOf_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0016
     * @tc.name      NdkRawfile_PaddingBytesOf_0016
     * @tc.desc      paddingBytesOf(fileSize=100, offset=-1, length=3) returns 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0016 begin`);
      const actual: number = paddingBytesOf(100, -1, 3);
      logInfo(`paddingBytesOf(fileSize=100, offset=-1, l...: actual=${actual}`);
      expect(actual).assertEqual(97);
      logInfo(`${BUNDLE}PaddingBytesOf_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0017
     * @tc.name      NdkRawfile_PaddingBytesOf_0017
     * @tc.desc      paddingBytesOf(fileSize=5, offset=-100, length=1) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0017 begin`);
      const actual: number = paddingBytesOf(5, -100, 1);
      logInfo(`paddingBytesOf(fileSize=5, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}PaddingBytesOf_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0018
     * @tc.name      NdkRawfile_PaddingBytesOf_0018
     * @tc.desc      paddingBytesOf(fileSize=196, offset=10, length=2) returns 194
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0018 begin`);
      const actual: number = paddingBytesOf(196, 10, 2);
      logInfo(`paddingBytesOf(fileSize=196, offset=10, l...: actual=${actual}`);
      expect(actual).assertEqual(194);
      logInfo(`${BUNDLE}PaddingBytesOf_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0019
     * @tc.name      NdkRawfile_PaddingBytesOf_0019
     * @tc.desc      paddingBytesOf(fileSize=10, offset=2, length=1) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0019 begin`);
      const actual: number = paddingBytesOf(10, 2, 1);
      logInfo(`paddingBytesOf(fileSize=10, offset=2, len...: actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}PaddingBytesOf_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0020
     * @tc.name      NdkRawfile_PaddingBytesOf_0020
     * @tc.desc      paddingBytesOf(fileSize=100, offset=3, length=10) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0020 begin`);
      const actual: number = paddingBytesOf(100, 3, 10);
      logInfo(`paddingBytesOf(fileSize=100, offset=3, le...: actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}PaddingBytesOf_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0021
     * @tc.name      NdkRawfile_PaddingBytesOf_0021
     * @tc.desc      paddingBytesOf(fileSize=20, offset=0, length=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0021 begin`);
      const actual: number = paddingBytesOf(20, 0, 10);
      logInfo(`paddingBytesOf(fileSize=20, offset=0, len...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}PaddingBytesOf_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0022
     * @tc.name      NdkRawfile_PaddingBytesOf_0022
     * @tc.desc      paddingBytesOf(fileSize=30, offset=5, length=3) returns 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0022 begin`);
      const actual: number = paddingBytesOf(30, 5, 3);
      logInfo(`paddingBytesOf(fileSize=30, offset=5, len...: actual=${actual}`);
      expect(actual).assertEqual(27);
      logInfo(`${BUNDLE}PaddingBytesOf_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0023
     * @tc.name      NdkRawfile_PaddingBytesOf_0023
     * @tc.desc      paddingBytesOf(fileSize=10, offset=1, length=2) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0023 begin`);
      const actual: number = paddingBytesOf(10, 1, 2);
      logInfo(`paddingBytesOf(fileSize=10, offset=1, len...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}PaddingBytesOf_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0024
     * @tc.name      NdkRawfile_PaddingBytesOf_0024
     * @tc.desc      paddingBytesOf(fileSize=10, offset=-1, length=3) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0024 begin`);
      const actual: number = paddingBytesOf(10, -1, 3);
      logInfo(`paddingBytesOf(fileSize=10, offset=-1, le...: actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}PaddingBytesOf_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0025
     * @tc.name      NdkRawfile_PaddingBytesOf_0025
     * @tc.desc      paddingBytesOf(fileSize=100, offset=1, length=2) returns 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0025 begin`);
      const actual: number = paddingBytesOf(100, 1, 2);
      logInfo(`paddingBytesOf(fileSize=100, offset=1, le...: actual=${actual}`);
      expect(actual).assertEqual(98);
      logInfo(`${BUNDLE}PaddingBytesOf_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0026
     * @tc.name      NdkRawfile_PaddingBytesOf_0026
     * @tc.desc      paddingBytesOf(fileSize=30, offset=-100, length=-14) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0026 begin`);
      const actual: number = paddingBytesOf(30, -100, -14);
      logInfo(`paddingBytesOf(fileSize=30, offset=-100, ...: actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}PaddingBytesOf_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0027
     * @tc.name      NdkRawfile_PaddingBytesOf_0027
     * @tc.desc      paddingBytesOf(fileSize=100, offset=-100, length=1) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0027 begin`);
      const actual: number = paddingBytesOf(100, -100, 1);
      logInfo(`paddingBytesOf(fileSize=100, offset=-100,...: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}PaddingBytesOf_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0028
     * @tc.name      NdkRawfile_PaddingBytesOf_0028
     * @tc.desc      paddingBytesOf(fileSize=100, offset=5, length=5) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0028 begin`);
      const actual: number = paddingBytesOf(100, 5, 5);
      logInfo(`paddingBytesOf(fileSize=100, offset=5, le...: actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}PaddingBytesOf_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0029
     * @tc.name      NdkRawfile_PaddingBytesOf_0029
     * @tc.desc      paddingBytesOf(fileSize=100, offset=10, length=18.1) returns 81.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0029 begin`);
      const actual: number = paddingBytesOf(100, 10, 18.1);
      logInfo(`paddingBytesOf(fileSize=100, offset=10, l...: actual=${actual}`);
      expect(actual).assertClose(81.9, PRECISION);
      logInfo(`${BUNDLE}PaddingBytesOf_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0030
     * @tc.name      NdkRawfile_PaddingBytesOf_0030
     * @tc.desc      paddingBytesOf(fileSize=10, offset=3, length=0) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0030 begin`);
      const actual: number = paddingBytesOf(10, 3, 0);
      logInfo(`paddingBytesOf(fileSize=10, offset=3, len...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PaddingBytesOf_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0031
     * @tc.name      NdkRawfile_PaddingBytesOf_0031
     * @tc.desc      paddingBytesOf(fileSize=196, offset=100, length=-1) returns 196
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0031 begin`);
      const actual: number = paddingBytesOf(196, 100, -1);
      logInfo(`paddingBytesOf(fileSize=196, offset=100, ...: actual=${actual}`);
      expect(actual).assertEqual(196);
      logInfo(`${BUNDLE}PaddingBytesOf_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0032
     * @tc.name      NdkRawfile_PaddingBytesOf_0032
     * @tc.desc      paddingBytesOf(fileSize=100, offset=0, length=15) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0032 begin`);
      const actual: number = paddingBytesOf(100, 0, 15);
      logInfo(`paddingBytesOf(fileSize=100, offset=0, le...: actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}PaddingBytesOf_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0033
     * @tc.name      NdkRawfile_PaddingBytesOf_0033
     * @tc.desc      paddingBytesOf(fileSize=100, offset=1, length=20) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0033 begin`);
      const actual: number = paddingBytesOf(100, 1, 20);
      logInfo(`paddingBytesOf(fileSize=100, offset=1, le...: actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}PaddingBytesOf_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0034
     * @tc.name      NdkRawfile_PaddingBytesOf_0034
     * @tc.desc      paddingBytesOf(fileSize=196, offset=2, length=3) returns 193
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0034 begin`);
      const actual: number = paddingBytesOf(196, 2, 3);
      logInfo(`paddingBytesOf(fileSize=196, offset=2, le...: actual=${actual}`);
      expect(actual).assertEqual(193);
      logInfo(`${BUNDLE}PaddingBytesOf_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0035
     * @tc.name      NdkRawfile_PaddingBytesOf_0035
     * @tc.desc      paddingBytesOf(fileSize=196, offset=-1, length=20) returns 176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0035 begin`);
      const actual: number = paddingBytesOf(196, -1, 20);
      logInfo(`paddingBytesOf(fileSize=196, offset=-1, l...: actual=${actual}`);
      expect(actual).assertEqual(176);
      logInfo(`${BUNDLE}PaddingBytesOf_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0036
     * @tc.name      NdkRawfile_PaddingBytesOf_0036
     * @tc.desc      paddingBytesOf(fileSize=20, offset=5, length=-1) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0036 begin`);
      const actual: number = paddingBytesOf(20, 5, -1);
      logInfo(`paddingBytesOf(fileSize=20, offset=5, len...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}PaddingBytesOf_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0037
     * @tc.name      NdkRawfile_PaddingBytesOf_0037
     * @tc.desc      paddingBytesOf(fileSize=196, offset=2, length=5) returns 191
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0037 begin`);
      const actual: number = paddingBytesOf(196, 2, 5);
      logInfo(`paddingBytesOf(fileSize=196, offset=2, le...: actual=${actual}`);
      expect(actual).assertEqual(191);
      logInfo(`${BUNDLE}PaddingBytesOf_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0038
     * @tc.name      NdkRawfile_PaddingBytesOf_0038
     * @tc.desc      paddingBytesOf(fileSize=196, offset=-1, length=15) returns 181
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0038 begin`);
      const actual: number = paddingBytesOf(196, -1, 15);
      logInfo(`paddingBytesOf(fileSize=196, offset=-1, l...: actual=${actual}`);
      expect(actual).assertEqual(181);
      logInfo(`${BUNDLE}PaddingBytesOf_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0039
     * @tc.name      NdkRawfile_PaddingBytesOf_0039
     * @tc.desc      paddingBytesOf(fileSize=20, offset=0, length=1) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0039 begin`);
      const actual: number = paddingBytesOf(20, 0, 1);
      logInfo(`paddingBytesOf(fileSize=20, offset=0, len...: actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}PaddingBytesOf_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0040
     * @tc.name      NdkRawfile_PaddingBytesOf_0040
     * @tc.desc      paddingBytesOf(fileSize=15, offset=0, length=3) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0040 begin`);
      const actual: number = paddingBytesOf(15, 0, 3);
      logInfo(`paddingBytesOf(fileSize=15, offset=0, len...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}PaddingBytesOf_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0041
     * @tc.name      NdkRawfile_PaddingBytesOf_0041
     * @tc.desc      paddingBytesOf(fileSize=1, offset=-100, length=18.1) returns -17.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0041 begin`);
      const actual: number = paddingBytesOf(1, -100, 18.1);
      logInfo(`paddingBytesOf(fileSize=1, offset=-100, l...: actual=${actual}`);
      expect(actual).assertClose(-17.1, PRECISION);
      logInfo(`${BUNDLE}PaddingBytesOf_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0042
     * @tc.name      NdkRawfile_PaddingBytesOf_0042
     * @tc.desc      paddingBytesOf(fileSize=196, offset=1, length=100) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0042 begin`);
      const actual: number = paddingBytesOf(196, 1, 100);
      logInfo(`paddingBytesOf(fileSize=196, offset=1, le...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}PaddingBytesOf_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0043
     * @tc.name      NdkRawfile_PaddingBytesOf_0043
     * @tc.desc      paddingBytesOf(fileSize=15, offset=3, length=1) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0043 begin`);
      const actual: number = paddingBytesOf(15, 3, 1);
      logInfo(`paddingBytesOf(fileSize=15, offset=3, len...: actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}PaddingBytesOf_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0044
     * @tc.name      NdkRawfile_PaddingBytesOf_0044
     * @tc.desc      paddingBytesOf(fileSize=196, offset=33, length=18.1) returns 177.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0044 begin`);
      const actual: number = paddingBytesOf(196, 33, 18.1);
      logInfo(`paddingBytesOf(fileSize=196, offset=33, l...: actual=${actual}`);
      expect(actual).assertClose(177.9, PRECISION);
      logInfo(`${BUNDLE}PaddingBytesOf_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0045
     * @tc.name      NdkRawfile_PaddingBytesOf_0045
     * @tc.desc      paddingBytesOf(fileSize=196, offset=100, length=10) returns 186
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0045 begin`);
      const actual: number = paddingBytesOf(196, 100, 10);
      logInfo(`paddingBytesOf(fileSize=196, offset=100, ...: actual=${actual}`);
      expect(actual).assertEqual(186);
      logInfo(`${BUNDLE}PaddingBytesOf_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0046
     * @tc.name      NdkRawfile_PaddingBytesOf_0046
     * @tc.desc      paddingBytesOf(fileSize=30, offset=2, length=2) returns 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0046 begin`);
      const actual: number = paddingBytesOf(30, 2, 2);
      logInfo(`paddingBytesOf(fileSize=30, offset=2, len...: actual=${actual}`);
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}PaddingBytesOf_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0047
     * @tc.name      NdkRawfile_PaddingBytesOf_0047
     * @tc.desc      paddingBytesOf(fileSize=30, offset=2, length=18.1) returns 11.899999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0047 begin`);
      const actual: number = paddingBytesOf(30, 2, 18.1);
      logInfo(`paddingBytesOf(fileSize=30, offset=2, len...: actual=${actual}`);
      expect(actual).assertClose(11.899999999999999, PRECISION);
      logInfo(`${BUNDLE}PaddingBytesOf_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0048
     * @tc.name      NdkRawfile_PaddingBytesOf_0048
     * @tc.desc      paddingBytesOf(fileSize=196, offset=50, length=1) returns 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0048 begin`);
      const actual: number = paddingBytesOf(196, 50, 1);
      logInfo(`paddingBytesOf(fileSize=196, offset=50, l...: actual=${actual}`);
      expect(actual).assertEqual(195);
      logInfo(`${BUNDLE}PaddingBytesOf_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0049
     * @tc.name      NdkRawfile_PaddingBytesOf_0049
     * @tc.desc      paddingBytesOf(fileSize=1, offset=-100, length=5) returns -4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0049 begin`);
      const actual: number = paddingBytesOf(1, -100, 5);
      logInfo(`paddingBytesOf(fileSize=1, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(-4);
      logInfo(`${BUNDLE}PaddingBytesOf_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0050
     * @tc.name      NdkRawfile_PaddingBytesOf_0050
     * @tc.desc      paddingBytesOf(fileSize=20, offset=-100, length=3) returns 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0050 begin`);
      const actual: number = paddingBytesOf(20, -100, 3);
      logInfo(`paddingBytesOf(fileSize=20, offset=-100, ...: actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}PaddingBytesOf_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0051
     * @tc.name      NdkRawfile_PaddingBytesOf_0051
     * @tc.desc      paddingBytesOf(fileSize=30, offset=2, length=5) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0051 begin`);
      const actual: number = paddingBytesOf(30, 2, 5);
      logInfo(`paddingBytesOf(fileSize=30, offset=2, len...: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}PaddingBytesOf_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0052
     * @tc.name      NdkRawfile_PaddingBytesOf_0052
     * @tc.desc      paddingBytesOf(fileSize=2, offset=-100, length=15) returns -13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0052 begin`);
      const actual: number = paddingBytesOf(2, -100, 15);
      logInfo(`paddingBytesOf(fileSize=2, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(-13);
      logInfo(`${BUNDLE}PaddingBytesOf_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0053
     * @tc.name      NdkRawfile_PaddingBytesOf_0053
     * @tc.desc      paddingBytesOf(fileSize=15, offset=1, length=2) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0053 begin`);
      const actual: number = paddingBytesOf(15, 1, 2);
      logInfo(`paddingBytesOf(fileSize=15, offset=1, len...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}PaddingBytesOf_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0054
     * @tc.name      NdkRawfile_PaddingBytesOf_0054
     * @tc.desc      paddingBytesOf(fileSize=20, offset=1, length=2) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0054 begin`);
      const actual: number = paddingBytesOf(20, 1, 2);
      logInfo(`paddingBytesOf(fileSize=20, offset=1, len...: actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}PaddingBytesOf_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0055
     * @tc.name      NdkRawfile_PaddingBytesOf_0055
     * @tc.desc      paddingBytesOf(fileSize=30, offset=15, length=1) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0055 begin`);
      const actual: number = paddingBytesOf(30, 15, 1);
      logInfo(`paddingBytesOf(fileSize=30, offset=15, le...: actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}PaddingBytesOf_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0056
     * @tc.name      NdkRawfile_PaddingBytesOf_0056
     * @tc.desc      paddingBytesOf(fileSize=10, offset=-100, length=18.1) returns -8.100000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0056 begin`);
      const actual: number = paddingBytesOf(10, -100, 18.1);
      logInfo(`paddingBytesOf(fileSize=10, offset=-100, ...: actual=${actual}`);
      expect(actual).assertClose(-8.100000000000001, PRECISION);
      logInfo(`${BUNDLE}PaddingBytesOf_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0057
     * @tc.name      NdkRawfile_PaddingBytesOf_0057
     * @tc.desc      paddingBytesOf(fileSize=3, offset=-100, length=10) returns -7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0057 begin`);
      const actual: number = paddingBytesOf(3, -100, 10);
      logInfo(`paddingBytesOf(fileSize=3, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(-7);
      logInfo(`${BUNDLE}PaddingBytesOf_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0058
     * @tc.name      NdkRawfile_PaddingBytesOf_0058
     * @tc.desc      paddingBytesOf(fileSize=100, offset=33, length=0) returns 33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0058 begin`);
      const actual: number = paddingBytesOf(100, 33, 0);
      logInfo(`paddingBytesOf(fileSize=100, offset=33, l...: actual=${actual}`);
      expect(actual).assertEqual(33);
      logInfo(`${BUNDLE}PaddingBytesOf_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0059
     * @tc.name      NdkRawfile_PaddingBytesOf_0059
     * @tc.desc      paddingBytesOf(fileSize=100, offset=50, length=0) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0059 begin`);
      const actual: number = paddingBytesOf(100, 50, 0);
      logInfo(`paddingBytesOf(fileSize=100, offset=50, l...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}PaddingBytesOf_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0060
     * @tc.name      NdkRawfile_PaddingBytesOf_0060
     * @tc.desc      paddingBytesOf(fileSize=1, offset=-100, length=20) returns -19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0060 begin`);
      const actual: number = paddingBytesOf(1, -100, 20);
      logInfo(`paddingBytesOf(fileSize=1, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(-19);
      logInfo(`${BUNDLE}PaddingBytesOf_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0061
     * @tc.name      NdkRawfile_PaddingBytesOf_0061
     * @tc.desc      paddingBytesOf(fileSize=3, offset=-100, length=100) returns -97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0061 begin`);
      const actual: number = paddingBytesOf(3, -100, 100);
      logInfo(`paddingBytesOf(fileSize=3, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(-97);
      logInfo(`${BUNDLE}PaddingBytesOf_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0062
     * @tc.name      NdkRawfile_PaddingBytesOf_0062
     * @tc.desc      paddingBytesOf(fileSize=1, offset=-100, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0062 begin`);
      const actual: number = paddingBytesOf(1, -100, 0);
      logInfo(`paddingBytesOf(fileSize=1, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0063
     * @tc.name      NdkRawfile_PaddingBytesOf_0063
     * @tc.desc      paddingBytesOf(fileSize=2, offset=-100, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0063 begin`);
      const actual: number = paddingBytesOf(2, -100, 0);
      logInfo(`paddingBytesOf(fileSize=2, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0064
     * @tc.name      NdkRawfile_PaddingBytesOf_0064
     * @tc.desc      paddingBytesOf(fileSize=5, offset=-100, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0064 begin`);
      const actual: number = paddingBytesOf(5, -100, 0);
      logInfo(`paddingBytesOf(fileSize=5, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0065
     * @tc.name      NdkRawfile_PaddingBytesOf_0065
     * @tc.desc      paddingBytesOf(fileSize=10, offset=-100, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0065 begin`);
      const actual: number = paddingBytesOf(10, -100, 0);
      logInfo(`paddingBytesOf(fileSize=10, offset=-100, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0066
     * @tc.name      NdkRawfile_PaddingBytesOf_0066
     * @tc.desc      paddingBytesOf(fileSize=100, offset=-100, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0066 begin`);
      const actual: number = paddingBytesOf(100, -100, 0);
      logInfo(`paddingBytesOf(fileSize=100, offset=-100,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0067
     * @tc.name      NdkRawfile_PaddingBytesOf_0067
     * @tc.desc      paddingBytesOf(fileSize=-1, offset=-100, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0067 begin`);
      const actual: number = paddingBytesOf(-1, -100, 0);
      logInfo(`paddingBytesOf(fileSize=-1, offset=-100, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0068
     * @tc.name      NdkRawfile_PaddingBytesOf_0068
     * @tc.desc      paddingBytesOf(fileSize=3, offset=-100, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0068 begin`);
      const actual: number = paddingBytesOf(3, -100, 0);
      logInfo(`paddingBytesOf(fileSize=3, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0069
     * @tc.name      NdkRawfile_PaddingBytesOf_0069
     * @tc.desc      paddingBytesOf(fileSize=15, offset=-100, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0069 begin`);
      const actual: number = paddingBytesOf(15, -100, 0);
      logInfo(`paddingBytesOf(fileSize=15, offset=-100, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0070
     * @tc.name      NdkRawfile_PaddingBytesOf_0070
     * @tc.desc      paddingBytesOf(fileSize=20, offset=-100, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0070 begin`);
      const actual: number = paddingBytesOf(20, -100, 0);
      logInfo(`paddingBytesOf(fileSize=20, offset=-100, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0071
     * @tc.name      NdkRawfile_PaddingBytesOf_0071
     * @tc.desc      paddingBytesOf(fileSize=196, offset=-100, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0071 begin`);
      const actual: number = paddingBytesOf(196, -100, 0);
      logInfo(`paddingBytesOf(fileSize=196, offset=-100,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0072
     * @tc.name      NdkRawfile_PaddingBytesOf_0072
     * @tc.desc      paddingBytesOf(fileSize=30, offset=-100, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0072 begin`);
      const actual: number = paddingBytesOf(30, -100, 0);
      logInfo(`paddingBytesOf(fileSize=30, offset=-100, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0073
     * @tc.name      NdkRawfile_PaddingBytesOf_0073
     * @tc.desc      paddingBytesOf(fileSize=0, offset=-1, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0073 begin`);
      const actual: number = paddingBytesOf(0, -1, 0);
      logInfo(`paddingBytesOf(fileSize=0, offset=-1, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0074
     * @tc.name      NdkRawfile_PaddingBytesOf_0074
     * @tc.desc      paddingBytesOf(fileSize=0, offset=0, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0074 begin`);
      const actual: number = paddingBytesOf(0, 0, 0);
      logInfo(`paddingBytesOf(fileSize=0, offset=0, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0075
     * @tc.name      NdkRawfile_PaddingBytesOf_0075
     * @tc.desc      paddingBytesOf(fileSize=0, offset=1, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0075 begin`);
      const actual: number = paddingBytesOf(0, 1, 0);
      logInfo(`paddingBytesOf(fileSize=0, offset=1, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0076
     * @tc.name      NdkRawfile_PaddingBytesOf_0076
     * @tc.desc      paddingBytesOf(fileSize=0, offset=50, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0076 begin`);
      const actual: number = paddingBytesOf(0, 50, 0);
      logInfo(`paddingBytesOf(fileSize=0, offset=50, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0077
     * @tc.name      NdkRawfile_PaddingBytesOf_0077
     * @tc.desc      paddingBytesOf(fileSize=0, offset=100, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0077 begin`);
      const actual: number = paddingBytesOf(0, 100, 0);
      logInfo(`paddingBytesOf(fileSize=0, offset=100, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0078
     * @tc.name      NdkRawfile_PaddingBytesOf_0078
     * @tc.desc      paddingBytesOf(fileSize=0, offset=2, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0078 begin`);
      const actual: number = paddingBytesOf(0, 2, 0);
      logInfo(`paddingBytesOf(fileSize=0, offset=2, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0079
     * @tc.name      NdkRawfile_PaddingBytesOf_0079
     * @tc.desc      paddingBytesOf(fileSize=0, offset=3, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0079 begin`);
      const actual: number = paddingBytesOf(0, 3, 0);
      logInfo(`paddingBytesOf(fileSize=0, offset=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0080
     * @tc.name      NdkRawfile_PaddingBytesOf_0080
     * @tc.desc      paddingBytesOf(fileSize=0, offset=10, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0080 begin`);
      const actual: number = paddingBytesOf(0, 10, 0);
      logInfo(`paddingBytesOf(fileSize=0, offset=10, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0081
     * @tc.name      NdkRawfile_PaddingBytesOf_0081
     * @tc.desc      paddingBytesOf(fileSize=0, offset=5, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0081 begin`);
      const actual: number = paddingBytesOf(0, 5, 0);
      logInfo(`paddingBytesOf(fileSize=0, offset=5, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0082
     * @tc.name      NdkRawfile_PaddingBytesOf_0082
     * @tc.desc      paddingBytesOf(fileSize=0, offset=15, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0082 begin`);
      const actual: number = paddingBytesOf(0, 15, 0);
      logInfo(`paddingBytesOf(fileSize=0, offset=15, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0083
     * @tc.name      NdkRawfile_PaddingBytesOf_0083
     * @tc.desc      paddingBytesOf(fileSize=0, offset=33, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0083 begin`);
      const actual: number = paddingBytesOf(0, 33, 0);
      logInfo(`paddingBytesOf(fileSize=0, offset=33, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0084
     * @tc.name      NdkRawfile_PaddingBytesOf_0084
     * @tc.desc      paddingBytesOf(fileSize=0, offset=-100, length=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0084 begin`);
      const actual: number = paddingBytesOf(0, -100, -1);
      logInfo(`paddingBytesOf(fileSize=0, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0085
     * @tc.name      NdkRawfile_PaddingBytesOf_0085
     * @tc.desc      paddingBytesOf(fileSize=0, offset=-100, length=-14) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0085 begin`);
      const actual: number = paddingBytesOf(0, -100, -14);
      logInfo(`paddingBytesOf(fileSize=0, offset=-100, l...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0086
     * @tc.name      NdkRawfile_PaddingBytesOf_0086
     * @tc.desc      paddingBytesOf(fileSize=-1, offset=100, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0086 begin`);
      const actual: number = paddingBytesOf(-1, 100, 0);
      logInfo(`paddingBytesOf(fileSize=-1, offset=100, l...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0087
     * @tc.name      NdkRawfile_PaddingBytesOf_0087
     * @tc.desc      paddingBytesOf(fileSize=3, offset=3, length=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0087 begin`);
      const actual: number = paddingBytesOf(3, 3, 5);
      logInfo(`paddingBytesOf(fileSize=3, offset=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0088
     * @tc.name      NdkRawfile_PaddingBytesOf_0088
     * @tc.desc      paddingBytesOf(fileSize=20, offset=15, length=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0088 begin`);
      const actual: number = paddingBytesOf(20, 15, 15);
      logInfo(`paddingBytesOf(fileSize=20, offset=15, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0089
     * @tc.name      NdkRawfile_PaddingBytesOf_0089
     * @tc.desc      paddingBytesOf(fileSize=0, offset=3, length=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0089 begin`);
      const actual: number = paddingBytesOf(0, 3, 3);
      logInfo(`paddingBytesOf(fileSize=0, offset=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0090
     * @tc.name      NdkRawfile_PaddingBytesOf_0090
     * @tc.desc      paddingBytesOf(fileSize=20, offset=3, length=18.1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0090 begin`);
      const actual: number = paddingBytesOf(20, 3, 18.1);
      logInfo(`paddingBytesOf(fileSize=20, offset=3, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0091
     * @tc.name      NdkRawfile_PaddingBytesOf_0091
     * @tc.desc      paddingBytesOf(fileSize=100, offset=100, length=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0091 begin`);
      const actual: number = paddingBytesOf(100, 100, 5);
      logInfo(`paddingBytesOf(fileSize=100, offset=100, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0092
     * @tc.name      NdkRawfile_PaddingBytesOf_0092
     * @tc.desc      paddingBytesOf(fileSize=20, offset=33, length=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0092 begin`);
      const actual: number = paddingBytesOf(20, 33, -1);
      logInfo(`paddingBytesOf(fileSize=20, offset=33, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0093
     * @tc.name      NdkRawfile_PaddingBytesOf_0093
     * @tc.desc      paddingBytesOf(fileSize=-1, offset=1, length=18.1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0093 begin`);
      const actual: number = paddingBytesOf(-1, 1, 18.1);
      logInfo(`paddingBytesOf(fileSize=-1, offset=1, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0094
     * @tc.name      NdkRawfile_PaddingBytesOf_0094
     * @tc.desc      paddingBytesOf(fileSize=15, offset=2, length=-1) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0094 begin`);
      const actual: number = paddingBytesOf(15, 2, -1);
      logInfo(`paddingBytesOf(fileSize=15, offset=2, len...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}PaddingBytesOf_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0095
     * @tc.name      NdkRawfile_PaddingBytesOf_0095
     * @tc.desc      paddingBytesOf(fileSize=0, offset=100, length=18.1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0095 begin`);
      const actual: number = paddingBytesOf(0, 100, 18.1);
      logInfo(`paddingBytesOf(fileSize=0, offset=100, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0096
     * @tc.name      NdkRawfile_PaddingBytesOf_0096
     * @tc.desc      paddingBytesOf(fileSize=2, offset=3, length=-1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0096 begin`);
      const actual: number = paddingBytesOf(2, 3, -1);
      logInfo(`paddingBytesOf(fileSize=2, offset=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}PaddingBytesOf_0096 end`);
    });
  });
}
