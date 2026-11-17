/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium';
import { common2D } from '@kit.ArkGraphics2D';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { negatePoint, offsetPoint } from '../../../main/ets/drawing/DrawingGeometryUtils';
import { point } from '../../../main/ets/drawing/DrawingTypes';
import { DRAWING_TAG, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;

export default function pointApiCoreTest() {
  describe('PointApiCoreTest', () => {
    /** @tc.number SUB_NdkTsDrawing_POINT_0001
     * @tc.name testPointApi0001
     * @tc.desc Verify negating a point flips both coordinates.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPointApi0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0001 begin');
      await runCase('testPointApi0001', async () => {
        const flipped: number[] = negatePoint(point(3, 4));
        expect(flipped.length).assertEqual(2);
        expect(flipped[0]).assertEqual(-3);
        expect(flipped[1]).assertEqual(-4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0001 end');
    });

    /** @tc.number SUB_NdkTsDrawing_POINT_0002
     * @tc.name testPointApi0002
     * @tc.desc Verify negating the origin gives the origin back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPointApi0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0002 begin');
      await runCase('testPointApi0002', async () => {
        const origin: number[] = negatePoint(point(0, 0));
        expect(origin[0]).assertEqual(0);
        expect(origin[1]).assertEqual(0);
        expect(negatePoint(point(origin[0], origin[1]))[0]).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0002 end');
    });

    /** @tc.number SUB_NdkTsDrawing_POINT_0003
     * @tc.name testPointApi0003
     * @tc.desc Verify negating a negative point turns both coordinates positive.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPointApi0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0003 begin');
      await runCase('testPointApi0003', async () => {
        const source: common2D.Point = point(-5, -6);
        const flipped: number[] = negatePoint(source);
        expect(flipped[0]).assertEqual(5);
        expect(flipped[1]).assertEqual(6);
        expect(source.x).assertEqual(-5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0003 end');
    });

    /** @tc.number SUB_NdkTsDrawing_POINT_0004
     * @tc.name testPointApi0004
     * @tc.desc Verify negating a fractional point keeps the precision.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPointApi0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0004 begin');
      await runCase('testPointApi0004', async () => {
        const flipped: number[] = negatePoint(point(1.5, -2.5));
        expect(flipped[0]).assertEqual(-1.5);
        expect(flipped[1]).assertEqual(2.5);
        expect(negatePoint(point(-1.5, 2.5))[0]).assertEqual(1.5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0004 end');
    });

    /** @tc.number SUB_NdkTsDrawing_POINT_0005
     * @tc.name testPointApi0005
     * @tc.desc Verify negating a huge point is reversible.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPointApi0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0005 begin');
      await runCase('testPointApi0005', async () => {
        const flipped: number[] = negatePoint(point(1000000, -1000000));
        expect(flipped[0]).assertEqual(-1000000);
        expect(flipped[1]).assertEqual(1000000);
        expect(negatePoint(point(flipped[0], flipped[1]))[1]).assertEqual(-1000000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0005 end');
    });

    /** @tc.number SUB_NdkTsDrawing_POINT_0006
     * @tc.name testPointApi0006
     * @tc.desc Verify offsetting a point adds each axis separately.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPointApi0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0006 begin');
      await runCase('testPointApi0006', async () => {
        const source: common2D.Point = point(10, 20);
        const moved: number[] = offsetPoint(source, 5, -5);
        expect(moved[0]).assertEqual(15);
        expect(moved[1]).assertEqual(15);
        expect(source.y).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0006 end');
    });

    /** @tc.number SUB_NdkTsDrawing_POINT_0007
     * @tc.name testPointApi0007
     * @tc.desc Verify a zero offset leaves the point unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPointApi0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0007 begin');
      await runCase('testPointApi0007', async () => {
        const kept: number[] = offsetPoint(point(0, 0), 0, 0);
        expect(kept[0]).assertEqual(0);
        expect(kept[1]).assertEqual(0);
        expect(kept.length).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0007 end');
    });

    /** @tc.number SUB_NdkTsDrawing_POINT_0008
     * @tc.name testPointApi0008
     * @tc.desc Verify a negative offset moves the point into the negative quadrant.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPointApi0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0008 begin');
      await runCase('testPointApi0008', async () => {
        const moved: number[] = offsetPoint(point(1, 1), -3, -4);
        expect(moved[0]).assertEqual(-2);
        expect(moved[1]).assertEqual(-3);
        expect(offsetPoint(point(-2, -3), 2, 3)[0]).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0008 end');
    });

    /** @tc.number SUB_NdkTsDrawing_POINT_0009
     * @tc.name testPointApi0009
     * @tc.desc Verify a fractional offset keeps the point precision.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPointApi0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0009 begin');
      await runCase('testPointApi0009', async () => {
        const moved: number[] = offsetPoint(point(10, 5), 2.5, 2.5);
        expect(moved[0]).assertEqual(12.5);
        expect(moved[1]).assertEqual(7.5);
        expect(offsetPoint(point(moved[0], moved[1]), -2.5, -2.5)[1]).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0009 end');
    });

    /** @tc.number SUB_NdkTsDrawing_POINT_0010
     * @tc.name testPointApi0010
     * @tc.desc Verify offsetting then negating a point composes as expected.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPointApi0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0010 begin');
      await runCase('testPointApi0010', async () => {
        const moved: number[] = offsetPoint(point(3, 4), 1, 1);
        const flipped: number[] = negatePoint(point(moved[0], moved[1]));
        expect(moved[0]).assertEqual(4);
        expect(moved[1]).assertEqual(5);
        expect(flipped[0]).assertEqual(-4);
        expect(flipped[1]).assertEqual(-5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPointApi0010 end');
    });
  });
}
