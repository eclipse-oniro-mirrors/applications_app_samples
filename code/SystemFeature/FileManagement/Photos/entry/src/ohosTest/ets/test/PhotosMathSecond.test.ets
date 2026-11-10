/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import HiLog from '@ohos.hilog';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { MathUtils } from '../../../main/ets/utils/MathUtils';

const TAG = '[Sample_PhotosMathSecondTest]';
const DOMAIN = 0xF811;

export default function PhotosMathSecondTest(): void {
  describe('PhotosMathSecondTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0001
     * @tc.name      testPhotosMathSecond0001
     * @tc.desc      Clamps second decimal range -25 to -24.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0001 begin');
      expect(MathUtils.clamp(-25.125, -25, -24.5)).assertEqual(-25);
      expect(MathUtils.clamp(-24.75, -25, -24.5)).assertEqual(-24.75);
      expect(MathUtils.clamp(-24.375, -25, -24.5)).assertEqual(-24.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0002
     * @tc.name      testPhotosMathSecond0002
     * @tc.desc      Clamps second decimal range -24.875 to -23.375.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0002 begin');
      expect(MathUtils.clamp(-25, -24.875, -23.375)).assertEqual(-24.875);
      expect(MathUtils.clamp(-24.125, -24.875, -23.375)).assertEqual(-24.125);
      expect(MathUtils.clamp(-23.25, -24.875, -23.375)).assertEqual(-23.375);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0003
     * @tc.name      testPhotosMathSecond0003
     * @tc.desc      Clamps second decimal range -24.75 to -22.25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0003 begin');
      expect(MathUtils.clamp(-24.875, -24.75, -22.25)).assertEqual(-24.75);
      expect(MathUtils.clamp(-23.5, -24.75, -22.25)).assertEqual(-23.5);
      expect(MathUtils.clamp(-22.125, -24.75, -22.25)).assertEqual(-22.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0004
     * @tc.name      testPhotosMathSecond0004
     * @tc.desc      Clamps second decimal range -24.625 to -21.125.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0004 begin');
      expect(MathUtils.clamp(-24.75, -24.625, -21.125)).assertEqual(-24.625);
      expect(MathUtils.clamp(-22.875, -24.625, -21.125)).assertEqual(-22.875);
      expect(MathUtils.clamp(-21, -24.625, -21.125)).assertEqual(-21.125);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0005
     * @tc.name      testPhotosMathSecond0005
     * @tc.desc      Clamps second decimal range -24.5 to -20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0005 begin');
      expect(MathUtils.clamp(-24.625, -24.5, -20)).assertEqual(-24.5);
      expect(MathUtils.clamp(-22.25, -24.5, -20)).assertEqual(-22.25);
      expect(MathUtils.clamp(-19.875, -24.5, -20)).assertEqual(-20);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0006
     * @tc.name      testPhotosMathSecond0006
     * @tc.desc      Clamps second decimal range -24.375 to -18.875.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0006 begin');
      expect(MathUtils.clamp(-24.5, -24.375, -18.875)).assertEqual(-24.375);
      expect(MathUtils.clamp(-21.625, -24.375, -18.875)).assertEqual(-21.625);
      expect(MathUtils.clamp(-18.75, -24.375, -18.875)).assertEqual(-18.875);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0007
     * @tc.name      testPhotosMathSecond0007
     * @tc.desc      Clamps second decimal range -24.25 to -17.75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0007 begin');
      expect(MathUtils.clamp(-24.375, -24.25, -17.75)).assertEqual(-24.25);
      expect(MathUtils.clamp(-21, -24.25, -17.75)).assertEqual(-21);
      expect(MathUtils.clamp(-17.625, -24.25, -17.75)).assertEqual(-17.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0008
     * @tc.name      testPhotosMathSecond0008
     * @tc.desc      Clamps second decimal range -24.125 to -16.625.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0008 begin');
      expect(MathUtils.clamp(-24.25, -24.125, -16.625)).assertEqual(-24.125);
      expect(MathUtils.clamp(-20.375, -24.125, -16.625)).assertEqual(-20.375);
      expect(MathUtils.clamp(-16.5, -24.125, -16.625)).assertEqual(-16.625);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0009
     * @tc.name      testPhotosMathSecond0009
     * @tc.desc      Clamps second decimal range -24 to -15.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0009 begin');
      expect(MathUtils.clamp(-24.125, -24, -15.5)).assertEqual(-24);
      expect(MathUtils.clamp(-19.75, -24, -15.5)).assertEqual(-19.75);
      expect(MathUtils.clamp(-15.375, -24, -15.5)).assertEqual(-15.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0010
     * @tc.name      testPhotosMathSecond0010
     * @tc.desc      Clamps second decimal range -23.875 to -14.375.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0010 begin');
      expect(MathUtils.clamp(-24, -23.875, -14.375)).assertEqual(-23.875);
      expect(MathUtils.clamp(-19.125, -23.875, -14.375)).assertEqual(-19.125);
      expect(MathUtils.clamp(-14.25, -23.875, -14.375)).assertEqual(-14.375);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0011
     * @tc.name      testPhotosMathSecond0011
     * @tc.desc      Clamps second decimal range -23.75 to -23.25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0011 begin');
      expect(MathUtils.clamp(-23.875, -23.75, -23.25)).assertEqual(-23.75);
      expect(MathUtils.clamp(-23.5, -23.75, -23.25)).assertEqual(-23.5);
      expect(MathUtils.clamp(-23.125, -23.75, -23.25)).assertEqual(-23.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0012
     * @tc.name      testPhotosMathSecond0012
     * @tc.desc      Clamps second decimal range -23.625 to -22.125.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0012 begin');
      expect(MathUtils.clamp(-23.75, -23.625, -22.125)).assertEqual(-23.625);
      expect(MathUtils.clamp(-22.875, -23.625, -22.125)).assertEqual(-22.875);
      expect(MathUtils.clamp(-22, -23.625, -22.125)).assertEqual(-22.125);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0013
     * @tc.name      testPhotosMathSecond0013
     * @tc.desc      Clamps second decimal range -23.5 to -21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0013 begin');
      expect(MathUtils.clamp(-23.625, -23.5, -21)).assertEqual(-23.5);
      expect(MathUtils.clamp(-22.25, -23.5, -21)).assertEqual(-22.25);
      expect(MathUtils.clamp(-20.875, -23.5, -21)).assertEqual(-21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0014
     * @tc.name      testPhotosMathSecond0014
     * @tc.desc      Clamps second decimal range -23.375 to -19.875.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0014 begin');
      expect(MathUtils.clamp(-23.5, -23.375, -19.875)).assertEqual(-23.375);
      expect(MathUtils.clamp(-21.625, -23.375, -19.875)).assertEqual(-21.625);
      expect(MathUtils.clamp(-19.75, -23.375, -19.875)).assertEqual(-19.875);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0015
     * @tc.name      testPhotosMathSecond0015
     * @tc.desc      Clamps second decimal range -23.25 to -18.75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0015 begin');
      expect(MathUtils.clamp(-23.375, -23.25, -18.75)).assertEqual(-23.25);
      expect(MathUtils.clamp(-21, -23.25, -18.75)).assertEqual(-21);
      expect(MathUtils.clamp(-18.625, -23.25, -18.75)).assertEqual(-18.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0015 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0016
     * @tc.name      testPhotosMathSecond0016
     * @tc.desc      Clamps second decimal range -23.125 to -17.625.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0016 begin');
      expect(MathUtils.clamp(-23.25, -23.125, -17.625)).assertEqual(-23.125);
      expect(MathUtils.clamp(-20.375, -23.125, -17.625)).assertEqual(-20.375);
      expect(MathUtils.clamp(-17.5, -23.125, -17.625)).assertEqual(-17.625);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0017
     * @tc.name      testPhotosMathSecond0017
     * @tc.desc      Clamps second decimal range -23 to -16.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0017 begin');
      expect(MathUtils.clamp(-23.125, -23, -16.5)).assertEqual(-23);
      expect(MathUtils.clamp(-19.75, -23, -16.5)).assertEqual(-19.75);
      expect(MathUtils.clamp(-16.375, -23, -16.5)).assertEqual(-16.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0018
     * @tc.name      testPhotosMathSecond0018
     * @tc.desc      Clamps second decimal range -22.875 to -15.375.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0018 begin');
      expect(MathUtils.clamp(-23, -22.875, -15.375)).assertEqual(-22.875);
      expect(MathUtils.clamp(-19.125, -22.875, -15.375)).assertEqual(-19.125);
      expect(MathUtils.clamp(-15.25, -22.875, -15.375)).assertEqual(-15.375);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0019
     * @tc.name      testPhotosMathSecond0019
     * @tc.desc      Clamps second decimal range -22.75 to -14.25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0019 begin');
      expect(MathUtils.clamp(-22.875, -22.75, -14.25)).assertEqual(-22.75);
      expect(MathUtils.clamp(-18.5, -22.75, -14.25)).assertEqual(-18.5);
      expect(MathUtils.clamp(-14.125, -22.75, -14.25)).assertEqual(-14.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0020
     * @tc.name      testPhotosMathSecond0020
     * @tc.desc      Clamps second decimal range -22.625 to -13.125.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0020 begin');
      expect(MathUtils.clamp(-22.75, -22.625, -13.125)).assertEqual(-22.625);
      expect(MathUtils.clamp(-17.875, -22.625, -13.125)).assertEqual(-17.875);
      expect(MathUtils.clamp(-13, -22.625, -13.125)).assertEqual(-13.125);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0021
     * @tc.name      testPhotosMathSecond0021
     * @tc.desc      Clamps second decimal range -22.5 to -22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0021 begin');
      expect(MathUtils.clamp(-22.625, -22.5, -22)).assertEqual(-22.5);
      expect(MathUtils.clamp(-22.25, -22.5, -22)).assertEqual(-22.25);
      expect(MathUtils.clamp(-21.875, -22.5, -22)).assertEqual(-22);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0022
     * @tc.name      testPhotosMathSecond0022
     * @tc.desc      Clamps second decimal range -22.375 to -20.875.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0022 begin');
      expect(MathUtils.clamp(-22.5, -22.375, -20.875)).assertEqual(-22.375);
      expect(MathUtils.clamp(-21.625, -22.375, -20.875)).assertEqual(-21.625);
      expect(MathUtils.clamp(-20.75, -22.375, -20.875)).assertEqual(-20.875);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0023
     * @tc.name      testPhotosMathSecond0023
     * @tc.desc      Clamps second decimal range -22.25 to -19.75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0023 begin');
      expect(MathUtils.clamp(-22.375, -22.25, -19.75)).assertEqual(-22.25);
      expect(MathUtils.clamp(-21, -22.25, -19.75)).assertEqual(-21);
      expect(MathUtils.clamp(-19.625, -22.25, -19.75)).assertEqual(-19.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0024
     * @tc.name      testPhotosMathSecond0024
     * @tc.desc      Clamps second decimal range -22.125 to -18.625.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0024 begin');
      expect(MathUtils.clamp(-22.25, -22.125, -18.625)).assertEqual(-22.125);
      expect(MathUtils.clamp(-20.375, -22.125, -18.625)).assertEqual(-20.375);
      expect(MathUtils.clamp(-18.5, -22.125, -18.625)).assertEqual(-18.625);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0025
     * @tc.name      testPhotosMathSecond0025
     * @tc.desc      Clamps second decimal range -22 to -17.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0025 begin');
      expect(MathUtils.clamp(-22.125, -22, -17.5)).assertEqual(-22);
      expect(MathUtils.clamp(-19.75, -22, -17.5)).assertEqual(-19.75);
      expect(MathUtils.clamp(-17.375, -22, -17.5)).assertEqual(-17.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0026
     * @tc.name      testPhotosMathSecond0026
     * @tc.desc      Clamps second decimal range -21.875 to -16.375.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0026 begin');
      expect(MathUtils.clamp(-22, -21.875, -16.375)).assertEqual(-21.875);
      expect(MathUtils.clamp(-19.125, -21.875, -16.375)).assertEqual(-19.125);
      expect(MathUtils.clamp(-16.25, -21.875, -16.375)).assertEqual(-16.375);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0027
     * @tc.name      testPhotosMathSecond0027
     * @tc.desc      Clamps second decimal range -21.75 to -15.25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0027 begin');
      expect(MathUtils.clamp(-21.875, -21.75, -15.25)).assertEqual(-21.75);
      expect(MathUtils.clamp(-18.5, -21.75, -15.25)).assertEqual(-18.5);
      expect(MathUtils.clamp(-15.125, -21.75, -15.25)).assertEqual(-15.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0028
     * @tc.name      testPhotosMathSecond0028
     * @tc.desc      Clamps second decimal range -21.625 to -14.125.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0028 begin');
      expect(MathUtils.clamp(-21.75, -21.625, -14.125)).assertEqual(-21.625);
      expect(MathUtils.clamp(-17.875, -21.625, -14.125)).assertEqual(-17.875);
      expect(MathUtils.clamp(-14, -21.625, -14.125)).assertEqual(-14.125);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0029
     * @tc.name      testPhotosMathSecond0029
     * @tc.desc      Clamps second decimal range -21.5 to -13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0029 begin');
      expect(MathUtils.clamp(-21.625, -21.5, -13)).assertEqual(-21.5);
      expect(MathUtils.clamp(-17.25, -21.5, -13)).assertEqual(-17.25);
      expect(MathUtils.clamp(-12.875, -21.5, -13)).assertEqual(-13);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0030
     * @tc.name      testPhotosMathSecond0030
     * @tc.desc      Clamps second decimal range -21.375 to -11.875.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0030 begin');
      expect(MathUtils.clamp(-21.5, -21.375, -11.875)).assertEqual(-21.375);
      expect(MathUtils.clamp(-16.625, -21.375, -11.875)).assertEqual(-16.625);
      expect(MathUtils.clamp(-11.75, -21.375, -11.875)).assertEqual(-11.875);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0030 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0031
     * @tc.name      testPhotosMathSecond0031
     * @tc.desc      Clamps second decimal range -21.25 to -20.75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0031 begin');
      expect(MathUtils.clamp(-21.375, -21.25, -20.75)).assertEqual(-21.25);
      expect(MathUtils.clamp(-21, -21.25, -20.75)).assertEqual(-21);
      expect(MathUtils.clamp(-20.625, -21.25, -20.75)).assertEqual(-20.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0032
     * @tc.name      testPhotosMathSecond0032
     * @tc.desc      Clamps second decimal range -21.125 to -19.625.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0032 begin');
      expect(MathUtils.clamp(-21.25, -21.125, -19.625)).assertEqual(-21.125);
      expect(MathUtils.clamp(-20.375, -21.125, -19.625)).assertEqual(-20.375);
      expect(MathUtils.clamp(-19.5, -21.125, -19.625)).assertEqual(-19.625);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0033
     * @tc.name      testPhotosMathSecond0033
     * @tc.desc      Clamps second decimal range -21 to -18.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0033 begin');
      expect(MathUtils.clamp(-21.125, -21, -18.5)).assertEqual(-21);
      expect(MathUtils.clamp(-19.75, -21, -18.5)).assertEqual(-19.75);
      expect(MathUtils.clamp(-18.375, -21, -18.5)).assertEqual(-18.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0034
     * @tc.name      testPhotosMathSecond0034
     * @tc.desc      Clamps second decimal range -20.875 to -17.375.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0034 begin');
      expect(MathUtils.clamp(-21, -20.875, -17.375)).assertEqual(-20.875);
      expect(MathUtils.clamp(-19.125, -20.875, -17.375)).assertEqual(-19.125);
      expect(MathUtils.clamp(-17.25, -20.875, -17.375)).assertEqual(-17.375);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0035
     * @tc.name      testPhotosMathSecond0035
     * @tc.desc      Clamps second decimal range -20.75 to -16.25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0035 begin');
      expect(MathUtils.clamp(-20.875, -20.75, -16.25)).assertEqual(-20.75);
      expect(MathUtils.clamp(-18.5, -20.75, -16.25)).assertEqual(-18.5);
      expect(MathUtils.clamp(-16.125, -20.75, -16.25)).assertEqual(-16.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0036
     * @tc.name      testPhotosMathSecond0036
     * @tc.desc      Clamps second decimal range -20.625 to -15.125.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0036 begin');
      expect(MathUtils.clamp(-20.75, -20.625, -15.125)).assertEqual(-20.625);
      expect(MathUtils.clamp(-17.875, -20.625, -15.125)).assertEqual(-17.875);
      expect(MathUtils.clamp(-15, -20.625, -15.125)).assertEqual(-15.125);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0036 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0037
     * @tc.name      testPhotosMathSecond0037
     * @tc.desc      Clamps second decimal range -20.5 to -14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0037 begin');
      expect(MathUtils.clamp(-20.625, -20.5, -14)).assertEqual(-20.5);
      expect(MathUtils.clamp(-17.25, -20.5, -14)).assertEqual(-17.25);
      expect(MathUtils.clamp(-13.875, -20.5, -14)).assertEqual(-14);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0038
     * @tc.name      testPhotosMathSecond0038
     * @tc.desc      Clamps second decimal range -20.375 to -12.875.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0038 begin');
      expect(MathUtils.clamp(-20.5, -20.375, -12.875)).assertEqual(-20.375);
      expect(MathUtils.clamp(-16.625, -20.375, -12.875)).assertEqual(-16.625);
      expect(MathUtils.clamp(-12.75, -20.375, -12.875)).assertEqual(-12.875);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0039
     * @tc.name      testPhotosMathSecond0039
     * @tc.desc      Clamps second decimal range -20.25 to -11.75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0039 begin');
      expect(MathUtils.clamp(-20.375, -20.25, -11.75)).assertEqual(-20.25);
      expect(MathUtils.clamp(-16, -20.25, -11.75)).assertEqual(-16);
      expect(MathUtils.clamp(-11.625, -20.25, -11.75)).assertEqual(-11.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0040
     * @tc.name      testPhotosMathSecond0040
     * @tc.desc      Clamps second decimal range -20.125 to -10.625.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0040 begin');
      expect(MathUtils.clamp(-20.25, -20.125, -10.625)).assertEqual(-20.125);
      expect(MathUtils.clamp(-15.375, -20.125, -10.625)).assertEqual(-15.375);
      expect(MathUtils.clamp(-10.5, -20.125, -10.625)).assertEqual(-10.625);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0041
     * @tc.name      testPhotosMathSecond0041
     * @tc.desc      Clamps second decimal range -20 to -19.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0041 begin');
      expect(MathUtils.clamp(-20.125, -20, -19.5)).assertEqual(-20);
      expect(MathUtils.clamp(-19.75, -20, -19.5)).assertEqual(-19.75);
      expect(MathUtils.clamp(-19.375, -20, -19.5)).assertEqual(-19.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0042
     * @tc.name      testPhotosMathSecond0042
     * @tc.desc      Clamps second decimal range -19.875 to -18.375.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0042 begin');
      expect(MathUtils.clamp(-20, -19.875, -18.375)).assertEqual(-19.875);
      expect(MathUtils.clamp(-19.125, -19.875, -18.375)).assertEqual(-19.125);
      expect(MathUtils.clamp(-18.25, -19.875, -18.375)).assertEqual(-18.375);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0043
     * @tc.name      testPhotosMathSecond0043
     * @tc.desc      Clamps second decimal range -19.75 to -17.25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0043 begin');
      expect(MathUtils.clamp(-19.875, -19.75, -17.25)).assertEqual(-19.75);
      expect(MathUtils.clamp(-18.5, -19.75, -17.25)).assertEqual(-18.5);
      expect(MathUtils.clamp(-17.125, -19.75, -17.25)).assertEqual(-17.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0044
     * @tc.name      testPhotosMathSecond0044
     * @tc.desc      Clamps second decimal range -19.625 to -16.125.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0044 begin');
      expect(MathUtils.clamp(-19.75, -19.625, -16.125)).assertEqual(-19.625);
      expect(MathUtils.clamp(-17.875, -19.625, -16.125)).assertEqual(-17.875);
      expect(MathUtils.clamp(-16, -19.625, -16.125)).assertEqual(-16.125);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0045
     * @tc.name      testPhotosMathSecond0045
     * @tc.desc      Clamps second decimal range -19.5 to -15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0045 begin');
      expect(MathUtils.clamp(-19.625, -19.5, -15)).assertEqual(-19.5);
      expect(MathUtils.clamp(-17.25, -19.5, -15)).assertEqual(-17.25);
      expect(MathUtils.clamp(-14.875, -19.5, -15)).assertEqual(-15);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0045 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0046
     * @tc.name      testPhotosMathSecond0046
     * @tc.desc      Clamps second decimal range -19.375 to -13.875.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0046 begin');
      expect(MathUtils.clamp(-19.5, -19.375, -13.875)).assertEqual(-19.375);
      expect(MathUtils.clamp(-16.625, -19.375, -13.875)).assertEqual(-16.625);
      expect(MathUtils.clamp(-13.75, -19.375, -13.875)).assertEqual(-13.875);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0047
     * @tc.name      testPhotosMathSecond0047
     * @tc.desc      Clamps second decimal range -19.25 to -12.75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0047 begin');
      expect(MathUtils.clamp(-19.375, -19.25, -12.75)).assertEqual(-19.25);
      expect(MathUtils.clamp(-16, -19.25, -12.75)).assertEqual(-16);
      expect(MathUtils.clamp(-12.625, -19.25, -12.75)).assertEqual(-12.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0048
     * @tc.name      testPhotosMathSecond0048
     * @tc.desc      Clamps second decimal range -19.125 to -11.625.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0048 begin');
      expect(MathUtils.clamp(-19.25, -19.125, -11.625)).assertEqual(-19.125);
      expect(MathUtils.clamp(-15.375, -19.125, -11.625)).assertEqual(-15.375);
      expect(MathUtils.clamp(-11.5, -19.125, -11.625)).assertEqual(-11.625);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0048 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0049
     * @tc.name      testPhotosMathSecond0049
     * @tc.desc      Clamps second decimal range -19 to -10.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0049 begin');
      expect(MathUtils.clamp(-19.125, -19, -10.5)).assertEqual(-19);
      expect(MathUtils.clamp(-14.75, -19, -10.5)).assertEqual(-14.75);
      expect(MathUtils.clamp(-10.375, -19, -10.5)).assertEqual(-10.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0050
     * @tc.name      testPhotosMathSecond0050
     * @tc.desc      Clamps second decimal range -18.875 to -9.375.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0050 begin');
      expect(MathUtils.clamp(-19, -18.875, -9.375)).assertEqual(-18.875);
      expect(MathUtils.clamp(-14.125, -18.875, -9.375)).assertEqual(-14.125);
      expect(MathUtils.clamp(-9.25, -18.875, -9.375)).assertEqual(-9.375);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0051
     * @tc.name      testPhotosMathSecond0051
     * @tc.desc      Clamps second reversed range sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0051 begin');
      expect(MathUtils.clamp(220, 200, 0)).assertEqual(0);
      expect(MathUtils.clamp(0.5, 200, 0)).assertEqual(0);
      expect(MathUtils.clamp(-20, 200, 0)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0051 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0052
     * @tc.name      testPhotosMathSecond0052
     * @tc.desc      Clamps second reversed range sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0052 begin');
      expect(MathUtils.clamp(221, 201, 1)).assertEqual(1);
      expect(MathUtils.clamp(1.5, 201, 1)).assertEqual(1);
      expect(MathUtils.clamp(-19, 201, 1)).assertEqual(1);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0053
     * @tc.name      testPhotosMathSecond0053
     * @tc.desc      Clamps second reversed range sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0053 begin');
      expect(MathUtils.clamp(222, 202, 2)).assertEqual(2);
      expect(MathUtils.clamp(2.5, 202, 2)).assertEqual(2);
      expect(MathUtils.clamp(-18, 202, 2)).assertEqual(2);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0054
     * @tc.name      testPhotosMathSecond0054
     * @tc.desc      Clamps second reversed range sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0054 begin');
      expect(MathUtils.clamp(223, 203, 3)).assertEqual(3);
      expect(MathUtils.clamp(3.5, 203, 3)).assertEqual(3);
      expect(MathUtils.clamp(-17, 203, 3)).assertEqual(3);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0054 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0055
     * @tc.name      testPhotosMathSecond0055
     * @tc.desc      Clamps second reversed range sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0055 begin');
      expect(MathUtils.clamp(224, 204, 4)).assertEqual(4);
      expect(MathUtils.clamp(4.5, 204, 4)).assertEqual(4);
      expect(MathUtils.clamp(-16, 204, 4)).assertEqual(4);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0056
     * @tc.name      testPhotosMathSecond0056
     * @tc.desc      Clamps second reversed range sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0056 begin');
      expect(MathUtils.clamp(225, 205, 5)).assertEqual(5);
      expect(MathUtils.clamp(5.5, 205, 5)).assertEqual(5);
      expect(MathUtils.clamp(-15, 205, 5)).assertEqual(5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0057
     * @tc.name      testPhotosMathSecond0057
     * @tc.desc      Clamps second reversed range sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0057 begin');
      expect(MathUtils.clamp(226, 206, 6)).assertEqual(6);
      expect(MathUtils.clamp(6.5, 206, 6)).assertEqual(6);
      expect(MathUtils.clamp(-14, 206, 6)).assertEqual(6);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0057 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0058
     * @tc.name      testPhotosMathSecond0058
     * @tc.desc      Clamps second reversed range sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0058 begin');
      expect(MathUtils.clamp(227, 207, 7)).assertEqual(7);
      expect(MathUtils.clamp(7.5, 207, 7)).assertEqual(7);
      expect(MathUtils.clamp(-13, 207, 7)).assertEqual(7);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0059
     * @tc.name      testPhotosMathSecond0059
     * @tc.desc      Clamps second reversed range sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0059 begin');
      expect(MathUtils.clamp(228, 208, 8)).assertEqual(8);
      expect(MathUtils.clamp(8.5, 208, 8)).assertEqual(8);
      expect(MathUtils.clamp(-12, 208, 8)).assertEqual(8);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0060
     * @tc.name      testPhotosMathSecond0060
     * @tc.desc      Clamps second reversed range sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0060 begin');
      expect(MathUtils.clamp(229, 209, 9)).assertEqual(9);
      expect(MathUtils.clamp(9.5, 209, 9)).assertEqual(9);
      expect(MathUtils.clamp(-11, 209, 9)).assertEqual(9);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0060 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0061
     * @tc.name      testPhotosMathSecond0061
     * @tc.desc      Clamps second reversed range sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0061 begin');
      expect(MathUtils.clamp(230, 210, 10)).assertEqual(10);
      expect(MathUtils.clamp(10.5, 210, 10)).assertEqual(10);
      expect(MathUtils.clamp(-10, 210, 10)).assertEqual(10);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0062
     * @tc.name      testPhotosMathSecond0062
     * @tc.desc      Clamps second reversed range sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0062 begin');
      expect(MathUtils.clamp(231, 211, 11)).assertEqual(11);
      expect(MathUtils.clamp(11.5, 211, 11)).assertEqual(11);
      expect(MathUtils.clamp(-9, 211, 11)).assertEqual(11);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0063
     * @tc.name      testPhotosMathSecond0063
     * @tc.desc      Clamps second reversed range sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0063 begin');
      expect(MathUtils.clamp(232, 212, 12)).assertEqual(12);
      expect(MathUtils.clamp(12.5, 212, 12)).assertEqual(12);
      expect(MathUtils.clamp(-8, 212, 12)).assertEqual(12);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0063 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0064
     * @tc.name      testPhotosMathSecond0064
     * @tc.desc      Clamps second reversed range sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0064 begin');
      expect(MathUtils.clamp(233, 213, 13)).assertEqual(13);
      expect(MathUtils.clamp(13.5, 213, 13)).assertEqual(13);
      expect(MathUtils.clamp(-7, 213, 13)).assertEqual(13);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0065
     * @tc.name      testPhotosMathSecond0065
     * @tc.desc      Clamps second reversed range sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0065 begin');
      expect(MathUtils.clamp(234, 214, 14)).assertEqual(14);
      expect(MathUtils.clamp(14.5, 214, 14)).assertEqual(14);
      expect(MathUtils.clamp(-6, 214, 14)).assertEqual(14);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0066
     * @tc.name      testPhotosMathSecond0066
     * @tc.desc      Clamps second reversed range sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0066 begin');
      expect(MathUtils.clamp(235, 215, 15)).assertEqual(15);
      expect(MathUtils.clamp(15.5, 215, 15)).assertEqual(15);
      expect(MathUtils.clamp(-5, 215, 15)).assertEqual(15);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0066 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0067
     * @tc.name      testPhotosMathSecond0067
     * @tc.desc      Clamps second reversed range sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0067 begin');
      expect(MathUtils.clamp(236, 216, 16)).assertEqual(16);
      expect(MathUtils.clamp(16.5, 216, 16)).assertEqual(16);
      expect(MathUtils.clamp(-4, 216, 16)).assertEqual(16);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0068
     * @tc.name      testPhotosMathSecond0068
     * @tc.desc      Clamps second reversed range sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0068 begin');
      expect(MathUtils.clamp(237, 217, 17)).assertEqual(17);
      expect(MathUtils.clamp(17.5, 217, 17)).assertEqual(17);
      expect(MathUtils.clamp(-3, 217, 17)).assertEqual(17);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0069
     * @tc.name      testPhotosMathSecond0069
     * @tc.desc      Clamps second reversed range sample 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0069 begin');
      expect(MathUtils.clamp(238, 218, 18)).assertEqual(18);
      expect(MathUtils.clamp(18.5, 218, 18)).assertEqual(18);
      expect(MathUtils.clamp(-2, 218, 18)).assertEqual(18);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0069 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0070
     * @tc.name      testPhotosMathSecond0070
     * @tc.desc      Clamps second reversed range sample 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0070 begin');
      expect(MathUtils.clamp(239, 219, 19)).assertEqual(19);
      expect(MathUtils.clamp(19.5, 219, 19)).assertEqual(19);
      expect(MathUtils.clamp(-1, 219, 19)).assertEqual(19);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0071
     * @tc.name      testPhotosMathSecond0071
     * @tc.desc      Clamps second reversed range sample 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0071 begin');
      expect(MathUtils.clamp(240, 220, 20)).assertEqual(20);
      expect(MathUtils.clamp(20.5, 220, 20)).assertEqual(20);
      expect(MathUtils.clamp(0, 220, 20)).assertEqual(20);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0072
     * @tc.name      testPhotosMathSecond0072
     * @tc.desc      Clamps second reversed range sample 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0072 begin');
      expect(MathUtils.clamp(241, 221, 21)).assertEqual(21);
      expect(MathUtils.clamp(21.5, 221, 21)).assertEqual(21);
      expect(MathUtils.clamp(1, 221, 21)).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0072 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0073
     * @tc.name      testPhotosMathSecond0073
     * @tc.desc      Clamps second reversed range sample 23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0073 begin');
      expect(MathUtils.clamp(242, 222, 22)).assertEqual(22);
      expect(MathUtils.clamp(22.5, 222, 22)).assertEqual(22);
      expect(MathUtils.clamp(2, 222, 22)).assertEqual(22);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0074
     * @tc.name      testPhotosMathSecond0074
     * @tc.desc      Clamps second reversed range sample 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0074 begin');
      expect(MathUtils.clamp(243, 223, 23)).assertEqual(23);
      expect(MathUtils.clamp(23.5, 223, 23)).assertEqual(23);
      expect(MathUtils.clamp(3, 223, 23)).assertEqual(23);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0075
     * @tc.name      testPhotosMathSecond0075
     * @tc.desc      Clamps second reversed range sample 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0075 begin');
      expect(MathUtils.clamp(244, 224, 24)).assertEqual(24);
      expect(MathUtils.clamp(24.5, 224, 24)).assertEqual(24);
      expect(MathUtils.clamp(4, 224, 24)).assertEqual(24);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0075 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0076
     * @tc.name      testPhotosMathSecond0076
     * @tc.desc      Clamps second reversed range sample 26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0076 begin');
      expect(MathUtils.clamp(245, 225, 25)).assertEqual(25);
      expect(MathUtils.clamp(25.5, 225, 25)).assertEqual(25);
      expect(MathUtils.clamp(5, 225, 25)).assertEqual(25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0077
     * @tc.name      testPhotosMathSecond0077
     * @tc.desc      Clamps second reversed range sample 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0077 begin');
      expect(MathUtils.clamp(246, 226, 26)).assertEqual(26);
      expect(MathUtils.clamp(26.5, 226, 26)).assertEqual(26);
      expect(MathUtils.clamp(6, 226, 26)).assertEqual(26);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0078
     * @tc.name      testPhotosMathSecond0078
     * @tc.desc      Clamps second reversed range sample 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0078 begin');
      expect(MathUtils.clamp(247, 227, 27)).assertEqual(27);
      expect(MathUtils.clamp(27.5, 227, 27)).assertEqual(27);
      expect(MathUtils.clamp(7, 227, 27)).assertEqual(27);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0078 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0079
     * @tc.name      testPhotosMathSecond0079
     * @tc.desc      Clamps second reversed range sample 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0079 begin');
      expect(MathUtils.clamp(248, 228, 28)).assertEqual(28);
      expect(MathUtils.clamp(28.5, 228, 28)).assertEqual(28);
      expect(MathUtils.clamp(8, 228, 28)).assertEqual(28);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0080
     * @tc.name      testPhotosMathSecond0080
     * @tc.desc      Clamps second reversed range sample 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0080 begin');
      expect(MathUtils.clamp(249, 229, 29)).assertEqual(29);
      expect(MathUtils.clamp(29.5, 229, 29)).assertEqual(29);
      expect(MathUtils.clamp(9, 229, 29)).assertEqual(29);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0080 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0081
     * @tc.name      testPhotosMathSecond0081
     * @tc.desc      Clamps second reversed range sample 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0081 begin');
      expect(MathUtils.clamp(250, 230, 30)).assertEqual(30);
      expect(MathUtils.clamp(30.5, 230, 30)).assertEqual(30);
      expect(MathUtils.clamp(10, 230, 30)).assertEqual(30);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0081 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0082
     * @tc.name      testPhotosMathSecond0082
     * @tc.desc      Clamps second reversed range sample 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0082 begin');
      expect(MathUtils.clamp(251, 231, 31)).assertEqual(31);
      expect(MathUtils.clamp(31.5, 231, 31)).assertEqual(31);
      expect(MathUtils.clamp(11, 231, 31)).assertEqual(31);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0083
     * @tc.name      testPhotosMathSecond0083
     * @tc.desc      Clamps second reversed range sample 33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0083 begin');
      expect(MathUtils.clamp(252, 232, 32)).assertEqual(32);
      expect(MathUtils.clamp(32.5, 232, 32)).assertEqual(32);
      expect(MathUtils.clamp(12, 232, 32)).assertEqual(32);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0084
     * @tc.name      testPhotosMathSecond0084
     * @tc.desc      Clamps second reversed range sample 34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0084 begin');
      expect(MathUtils.clamp(253, 233, 33)).assertEqual(33);
      expect(MathUtils.clamp(33.5, 233, 33)).assertEqual(33);
      expect(MathUtils.clamp(13, 233, 33)).assertEqual(33);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0084 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0085
     * @tc.name      testPhotosMathSecond0085
     * @tc.desc      Clamps second reversed range sample 35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0085 begin');
      expect(MathUtils.clamp(254, 234, 34)).assertEqual(34);
      expect(MathUtils.clamp(34.5, 234, 34)).assertEqual(34);
      expect(MathUtils.clamp(14, 234, 34)).assertEqual(34);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0086
     * @tc.name      testPhotosMathSecond0086
     * @tc.desc      Clamps second reversed range sample 36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0086 begin');
      expect(MathUtils.clamp(255, 235, 35)).assertEqual(35);
      expect(MathUtils.clamp(35.5, 235, 35)).assertEqual(35);
      expect(MathUtils.clamp(15, 235, 35)).assertEqual(35);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0087
     * @tc.name      testPhotosMathSecond0087
     * @tc.desc      Clamps second reversed range sample 37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0087 begin');
      expect(MathUtils.clamp(256, 236, 36)).assertEqual(36);
      expect(MathUtils.clamp(36.5, 236, 36)).assertEqual(36);
      expect(MathUtils.clamp(16, 236, 36)).assertEqual(36);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0087 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0088
     * @tc.name      testPhotosMathSecond0088
     * @tc.desc      Clamps second reversed range sample 38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0088 begin');
      expect(MathUtils.clamp(257, 237, 37)).assertEqual(37);
      expect(MathUtils.clamp(37.5, 237, 37)).assertEqual(37);
      expect(MathUtils.clamp(17, 237, 37)).assertEqual(37);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0089
     * @tc.name      testPhotosMathSecond0089
     * @tc.desc      Clamps second reversed range sample 39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0089 begin');
      expect(MathUtils.clamp(258, 238, 38)).assertEqual(38);
      expect(MathUtils.clamp(38.5, 238, 38)).assertEqual(38);
      expect(MathUtils.clamp(18, 238, 38)).assertEqual(38);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0090
     * @tc.name      testPhotosMathSecond0090
     * @tc.desc      Clamps second reversed range sample 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0090 begin');
      expect(MathUtils.clamp(259, 239, 39)).assertEqual(39);
      expect(MathUtils.clamp(39.5, 239, 39)).assertEqual(39);
      expect(MathUtils.clamp(19, 239, 39)).assertEqual(39);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0090 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0091
     * @tc.name      testPhotosMathSecond0091
     * @tc.desc      Clamps second reversed range sample 41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0091 begin');
      expect(MathUtils.clamp(260, 240, 40)).assertEqual(40);
      expect(MathUtils.clamp(40.5, 240, 40)).assertEqual(40);
      expect(MathUtils.clamp(20, 240, 40)).assertEqual(40);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0092
     * @tc.name      testPhotosMathSecond0092
     * @tc.desc      Clamps second reversed range sample 42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0092 begin');
      expect(MathUtils.clamp(261, 241, 41)).assertEqual(41);
      expect(MathUtils.clamp(41.5, 241, 41)).assertEqual(41);
      expect(MathUtils.clamp(21, 241, 41)).assertEqual(41);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0092 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0093
     * @tc.name      testPhotosMathSecond0093
     * @tc.desc      Clamps second reversed range sample 43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0093 begin');
      expect(MathUtils.clamp(262, 242, 42)).assertEqual(42);
      expect(MathUtils.clamp(42.5, 242, 42)).assertEqual(42);
      expect(MathUtils.clamp(22, 242, 42)).assertEqual(42);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0093 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0094
     * @tc.name      testPhotosMathSecond0094
     * @tc.desc      Clamps second reversed range sample 44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0094 begin');
      expect(MathUtils.clamp(263, 243, 43)).assertEqual(43);
      expect(MathUtils.clamp(43.5, 243, 43)).assertEqual(43);
      expect(MathUtils.clamp(23, 243, 43)).assertEqual(43);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0094 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0095
     * @tc.name      testPhotosMathSecond0095
     * @tc.desc      Clamps second reversed range sample 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0095 begin');
      expect(MathUtils.clamp(264, 244, 44)).assertEqual(44);
      expect(MathUtils.clamp(44.5, 244, 44)).assertEqual(44);
      expect(MathUtils.clamp(24, 244, 44)).assertEqual(44);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0095 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0096
     * @tc.name      testPhotosMathSecond0096
     * @tc.desc      Clamps second reversed range sample 46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0096 begin');
      expect(MathUtils.clamp(265, 245, 45)).assertEqual(45);
      expect(MathUtils.clamp(45.5, 245, 45)).assertEqual(45);
      expect(MathUtils.clamp(25, 245, 45)).assertEqual(45);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0096 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0097
     * @tc.name      testPhotosMathSecond0097
     * @tc.desc      Clamps second reversed range sample 47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0097 begin');
      expect(MathUtils.clamp(266, 246, 46)).assertEqual(46);
      expect(MathUtils.clamp(46.5, 246, 46)).assertEqual(46);
      expect(MathUtils.clamp(26, 246, 46)).assertEqual(46);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0097 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0098
     * @tc.name      testPhotosMathSecond0098
     * @tc.desc      Clamps second reversed range sample 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0098 begin');
      expect(MathUtils.clamp(267, 247, 47)).assertEqual(47);
      expect(MathUtils.clamp(47.5, 247, 47)).assertEqual(47);
      expect(MathUtils.clamp(27, 247, 47)).assertEqual(47);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0098 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0099
     * @tc.name      testPhotosMathSecond0099
     * @tc.desc      Clamps second reversed range sample 49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0099 begin');
      expect(MathUtils.clamp(268, 248, 48)).assertEqual(48);
      expect(MathUtils.clamp(48.5, 248, 48)).assertEqual(48);
      expect(MathUtils.clamp(28, 248, 48)).assertEqual(48);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0099 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_SECOND_0100
     * @tc.name      testPhotosMathSecond0100
     * @tc.desc      Clamps second reversed range sample 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathSecond0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0100 begin');
      expect(MathUtils.clamp(269, 249, 49)).assertEqual(49);
      expect(MathUtils.clamp(49.5, 249, 49)).assertEqual(49);
      expect(MathUtils.clamp(29, 249, 49)).assertEqual(49);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathSecond0100 end');
    })
  })
}
