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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { simplestRotationQuarter } from '../../../../main/ets/utils/FuncUtils';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImageViewer]';
const BUNDLE: string = 'ImageViewer_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for simplestRotationQuarter (96 cases). */
export default function simplestRotationQuarterTest(): void {
  describe('SimplestRotationQuarterTest', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0001
     * @tc.name      ImageViewer_SimplestRotationQuarter_0001
     * @tc.desc      simplestRotationQuarter(angle=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImageViewer_SimplestRotationQuarter_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0001 begin`);
      const actual: number = simplestRotationQuarter(0);
      logInfo(`simplestRotationQuarter(angle=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0002
     * @tc.name      ImageViewer_SimplestRotationQuarter_0002
     * @tc.desc      simplestRotationQuarter(angle=180) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImageViewer_SimplestRotationQuarter_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0002 begin`);
      const actual: number = simplestRotationQuarter(180);
      logInfo(`simplestRotationQuarter(angle=180): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0003
     * @tc.name      ImageViewer_SimplestRotationQuarter_0003
     * @tc.desc      simplestRotationQuarter(angle=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0003 begin`);
      const actual: number = simplestRotationQuarter(90);
      logInfo(`simplestRotationQuarter(angle=90): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0003 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0004
     * @tc.name      ImageViewer_SimplestRotationQuarter_0004
     * @tc.desc      simplestRotationQuarter(angle=270) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0004 begin`);
      const actual: number = simplestRotationQuarter(270);
      logInfo(`simplestRotationQuarter(angle=270): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0004 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0005
     * @tc.name      ImageViewer_SimplestRotationQuarter_0005
     * @tc.desc      simplestRotationQuarter(angle=-90) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0005 begin`);
      const actual: number = simplestRotationQuarter(-90);
      logInfo(`simplestRotationQuarter(angle=-90): actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0005 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0006
     * @tc.name      ImageViewer_SimplestRotationQuarter_0006
     * @tc.desc      simplestRotationQuarter(angle=-584) returns -180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0006 begin`);
      const actual: number = simplestRotationQuarter(-584);
      logInfo(`simplestRotationQuarter(angle=-584): actual=${actual}`);
      expect(actual).assertEqual(-180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0006 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0007
     * @tc.name      ImageViewer_SimplestRotationQuarter_0007
     * @tc.desc      simplestRotationQuarter(angle=-266) returns -270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0007 begin`);
      const actual: number = simplestRotationQuarter(-266);
      logInfo(`simplestRotationQuarter(angle=-266): actual=${actual}`);
      expect(actual).assertEqual(-270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0007 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0008
     * @tc.name      ImageViewer_SimplestRotationQuarter_0008
     * @tc.desc      simplestRotationQuarter(angle=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0008 begin`);
      const actual: number = simplestRotationQuarter(45);
      logInfo(`simplestRotationQuarter(angle=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0008 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0009
     * @tc.name      ImageViewer_SimplestRotationQuarter_0009
     * @tc.desc      simplestRotationQuarter(angle=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0009 begin`);
      const actual: number = simplestRotationQuarter(360);
      logInfo(`simplestRotationQuarter(angle=360): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0009 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0010
     * @tc.name      ImageViewer_SimplestRotationQuarter_0010
     * @tc.desc      simplestRotationQuarter(angle=359) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0010 begin`);
      const actual: number = simplestRotationQuarter(359);
      logInfo(`simplestRotationQuarter(angle=359): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0010 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0011
     * @tc.name      ImageViewer_SimplestRotationQuarter_0011
     * @tc.desc      simplestRotationQuarter(angle=361) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0011 begin`);
      const actual: number = simplestRotationQuarter(361);
      logInfo(`simplestRotationQuarter(angle=361): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0011 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0012
     * @tc.name      ImageViewer_SimplestRotationQuarter_0012
     * @tc.desc      simplestRotationQuarter(angle=720) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0012 begin`);
      const actual: number = simplestRotationQuarter(720);
      logInfo(`simplestRotationQuarter(angle=720): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0012 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0013
     * @tc.name      ImageViewer_SimplestRotationQuarter_0013
     * @tc.desc      simplestRotationQuarter(angle=89) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0013 begin`);
      const actual: number = simplestRotationQuarter(89);
      logInfo(`simplestRotationQuarter(angle=89): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0013 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0014
     * @tc.name      ImageViewer_SimplestRotationQuarter_0014
     * @tc.desc      simplestRotationQuarter(angle=91) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0014 begin`);
      const actual: number = simplestRotationQuarter(91);
      logInfo(`simplestRotationQuarter(angle=91): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0014 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0015
     * @tc.name      ImageViewer_SimplestRotationQuarter_0015
     * @tc.desc      simplestRotationQuarter(angle=44.5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0015 begin`);
      const actual: number = simplestRotationQuarter(44.5);
      logInfo(`simplestRotationQuarter(angle=44.5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0015 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0016
     * @tc.name      ImageViewer_SimplestRotationQuarter_0016
     * @tc.desc      simplestRotationQuarter(angle=22.25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0016 begin`);
      const actual: number = simplestRotationQuarter(22.25);
      logInfo(`simplestRotationQuarter(angle=22.25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0016 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0017
     * @tc.name      ImageViewer_SimplestRotationQuarter_0017
     * @tc.desc      simplestRotationQuarter(angle=4) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0017 begin`);
      const actual: number = simplestRotationQuarter(4);
      logInfo(`simplestRotationQuarter(angle=4): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0017 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0018
     * @tc.name      ImageViewer_SimplestRotationQuarter_0018
     * @tc.desc      simplestRotationQuarter(angle=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0018 begin`);
      const actual: number = simplestRotationQuarter(3);
      logInfo(`simplestRotationQuarter(angle=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0018 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0019
     * @tc.name      ImageViewer_SimplestRotationQuarter_0019
     * @tc.desc      simplestRotationQuarter(angle=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0019 begin`);
      const actual: number = simplestRotationQuarter(5);
      logInfo(`simplestRotationQuarter(angle=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0019 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0020
     * @tc.name      ImageViewer_SimplestRotationQuarter_0020
     * @tc.desc      simplestRotationQuarter(angle=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0020 begin`);
      const actual: number = simplestRotationQuarter(-1);
      logInfo(`simplestRotationQuarter(angle=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0020 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0021
     * @tc.name      ImageViewer_SimplestRotationQuarter_0021
     * @tc.desc      simplestRotationQuarter(angle=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0021 begin`);
      const actual: number = simplestRotationQuarter(1);
      logInfo(`simplestRotationQuarter(angle=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0021 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0022
     * @tc.name      ImageViewer_SimplestRotationQuarter_0022
     * @tc.desc      simplestRotationQuarter(angle=179) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0022 begin`);
      const actual: number = simplestRotationQuarter(179);
      logInfo(`simplestRotationQuarter(angle=179): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0022 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0023
     * @tc.name      ImageViewer_SimplestRotationQuarter_0023
     * @tc.desc      simplestRotationQuarter(angle=181) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0023 begin`);
      const actual: number = simplestRotationQuarter(181);
      logInfo(`simplestRotationQuarter(angle=181): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0023 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0024
     * @tc.name      ImageViewer_SimplestRotationQuarter_0024
     * @tc.desc      simplestRotationQuarter(angle=269) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0024 begin`);
      const actual: number = simplestRotationQuarter(269);
      logInfo(`simplestRotationQuarter(angle=269): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0024 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0025
     * @tc.name      ImageViewer_SimplestRotationQuarter_0025
     * @tc.desc      simplestRotationQuarter(angle=271) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0025 begin`);
      const actual: number = simplestRotationQuarter(271);
      logInfo(`simplestRotationQuarter(angle=271): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0025 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0026
     * @tc.name      ImageViewer_SimplestRotationQuarter_0026
     * @tc.desc      simplestRotationQuarter(angle=540) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0026 begin`);
      const actual: number = simplestRotationQuarter(540);
      logInfo(`simplestRotationQuarter(angle=540): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0026 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0027
     * @tc.name      ImageViewer_SimplestRotationQuarter_0027
     * @tc.desc      simplestRotationQuarter(angle=135) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0027 begin`);
      const actual: number = simplestRotationQuarter(135);
      logInfo(`simplestRotationQuarter(angle=135): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0027 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0028
     * @tc.name      ImageViewer_SimplestRotationQuarter_0028
     * @tc.desc      simplestRotationQuarter(angle=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0028 begin`);
      const actual: number = simplestRotationQuarter(2);
      logInfo(`simplestRotationQuarter(angle=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0028 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0029
     * @tc.name      ImageViewer_SimplestRotationQuarter_0029
     * @tc.desc      simplestRotationQuarter(angle=-2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImageViewer_SimplestRotationQuarter_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0029 begin`);
      const actual: number = simplestRotationQuarter(-2);
      logInfo(`simplestRotationQuarter(angle=-2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0029 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0030
     * @tc.name      ImageViewer_SimplestRotationQuarter_0030
     * @tc.desc      simplestRotationQuarter(angle=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0030 begin`);
      const actual: number = simplestRotationQuarter(10);
      logInfo(`simplestRotationQuarter(angle=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0030 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0031
     * @tc.name      ImageViewer_SimplestRotationQuarter_0031
     * @tc.desc      simplestRotationQuarter(angle=100) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0031 begin`);
      const actual: number = simplestRotationQuarter(100);
      logInfo(`simplestRotationQuarter(angle=100): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0031 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0032
     * @tc.name      ImageViewer_SimplestRotationQuarter_0032
     * @tc.desc      simplestRotationQuarter(angle=36) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0032 begin`);
      const actual: number = simplestRotationQuarter(36);
      logInfo(`simplestRotationQuarter(angle=36): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0032 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0033
     * @tc.name      ImageViewer_SimplestRotationQuarter_0033
     * @tc.desc      simplestRotationQuarter(angle=72) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0033 begin`);
      const actual: number = simplestRotationQuarter(72);
      logInfo(`simplestRotationQuarter(angle=72): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0033 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0034
     * @tc.name      ImageViewer_SimplestRotationQuarter_0034
     * @tc.desc      simplestRotationQuarter(angle=108) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0034 begin`);
      const actual: number = simplestRotationQuarter(108);
      logInfo(`simplestRotationQuarter(angle=108): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0034 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0035
     * @tc.name      ImageViewer_SimplestRotationQuarter_0035
     * @tc.desc      simplestRotationQuarter(angle=144) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0035 begin`);
      const actual: number = simplestRotationQuarter(144);
      logInfo(`simplestRotationQuarter(angle=144): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0035 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0036
     * @tc.name      ImageViewer_SimplestRotationQuarter_0036
     * @tc.desc      simplestRotationQuarter(angle=216) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0036 begin`);
      const actual: number = simplestRotationQuarter(216);
      logInfo(`simplestRotationQuarter(angle=216): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0036 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0037
     * @tc.name      ImageViewer_SimplestRotationQuarter_0037
     * @tc.desc      simplestRotationQuarter(angle=252) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0037 begin`);
      const actual: number = simplestRotationQuarter(252);
      logInfo(`simplestRotationQuarter(angle=252): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0037 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0038
     * @tc.name      ImageViewer_SimplestRotationQuarter_0038
     * @tc.desc      simplestRotationQuarter(angle=288) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0038 begin`);
      const actual: number = simplestRotationQuarter(288);
      logInfo(`simplestRotationQuarter(angle=288): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0038 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0039
     * @tc.name      ImageViewer_SimplestRotationQuarter_0039
     * @tc.desc      simplestRotationQuarter(angle=324) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0039 begin`);
      const actual: number = simplestRotationQuarter(324);
      logInfo(`simplestRotationQuarter(angle=324): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0039 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0040
     * @tc.name      ImageViewer_SimplestRotationQuarter_0040
     * @tc.desc      simplestRotationQuarter(angle=396) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0040 begin`);
      const actual: number = simplestRotationQuarter(396);
      logInfo(`simplestRotationQuarter(angle=396): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0040 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0041
     * @tc.name      ImageViewer_SimplestRotationQuarter_0041
     * @tc.desc      simplestRotationQuarter(angle=432) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0041 begin`);
      const actual: number = simplestRotationQuarter(432);
      logInfo(`simplestRotationQuarter(angle=432): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0041 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0042
     * @tc.name      ImageViewer_SimplestRotationQuarter_0042
     * @tc.desc      simplestRotationQuarter(angle=468) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0042 begin`);
      const actual: number = simplestRotationQuarter(468);
      logInfo(`simplestRotationQuarter(angle=468): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0042 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0043
     * @tc.name      ImageViewer_SimplestRotationQuarter_0043
     * @tc.desc      simplestRotationQuarter(angle=504) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0043 begin`);
      const actual: number = simplestRotationQuarter(504);
      logInfo(`simplestRotationQuarter(angle=504): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0043 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0044
     * @tc.name      ImageViewer_SimplestRotationQuarter_0044
     * @tc.desc      simplestRotationQuarter(angle=576) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0044 begin`);
      const actual: number = simplestRotationQuarter(576);
      logInfo(`simplestRotationQuarter(angle=576): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0044 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0045
     * @tc.name      ImageViewer_SimplestRotationQuarter_0045
     * @tc.desc      simplestRotationQuarter(angle=612) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0045 begin`);
      const actual: number = simplestRotationQuarter(612);
      logInfo(`simplestRotationQuarter(angle=612): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0045 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0046
     * @tc.name      ImageViewer_SimplestRotationQuarter_0046
     * @tc.desc      simplestRotationQuarter(angle=648) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0046 begin`);
      const actual: number = simplestRotationQuarter(648);
      logInfo(`simplestRotationQuarter(angle=648): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0046 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0047
     * @tc.name      ImageViewer_SimplestRotationQuarter_0047
     * @tc.desc      simplestRotationQuarter(angle=684) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0047 begin`);
      const actual: number = simplestRotationQuarter(684);
      logInfo(`simplestRotationQuarter(angle=684): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0047 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0048
     * @tc.name      ImageViewer_SimplestRotationQuarter_0048
     * @tc.desc      simplestRotationQuarter(angle=756) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0048 begin`);
      const actual: number = simplestRotationQuarter(756);
      logInfo(`simplestRotationQuarter(angle=756): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0048 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0049
     * @tc.name      ImageViewer_SimplestRotationQuarter_0049
     * @tc.desc      simplestRotationQuarter(angle=792) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0049 begin`);
      const actual: number = simplestRotationQuarter(792);
      logInfo(`simplestRotationQuarter(angle=792): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0049 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0050
     * @tc.name      ImageViewer_SimplestRotationQuarter_0050
     * @tc.desc      simplestRotationQuarter(angle=828) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0050 begin`);
      const actual: number = simplestRotationQuarter(828);
      logInfo(`simplestRotationQuarter(angle=828): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0050 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0051
     * @tc.name      ImageViewer_SimplestRotationQuarter_0051
     * @tc.desc      simplestRotationQuarter(angle=864) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0051 begin`);
      const actual: number = simplestRotationQuarter(864);
      logInfo(`simplestRotationQuarter(angle=864): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0051 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0052
     * @tc.name      ImageViewer_SimplestRotationQuarter_0052
     * @tc.desc      simplestRotationQuarter(angle=900) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0052 begin`);
      const actual: number = simplestRotationQuarter(900);
      logInfo(`simplestRotationQuarter(angle=900): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0052 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0053
     * @tc.name      ImageViewer_SimplestRotationQuarter_0053
     * @tc.desc      simplestRotationQuarter(angle=936) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0053 begin`);
      const actual: number = simplestRotationQuarter(936);
      logInfo(`simplestRotationQuarter(angle=936): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0053 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0054
     * @tc.name      ImageViewer_SimplestRotationQuarter_0054
     * @tc.desc      simplestRotationQuarter(angle=972) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0054 begin`);
      const actual: number = simplestRotationQuarter(972);
      logInfo(`simplestRotationQuarter(angle=972): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0054 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0055
     * @tc.name      ImageViewer_SimplestRotationQuarter_0055
     * @tc.desc      simplestRotationQuarter(angle=1008) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0055 begin`);
      const actual: number = simplestRotationQuarter(1008);
      logInfo(`simplestRotationQuarter(angle=1008): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0055 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0056
     * @tc.name      ImageViewer_SimplestRotationQuarter_0056
     * @tc.desc      simplestRotationQuarter(angle=1044) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0056 begin`);
      const actual: number = simplestRotationQuarter(1044);
      logInfo(`simplestRotationQuarter(angle=1044): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0056 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0057
     * @tc.name      ImageViewer_SimplestRotationQuarter_0057
     * @tc.desc      simplestRotationQuarter(angle=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0057 begin`);
      const actual: number = simplestRotationQuarter(1080);
      logInfo(`simplestRotationQuarter(angle=1080): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0057 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0058
     * @tc.name      ImageViewer_SimplestRotationQuarter_0058
     * @tc.desc      simplestRotationQuarter(angle=1116) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0058 begin`);
      const actual: number = simplestRotationQuarter(1116);
      logInfo(`simplestRotationQuarter(angle=1116): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0058 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0059
     * @tc.name      ImageViewer_SimplestRotationQuarter_0059
     * @tc.desc      simplestRotationQuarter(angle=1152) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0059 begin`);
      const actual: number = simplestRotationQuarter(1152);
      logInfo(`simplestRotationQuarter(angle=1152): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0059 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0060
     * @tc.name      ImageViewer_SimplestRotationQuarter_0060
     * @tc.desc      simplestRotationQuarter(angle=1188) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0060 begin`);
      const actual: number = simplestRotationQuarter(1188);
      logInfo(`simplestRotationQuarter(angle=1188): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0060 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0061
     * @tc.name      ImageViewer_SimplestRotationQuarter_0061
     * @tc.desc      simplestRotationQuarter(angle=1224) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0061 begin`);
      const actual: number = simplestRotationQuarter(1224);
      logInfo(`simplestRotationQuarter(angle=1224): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0061 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0062
     * @tc.name      ImageViewer_SimplestRotationQuarter_0062
     * @tc.desc      simplestRotationQuarter(angle=1260) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0062 begin`);
      const actual: number = simplestRotationQuarter(1260);
      logInfo(`simplestRotationQuarter(angle=1260): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0062 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0063
     * @tc.name      ImageViewer_SimplestRotationQuarter_0063
     * @tc.desc      simplestRotationQuarter(angle=1296) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0063 begin`);
      const actual: number = simplestRotationQuarter(1296);
      logInfo(`simplestRotationQuarter(angle=1296): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0063 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0064
     * @tc.name      ImageViewer_SimplestRotationQuarter_0064
     * @tc.desc      simplestRotationQuarter(angle=1332) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0064 begin`);
      const actual: number = simplestRotationQuarter(1332);
      logInfo(`simplestRotationQuarter(angle=1332): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0064 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0065
     * @tc.name      ImageViewer_SimplestRotationQuarter_0065
     * @tc.desc      simplestRotationQuarter(angle=1368) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0065 begin`);
      const actual: number = simplestRotationQuarter(1368);
      logInfo(`simplestRotationQuarter(angle=1368): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0065 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0066
     * @tc.name      ImageViewer_SimplestRotationQuarter_0066
     * @tc.desc      simplestRotationQuarter(angle=1404) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0066 begin`);
      const actual: number = simplestRotationQuarter(1404);
      logInfo(`simplestRotationQuarter(angle=1404): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0066 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0067
     * @tc.name      ImageViewer_SimplestRotationQuarter_0067
     * @tc.desc      simplestRotationQuarter(angle=1440) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0067 begin`);
      const actual: number = simplestRotationQuarter(1440);
      logInfo(`simplestRotationQuarter(angle=1440): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0067 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0068
     * @tc.name      ImageViewer_SimplestRotationQuarter_0068
     * @tc.desc      simplestRotationQuarter(angle=1323) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0068 begin`);
      const actual: number = simplestRotationQuarter(1323);
      logInfo(`simplestRotationQuarter(angle=1323): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0068 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0069
     * @tc.name      ImageViewer_SimplestRotationQuarter_0069
     * @tc.desc      simplestRotationQuarter(angle=328) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0069 begin`);
      const actual: number = simplestRotationQuarter(328);
      logInfo(`simplestRotationQuarter(angle=328): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0069 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0070
     * @tc.name      ImageViewer_SimplestRotationQuarter_0070
     * @tc.desc      simplestRotationQuarter(angle=621) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0070 begin`);
      const actual: number = simplestRotationQuarter(621);
      logInfo(`simplestRotationQuarter(angle=621): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0070 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0071
     * @tc.name      ImageViewer_SimplestRotationQuarter_0071
     * @tc.desc      simplestRotationQuarter(angle=286.55) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0071 begin`);
      const actual: number = simplestRotationQuarter(286.55);
      logInfo(`simplestRotationQuarter(angle=286.55): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0071 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0072
     * @tc.name      ImageViewer_SimplestRotationQuarter_0072
     * @tc.desc      simplestRotationQuarter(angle=496.83) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0072 begin`);
      const actual: number = simplestRotationQuarter(496.83);
      logInfo(`simplestRotationQuarter(angle=496.83): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0072 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0073
     * @tc.name      ImageViewer_SimplestRotationQuarter_0073
     * @tc.desc      simplestRotationQuarter(angle=-440) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0073 begin`);
      const actual: number = simplestRotationQuarter(-440);
      logInfo(`simplestRotationQuarter(angle=-440): actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0073 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0074
     * @tc.name      ImageViewer_SimplestRotationQuarter_0074
     * @tc.desc      simplestRotationQuarter(angle=54) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0074 begin`);
      const actual: number = simplestRotationQuarter(54);
      logInfo(`simplestRotationQuarter(angle=54): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0074 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0075
     * @tc.name      ImageViewer_SimplestRotationQuarter_0075
     * @tc.desc      simplestRotationQuarter(angle=163) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0075 begin`);
      const actual: number = simplestRotationQuarter(163);
      logInfo(`simplestRotationQuarter(angle=163): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0075 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0076
     * @tc.name      ImageViewer_SimplestRotationQuarter_0076
     * @tc.desc      simplestRotationQuarter(angle=316) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0076 begin`);
      const actual: number = simplestRotationQuarter(316);
      logInfo(`simplestRotationQuarter(angle=316): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0076 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0077
     * @tc.name      ImageViewer_SimplestRotationQuarter_0077
     * @tc.desc      simplestRotationQuarter(angle=584) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0077 begin`);
      const actual: number = simplestRotationQuarter(584);
      logInfo(`simplestRotationQuarter(angle=584): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0077 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0078
     * @tc.name      ImageViewer_SimplestRotationQuarter_0078
     * @tc.desc      simplestRotationQuarter(angle=-29) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0078 begin`);
      const actual: number = simplestRotationQuarter(-29);
      logInfo(`simplestRotationQuarter(angle=-29): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0078 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0079
     * @tc.name      ImageViewer_SimplestRotationQuarter_0079
     * @tc.desc      simplestRotationQuarter(angle=600) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0079 begin`);
      const actual: number = simplestRotationQuarter(600);
      logInfo(`simplestRotationQuarter(angle=600): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0079 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0080
     * @tc.name      ImageViewer_SimplestRotationQuarter_0080
     * @tc.desc      simplestRotationQuarter(angle=851) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0080 begin`);
      const actual: number = simplestRotationQuarter(851);
      logInfo(`simplestRotationQuarter(angle=851): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0080 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0081
     * @tc.name      ImageViewer_SimplestRotationQuarter_0081
     * @tc.desc      simplestRotationQuarter(angle=-343) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0081 begin`);
      const actual: number = simplestRotationQuarter(-343);
      logInfo(`simplestRotationQuarter(angle=-343): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0081 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0082
     * @tc.name      ImageViewer_SimplestRotationQuarter_0082
     * @tc.desc      simplestRotationQuarter(angle=944) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0082 begin`);
      const actual: number = simplestRotationQuarter(944);
      logInfo(`simplestRotationQuarter(angle=944): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0082 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0083
     * @tc.name      ImageViewer_SimplestRotationQuarter_0083
     * @tc.desc      simplestRotationQuarter(angle=289) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0083 begin`);
      const actual: number = simplestRotationQuarter(289);
      logInfo(`simplestRotationQuarter(angle=289): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0083 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0084
     * @tc.name      ImageViewer_SimplestRotationQuarter_0084
     * @tc.desc      simplestRotationQuarter(angle=1011) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0084 begin`);
      const actual: number = simplestRotationQuarter(1011);
      logInfo(`simplestRotationQuarter(angle=1011): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0084 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0085
     * @tc.name      ImageViewer_SimplestRotationQuarter_0085
     * @tc.desc      simplestRotationQuarter(angle=1199) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0085 begin`);
      const actual: number = simplestRotationQuarter(1199);
      logInfo(`simplestRotationQuarter(angle=1199): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0085 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0086
     * @tc.name      ImageViewer_SimplestRotationQuarter_0086
     * @tc.desc      simplestRotationQuarter(angle=-28) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0086 begin`);
      const actual: number = simplestRotationQuarter(-28);
      logInfo(`simplestRotationQuarter(angle=-28): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0086 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0087
     * @tc.name      ImageViewer_SimplestRotationQuarter_0087
     * @tc.desc      simplestRotationQuarter(angle=34.5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0087 begin`);
      const actual: number = simplestRotationQuarter(34.5);
      logInfo(`simplestRotationQuarter(angle=34.5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0087 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0088
     * @tc.name      ImageViewer_SimplestRotationQuarter_0088
     * @tc.desc      simplestRotationQuarter(angle=201.67) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0088 begin`);
      const actual: number = simplestRotationQuarter(201.67);
      logInfo(`simplestRotationQuarter(angle=201.67): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0088 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0089
     * @tc.name      ImageViewer_SimplestRotationQuarter_0089
     * @tc.desc      simplestRotationQuarter(angle=-555) returns -180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImageViewer_SimplestRotationQuarter_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0089 begin`);
      const actual: number = simplestRotationQuarter(-555);
      logInfo(`simplestRotationQuarter(angle=-555): actual=${actual}`);
      expect(actual).assertEqual(-180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0089 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0090
     * @tc.name      ImageViewer_SimplestRotationQuarter_0090
     * @tc.desc      simplestRotationQuarter(angle=498.29) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0090 begin`);
      const actual: number = simplestRotationQuarter(498.29);
      logInfo(`simplestRotationQuarter(angle=498.29): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0090 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0091
     * @tc.name      ImageViewer_SimplestRotationQuarter_0091
     * @tc.desc      simplestRotationQuarter(angle=218.63) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0091 begin`);
      const actual: number = simplestRotationQuarter(218.63);
      logInfo(`simplestRotationQuarter(angle=218.63): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0091 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0092
     * @tc.name      ImageViewer_SimplestRotationQuarter_0092
     * @tc.desc      simplestRotationQuarter(angle=132) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0092 begin`);
      const actual: number = simplestRotationQuarter(132);
      logInfo(`simplestRotationQuarter(angle=132): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0092 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0093
     * @tc.name      ImageViewer_SimplestRotationQuarter_0093
     * @tc.desc      simplestRotationQuarter(angle=640) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0093 begin`);
      const actual: number = simplestRotationQuarter(640);
      logInfo(`simplestRotationQuarter(angle=640): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0093 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0094
     * @tc.name      ImageViewer_SimplestRotationQuarter_0094
     * @tc.desc      simplestRotationQuarter(angle=1378) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0094 begin`);
      const actual: number = simplestRotationQuarter(1378);
      logInfo(`simplestRotationQuarter(angle=1378): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0094 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0095
     * @tc.name      ImageViewer_SimplestRotationQuarter_0095
     * @tc.desc      simplestRotationQuarter(angle=379.88) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0095 begin`);
      const actual: number = simplestRotationQuarter(379.88);
      logInfo(`simplestRotationQuarter(angle=379.88): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0095 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SIMPLEST_ROTATION_QUARTER_0096
     * @tc.name      ImageViewer_SimplestRotationQuarter_0096
     * @tc.desc      simplestRotationQuarter(angle=162) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_SimplestRotationQuarter_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SimplestRotationQuarter_0096 begin`);
      const actual: number = simplestRotationQuarter(162);
      logInfo(`simplestRotationQuarter(angle=162): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}SimplestRotationQuarter_0096 end`);
    });
  });
}
