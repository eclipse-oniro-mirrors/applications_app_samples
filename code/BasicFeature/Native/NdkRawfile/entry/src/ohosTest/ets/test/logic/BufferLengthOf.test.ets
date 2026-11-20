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
import { bufferLengthOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for bufferLengthOf (96 cases). */
export default function bufferLengthOfTest(): void {
  describe('BufferLengthOfTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0001
     * @tc.name      NdkRawfile_BufferLengthOf_0001
     * @tc.desc      bufferLengthOf(fileSize=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_BufferLengthOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0001 begin`);
      const actual: number = bufferLengthOf(0);
      logInfo(`bufferLengthOf(fileSize=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0002
     * @tc.name      NdkRawfile_BufferLengthOf_0002
     * @tc.desc      bufferLengthOf(fileSize=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_BufferLengthOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0002 begin`);
      const actual: number = bufferLengthOf(1);
      logInfo(`bufferLengthOf(fileSize=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}BufferLengthOf_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0003
     * @tc.name      NdkRawfile_BufferLengthOf_0003
     * @tc.desc      bufferLengthOf(fileSize=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0003 begin`);
      const actual: number = bufferLengthOf(2);
      logInfo(`bufferLengthOf(fileSize=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}BufferLengthOf_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0004
     * @tc.name      NdkRawfile_BufferLengthOf_0004
     * @tc.desc      bufferLengthOf(fileSize=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0004 begin`);
      const actual: number = bufferLengthOf(5);
      logInfo(`bufferLengthOf(fileSize=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}BufferLengthOf_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0005
     * @tc.name      NdkRawfile_BufferLengthOf_0005
     * @tc.desc      bufferLengthOf(fileSize=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0005 begin`);
      const actual: number = bufferLengthOf(10);
      logInfo(`bufferLengthOf(fileSize=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}BufferLengthOf_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0006
     * @tc.name      NdkRawfile_BufferLengthOf_0006
     * @tc.desc      bufferLengthOf(fileSize=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0006 begin`);
      const actual: number = bufferLengthOf(100);
      logInfo(`bufferLengthOf(fileSize=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}BufferLengthOf_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0007
     * @tc.name      NdkRawfile_BufferLengthOf_0007
     * @tc.desc      bufferLengthOf(fileSize=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0007 begin`);
      const actual: number = bufferLengthOf(3);
      logInfo(`bufferLengthOf(fileSize=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}BufferLengthOf_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0008
     * @tc.name      NdkRawfile_BufferLengthOf_0008
     * @tc.desc      bufferLengthOf(fileSize=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0008 begin`);
      const actual: number = bufferLengthOf(15);
      logInfo(`bufferLengthOf(fileSize=15): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}BufferLengthOf_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0009
     * @tc.name      NdkRawfile_BufferLengthOf_0009
     * @tc.desc      bufferLengthOf(fileSize=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0009 begin`);
      const actual: number = bufferLengthOf(20);
      logInfo(`bufferLengthOf(fileSize=20): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}BufferLengthOf_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0010
     * @tc.name      NdkRawfile_BufferLengthOf_0010
     * @tc.desc      bufferLengthOf(fileSize=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0010 begin`);
      const actual: number = bufferLengthOf(25);
      logInfo(`bufferLengthOf(fileSize=25): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}BufferLengthOf_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0011
     * @tc.name      NdkRawfile_BufferLengthOf_0011
     * @tc.desc      bufferLengthOf(fileSize=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0011 begin`);
      const actual: number = bufferLengthOf(30);
      logInfo(`bufferLengthOf(fileSize=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}BufferLengthOf_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0012
     * @tc.name      NdkRawfile_BufferLengthOf_0012
     * @tc.desc      bufferLengthOf(fileSize=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0012 begin`);
      const actual: number = bufferLengthOf(35);
      logInfo(`bufferLengthOf(fileSize=35): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}BufferLengthOf_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0013
     * @tc.name      NdkRawfile_BufferLengthOf_0013
     * @tc.desc      bufferLengthOf(fileSize=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0013 begin`);
      const actual: number = bufferLengthOf(40);
      logInfo(`bufferLengthOf(fileSize=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}BufferLengthOf_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0014
     * @tc.name      NdkRawfile_BufferLengthOf_0014
     * @tc.desc      bufferLengthOf(fileSize=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0014 begin`);
      const actual: number = bufferLengthOf(45);
      logInfo(`bufferLengthOf(fileSize=45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}BufferLengthOf_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0015
     * @tc.name      NdkRawfile_BufferLengthOf_0015
     * @tc.desc      bufferLengthOf(fileSize=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0015 begin`);
      const actual: number = bufferLengthOf(50);
      logInfo(`bufferLengthOf(fileSize=50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}BufferLengthOf_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0016
     * @tc.name      NdkRawfile_BufferLengthOf_0016
     * @tc.desc      bufferLengthOf(fileSize=55) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0016 begin`);
      const actual: number = bufferLengthOf(55);
      logInfo(`bufferLengthOf(fileSize=55): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}BufferLengthOf_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0017
     * @tc.name      NdkRawfile_BufferLengthOf_0017
     * @tc.desc      bufferLengthOf(fileSize=60) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0017 begin`);
      const actual: number = bufferLengthOf(60);
      logInfo(`bufferLengthOf(fileSize=60): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}BufferLengthOf_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0018
     * @tc.name      NdkRawfile_BufferLengthOf_0018
     * @tc.desc      bufferLengthOf(fileSize=65) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0018 begin`);
      const actual: number = bufferLengthOf(65);
      logInfo(`bufferLengthOf(fileSize=65): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}BufferLengthOf_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0019
     * @tc.name      NdkRawfile_BufferLengthOf_0019
     * @tc.desc      bufferLengthOf(fileSize=70) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0019 begin`);
      const actual: number = bufferLengthOf(70);
      logInfo(`bufferLengthOf(fileSize=70): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}BufferLengthOf_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0020
     * @tc.name      NdkRawfile_BufferLengthOf_0020
     * @tc.desc      bufferLengthOf(fileSize=75) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0020 begin`);
      const actual: number = bufferLengthOf(75);
      logInfo(`bufferLengthOf(fileSize=75): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}BufferLengthOf_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0021
     * @tc.name      NdkRawfile_BufferLengthOf_0021
     * @tc.desc      bufferLengthOf(fileSize=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0021 begin`);
      const actual: number = bufferLengthOf(80);
      logInfo(`bufferLengthOf(fileSize=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}BufferLengthOf_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0022
     * @tc.name      NdkRawfile_BufferLengthOf_0022
     * @tc.desc      bufferLengthOf(fileSize=85) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0022 begin`);
      const actual: number = bufferLengthOf(85);
      logInfo(`bufferLengthOf(fileSize=85): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}BufferLengthOf_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0023
     * @tc.name      NdkRawfile_BufferLengthOf_0023
     * @tc.desc      bufferLengthOf(fileSize=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0023 begin`);
      const actual: number = bufferLengthOf(90);
      logInfo(`bufferLengthOf(fileSize=90): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}BufferLengthOf_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0024
     * @tc.name      NdkRawfile_BufferLengthOf_0024
     * @tc.desc      bufferLengthOf(fileSize=95) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0024 begin`);
      const actual: number = bufferLengthOf(95);
      logInfo(`bufferLengthOf(fileSize=95): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}BufferLengthOf_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0025
     * @tc.name      NdkRawfile_BufferLengthOf_0025
     * @tc.desc      bufferLengthOf(fileSize=105) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0025 begin`);
      const actual: number = bufferLengthOf(105);
      logInfo(`bufferLengthOf(fileSize=105): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}BufferLengthOf_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0026
     * @tc.name      NdkRawfile_BufferLengthOf_0026
     * @tc.desc      bufferLengthOf(fileSize=110) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0026 begin`);
      const actual: number = bufferLengthOf(110);
      logInfo(`bufferLengthOf(fileSize=110): actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}BufferLengthOf_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0027
     * @tc.name      NdkRawfile_BufferLengthOf_0027
     * @tc.desc      bufferLengthOf(fileSize=115) returns 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0027 begin`);
      const actual: number = bufferLengthOf(115);
      logInfo(`bufferLengthOf(fileSize=115): actual=${actual}`);
      expect(actual).assertEqual(115);
      logInfo(`${BUNDLE}BufferLengthOf_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0028
     * @tc.name      NdkRawfile_BufferLengthOf_0028
     * @tc.desc      bufferLengthOf(fileSize=120) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0028 begin`);
      const actual: number = bufferLengthOf(120);
      logInfo(`bufferLengthOf(fileSize=120): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}BufferLengthOf_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0029
     * @tc.name      NdkRawfile_BufferLengthOf_0029
     * @tc.desc      bufferLengthOf(fileSize=125) returns 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0029 begin`);
      const actual: number = bufferLengthOf(125);
      logInfo(`bufferLengthOf(fileSize=125): actual=${actual}`);
      expect(actual).assertEqual(125);
      logInfo(`${BUNDLE}BufferLengthOf_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0030
     * @tc.name      NdkRawfile_BufferLengthOf_0030
     * @tc.desc      bufferLengthOf(fileSize=130) returns 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0030 begin`);
      const actual: number = bufferLengthOf(130);
      logInfo(`bufferLengthOf(fileSize=130): actual=${actual}`);
      expect(actual).assertEqual(130);
      logInfo(`${BUNDLE}BufferLengthOf_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0031
     * @tc.name      NdkRawfile_BufferLengthOf_0031
     * @tc.desc      bufferLengthOf(fileSize=135) returns 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0031 begin`);
      const actual: number = bufferLengthOf(135);
      logInfo(`bufferLengthOf(fileSize=135): actual=${actual}`);
      expect(actual).assertEqual(135);
      logInfo(`${BUNDLE}BufferLengthOf_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0032
     * @tc.name      NdkRawfile_BufferLengthOf_0032
     * @tc.desc      bufferLengthOf(fileSize=140) returns 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0032 begin`);
      const actual: number = bufferLengthOf(140);
      logInfo(`bufferLengthOf(fileSize=140): actual=${actual}`);
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}BufferLengthOf_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0033
     * @tc.name      NdkRawfile_BufferLengthOf_0033
     * @tc.desc      bufferLengthOf(fileSize=145) returns 145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0033 begin`);
      const actual: number = bufferLengthOf(145);
      logInfo(`bufferLengthOf(fileSize=145): actual=${actual}`);
      expect(actual).assertEqual(145);
      logInfo(`${BUNDLE}BufferLengthOf_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0034
     * @tc.name      NdkRawfile_BufferLengthOf_0034
     * @tc.desc      bufferLengthOf(fileSize=150) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0034 begin`);
      const actual: number = bufferLengthOf(150);
      logInfo(`bufferLengthOf(fileSize=150): actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}BufferLengthOf_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0035
     * @tc.name      NdkRawfile_BufferLengthOf_0035
     * @tc.desc      bufferLengthOf(fileSize=155) returns 155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0035 begin`);
      const actual: number = bufferLengthOf(155);
      logInfo(`bufferLengthOf(fileSize=155): actual=${actual}`);
      expect(actual).assertEqual(155);
      logInfo(`${BUNDLE}BufferLengthOf_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0036
     * @tc.name      NdkRawfile_BufferLengthOf_0036
     * @tc.desc      bufferLengthOf(fileSize=160) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0036 begin`);
      const actual: number = bufferLengthOf(160);
      logInfo(`bufferLengthOf(fileSize=160): actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}BufferLengthOf_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0037
     * @tc.name      NdkRawfile_BufferLengthOf_0037
     * @tc.desc      bufferLengthOf(fileSize=165) returns 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0037 begin`);
      const actual: number = bufferLengthOf(165);
      logInfo(`bufferLengthOf(fileSize=165): actual=${actual}`);
      expect(actual).assertEqual(165);
      logInfo(`${BUNDLE}BufferLengthOf_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0038
     * @tc.name      NdkRawfile_BufferLengthOf_0038
     * @tc.desc      bufferLengthOf(fileSize=170) returns 170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0038 begin`);
      const actual: number = bufferLengthOf(170);
      logInfo(`bufferLengthOf(fileSize=170): actual=${actual}`);
      expect(actual).assertEqual(170);
      logInfo(`${BUNDLE}BufferLengthOf_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0039
     * @tc.name      NdkRawfile_BufferLengthOf_0039
     * @tc.desc      bufferLengthOf(fileSize=175) returns 175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0039 begin`);
      const actual: number = bufferLengthOf(175);
      logInfo(`bufferLengthOf(fileSize=175): actual=${actual}`);
      expect(actual).assertEqual(175);
      logInfo(`${BUNDLE}BufferLengthOf_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0040
     * @tc.name      NdkRawfile_BufferLengthOf_0040
     * @tc.desc      bufferLengthOf(fileSize=180) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0040 begin`);
      const actual: number = bufferLengthOf(180);
      logInfo(`bufferLengthOf(fileSize=180): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}BufferLengthOf_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0041
     * @tc.name      NdkRawfile_BufferLengthOf_0041
     * @tc.desc      bufferLengthOf(fileSize=185) returns 185
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0041 begin`);
      const actual: number = bufferLengthOf(185);
      logInfo(`bufferLengthOf(fileSize=185): actual=${actual}`);
      expect(actual).assertEqual(185);
      logInfo(`${BUNDLE}BufferLengthOf_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0042
     * @tc.name      NdkRawfile_BufferLengthOf_0042
     * @tc.desc      bufferLengthOf(fileSize=190) returns 190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0042 begin`);
      const actual: number = bufferLengthOf(190);
      logInfo(`bufferLengthOf(fileSize=190): actual=${actual}`);
      expect(actual).assertEqual(190);
      logInfo(`${BUNDLE}BufferLengthOf_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0043
     * @tc.name      NdkRawfile_BufferLengthOf_0043
     * @tc.desc      bufferLengthOf(fileSize=195) returns 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0043 begin`);
      const actual: number = bufferLengthOf(195);
      logInfo(`bufferLengthOf(fileSize=195): actual=${actual}`);
      expect(actual).assertEqual(195);
      logInfo(`${BUNDLE}BufferLengthOf_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0044
     * @tc.name      NdkRawfile_BufferLengthOf_0044
     * @tc.desc      bufferLengthOf(fileSize=200) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0044 begin`);
      const actual: number = bufferLengthOf(200);
      logInfo(`bufferLengthOf(fileSize=200): actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}BufferLengthOf_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0045
     * @tc.name      NdkRawfile_BufferLengthOf_0045
     * @tc.desc      bufferLengthOf(fileSize=20.85) returns 20.85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0045 begin`);
      const actual: number = bufferLengthOf(20.85);
      logInfo(`bufferLengthOf(fileSize=20.85): actual=${actual}`);
      expect(actual).assertClose(20.85, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0046
     * @tc.name      NdkRawfile_BufferLengthOf_0046
     * @tc.desc      bufferLengthOf(fileSize=26.54) returns 26.54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0046 begin`);
      const actual: number = bufferLengthOf(26.54);
      logInfo(`bufferLengthOf(fileSize=26.54): actual=${actual}`);
      expect(actual).assertClose(26.54, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0047
     * @tc.name      NdkRawfile_BufferLengthOf_0047
     * @tc.desc      bufferLengthOf(fileSize=173) returns 173
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0047 begin`);
      const actual: number = bufferLengthOf(173);
      logInfo(`bufferLengthOf(fileSize=173): actual=${actual}`);
      expect(actual).assertEqual(173);
      logInfo(`${BUNDLE}BufferLengthOf_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0048
     * @tc.name      NdkRawfile_BufferLengthOf_0048
     * @tc.desc      bufferLengthOf(fileSize=168) returns 168
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0048 begin`);
      const actual: number = bufferLengthOf(168);
      logInfo(`bufferLengthOf(fileSize=168): actual=${actual}`);
      expect(actual).assertEqual(168);
      logInfo(`${BUNDLE}BufferLengthOf_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0049
     * @tc.name      NdkRawfile_BufferLengthOf_0049
     * @tc.desc      bufferLengthOf(fileSize=161) returns 161
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0049 begin`);
      const actual: number = bufferLengthOf(161);
      logInfo(`bufferLengthOf(fileSize=161): actual=${actual}`);
      expect(actual).assertEqual(161);
      logInfo(`${BUNDLE}BufferLengthOf_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0050
     * @tc.name      NdkRawfile_BufferLengthOf_0050
     * @tc.desc      bufferLengthOf(fileSize=197) returns 197
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0050 begin`);
      const actual: number = bufferLengthOf(197);
      logInfo(`bufferLengthOf(fileSize=197): actual=${actual}`);
      expect(actual).assertEqual(197);
      logInfo(`${BUNDLE}BufferLengthOf_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0051
     * @tc.name      NdkRawfile_BufferLengthOf_0051
     * @tc.desc      bufferLengthOf(fileSize=16) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0051 begin`);
      const actual: number = bufferLengthOf(16);
      logInfo(`bufferLengthOf(fileSize=16): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}BufferLengthOf_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0052
     * @tc.name      NdkRawfile_BufferLengthOf_0052
     * @tc.desc      bufferLengthOf(fileSize=9.56) returns 9.56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0052 begin`);
      const actual: number = bufferLengthOf(9.56);
      logInfo(`bufferLengthOf(fileSize=9.56): actual=${actual}`);
      expect(actual).assertClose(9.56, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0053
     * @tc.name      NdkRawfile_BufferLengthOf_0053
     * @tc.desc      bufferLengthOf(fileSize=91.16) returns 91.16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0053 begin`);
      const actual: number = bufferLengthOf(91.16);
      logInfo(`bufferLengthOf(fileSize=91.16): actual=${actual}`);
      expect(actual).assertClose(91.16, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0054
     * @tc.name      NdkRawfile_BufferLengthOf_0054
     * @tc.desc      bufferLengthOf(fileSize=3.74) returns 3.74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0054 begin`);
      const actual: number = bufferLengthOf(3.74);
      logInfo(`bufferLengthOf(fileSize=3.74): actual=${actual}`);
      expect(actual).assertClose(3.74, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0055
     * @tc.name      NdkRawfile_BufferLengthOf_0055
     * @tc.desc      bufferLengthOf(fileSize=54) returns 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0055 begin`);
      const actual: number = bufferLengthOf(54);
      logInfo(`bufferLengthOf(fileSize=54): actual=${actual}`);
      expect(actual).assertEqual(54);
      logInfo(`${BUNDLE}BufferLengthOf_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0056
     * @tc.name      NdkRawfile_BufferLengthOf_0056
     * @tc.desc      bufferLengthOf(fileSize=133) returns 133
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0056 begin`);
      const actual: number = bufferLengthOf(133);
      logInfo(`bufferLengthOf(fileSize=133): actual=${actual}`);
      expect(actual).assertEqual(133);
      logInfo(`${BUNDLE}BufferLengthOf_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0057
     * @tc.name      NdkRawfile_BufferLengthOf_0057
     * @tc.desc      bufferLengthOf(fileSize=51) returns 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0057 begin`);
      const actual: number = bufferLengthOf(51);
      logInfo(`bufferLengthOf(fileSize=51): actual=${actual}`);
      expect(actual).assertEqual(51);
      logInfo(`${BUNDLE}BufferLengthOf_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0058
     * @tc.name      NdkRawfile_BufferLengthOf_0058
     * @tc.desc      bufferLengthOf(fileSize=76.97) returns 76.97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0058 begin`);
      const actual: number = bufferLengthOf(76.97);
      logInfo(`bufferLengthOf(fileSize=76.97): actual=${actual}`);
      expect(actual).assertClose(76.97, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0059
     * @tc.name      NdkRawfile_BufferLengthOf_0059
     * @tc.desc      bufferLengthOf(fileSize=126) returns 126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0059 begin`);
      const actual: number = bufferLengthOf(126);
      logInfo(`bufferLengthOf(fileSize=126): actual=${actual}`);
      expect(actual).assertEqual(126);
      logInfo(`${BUNDLE}BufferLengthOf_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0060
     * @tc.name      NdkRawfile_BufferLengthOf_0060
     * @tc.desc      bufferLengthOf(fileSize=81.39) returns 81.39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0060 begin`);
      const actual: number = bufferLengthOf(81.39);
      logInfo(`bufferLengthOf(fileSize=81.39): actual=${actual}`);
      expect(actual).assertClose(81.39, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0061
     * @tc.name      NdkRawfile_BufferLengthOf_0061
     * @tc.desc      bufferLengthOf(fileSize=67.3) returns 67.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0061 begin`);
      const actual: number = bufferLengthOf(67.3);
      logInfo(`bufferLengthOf(fileSize=67.3): actual=${actual}`);
      expect(actual).assertClose(67.3, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0062
     * @tc.name      NdkRawfile_BufferLengthOf_0062
     * @tc.desc      bufferLengthOf(fileSize=50.24) returns 50.24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0062 begin`);
      const actual: number = bufferLengthOf(50.24);
      logInfo(`bufferLengthOf(fileSize=50.24): actual=${actual}`);
      expect(actual).assertClose(50.24, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0063
     * @tc.name      NdkRawfile_BufferLengthOf_0063
     * @tc.desc      bufferLengthOf(fileSize=74.74) returns 74.74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0063 begin`);
      const actual: number = bufferLengthOf(74.74);
      logInfo(`bufferLengthOf(fileSize=74.74): actual=${actual}`);
      expect(actual).assertClose(74.74, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0064
     * @tc.name      NdkRawfile_BufferLengthOf_0064
     * @tc.desc      bufferLengthOf(fileSize=27.08) returns 27.08
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0064 begin`);
      const actual: number = bufferLengthOf(27.08);
      logInfo(`bufferLengthOf(fileSize=27.08): actual=${actual}`);
      expect(actual).assertClose(27.08, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0065
     * @tc.name      NdkRawfile_BufferLengthOf_0065
     * @tc.desc      bufferLengthOf(fileSize=23) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0065 begin`);
      const actual: number = bufferLengthOf(23);
      logInfo(`bufferLengthOf(fileSize=23): actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}BufferLengthOf_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0066
     * @tc.name      NdkRawfile_BufferLengthOf_0066
     * @tc.desc      bufferLengthOf(fileSize=38) returns 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0066 begin`);
      const actual: number = bufferLengthOf(38);
      logInfo(`bufferLengthOf(fileSize=38): actual=${actual}`);
      expect(actual).assertEqual(38);
      logInfo(`${BUNDLE}BufferLengthOf_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0067
     * @tc.name      NdkRawfile_BufferLengthOf_0067
     * @tc.desc      bufferLengthOf(fileSize=51.04) returns 51.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0067 begin`);
      const actual: number = bufferLengthOf(51.04);
      logInfo(`bufferLengthOf(fileSize=51.04): actual=${actual}`);
      expect(actual).assertClose(51.04, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0068
     * @tc.name      NdkRawfile_BufferLengthOf_0068
     * @tc.desc      bufferLengthOf(fileSize=119) returns 119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0068 begin`);
      const actual: number = bufferLengthOf(119);
      logInfo(`bufferLengthOf(fileSize=119): actual=${actual}`);
      expect(actual).assertEqual(119);
      logInfo(`${BUNDLE}BufferLengthOf_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0069
     * @tc.name      NdkRawfile_BufferLengthOf_0069
     * @tc.desc      bufferLengthOf(fileSize=61.57) returns 61.57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0069 begin`);
      const actual: number = bufferLengthOf(61.57);
      logInfo(`bufferLengthOf(fileSize=61.57): actual=${actual}`);
      expect(actual).assertClose(61.57, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0070
     * @tc.name      NdkRawfile_BufferLengthOf_0070
     * @tc.desc      bufferLengthOf(fileSize=143) returns 143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0070 begin`);
      const actual: number = bufferLengthOf(143);
      logInfo(`bufferLengthOf(fileSize=143): actual=${actual}`);
      expect(actual).assertEqual(143);
      logInfo(`${BUNDLE}BufferLengthOf_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0071
     * @tc.name      NdkRawfile_BufferLengthOf_0071
     * @tc.desc      bufferLengthOf(fileSize=6) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0071 begin`);
      const actual: number = bufferLengthOf(6);
      logInfo(`bufferLengthOf(fileSize=6): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}BufferLengthOf_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0072
     * @tc.name      NdkRawfile_BufferLengthOf_0072
     * @tc.desc      bufferLengthOf(fileSize=56) returns 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0072 begin`);
      const actual: number = bufferLengthOf(56);
      logInfo(`bufferLengthOf(fileSize=56): actual=${actual}`);
      expect(actual).assertEqual(56);
      logInfo(`${BUNDLE}BufferLengthOf_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0073
     * @tc.name      NdkRawfile_BufferLengthOf_0073
     * @tc.desc      bufferLengthOf(fileSize=19.86) returns 19.86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0073 begin`);
      const actual: number = bufferLengthOf(19.86);
      logInfo(`bufferLengthOf(fileSize=19.86): actual=${actual}`);
      expect(actual).assertClose(19.86, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0074
     * @tc.name      NdkRawfile_BufferLengthOf_0074
     * @tc.desc      bufferLengthOf(fileSize=188) returns 188
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0074 begin`);
      const actual: number = bufferLengthOf(188);
      logInfo(`bufferLengthOf(fileSize=188): actual=${actual}`);
      expect(actual).assertEqual(188);
      logInfo(`${BUNDLE}BufferLengthOf_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0075
     * @tc.name      NdkRawfile_BufferLengthOf_0075
     * @tc.desc      bufferLengthOf(fileSize=59.57) returns 59.57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0075 begin`);
      const actual: number = bufferLengthOf(59.57);
      logInfo(`bufferLengthOf(fileSize=59.57): actual=${actual}`);
      expect(actual).assertClose(59.57, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0076
     * @tc.name      NdkRawfile_BufferLengthOf_0076
     * @tc.desc      bufferLengthOf(fileSize=57.37) returns 57.37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0076 begin`);
      const actual: number = bufferLengthOf(57.37);
      logInfo(`bufferLengthOf(fileSize=57.37): actual=${actual}`);
      expect(actual).assertClose(57.37, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0077
     * @tc.name      NdkRawfile_BufferLengthOf_0077
     * @tc.desc      bufferLengthOf(fileSize=164) returns 164
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0077 begin`);
      const actual: number = bufferLengthOf(164);
      logInfo(`bufferLengthOf(fileSize=164): actual=${actual}`);
      expect(actual).assertEqual(164);
      logInfo(`${BUNDLE}BufferLengthOf_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0078
     * @tc.name      NdkRawfile_BufferLengthOf_0078
     * @tc.desc      bufferLengthOf(fileSize=42) returns 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0078 begin`);
      const actual: number = bufferLengthOf(42);
      logInfo(`bufferLengthOf(fileSize=42): actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}BufferLengthOf_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0079
     * @tc.name      NdkRawfile_BufferLengthOf_0079
     * @tc.desc      bufferLengthOf(fileSize=138) returns 138
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0079 begin`);
      const actual: number = bufferLengthOf(138);
      logInfo(`bufferLengthOf(fileSize=138): actual=${actual}`);
      expect(actual).assertEqual(138);
      logInfo(`${BUNDLE}BufferLengthOf_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0080
     * @tc.name      NdkRawfile_BufferLengthOf_0080
     * @tc.desc      bufferLengthOf(fileSize=78.6) returns 78.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0080 begin`);
      const actual: number = bufferLengthOf(78.6);
      logInfo(`bufferLengthOf(fileSize=78.6): actual=${actual}`);
      expect(actual).assertClose(78.6, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0081
     * @tc.name      NdkRawfile_BufferLengthOf_0081
     * @tc.desc      bufferLengthOf(fileSize=83.35) returns 83.35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0081 begin`);
      const actual: number = bufferLengthOf(83.35);
      logInfo(`bufferLengthOf(fileSize=83.35): actual=${actual}`);
      expect(actual).assertClose(83.35, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0082
     * @tc.name      NdkRawfile_BufferLengthOf_0082
     * @tc.desc      bufferLengthOf(fileSize=76.64) returns 76.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0082 begin`);
      const actual: number = bufferLengthOf(76.64);
      logInfo(`bufferLengthOf(fileSize=76.64): actual=${actual}`);
      expect(actual).assertClose(76.64, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0083
     * @tc.name      NdkRawfile_BufferLengthOf_0083
     * @tc.desc      bufferLengthOf(fileSize=172) returns 172
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0083 begin`);
      const actual: number = bufferLengthOf(172);
      logInfo(`bufferLengthOf(fileSize=172): actual=${actual}`);
      expect(actual).assertEqual(172);
      logInfo(`${BUNDLE}BufferLengthOf_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0084
     * @tc.name      NdkRawfile_BufferLengthOf_0084
     * @tc.desc      bufferLengthOf(fileSize=79) returns 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0084 begin`);
      const actual: number = bufferLengthOf(79);
      logInfo(`bufferLengthOf(fileSize=79): actual=${actual}`);
      expect(actual).assertEqual(79);
      logInfo(`${BUNDLE}BufferLengthOf_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0085
     * @tc.name      NdkRawfile_BufferLengthOf_0085
     * @tc.desc      bufferLengthOf(fileSize=4) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0085 begin`);
      const actual: number = bufferLengthOf(4);
      logInfo(`bufferLengthOf(fileSize=4): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}BufferLengthOf_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0086
     * @tc.name      NdkRawfile_BufferLengthOf_0086
     * @tc.desc      bufferLengthOf(fileSize=137) returns 137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0086 begin`);
      const actual: number = bufferLengthOf(137);
      logInfo(`bufferLengthOf(fileSize=137): actual=${actual}`);
      expect(actual).assertEqual(137);
      logInfo(`${BUNDLE}BufferLengthOf_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0087
     * @tc.name      NdkRawfile_BufferLengthOf_0087
     * @tc.desc      bufferLengthOf(fileSize=162) returns 162
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0087 begin`);
      const actual: number = bufferLengthOf(162);
      logInfo(`bufferLengthOf(fileSize=162): actual=${actual}`);
      expect(actual).assertEqual(162);
      logInfo(`${BUNDLE}BufferLengthOf_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0088
     * @tc.name      NdkRawfile_BufferLengthOf_0088
     * @tc.desc      bufferLengthOf(fileSize=42.06) returns 42.06
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0088 begin`);
      const actual: number = bufferLengthOf(42.06);
      logInfo(`bufferLengthOf(fileSize=42.06): actual=${actual}`);
      expect(actual).assertClose(42.06, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0089
     * @tc.name      NdkRawfile_BufferLengthOf_0089
     * @tc.desc      bufferLengthOf(fileSize=34.7) returns 34.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0089 begin`);
      const actual: number = bufferLengthOf(34.7);
      logInfo(`bufferLengthOf(fileSize=34.7): actual=${actual}`);
      expect(actual).assertClose(34.7, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0090
     * @tc.name      NdkRawfile_BufferLengthOf_0090
     * @tc.desc      bufferLengthOf(fileSize=79.94) returns 79.94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0090 begin`);
      const actual: number = bufferLengthOf(79.94);
      logInfo(`bufferLengthOf(fileSize=79.94): actual=${actual}`);
      expect(actual).assertClose(79.94, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0091
     * @tc.name      NdkRawfile_BufferLengthOf_0091
     * @tc.desc      bufferLengthOf(fileSize=169) returns 169
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0091 begin`);
      const actual: number = bufferLengthOf(169);
      logInfo(`bufferLengthOf(fileSize=169): actual=${actual}`);
      expect(actual).assertEqual(169);
      logInfo(`${BUNDLE}BufferLengthOf_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0092
     * @tc.name      NdkRawfile_BufferLengthOf_0092
     * @tc.desc      bufferLengthOf(fileSize=99) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0092 begin`);
      const actual: number = bufferLengthOf(99);
      logInfo(`bufferLengthOf(fileSize=99): actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}BufferLengthOf_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0093
     * @tc.name      NdkRawfile_BufferLengthOf_0093
     * @tc.desc      bufferLengthOf(fileSize=24.12) returns 24.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0093 begin`);
      const actual: number = bufferLengthOf(24.12);
      logInfo(`bufferLengthOf(fileSize=24.12): actual=${actual}`);
      expect(actual).assertClose(24.12, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0094
     * @tc.name      NdkRawfile_BufferLengthOf_0094
     * @tc.desc      bufferLengthOf(fileSize=149) returns 149
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0094 begin`);
      const actual: number = bufferLengthOf(149);
      logInfo(`bufferLengthOf(fileSize=149): actual=${actual}`);
      expect(actual).assertEqual(149);
      logInfo(`${BUNDLE}BufferLengthOf_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0095
     * @tc.name      NdkRawfile_BufferLengthOf_0095
     * @tc.desc      bufferLengthOf(fileSize=134) returns 134
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0095 begin`);
      const actual: number = bufferLengthOf(134);
      logInfo(`bufferLengthOf(fileSize=134): actual=${actual}`);
      expect(actual).assertEqual(134);
      logInfo(`${BUNDLE}BufferLengthOf_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0096
     * @tc.name      NdkRawfile_BufferLengthOf_0096
     * @tc.desc      bufferLengthOf(fileSize=141) returns 141
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0096 begin`);
      const actual: number = bufferLengthOf(141);
      logInfo(`bufferLengthOf(fileSize=141): actual=${actual}`);
      expect(actual).assertEqual(141);
      logInfo(`${BUNDLE}BufferLengthOf_0096 end`);
    });
  });
}
