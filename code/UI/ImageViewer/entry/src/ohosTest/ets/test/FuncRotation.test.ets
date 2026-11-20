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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { simplestRotationQuarter } from '../../../main/ets/utils/FuncUtils';

const DOMAIN: number = 0xF814;
const TAG: string = 'FuncRotationTest';
const VALID_ROTATIONS: number[] = [0, 90, 180, 270, -90, -180, -270];

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function funcRotationTest(): void {
  describe('FuncRotationTest', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0001
     * @tc.name      testRotationQuarter0001
     * @tc.desc      Checks angle 0 simplifies to rotation 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0001 begin');
      const actual: number = simplestRotationQuarter(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0001 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0002
     * @tc.name      testRotationQuarter0002
     * @tc.desc      Checks angle 1 stays inside the first quadrant and simplifies to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0002 begin');
      const actual: number = simplestRotationQuarter(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0002 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0003
     * @tc.name      testRotationQuarter0003
     * @tc.desc      Checks angle 44.4 below the boundary offset simplifies to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0003 begin');
      const actual: number = simplestRotationQuarter(44.4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0003 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0004
     * @tc.name      testRotationQuarter0004
     * @tc.desc      Checks the boundary offset angle 44.5 simplifies to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0004 begin');
      const actual: number = simplestRotationQuarter(44.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0004 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0005
     * @tc.name      testRotationQuarter0005
     * @tc.desc      Checks angle 45 below the quadrant edge simplifies to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0005 begin');
      const actual: number = simplestRotationQuarter(45);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0005 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0006
     * @tc.name      testRotationQuarter0006
     * @tc.desc      Checks angle 45.5 crossing the quadrant edge simplifies to 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0006 begin');
      const actual: number = simplestRotationQuarter(45.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=90`);
      expect(actual).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0006 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0007
     * @tc.name      testRotationQuarter0007
     * @tc.desc      Checks angle 46 in the first quadrant simplifies to 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0007 begin');
      const actual: number = simplestRotationQuarter(46);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=90`);
      expect(actual).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0007 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0008
     * @tc.name      testRotationQuarter0008
     * @tc.desc      Checks angle 89 in the first quadrant simplifies to 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0008 begin');
      const actual: number = simplestRotationQuarter(89);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=90`);
      expect(actual).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0008 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0009
     * @tc.name      testRotationQuarter0009
     * @tc.desc      Checks angle 89.9 close to the axis simplifies to 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0009 begin');
      const actual: number = simplestRotationQuarter(89.9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=90`);
      expect(actual).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0009 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0010
     * @tc.name      testRotationQuarter0010
     * @tc.desc      Checks angle 90 on the axis simplifies to 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0010 begin');
      const actual: number = simplestRotationQuarter(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=90`);
      expect(actual).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0010 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0011
     * @tc.name      testRotationQuarter0011
     * @tc.desc      Checks angle 90.1 just past the axis simplifies to 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0011 begin');
      const actual: number = simplestRotationQuarter(90.1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=90`);
      expect(actual).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0011 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0012
     * @tc.name      testRotationQuarter0012
     * @tc.desc      Checks angle 134.9 in the second quadrant simplifies to 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0012 begin');
      const actual: number = simplestRotationQuarter(134.9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=90`);
      expect(actual).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0012 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0013
     * @tc.name      testRotationQuarter0013
     * @tc.desc      Checks angle 135 at the diagonal simplifies to 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0013 begin');
      const actual: number = simplestRotationQuarter(135);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=90`);
      expect(actual).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0013 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0014
     * @tc.name      testRotationQuarter0014
     * @tc.desc      Checks angle 135.5 crossing the diagonal simplifies to 180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0014 begin');
      const actual: number = simplestRotationQuarter(135.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=180`);
      expect(actual).assertEqual(180);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0014 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0015
     * @tc.name      testRotationQuarter0015
     * @tc.desc      Checks angle 136 in the second quadrant simplifies to 180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0015 begin');
      const actual: number = simplestRotationQuarter(136);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=180`);
      expect(actual).assertEqual(180);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0015 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0016
     * @tc.name      testRotationQuarter0016
     * @tc.desc      Checks angle 179.9 close to the opposite axis simplifies to 180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0016 begin');
      const actual: number = simplestRotationQuarter(179.9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=180`);
      expect(actual).assertEqual(180);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0016 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0017
     * @tc.name      testRotationQuarter0017
     * @tc.desc      Checks angle 180 on the opposite axis simplifies to 180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0017 begin');
      const actual: number = simplestRotationQuarter(180);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=180`);
      expect(actual).assertEqual(180);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0017 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0018
     * @tc.name      testRotationQuarter0018
     * @tc.desc      Checks angle 180.1 just past the opposite axis simplifies to 180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0018 begin');
      const actual: number = simplestRotationQuarter(180.1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=180`);
      expect(actual).assertEqual(180);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0018 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0019
     * @tc.name      testRotationQuarter0019
     * @tc.desc      Checks angle 224.9 in the third quadrant simplifies to 180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0019 begin');
      const actual: number = simplestRotationQuarter(224.9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=180`);
      expect(actual).assertEqual(180);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0019 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0020
     * @tc.name      testRotationQuarter0020
     * @tc.desc      Checks angle 225 at the diagonal simplifies to 180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0020 begin');
      const actual: number = simplestRotationQuarter(225);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=180`);
      expect(actual).assertEqual(180);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0020 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0021
     * @tc.name      testRotationQuarter0021
     * @tc.desc      Checks angle 225.5 crossing the diagonal simplifies to 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0021 begin');
      const actual: number = simplestRotationQuarter(225.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=270`);
      expect(actual).assertEqual(270);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0021 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0022
     * @tc.name      testRotationQuarter0022
     * @tc.desc      Checks angle 226 in the third quadrant simplifies to 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0022 begin');
      const actual: number = simplestRotationQuarter(226);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=270`);
      expect(actual).assertEqual(270);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0022 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0023
     * @tc.name      testRotationQuarter0023
     * @tc.desc      Checks angle 269.9 close to the last axis simplifies to 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0023 begin');
      const actual: number = simplestRotationQuarter(269.9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=270`);
      expect(actual).assertEqual(270);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0023 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0024
     * @tc.name      testRotationQuarter0024
     * @tc.desc      Checks angle 270 on the last axis simplifies to 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0024 begin');
      const actual: number = simplestRotationQuarter(270);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=270`);
      expect(actual).assertEqual(270);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0024 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0025
     * @tc.name      testRotationQuarter0025
     * @tc.desc      Checks angle 270.1 just past the last axis simplifies to 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0025 begin');
      const actual: number = simplestRotationQuarter(270.1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=270`);
      expect(actual).assertEqual(270);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0025 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0026
     * @tc.name      testRotationQuarter0026
     * @tc.desc      Checks angle 314.9 in the fourth quadrant simplifies to 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0026 begin');
      const actual: number = simplestRotationQuarter(314.9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=270`);
      expect(actual).assertEqual(270);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0026 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0027
     * @tc.name      testRotationQuarter0027
     * @tc.desc      Checks angle 315 at the diagonal simplifies to 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0027 begin');
      const actual: number = simplestRotationQuarter(315);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=270`);
      expect(actual).assertEqual(270);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0027 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0028
     * @tc.name      testRotationQuarter0028
     * @tc.desc      Checks angle 315.5 crossing the diagonal wraps back to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0028 begin');
      const actual: number = simplestRotationQuarter(315.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0028 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0029
     * @tc.name      testRotationQuarter0029
     * @tc.desc      Checks angle 316 in the fourth quadrant wraps back to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0029 begin');
      const actual: number = simplestRotationQuarter(316);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0029 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0030
     * @tc.name      testRotationQuarter0030
     * @tc.desc      Checks angle 359 near a full turn simplifies to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0030 begin');
      const actual: number = simplestRotationQuarter(359);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0030 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0031
     * @tc.name      testRotationQuarter0031
     * @tc.desc      Checks angle 359.9 near a full turn simplifies to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0031 begin');
      const actual: number = simplestRotationQuarter(359.9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0031 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0032
     * @tc.name      testRotationQuarter0032
     * @tc.desc      Checks a full 360 turn simplifies to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0032 begin');
      const actual: number = simplestRotationQuarter(360);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0032 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0033
     * @tc.name      testRotationQuarter0033
     * @tc.desc      Checks angle 405 equivalent to 45 simplifies to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0033 begin');
      const actual: number = simplestRotationQuarter(405);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0033 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0034
     * @tc.name      testRotationQuarter0034
     * @tc.desc      Checks angle 810 equivalent to 90 simplifies to 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0034 begin');
      const actual: number = simplestRotationQuarter(810);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=90`);
      expect(actual).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0034 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0035
     * @tc.name      testRotationQuarter0035
     * @tc.desc      Checks angle 1000 with remainder 280 simplifies to 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0035 begin');
      const actual: number = simplestRotationQuarter(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=270`);
      expect(actual).assertEqual(270);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0035 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0036
     * @tc.name      testRotationQuarter0036
     * @tc.desc      Checks two full 360 turns simplify to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0036 begin');
      const actual: number = simplestRotationQuarter(720);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0036 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0037
     * @tc.name      testRotationQuarter0037
     * @tc.desc      Checks three full 360 turns simplify to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0037 begin');
      const actual: number = simplestRotationQuarter(1080);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0037 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0038
     * @tc.name      testRotationQuarter0038
     * @tc.desc      Checks angle -0.1 simplifies to 0 keeping the sign convention.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0038 begin');
      const actual: number = simplestRotationQuarter(-0.1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0038 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0039
     * @tc.name      testRotationQuarter0039
     * @tc.desc      Checks angle -1 in the first quadrant simplifies to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0039 begin');
      const actual: number = simplestRotationQuarter(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0039 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0040
     * @tc.name      testRotationQuarter0040
     * @tc.desc      Checks angle -45 below the quadrant edge simplifies to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0040 begin');
      const actual: number = simplestRotationQuarter(-45);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0040 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0041
     * @tc.name      testRotationQuarter0041
     * @tc.desc      Checks angle -45.5 crossing the quadrant edge simplifies to -90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0041 begin');
      const actual: number = simplestRotationQuarter(-45.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=-90`);
      expect(actual).assertEqual(-90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0041 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0042
     * @tc.name      testRotationQuarter0042
     * @tc.desc      Checks angle -90 on the axis simplifies to -90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0042 begin');
      const actual: number = simplestRotationQuarter(-90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=-90`);
      expect(actual).assertEqual(-90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0042 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0043
     * @tc.name      testRotationQuarter0043
     * @tc.desc      Checks angle -135 at the diagonal simplifies to -90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0043 begin');
      const actual: number = simplestRotationQuarter(-135);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=-90`);
      expect(actual).assertEqual(-90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0043 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0044
     * @tc.name      testRotationQuarter0044
     * @tc.desc      Checks angle -135.5 crossing the diagonal simplifies to -180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0044 begin');
      const actual: number = simplestRotationQuarter(-135.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=-180`);
      expect(actual).assertEqual(-180);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0044 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0045
     * @tc.name      testRotationQuarter0045
     * @tc.desc      Checks angle -180 on the opposite axis simplifies to -180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0045 begin');
      const actual: number = simplestRotationQuarter(-180);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=-180`);
      expect(actual).assertEqual(-180);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0045 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0046
     * @tc.name      testRotationQuarter0046
     * @tc.desc      Checks angle -225 at the diagonal simplifies to -180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0046 begin');
      const actual: number = simplestRotationQuarter(-225);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=-180`);
      expect(actual).assertEqual(-180);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0046 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0047
     * @tc.name      testRotationQuarter0047
     * @tc.desc      Checks angle -225.5 crossing the diagonal simplifies to -270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0047 begin');
      const actual: number = simplestRotationQuarter(-225.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=-270`);
      expect(actual).assertEqual(-270);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0047 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0048
     * @tc.name      testRotationQuarter0048
     * @tc.desc      Checks angle -270 on the last axis simplifies to -270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0048 begin');
      const actual: number = simplestRotationQuarter(-270);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=-270`);
      expect(actual).assertEqual(-270);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0048 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0049
     * @tc.name      testRotationQuarter0049
     * @tc.desc      Checks angle -315 at the diagonal simplifies to -270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0049 begin');
      const actual: number = simplestRotationQuarter(-315);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=-270`);
      expect(actual).assertEqual(-270);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0049 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0050
     * @tc.name      testRotationQuarter0050
     * @tc.desc      Checks angle -315.5 crossing the diagonal wraps back to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0050 begin');
      const actual: number = simplestRotationQuarter(-315.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0050 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0051
     * @tc.name      testRotationQuarter0051
     * @tc.desc      Checks a negative full turn -360 simplifies to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0051 begin');
      const actual: number = simplestRotationQuarter(-360);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0051 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0052
     * @tc.name      testRotationQuarter0052
     * @tc.desc      Checks angle -405 equivalent to -45 simplifies to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0052 begin');
      const actual: number = simplestRotationQuarter(-405);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0052 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0053
     * @tc.name      testRotationQuarter0053
     * @tc.desc      Checks angle -810 equivalent to -90 simplifies to -90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0053 begin');
      const actual: number = simplestRotationQuarter(-810);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=-90`);
      expect(actual).assertEqual(-90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0053 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_FUNCROTATION_0054
     * @tc.name      testRotationQuarter0054
     * @tc.desc      Checks angle -1000 with remainder -280 simplifies to -270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotationQuarter0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotationQuarter0054 begin');
      const actual: number = simplestRotationQuarter(-1000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=-270`);
      expect(actual).assertEqual(-270);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_ROTATIONS.includes(actual)}`);
      expect(VALID_ROTATIONS.includes(actual)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRotationQuarter0054 end');
    })
  })
}
