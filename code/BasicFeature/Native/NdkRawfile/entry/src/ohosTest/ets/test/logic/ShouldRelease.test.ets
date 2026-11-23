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
import { shouldRelease } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for shouldRelease (50 cases). */
export default function shouldReleaseTest(): void {
  describe('ShouldReleaseTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0001
     * @tc.name      NdkRawfile_ShouldRelease_0001
     * @tc.desc      shouldRelease(fd=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_ShouldRelease_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShouldRelease_0001 begin`);
      const actual: boolean = shouldRelease(0);
      logInfo(`shouldRelease(fd=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0002
     * @tc.name      NdkRawfile_ShouldRelease_0002
     * @tc.desc      shouldRelease(fd=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_ShouldRelease_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShouldRelease_0002 begin`);
      const actual: boolean = shouldRelease(-1);
      logInfo(`shouldRelease(fd=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldRelease_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0003
     * @tc.name      NdkRawfile_ShouldRelease_0003
     * @tc.desc      shouldRelease(fd=1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ShouldRelease_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShouldRelease_0003 begin`);
      const actual: boolean = shouldRelease(1);
      logInfo(`shouldRelease(fd=1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0004
     * @tc.name      NdkRawfile_ShouldRelease_0004
     * @tc.desc      shouldRelease(fd=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0004 begin`);
      const actual: boolean = shouldRelease(2);
      logInfo(`shouldRelease(fd=2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0005
     * @tc.name      NdkRawfile_ShouldRelease_0005
     * @tc.desc      shouldRelease(fd=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0005 begin`);
      const actual: boolean = shouldRelease(3);
      logInfo(`shouldRelease(fd=3): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0006
     * @tc.name      NdkRawfile_ShouldRelease_0006
     * @tc.desc      shouldRelease(fd=10) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0006 begin`);
      const actual: boolean = shouldRelease(10);
      logInfo(`shouldRelease(fd=10): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0007
     * @tc.name      NdkRawfile_ShouldRelease_0007
     * @tc.desc      shouldRelease(fd=100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0007 begin`);
      const actual: boolean = shouldRelease(100);
      logInfo(`shouldRelease(fd=100): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0008
     * @tc.name      NdkRawfile_ShouldRelease_0008
     * @tc.desc      shouldRelease(fd=5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0008 begin`);
      const actual: boolean = shouldRelease(5);
      logInfo(`shouldRelease(fd=5): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0009
     * @tc.name      NdkRawfile_ShouldRelease_0009
     * @tc.desc      shouldRelease(fd=15) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0009 begin`);
      const actual: boolean = shouldRelease(15);
      logInfo(`shouldRelease(fd=15): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0010
     * @tc.name      NdkRawfile_ShouldRelease_0010
     * @tc.desc      shouldRelease(fd=20) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0010 begin`);
      const actual: boolean = shouldRelease(20);
      logInfo(`shouldRelease(fd=20): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0011
     * @tc.name      NdkRawfile_ShouldRelease_0011
     * @tc.desc      shouldRelease(fd=25) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0011 begin`);
      const actual: boolean = shouldRelease(25);
      logInfo(`shouldRelease(fd=25): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0012
     * @tc.name      NdkRawfile_ShouldRelease_0012
     * @tc.desc      shouldRelease(fd=30) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0012 begin`);
      const actual: boolean = shouldRelease(30);
      logInfo(`shouldRelease(fd=30): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0013
     * @tc.name      NdkRawfile_ShouldRelease_0013
     * @tc.desc      shouldRelease(fd=35) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0013 begin`);
      const actual: boolean = shouldRelease(35);
      logInfo(`shouldRelease(fd=35): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0014
     * @tc.name      NdkRawfile_ShouldRelease_0014
     * @tc.desc      shouldRelease(fd=40) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0014 begin`);
      const actual: boolean = shouldRelease(40);
      logInfo(`shouldRelease(fd=40): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0015
     * @tc.name      NdkRawfile_ShouldRelease_0015
     * @tc.desc      shouldRelease(fd=45) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0015 begin`);
      const actual: boolean = shouldRelease(45);
      logInfo(`shouldRelease(fd=45): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0016
     * @tc.name      NdkRawfile_ShouldRelease_0016
     * @tc.desc      shouldRelease(fd=50) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0016 begin`);
      const actual: boolean = shouldRelease(50);
      logInfo(`shouldRelease(fd=50): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0017
     * @tc.name      NdkRawfile_ShouldRelease_0017
     * @tc.desc      shouldRelease(fd=55) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0017 begin`);
      const actual: boolean = shouldRelease(55);
      logInfo(`shouldRelease(fd=55): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0018
     * @tc.name      NdkRawfile_ShouldRelease_0018
     * @tc.desc      shouldRelease(fd=60) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0018 begin`);
      const actual: boolean = shouldRelease(60);
      logInfo(`shouldRelease(fd=60): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0019
     * @tc.name      NdkRawfile_ShouldRelease_0019
     * @tc.desc      shouldRelease(fd=65) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0019 begin`);
      const actual: boolean = shouldRelease(65);
      logInfo(`shouldRelease(fd=65): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0020
     * @tc.name      NdkRawfile_ShouldRelease_0020
     * @tc.desc      shouldRelease(fd=70) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0020 begin`);
      const actual: boolean = shouldRelease(70);
      logInfo(`shouldRelease(fd=70): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0021
     * @tc.name      NdkRawfile_ShouldRelease_0021
     * @tc.desc      shouldRelease(fd=75) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0021 begin`);
      const actual: boolean = shouldRelease(75);
      logInfo(`shouldRelease(fd=75): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0022
     * @tc.name      NdkRawfile_ShouldRelease_0022
     * @tc.desc      shouldRelease(fd=80) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0022 begin`);
      const actual: boolean = shouldRelease(80);
      logInfo(`shouldRelease(fd=80): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0023
     * @tc.name      NdkRawfile_ShouldRelease_0023
     * @tc.desc      shouldRelease(fd=85) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0023 begin`);
      const actual: boolean = shouldRelease(85);
      logInfo(`shouldRelease(fd=85): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0024
     * @tc.name      NdkRawfile_ShouldRelease_0024
     * @tc.desc      shouldRelease(fd=90) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0024 begin`);
      const actual: boolean = shouldRelease(90);
      logInfo(`shouldRelease(fd=90): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0025
     * @tc.name      NdkRawfile_ShouldRelease_0025
     * @tc.desc      shouldRelease(fd=95) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0025 begin`);
      const actual: boolean = shouldRelease(95);
      logInfo(`shouldRelease(fd=95): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0026
     * @tc.name      NdkRawfile_ShouldRelease_0026
     * @tc.desc      shouldRelease(fd=105) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0026 begin`);
      const actual: boolean = shouldRelease(105);
      logInfo(`shouldRelease(fd=105): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0027
     * @tc.name      NdkRawfile_ShouldRelease_0027
     * @tc.desc      shouldRelease(fd=110) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0027 begin`);
      const actual: boolean = shouldRelease(110);
      logInfo(`shouldRelease(fd=110): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0028
     * @tc.name      NdkRawfile_ShouldRelease_0028
     * @tc.desc      shouldRelease(fd=115) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0028 begin`);
      const actual: boolean = shouldRelease(115);
      logInfo(`shouldRelease(fd=115): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0029
     * @tc.name      NdkRawfile_ShouldRelease_0029
     * @tc.desc      shouldRelease(fd=120) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0029 begin`);
      const actual: boolean = shouldRelease(120);
      logInfo(`shouldRelease(fd=120): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0030
     * @tc.name      NdkRawfile_ShouldRelease_0030
     * @tc.desc      shouldRelease(fd=125) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0030 begin`);
      const actual: boolean = shouldRelease(125);
      logInfo(`shouldRelease(fd=125): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0031
     * @tc.name      NdkRawfile_ShouldRelease_0031
     * @tc.desc      shouldRelease(fd=130) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0031 begin`);
      const actual: boolean = shouldRelease(130);
      logInfo(`shouldRelease(fd=130): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0032
     * @tc.name      NdkRawfile_ShouldRelease_0032
     * @tc.desc      shouldRelease(fd=135) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0032 begin`);
      const actual: boolean = shouldRelease(135);
      logInfo(`shouldRelease(fd=135): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0033
     * @tc.name      NdkRawfile_ShouldRelease_0033
     * @tc.desc      shouldRelease(fd=140) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0033 begin`);
      const actual: boolean = shouldRelease(140);
      logInfo(`shouldRelease(fd=140): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0034
     * @tc.name      NdkRawfile_ShouldRelease_0034
     * @tc.desc      shouldRelease(fd=145) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0034 begin`);
      const actual: boolean = shouldRelease(145);
      logInfo(`shouldRelease(fd=145): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0035
     * @tc.name      NdkRawfile_ShouldRelease_0035
     * @tc.desc      shouldRelease(fd=150) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0035 begin`);
      const actual: boolean = shouldRelease(150);
      logInfo(`shouldRelease(fd=150): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0036
     * @tc.name      NdkRawfile_ShouldRelease_0036
     * @tc.desc      shouldRelease(fd=155) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0036 begin`);
      const actual: boolean = shouldRelease(155);
      logInfo(`shouldRelease(fd=155): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0037
     * @tc.name      NdkRawfile_ShouldRelease_0037
     * @tc.desc      shouldRelease(fd=160) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0037 begin`);
      const actual: boolean = shouldRelease(160);
      logInfo(`shouldRelease(fd=160): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0038
     * @tc.name      NdkRawfile_ShouldRelease_0038
     * @tc.desc      shouldRelease(fd=165) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0038 begin`);
      const actual: boolean = shouldRelease(165);
      logInfo(`shouldRelease(fd=165): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0039
     * @tc.name      NdkRawfile_ShouldRelease_0039
     * @tc.desc      shouldRelease(fd=170) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0039 begin`);
      const actual: boolean = shouldRelease(170);
      logInfo(`shouldRelease(fd=170): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0040
     * @tc.name      NdkRawfile_ShouldRelease_0040
     * @tc.desc      shouldRelease(fd=175) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0040 begin`);
      const actual: boolean = shouldRelease(175);
      logInfo(`shouldRelease(fd=175): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0041
     * @tc.name      NdkRawfile_ShouldRelease_0041
     * @tc.desc      shouldRelease(fd=180) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0041 begin`);
      const actual: boolean = shouldRelease(180);
      logInfo(`shouldRelease(fd=180): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0042
     * @tc.name      NdkRawfile_ShouldRelease_0042
     * @tc.desc      shouldRelease(fd=185) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0042 begin`);
      const actual: boolean = shouldRelease(185);
      logInfo(`shouldRelease(fd=185): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0043
     * @tc.name      NdkRawfile_ShouldRelease_0043
     * @tc.desc      shouldRelease(fd=190) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0043 begin`);
      const actual: boolean = shouldRelease(190);
      logInfo(`shouldRelease(fd=190): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0044
     * @tc.name      NdkRawfile_ShouldRelease_0044
     * @tc.desc      shouldRelease(fd=195) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0044 begin`);
      const actual: boolean = shouldRelease(195);
      logInfo(`shouldRelease(fd=195): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0045
     * @tc.name      NdkRawfile_ShouldRelease_0045
     * @tc.desc      shouldRelease(fd=200) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0045 begin`);
      const actual: boolean = shouldRelease(200);
      logInfo(`shouldRelease(fd=200): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0046
     * @tc.name      NdkRawfile_ShouldRelease_0046
     * @tc.desc      shouldRelease(fd=131) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0046 begin`);
      const actual: boolean = shouldRelease(131);
      logInfo(`shouldRelease(fd=131): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0047
     * @tc.name      NdkRawfile_ShouldRelease_0047
     * @tc.desc      shouldRelease(fd=81) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0047 begin`);
      const actual: boolean = shouldRelease(81);
      logInfo(`shouldRelease(fd=81): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0048
     * @tc.name      NdkRawfile_ShouldRelease_0048
     * @tc.desc      shouldRelease(fd=-31) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ShouldRelease_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldRelease_0048 begin`);
      const actual: boolean = shouldRelease(-31);
      logInfo(`shouldRelease(fd=-31): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldRelease_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0049
     * @tc.name      NdkRawfile_ShouldRelease_0049
     * @tc.desc      shouldRelease(fd=157) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ShouldRelease_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShouldRelease_0049 begin`);
      const actual: boolean = shouldRelease(157);
      logInfo(`shouldRelease(fd=157): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShouldRelease_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SHOULD_RELEASE_0050
     * @tc.name      NdkRawfile_ShouldRelease_0050
     * @tc.desc      shouldRelease(fd=-78) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ShouldRelease_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShouldRelease_0050 begin`);
      const actual: boolean = shouldRelease(-78);
      logInfo(`shouldRelease(fd=-78): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShouldRelease_0050 end`);
    });
  });
}
