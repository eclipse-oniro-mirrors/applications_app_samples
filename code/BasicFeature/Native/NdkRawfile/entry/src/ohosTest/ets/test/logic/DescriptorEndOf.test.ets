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
import { descriptorEndOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for descriptorEndOf (96 cases). */
export default function descriptorEndOfTest(): void {
  describe('DescriptorEndOfTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0001
     * @tc.name      NdkRawfile_DescriptorEndOf_0001
     * @tc.desc      descriptorEndOf(offset=-100, length=0) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_DescriptorEndOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0001 begin`);
      const actual: number = descriptorEndOf(-100, 0);
      logInfo(`descriptorEndOf(offset=-100, length=0): actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}DescriptorEndOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0002
     * @tc.name      NdkRawfile_DescriptorEndOf_0002
     * @tc.desc      descriptorEndOf(offset=-100, length=1) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_DescriptorEndOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0002 begin`);
      const actual: number = descriptorEndOf(-100, 1);
      logInfo(`descriptorEndOf(offset=-100, length=1): actual=${actual}`);
      expect(actual).assertEqual(-99);
      logInfo(`${BUNDLE}DescriptorEndOf_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0003
     * @tc.name      NdkRawfile_DescriptorEndOf_0003
     * @tc.desc      descriptorEndOf(offset=-100, length=2) returns -98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0003 begin`);
      const actual: number = descriptorEndOf(-100, 2);
      logInfo(`descriptorEndOf(offset=-100, length=2): actual=${actual}`);
      expect(actual).assertEqual(-98);
      logInfo(`${BUNDLE}DescriptorEndOf_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0004
     * @tc.name      NdkRawfile_DescriptorEndOf_0004
     * @tc.desc      descriptorEndOf(offset=-100, length=5) returns -95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0004 begin`);
      const actual: number = descriptorEndOf(-100, 5);
      logInfo(`descriptorEndOf(offset=-100, length=5): actual=${actual}`);
      expect(actual).assertEqual(-95);
      logInfo(`${BUNDLE}DescriptorEndOf_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0005
     * @tc.name      NdkRawfile_DescriptorEndOf_0005
     * @tc.desc      descriptorEndOf(offset=-100, length=10) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0005 begin`);
      const actual: number = descriptorEndOf(-100, 10);
      logInfo(`descriptorEndOf(offset=-100, length=10): actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}DescriptorEndOf_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0006
     * @tc.name      NdkRawfile_DescriptorEndOf_0006
     * @tc.desc      descriptorEndOf(offset=-100, length=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0006 begin`);
      const actual: number = descriptorEndOf(-100, 100);
      logInfo(`descriptorEndOf(offset=-100, length=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DescriptorEndOf_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0007
     * @tc.name      NdkRawfile_DescriptorEndOf_0007
     * @tc.desc      descriptorEndOf(offset=-100, length=-1) returns -101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0007 begin`);
      const actual: number = descriptorEndOf(-100, -1);
      logInfo(`descriptorEndOf(offset=-100, length=-1): actual=${actual}`);
      expect(actual).assertEqual(-101);
      logInfo(`${BUNDLE}DescriptorEndOf_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0008
     * @tc.name      NdkRawfile_DescriptorEndOf_0008
     * @tc.desc      descriptorEndOf(offset=-100, length=3) returns -97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0008 begin`);
      const actual: number = descriptorEndOf(-100, 3);
      logInfo(`descriptorEndOf(offset=-100, length=3): actual=${actual}`);
      expect(actual).assertEqual(-97);
      logInfo(`${BUNDLE}DescriptorEndOf_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0009
     * @tc.name      NdkRawfile_DescriptorEndOf_0009
     * @tc.desc      descriptorEndOf(offset=-100, length=15) returns -85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0009 begin`);
      const actual: number = descriptorEndOf(-100, 15);
      logInfo(`descriptorEndOf(offset=-100, length=15): actual=${actual}`);
      expect(actual).assertEqual(-85);
      logInfo(`${BUNDLE}DescriptorEndOf_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0010
     * @tc.name      NdkRawfile_DescriptorEndOf_0010
     * @tc.desc      descriptorEndOf(offset=-100, length=20) returns -80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0010 begin`);
      const actual: number = descriptorEndOf(-100, 20);
      logInfo(`descriptorEndOf(offset=-100, length=20): actual=${actual}`);
      expect(actual).assertEqual(-80);
      logInfo(`${BUNDLE}DescriptorEndOf_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0011
     * @tc.name      NdkRawfile_DescriptorEndOf_0011
     * @tc.desc      descriptorEndOf(offset=-100, length=25) returns -75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0011 begin`);
      const actual: number = descriptorEndOf(-100, 25);
      logInfo(`descriptorEndOf(offset=-100, length=25): actual=${actual}`);
      expect(actual).assertEqual(-75);
      logInfo(`${BUNDLE}DescriptorEndOf_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0012
     * @tc.name      NdkRawfile_DescriptorEndOf_0012
     * @tc.desc      descriptorEndOf(offset=-100, length=30) returns -70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0012 begin`);
      const actual: number = descriptorEndOf(-100, 30);
      logInfo(`descriptorEndOf(offset=-100, length=30): actual=${actual}`);
      expect(actual).assertEqual(-70);
      logInfo(`${BUNDLE}DescriptorEndOf_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0013
     * @tc.name      NdkRawfile_DescriptorEndOf_0013
     * @tc.desc      descriptorEndOf(offset=-100, length=35) returns -65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0013 begin`);
      const actual: number = descriptorEndOf(-100, 35);
      logInfo(`descriptorEndOf(offset=-100, length=35): actual=${actual}`);
      expect(actual).assertEqual(-65);
      logInfo(`${BUNDLE}DescriptorEndOf_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0014
     * @tc.name      NdkRawfile_DescriptorEndOf_0014
     * @tc.desc      descriptorEndOf(offset=-100, length=40) returns -60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0014 begin`);
      const actual: number = descriptorEndOf(-100, 40);
      logInfo(`descriptorEndOf(offset=-100, length=40): actual=${actual}`);
      expect(actual).assertEqual(-60);
      logInfo(`${BUNDLE}DescriptorEndOf_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0015
     * @tc.name      NdkRawfile_DescriptorEndOf_0015
     * @tc.desc      descriptorEndOf(offset=-100, length=45) returns -55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0015 begin`);
      const actual: number = descriptorEndOf(-100, 45);
      logInfo(`descriptorEndOf(offset=-100, length=45): actual=${actual}`);
      expect(actual).assertEqual(-55);
      logInfo(`${BUNDLE}DescriptorEndOf_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0016
     * @tc.name      NdkRawfile_DescriptorEndOf_0016
     * @tc.desc      descriptorEndOf(offset=-100, length=50) returns -50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0016 begin`);
      const actual: number = descriptorEndOf(-100, 50);
      logInfo(`descriptorEndOf(offset=-100, length=50): actual=${actual}`);
      expect(actual).assertEqual(-50);
      logInfo(`${BUNDLE}DescriptorEndOf_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0017
     * @tc.name      NdkRawfile_DescriptorEndOf_0017
     * @tc.desc      descriptorEndOf(offset=-100, length=55) returns -45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0017 begin`);
      const actual: number = descriptorEndOf(-100, 55);
      logInfo(`descriptorEndOf(offset=-100, length=55): actual=${actual}`);
      expect(actual).assertEqual(-45);
      logInfo(`${BUNDLE}DescriptorEndOf_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0018
     * @tc.name      NdkRawfile_DescriptorEndOf_0018
     * @tc.desc      descriptorEndOf(offset=-100, length=60) returns -40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0018 begin`);
      const actual: number = descriptorEndOf(-100, 60);
      logInfo(`descriptorEndOf(offset=-100, length=60): actual=${actual}`);
      expect(actual).assertEqual(-40);
      logInfo(`${BUNDLE}DescriptorEndOf_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0019
     * @tc.name      NdkRawfile_DescriptorEndOf_0019
     * @tc.desc      descriptorEndOf(offset=-100, length=65) returns -35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0019 begin`);
      const actual: number = descriptorEndOf(-100, 65);
      logInfo(`descriptorEndOf(offset=-100, length=65): actual=${actual}`);
      expect(actual).assertEqual(-35);
      logInfo(`${BUNDLE}DescriptorEndOf_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0020
     * @tc.name      NdkRawfile_DescriptorEndOf_0020
     * @tc.desc      descriptorEndOf(offset=-100, length=70) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0020 begin`);
      const actual: number = descriptorEndOf(-100, 70);
      logInfo(`descriptorEndOf(offset=-100, length=70): actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}DescriptorEndOf_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0021
     * @tc.name      NdkRawfile_DescriptorEndOf_0021
     * @tc.desc      descriptorEndOf(offset=-100, length=75) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0021 begin`);
      const actual: number = descriptorEndOf(-100, 75);
      logInfo(`descriptorEndOf(offset=-100, length=75): actual=${actual}`);
      expect(actual).assertEqual(-25);
      logInfo(`${BUNDLE}DescriptorEndOf_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0022
     * @tc.name      NdkRawfile_DescriptorEndOf_0022
     * @tc.desc      descriptorEndOf(offset=-100, length=80) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0022 begin`);
      const actual: number = descriptorEndOf(-100, 80);
      logInfo(`descriptorEndOf(offset=-100, length=80): actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}DescriptorEndOf_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0023
     * @tc.name      NdkRawfile_DescriptorEndOf_0023
     * @tc.desc      descriptorEndOf(offset=-100, length=85) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0023 begin`);
      const actual: number = descriptorEndOf(-100, 85);
      logInfo(`descriptorEndOf(offset=-100, length=85): actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}DescriptorEndOf_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0024
     * @tc.name      NdkRawfile_DescriptorEndOf_0024
     * @tc.desc      descriptorEndOf(offset=-100, length=90) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0024 begin`);
      const actual: number = descriptorEndOf(-100, 90);
      logInfo(`descriptorEndOf(offset=-100, length=90): actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}DescriptorEndOf_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0025
     * @tc.name      NdkRawfile_DescriptorEndOf_0025
     * @tc.desc      descriptorEndOf(offset=-100, length=95) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0025 begin`);
      const actual: number = descriptorEndOf(-100, 95);
      logInfo(`descriptorEndOf(offset=-100, length=95): actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}DescriptorEndOf_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0026
     * @tc.name      NdkRawfile_DescriptorEndOf_0026
     * @tc.desc      descriptorEndOf(offset=-100, length=105) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0026 begin`);
      const actual: number = descriptorEndOf(-100, 105);
      logInfo(`descriptorEndOf(offset=-100, length=105): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}DescriptorEndOf_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0027
     * @tc.name      NdkRawfile_DescriptorEndOf_0027
     * @tc.desc      descriptorEndOf(offset=-100, length=110) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0027 begin`);
      const actual: number = descriptorEndOf(-100, 110);
      logInfo(`descriptorEndOf(offset=-100, length=110): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}DescriptorEndOf_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0028
     * @tc.name      NdkRawfile_DescriptorEndOf_0028
     * @tc.desc      descriptorEndOf(offset=-100, length=-65) returns -165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0028 begin`);
      const actual: number = descriptorEndOf(-100, -65);
      logInfo(`descriptorEndOf(offset=-100, length=-65): actual=${actual}`);
      expect(actual).assertEqual(-165);
      logInfo(`${BUNDLE}DescriptorEndOf_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0029
     * @tc.name      NdkRawfile_DescriptorEndOf_0029
     * @tc.desc      descriptorEndOf(offset=-100, length=-26) returns -126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0029 begin`);
      const actual: number = descriptorEndOf(-100, -26);
      logInfo(`descriptorEndOf(offset=-100, length=-26): actual=${actual}`);
      expect(actual).assertEqual(-126);
      logInfo(`${BUNDLE}DescriptorEndOf_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0030
     * @tc.name      NdkRawfile_DescriptorEndOf_0030
     * @tc.desc      descriptorEndOf(offset=-100, length=127) returns 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0030 begin`);
      const actual: number = descriptorEndOf(-100, 127);
      logInfo(`descriptorEndOf(offset=-100, length=127): actual=${actual}`);
      expect(actual).assertEqual(27);
      logInfo(`${BUNDLE}DescriptorEndOf_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0031
     * @tc.name      NdkRawfile_DescriptorEndOf_0031
     * @tc.desc      descriptorEndOf(offset=-1, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0031 begin`);
      const actual: number = descriptorEndOf(-1, 0);
      logInfo(`descriptorEndOf(offset=-1, length=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DescriptorEndOf_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0032
     * @tc.name      NdkRawfile_DescriptorEndOf_0032
     * @tc.desc      descriptorEndOf(offset=-1, length=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0032 begin`);
      const actual: number = descriptorEndOf(-1, 2);
      logInfo(`descriptorEndOf(offset=-1, length=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DescriptorEndOf_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0033
     * @tc.name      NdkRawfile_DescriptorEndOf_0033
     * @tc.desc      descriptorEndOf(offset=-1, length=5) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0033 begin`);
      const actual: number = descriptorEndOf(-1, 5);
      logInfo(`descriptorEndOf(offset=-1, length=5): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}DescriptorEndOf_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0034
     * @tc.name      NdkRawfile_DescriptorEndOf_0034
     * @tc.desc      descriptorEndOf(offset=-1, length=10) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0034 begin`);
      const actual: number = descriptorEndOf(-1, 10);
      logInfo(`descriptorEndOf(offset=-1, length=10): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}DescriptorEndOf_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0035
     * @tc.name      NdkRawfile_DescriptorEndOf_0035
     * @tc.desc      descriptorEndOf(offset=-1, length=100) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0035 begin`);
      const actual: number = descriptorEndOf(-1, 100);
      logInfo(`descriptorEndOf(offset=-1, length=100): actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}DescriptorEndOf_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0036
     * @tc.name      NdkRawfile_DescriptorEndOf_0036
     * @tc.desc      descriptorEndOf(offset=-1, length=-1) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0036 begin`);
      const actual: number = descriptorEndOf(-1, -1);
      logInfo(`descriptorEndOf(offset=-1, length=-1): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}DescriptorEndOf_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0037
     * @tc.name      NdkRawfile_DescriptorEndOf_0037
     * @tc.desc      descriptorEndOf(offset=-1, length=3) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0037 begin`);
      const actual: number = descriptorEndOf(-1, 3);
      logInfo(`descriptorEndOf(offset=-1, length=3): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}DescriptorEndOf_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0038
     * @tc.name      NdkRawfile_DescriptorEndOf_0038
     * @tc.desc      descriptorEndOf(offset=-1, length=15) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0038 begin`);
      const actual: number = descriptorEndOf(-1, 15);
      logInfo(`descriptorEndOf(offset=-1, length=15): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}DescriptorEndOf_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0039
     * @tc.name      NdkRawfile_DescriptorEndOf_0039
     * @tc.desc      descriptorEndOf(offset=-1, length=20) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0039 begin`);
      const actual: number = descriptorEndOf(-1, 20);
      logInfo(`descriptorEndOf(offset=-1, length=20): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}DescriptorEndOf_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0040
     * @tc.name      NdkRawfile_DescriptorEndOf_0040
     * @tc.desc      descriptorEndOf(offset=-1, length=25) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0040 begin`);
      const actual: number = descriptorEndOf(-1, 25);
      logInfo(`descriptorEndOf(offset=-1, length=25): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}DescriptorEndOf_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0041
     * @tc.name      NdkRawfile_DescriptorEndOf_0041
     * @tc.desc      descriptorEndOf(offset=-1, length=30) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0041 begin`);
      const actual: number = descriptorEndOf(-1, 30);
      logInfo(`descriptorEndOf(offset=-1, length=30): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}DescriptorEndOf_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0042
     * @tc.name      NdkRawfile_DescriptorEndOf_0042
     * @tc.desc      descriptorEndOf(offset=-1, length=35) returns 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0042 begin`);
      const actual: number = descriptorEndOf(-1, 35);
      logInfo(`descriptorEndOf(offset=-1, length=35): actual=${actual}`);
      expect(actual).assertEqual(34);
      logInfo(`${BUNDLE}DescriptorEndOf_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0043
     * @tc.name      NdkRawfile_DescriptorEndOf_0043
     * @tc.desc      descriptorEndOf(offset=-1, length=40) returns 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0043 begin`);
      const actual: number = descriptorEndOf(-1, 40);
      logInfo(`descriptorEndOf(offset=-1, length=40): actual=${actual}`);
      expect(actual).assertEqual(39);
      logInfo(`${BUNDLE}DescriptorEndOf_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0044
     * @tc.name      NdkRawfile_DescriptorEndOf_0044
     * @tc.desc      descriptorEndOf(offset=-1, length=45) returns 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0044 begin`);
      const actual: number = descriptorEndOf(-1, 45);
      logInfo(`descriptorEndOf(offset=-1, length=45): actual=${actual}`);
      expect(actual).assertEqual(44);
      logInfo(`${BUNDLE}DescriptorEndOf_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0045
     * @tc.name      NdkRawfile_DescriptorEndOf_0045
     * @tc.desc      descriptorEndOf(offset=-1, length=50) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0045 begin`);
      const actual: number = descriptorEndOf(-1, 50);
      logInfo(`descriptorEndOf(offset=-1, length=50): actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}DescriptorEndOf_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0046
     * @tc.name      NdkRawfile_DescriptorEndOf_0046
     * @tc.desc      descriptorEndOf(offset=-1, length=55) returns 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0046 begin`);
      const actual: number = descriptorEndOf(-1, 55);
      logInfo(`descriptorEndOf(offset=-1, length=55): actual=${actual}`);
      expect(actual).assertEqual(54);
      logInfo(`${BUNDLE}DescriptorEndOf_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0047
     * @tc.name      NdkRawfile_DescriptorEndOf_0047
     * @tc.desc      descriptorEndOf(offset=-1, length=60) returns 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0047 begin`);
      const actual: number = descriptorEndOf(-1, 60);
      logInfo(`descriptorEndOf(offset=-1, length=60): actual=${actual}`);
      expect(actual).assertEqual(59);
      logInfo(`${BUNDLE}DescriptorEndOf_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0048
     * @tc.name      NdkRawfile_DescriptorEndOf_0048
     * @tc.desc      descriptorEndOf(offset=-1, length=65) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0048 begin`);
      const actual: number = descriptorEndOf(-1, 65);
      logInfo(`descriptorEndOf(offset=-1, length=65): actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}DescriptorEndOf_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0049
     * @tc.name      NdkRawfile_DescriptorEndOf_0049
     * @tc.desc      descriptorEndOf(offset=-1, length=70) returns 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0049 begin`);
      const actual: number = descriptorEndOf(-1, 70);
      logInfo(`descriptorEndOf(offset=-1, length=70): actual=${actual}`);
      expect(actual).assertEqual(69);
      logInfo(`${BUNDLE}DescriptorEndOf_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0050
     * @tc.name      NdkRawfile_DescriptorEndOf_0050
     * @tc.desc      descriptorEndOf(offset=-1, length=75) returns 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0050 begin`);
      const actual: number = descriptorEndOf(-1, 75);
      logInfo(`descriptorEndOf(offset=-1, length=75): actual=${actual}`);
      expect(actual).assertEqual(74);
      logInfo(`${BUNDLE}DescriptorEndOf_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0051
     * @tc.name      NdkRawfile_DescriptorEndOf_0051
     * @tc.desc      descriptorEndOf(offset=-1, length=80) returns 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0051 begin`);
      const actual: number = descriptorEndOf(-1, 80);
      logInfo(`descriptorEndOf(offset=-1, length=80): actual=${actual}`);
      expect(actual).assertEqual(79);
      logInfo(`${BUNDLE}DescriptorEndOf_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0052
     * @tc.name      NdkRawfile_DescriptorEndOf_0052
     * @tc.desc      descriptorEndOf(offset=-1, length=85) returns 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0052 begin`);
      const actual: number = descriptorEndOf(-1, 85);
      logInfo(`descriptorEndOf(offset=-1, length=85): actual=${actual}`);
      expect(actual).assertEqual(84);
      logInfo(`${BUNDLE}DescriptorEndOf_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0053
     * @tc.name      NdkRawfile_DescriptorEndOf_0053
     * @tc.desc      descriptorEndOf(offset=-1, length=90) returns 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0053 begin`);
      const actual: number = descriptorEndOf(-1, 90);
      logInfo(`descriptorEndOf(offset=-1, length=90): actual=${actual}`);
      expect(actual).assertEqual(89);
      logInfo(`${BUNDLE}DescriptorEndOf_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0054
     * @tc.name      NdkRawfile_DescriptorEndOf_0054
     * @tc.desc      descriptorEndOf(offset=-1, length=95) returns 94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0054 begin`);
      const actual: number = descriptorEndOf(-1, 95);
      logInfo(`descriptorEndOf(offset=-1, length=95): actual=${actual}`);
      expect(actual).assertEqual(94);
      logInfo(`${BUNDLE}DescriptorEndOf_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0055
     * @tc.name      NdkRawfile_DescriptorEndOf_0055
     * @tc.desc      descriptorEndOf(offset=-1, length=105) returns 104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0055 begin`);
      const actual: number = descriptorEndOf(-1, 105);
      logInfo(`descriptorEndOf(offset=-1, length=105): actual=${actual}`);
      expect(actual).assertEqual(104);
      logInfo(`${BUNDLE}DescriptorEndOf_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0056
     * @tc.name      NdkRawfile_DescriptorEndOf_0056
     * @tc.desc      descriptorEndOf(offset=-1, length=110) returns 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0056 begin`);
      const actual: number = descriptorEndOf(-1, 110);
      logInfo(`descriptorEndOf(offset=-1, length=110): actual=${actual}`);
      expect(actual).assertEqual(109);
      logInfo(`${BUNDLE}DescriptorEndOf_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0057
     * @tc.name      NdkRawfile_DescriptorEndOf_0057
     * @tc.desc      descriptorEndOf(offset=-1, length=-65) returns -66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0057 begin`);
      const actual: number = descriptorEndOf(-1, -65);
      logInfo(`descriptorEndOf(offset=-1, length=-65): actual=${actual}`);
      expect(actual).assertEqual(-66);
      logInfo(`${BUNDLE}DescriptorEndOf_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0058
     * @tc.name      NdkRawfile_DescriptorEndOf_0058
     * @tc.desc      descriptorEndOf(offset=-1, length=-26) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0058 begin`);
      const actual: number = descriptorEndOf(-1, -26);
      logInfo(`descriptorEndOf(offset=-1, length=-26): actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}DescriptorEndOf_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0059
     * @tc.name      NdkRawfile_DescriptorEndOf_0059
     * @tc.desc      descriptorEndOf(offset=-1, length=127) returns 126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0059 begin`);
      const actual: number = descriptorEndOf(-1, 127);
      logInfo(`descriptorEndOf(offset=-1, length=127): actual=${actual}`);
      expect(actual).assertEqual(126);
      logInfo(`${BUNDLE}DescriptorEndOf_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0060
     * @tc.name      NdkRawfile_DescriptorEndOf_0060
     * @tc.desc      descriptorEndOf(offset=0, length=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0060 begin`);
      const actual: number = descriptorEndOf(0, 100);
      logInfo(`descriptorEndOf(offset=0, length=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}DescriptorEndOf_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0061
     * @tc.name      NdkRawfile_DescriptorEndOf_0061
     * @tc.desc      descriptorEndOf(offset=0, length=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0061 begin`);
      const actual: number = descriptorEndOf(0, 3);
      logInfo(`descriptorEndOf(offset=0, length=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}DescriptorEndOf_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0062
     * @tc.name      NdkRawfile_DescriptorEndOf_0062
     * @tc.desc      descriptorEndOf(offset=0, length=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0062 begin`);
      const actual: number = descriptorEndOf(0, 15);
      logInfo(`descriptorEndOf(offset=0, length=15): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}DescriptorEndOf_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0063
     * @tc.name      NdkRawfile_DescriptorEndOf_0063
     * @tc.desc      descriptorEndOf(offset=0, length=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0063 begin`);
      const actual: number = descriptorEndOf(0, 20);
      logInfo(`descriptorEndOf(offset=0, length=20): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}DescriptorEndOf_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0064
     * @tc.name      NdkRawfile_DescriptorEndOf_0064
     * @tc.desc      descriptorEndOf(offset=0, length=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0064 begin`);
      const actual: number = descriptorEndOf(0, 25);
      logInfo(`descriptorEndOf(offset=0, length=25): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}DescriptorEndOf_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0065
     * @tc.name      NdkRawfile_DescriptorEndOf_0065
     * @tc.desc      descriptorEndOf(offset=0, length=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0065 begin`);
      const actual: number = descriptorEndOf(0, 30);
      logInfo(`descriptorEndOf(offset=0, length=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}DescriptorEndOf_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0066
     * @tc.name      NdkRawfile_DescriptorEndOf_0066
     * @tc.desc      descriptorEndOf(offset=0, length=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0066 begin`);
      const actual: number = descriptorEndOf(0, 35);
      logInfo(`descriptorEndOf(offset=0, length=35): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}DescriptorEndOf_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0067
     * @tc.name      NdkRawfile_DescriptorEndOf_0067
     * @tc.desc      descriptorEndOf(offset=0, length=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0067 begin`);
      const actual: number = descriptorEndOf(0, 40);
      logInfo(`descriptorEndOf(offset=0, length=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}DescriptorEndOf_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0068
     * @tc.name      NdkRawfile_DescriptorEndOf_0068
     * @tc.desc      descriptorEndOf(offset=0, length=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0068 begin`);
      const actual: number = descriptorEndOf(0, 45);
      logInfo(`descriptorEndOf(offset=0, length=45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}DescriptorEndOf_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0069
     * @tc.name      NdkRawfile_DescriptorEndOf_0069
     * @tc.desc      descriptorEndOf(offset=0, length=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0069 begin`);
      const actual: number = descriptorEndOf(0, 50);
      logInfo(`descriptorEndOf(offset=0, length=50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}DescriptorEndOf_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0070
     * @tc.name      NdkRawfile_DescriptorEndOf_0070
     * @tc.desc      descriptorEndOf(offset=0, length=55) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0070 begin`);
      const actual: number = descriptorEndOf(0, 55);
      logInfo(`descriptorEndOf(offset=0, length=55): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}DescriptorEndOf_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0071
     * @tc.name      NdkRawfile_DescriptorEndOf_0071
     * @tc.desc      descriptorEndOf(offset=0, length=60) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0071 begin`);
      const actual: number = descriptorEndOf(0, 60);
      logInfo(`descriptorEndOf(offset=0, length=60): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}DescriptorEndOf_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0072
     * @tc.name      NdkRawfile_DescriptorEndOf_0072
     * @tc.desc      descriptorEndOf(offset=0, length=65) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0072 begin`);
      const actual: number = descriptorEndOf(0, 65);
      logInfo(`descriptorEndOf(offset=0, length=65): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}DescriptorEndOf_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0073
     * @tc.name      NdkRawfile_DescriptorEndOf_0073
     * @tc.desc      descriptorEndOf(offset=0, length=70) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0073 begin`);
      const actual: number = descriptorEndOf(0, 70);
      logInfo(`descriptorEndOf(offset=0, length=70): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}DescriptorEndOf_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0074
     * @tc.name      NdkRawfile_DescriptorEndOf_0074
     * @tc.desc      descriptorEndOf(offset=0, length=75) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0074 begin`);
      const actual: number = descriptorEndOf(0, 75);
      logInfo(`descriptorEndOf(offset=0, length=75): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}DescriptorEndOf_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0075
     * @tc.name      NdkRawfile_DescriptorEndOf_0075
     * @tc.desc      descriptorEndOf(offset=0, length=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0075 begin`);
      const actual: number = descriptorEndOf(0, 80);
      logInfo(`descriptorEndOf(offset=0, length=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}DescriptorEndOf_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0076
     * @tc.name      NdkRawfile_DescriptorEndOf_0076
     * @tc.desc      descriptorEndOf(offset=0, length=85) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0076 begin`);
      const actual: number = descriptorEndOf(0, 85);
      logInfo(`descriptorEndOf(offset=0, length=85): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}DescriptorEndOf_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0077
     * @tc.name      NdkRawfile_DescriptorEndOf_0077
     * @tc.desc      descriptorEndOf(offset=0, length=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0077 begin`);
      const actual: number = descriptorEndOf(0, 90);
      logInfo(`descriptorEndOf(offset=0, length=90): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}DescriptorEndOf_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0078
     * @tc.name      NdkRawfile_DescriptorEndOf_0078
     * @tc.desc      descriptorEndOf(offset=0, length=95) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0078 begin`);
      const actual: number = descriptorEndOf(0, 95);
      logInfo(`descriptorEndOf(offset=0, length=95): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}DescriptorEndOf_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0079
     * @tc.name      NdkRawfile_DescriptorEndOf_0079
     * @tc.desc      descriptorEndOf(offset=0, length=105) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0079 begin`);
      const actual: number = descriptorEndOf(0, 105);
      logInfo(`descriptorEndOf(offset=0, length=105): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}DescriptorEndOf_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0080
     * @tc.name      NdkRawfile_DescriptorEndOf_0080
     * @tc.desc      descriptorEndOf(offset=0, length=110) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0080 begin`);
      const actual: number = descriptorEndOf(0, 110);
      logInfo(`descriptorEndOf(offset=0, length=110): actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}DescriptorEndOf_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0081
     * @tc.name      NdkRawfile_DescriptorEndOf_0081
     * @tc.desc      descriptorEndOf(offset=0, length=-26) returns -26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorEndOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0081 begin`);
      const actual: number = descriptorEndOf(0, -26);
      logInfo(`descriptorEndOf(offset=0, length=-26): actual=${actual}`);
      expect(actual).assertEqual(-26);
      logInfo(`${BUNDLE}DescriptorEndOf_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0082
     * @tc.name      NdkRawfile_DescriptorEndOf_0082
     * @tc.desc      descriptorEndOf(offset=0, length=127) returns 127
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0082 begin`);
      const actual: number = descriptorEndOf(0, 127);
      logInfo(`descriptorEndOf(offset=0, length=127): actual=${actual}`);
      expect(actual).assertEqual(127);
      logInfo(`${BUNDLE}DescriptorEndOf_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0083
     * @tc.name      NdkRawfile_DescriptorEndOf_0083
     * @tc.desc      descriptorEndOf(offset=1, length=5) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0083 begin`);
      const actual: number = descriptorEndOf(1, 5);
      logInfo(`descriptorEndOf(offset=1, length=5): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}DescriptorEndOf_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0084
     * @tc.name      NdkRawfile_DescriptorEndOf_0084
     * @tc.desc      descriptorEndOf(offset=1, length=10) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0084 begin`);
      const actual: number = descriptorEndOf(1, 10);
      logInfo(`descriptorEndOf(offset=1, length=10): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}DescriptorEndOf_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0085
     * @tc.name      NdkRawfile_DescriptorEndOf_0085
     * @tc.desc      descriptorEndOf(offset=1, length=100) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0085 begin`);
      const actual: number = descriptorEndOf(1, 100);
      logInfo(`descriptorEndOf(offset=1, length=100): actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}DescriptorEndOf_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0086
     * @tc.name      NdkRawfile_DescriptorEndOf_0086
     * @tc.desc      descriptorEndOf(offset=1, length=15) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0086 begin`);
      const actual: number = descriptorEndOf(1, 15);
      logInfo(`descriptorEndOf(offset=1, length=15): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}DescriptorEndOf_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0087
     * @tc.name      NdkRawfile_DescriptorEndOf_0087
     * @tc.desc      descriptorEndOf(offset=1, length=20) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0087 begin`);
      const actual: number = descriptorEndOf(1, 20);
      logInfo(`descriptorEndOf(offset=1, length=20): actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}DescriptorEndOf_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0088
     * @tc.name      NdkRawfile_DescriptorEndOf_0088
     * @tc.desc      descriptorEndOf(offset=1, length=25) returns 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0088 begin`);
      const actual: number = descriptorEndOf(1, 25);
      logInfo(`descriptorEndOf(offset=1, length=25): actual=${actual}`);
      expect(actual).assertEqual(26);
      logInfo(`${BUNDLE}DescriptorEndOf_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0089
     * @tc.name      NdkRawfile_DescriptorEndOf_0089
     * @tc.desc      descriptorEndOf(offset=1, length=30) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0089 begin`);
      const actual: number = descriptorEndOf(1, 30);
      logInfo(`descriptorEndOf(offset=1, length=30): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}DescriptorEndOf_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0090
     * @tc.name      NdkRawfile_DescriptorEndOf_0090
     * @tc.desc      descriptorEndOf(offset=1, length=35) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0090 begin`);
      const actual: number = descriptorEndOf(1, 35);
      logInfo(`descriptorEndOf(offset=1, length=35): actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}DescriptorEndOf_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0091
     * @tc.name      NdkRawfile_DescriptorEndOf_0091
     * @tc.desc      descriptorEndOf(offset=1, length=40) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0091 begin`);
      const actual: number = descriptorEndOf(1, 40);
      logInfo(`descriptorEndOf(offset=1, length=40): actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}DescriptorEndOf_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0092
     * @tc.name      NdkRawfile_DescriptorEndOf_0092
     * @tc.desc      descriptorEndOf(offset=1, length=45) returns 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0092 begin`);
      const actual: number = descriptorEndOf(1, 45);
      logInfo(`descriptorEndOf(offset=1, length=45): actual=${actual}`);
      expect(actual).assertEqual(46);
      logInfo(`${BUNDLE}DescriptorEndOf_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0093
     * @tc.name      NdkRawfile_DescriptorEndOf_0093
     * @tc.desc      descriptorEndOf(offset=1, length=50) returns 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0093 begin`);
      const actual: number = descriptorEndOf(1, 50);
      logInfo(`descriptorEndOf(offset=1, length=50): actual=${actual}`);
      expect(actual).assertEqual(51);
      logInfo(`${BUNDLE}DescriptorEndOf_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0094
     * @tc.name      NdkRawfile_DescriptorEndOf_0094
     * @tc.desc      descriptorEndOf(offset=1, length=55) returns 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0094 begin`);
      const actual: number = descriptorEndOf(1, 55);
      logInfo(`descriptorEndOf(offset=1, length=55): actual=${actual}`);
      expect(actual).assertEqual(56);
      logInfo(`${BUNDLE}DescriptorEndOf_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0095
     * @tc.name      NdkRawfile_DescriptorEndOf_0095
     * @tc.desc      descriptorEndOf(offset=1, length=60) returns 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0095 begin`);
      const actual: number = descriptorEndOf(1, 60);
      logInfo(`descriptorEndOf(offset=1, length=60): actual=${actual}`);
      expect(actual).assertEqual(61);
      logInfo(`${BUNDLE}DescriptorEndOf_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_END_OF_0096
     * @tc.name      NdkRawfile_DescriptorEndOf_0096
     * @tc.desc      descriptorEndOf(offset=1, length=65) returns 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DescriptorEndOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DescriptorEndOf_0096 begin`);
      const actual: number = descriptorEndOf(1, 65);
      logInfo(`descriptorEndOf(offset=1, length=65): actual=${actual}`);
      expect(actual).assertEqual(66);
      logInfo(`${BUNDLE}DescriptorEndOf_0096 end`);
    });
  });
}
