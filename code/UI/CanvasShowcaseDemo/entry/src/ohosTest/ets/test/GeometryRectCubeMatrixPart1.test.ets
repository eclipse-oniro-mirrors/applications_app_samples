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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { delayTick } from './shared/AsyncYield';
import { GeometryUtil } from '../../../main/ets/model/utils/GeometryUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF817;
const TAG: string = '[Sample_Canvas]';

export default function GeometryRectCubeMatrixPart1Test(): void {
  describe('GeometryRectCubeMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_GRCP1_0100
     * @tc.name      testRectCube0001
     * @tc.desc      Verify rect (0, 0, 10, 10) contains (0, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectCube0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0001 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 0, 0)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GRCP1_0200
     * @tc.name      testRectCube0002
     * @tc.desc      Verify rect (0, 0, 10, 10) contains (5, 5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectCube0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0002 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 5, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GRCP1_0300
     * @tc.name      testRectCube0003
     * @tc.desc      Verify rect (0, 0, 10, 10) contains (10, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectCube0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0003 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 10, 10)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GRCP1_0400
     * @tc.name      testRectCube0004
     * @tc.desc      Verify rect (0, 0, 10, 10) contains (-1, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectCube0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0004 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, -1, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GRCP1_0500
     * @tc.name      testRectCube0005
     * @tc.desc      Verify rect (0, 0, 10, 10) contains (11, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectCube0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0005 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 11, 10)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GRCP1_0600
     * @tc.name      testRectCube0006
     * @tc.desc      Verify rect (0, 0, 10, 10) contains (5, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectCube0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0006 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 5, -1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GRCP1_0700
     * @tc.name      testRectCube0007
     * @tc.desc      Verify rect (0, 0, 10, 10) contains (5, 11).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectCube0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0007 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 5, 11)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GRCP1_0800
     * @tc.name      testRectCube0008
     * @tc.desc      Verify rect (0, 0, 10, 10) contains (100, 100).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectCube0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0008 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 10, 100, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0008 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GRCP1_0900
     * @tc.name      testRectCube0009
     * @tc.desc      Verify rect (10, 20, 100, 50) contains (0, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectCube0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0009 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 100, 50, 0, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0009 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GRCP1_1000
     * @tc.name      testRectCube0010
     * @tc.desc      Verify rect (10, 20, 100, 50) contains (5, 5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectCube0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0010 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 100, 50, 5, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0010 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GRCP1_1100
     * @tc.name      testRectCube0011
     * @tc.desc      Verify rect (10, 20, 100, 50) contains (10, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectCube0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0011 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 100, 50, 10, 10)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0011 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GRCP1_1200
     * @tc.name      testRectCube0012
     * @tc.desc      Verify rect (10, 20, 100, 50) contains (-1, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectCube0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0012 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 100, 50, -1, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0012 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GRCP1_1300
     * @tc.name      testRectCube0013
     * @tc.desc      Verify rect (10, 20, 100, 50) contains (11, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectCube0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0013 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 100, 50, 11, 10)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0013 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GRCP1_1400
     * @tc.name      testRectCube0014
     * @tc.desc      Verify rect (10, 20, 100, 50) contains (5, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectCube0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0014 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 100, 50, 5, -1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0014 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GRCP1_1500
     * @tc.name      testRectCube0015
     * @tc.desc      Verify rect (10, 20, 100, 50) contains (5, 11).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectCube0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0015 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 100, 50, 5, 11)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0015 end');
    })

    /**
     * @tc.number    SUB_CANVAS_GRCP1_1600
     * @tc.name      testRectCube0016
     * @tc.desc      Verify rect (10, 20, 100, 50) contains (100, 100).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectCube0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0016 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 100, 50, 100, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectCube0016 end');
    })

  })
}
