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
import { drawing, common2D } from '@kit.ArkGraphics2D';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ltrb, point } from '../../../main/ets/drawing/DrawingTypes';
import { DRAWING_TAG, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;

/**
 * Build a path that contains one axis aligned rectangle contour.
 *
 * @param { number } left - Left edge.
 * @param { number } top - Top edge.
 * @param { number } right - Right edge.
 * @param { number } bottom - Bottom edge.
 * @returns { drawing.Path } Rectangle path.
 */
function rectPath(left: number, top: number, right: number, bottom: number): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.addRect(ltrb(left, top, right, bottom));
  return path;
}

/**
 * Parse an svg path string into a new path object.
 *
 * @param { string } svg - Svg path commands.
 * @returns { drawing.Path } Parsed path, empty when the string is rejected.
 */
function fromSvg(svg: string): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.buildFromSvgString(svg);
  return path;
}

/**
 * Sum the straight line distance between consecutive approximate points.
 *
 * @param { number[] } flat - Flat approximate array, three values per point.
 * @returns { number } Total chord length.
 */
function chordLength(flat: number[]): number {
  let total: number = 0;
  for (let index: number = 4; index + 1 < flat.length; index += 3) {
    const dx: number = flat[index] - flat[index - 3];
    const dy: number = flat[index + 1] - flat[index - 2];
    total += Math.sqrt(dx * dx + dy * dy);
  }
  return total;
}

export default function pathApiTail2Test() {
  describe('PathApiTail2Test', () => {
    /** @tc.number SUB_NdkTsDrawing_PATH_0246
     * @tc.name testPathApi0246
     * @tc.desc Verify an svg arc command produces curve geometry ending at the target.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0246', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0246 begin');
      await runCase('testPathApi0246', async () => {
        const path: drawing.Path = fromSvg('M0 0 A50 50 0 0 1 100 0');
        expect(path.isEmpty()).assertFalse();
        expect(path.getBounds().right > 90).assertTrue();
        expect(path.getBounds().right <= 100).assertTrue();
        expect(path.getLength(false) > 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0246 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0247
     * @tc.name testPathApi0247
     * @tc.desc Verify the smooth cubic svg command adds another CUBIC verb.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0247', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0247 begin');
      await runCase('testPathApi0247', async () => {
        const path: drawing.Path = fromSvg('M0 0 C10 20 20 20 30 0 S50 -20 60 0');
        const verbs: drawing.PathIteratorVerb[] = path.getVerbData();
        expect(verbs.length).assertEqual(3);
        expect(verbs[1]).assertEqual(drawing.PathIteratorVerb.CUBIC);
        expect(verbs[2]).assertEqual(drawing.PathIteratorVerb.CUBIC);
        expect(path.getPointData().length).assertEqual(7);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0247 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0248
     * @tc.name testPathApi0248
     * @tc.desc Verify the smooth quadratic svg command adds another QUAD verb.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0248', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0248 begin');
      await runCase('testPathApi0248', async () => {
        const path: drawing.Path = fromSvg('M0 0 Q10 20 20 0 T40 0');
        expect(path.getVerbData().length).assertEqual(3);
        expect(path.getVerbData()[2]).assertEqual(drawing.PathIteratorVerb.QUAD);
        expect(path.getBounds().right).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0248 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0249
     * @tc.name testPathApi0249
     * @tc.desc Verify a vertical svg command reaches fifty pixels below the start.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0249', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0249 begin');
      await runCase('testPathApi0249', async () => {
        const path: drawing.Path = fromSvg('M0 0 V50');
        expect(path.getVerbData().length).assertEqual(2);
        expect(path.getBounds().bottom).assertEqual(50);
        expect(path.getLength(false)).assertEqual(50);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0249 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0250
     * @tc.name testPathApi0250
     * @tc.desc Verify a chained svg line keeps four verbs and thirty units of length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0250', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0250 begin');
      await runCase('testPathApi0250', async () => {
        const path: drawing.Path = fromSvg('M0 0 L10 0 L20 0 L30 0');
        expect(path.getVerbData().length).assertEqual(4);
        expect(path.getLength(false)).assertEqual(30);
        expect(path.getBounds().right).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0250 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0251
     * @tc.name testPathApi0251
     * @tc.desc Verify a relative cubic svg command ends thirty pixels to the right.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0251', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0251 begin');
      await runCase('testPathApi0251', async () => {
        const path: drawing.Path = fromSvg('M0 0 c10 10 20 10 30 0');
        expect(path.getVerbData().length).assertEqual(2);
        expect(path.getBounds().right).assertEqual(30);
        expect(path.getBounds().bottom > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0251 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0252
     * @tc.name testPathApi0252
     * @tc.desc Verify a relative quadratic svg command records three points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0252', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0252 begin');
      await runCase('testPathApi0252', async () => {
        const path: drawing.Path = fromSvg('M0 0 q10 20 20 0');
        expect(path.getPointData().length).assertEqual(3);
        expect(path.getBounds().right).assertEqual(20);
        expect(path.getLastPoint().y).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0252 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0253
     * @tc.name testPathApi0253
     * @tc.desc Verify negative svg coordinates are kept left of the origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0253', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0253 begin');
      await runCase('testPathApi0253', async () => {
        const path: drawing.Path = fromSvg('M0 0 L-40 -20');
        expect(path.getBounds().left).assertEqual(-40);
        expect(path.getBounds().top).assertEqual(-20);
        expect(Math.round(path.getLength(false))).assertEqual(45);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0253 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0254
     * @tc.name testPathApi0254
     * @tc.desc Verify comma separated svg coordinates parse like space separated ones.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0254', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0254 begin');
      await runCase('testPathApi0254', async () => {
        const withComma: drawing.Path = new drawing.Path();
        const withSpace: drawing.Path = new drawing.Path();
        expect(withComma.buildFromSvgString('M0,0 L10,10')).assertTrue();
        withSpace.buildFromSvgString('M0 0 L10 10');
        expect(withComma.isEqual(withSpace)).assertTrue();
        expect(Math.abs(withComma.getLength(false) - Math.sqrt(200)) < 0.5).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0254 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0255
     * @tc.name testPathApi0255
     * @tc.desc Verify a repeated close command still leaves one closed contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0255', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0255 begin');
      await runCase('testPathApi0255', async () => {
        const path: drawing.Path = fromSvg('M0 0 L10 0 Z Z');
        expect(path.isClosed()).assertTrue();
        expect(path.getVerbData().length <= 4).assertTrue();
        expect(path.getLength(true)).assertEqual(path.getLength(false));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0255 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0256
     * @tc.name testPathApi0256
     * @tc.desc Verify an svg string with a single move reports one verb.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0256', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0256 begin');
      await runCase('testPathApi0256', async () => {
        const path: drawing.Path = fromSvg('M5 5');
        expect(path.getVerbData().length).assertEqual(1);
        expect(path.getBounds().left).assertEqual(5);
        expect(path.getLength(false)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0256 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0257
     * @tc.name testPathApi0257
     * @tc.desc Verify two svg move commands before a line keep three verbs.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0257', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0257 begin');
      await runCase('testPathApi0257', async () => {
        const path: drawing.Path = fromSvg('M0 0 M10 10 L20 10');
        expect(path.getVerbData().length).assertEqual(3);
        expect(path.getLength(false)).assertEqual(10);
        expect(path.getBounds().left).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0257 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0258
     * @tc.name testPathApi0258
     * @tc.desc Verify an svg round trip of a round trip is stable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0258', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0258 begin');
      await runCase('testPathApi0258', async () => {
        const first: string = rectPath(4, 8, 64, 48).convertToSvgString();
        const second: string = fromSvg(first).convertToSvgString();
        expect(second.length > 0).assertTrue();
        expect(second).assertEqual(first);
        expect(fromSvg(second).isEqual(fromSvg(first))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0258 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0259
     * @tc.name testPathApi0259
     * @tc.desc Verify a thousandth wide rectangle keeps its perimeter to two decimals.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0259', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0259 begin');
      await runCase('testPathApi0259', async () => {
        const path: drawing.Path = rectPath(0, 0, 0.001, 10);
        expect(Math.abs(path.getLength(true) - 20.002) < 0.001).assertTrue();
        expect(path.getBounds().right).assertClose(0.001, 0.000001);
        expect(path.contains(0.0005, 5)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0259 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0260
     * @tc.name testPathApi0260
     * @tc.desc Verify coordinates in the ten million range are not clamped.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathApi0260', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0260 begin');
      await runCase('testPathApi0260', async () => {
        const path: drawing.Path = rectPath(10000000, 0, 10000100, 100);
        const bounds: common2D.Rect = path.getBounds();
        expect(bounds.left).assertEqual(10000000);
        expect(bounds.right).assertEqual(10000100);
        expect(path.contains(10000050, 50)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0260 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0261
     * @tc.name testPathApi0261
     * @tc.desc Verify a very flat oval keeps its wide bounds and short height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0261', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0261 begin');
      await runCase('testPathApi0261', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addOval(ltrb(0, 0, 1000, 0.5), 0);
        const bounds: common2D.Rect = path.getBounds();
        expect(Math.round(bounds.right)).assertEqual(1000);
        expect(bounds.bottom < 1).assertTrue();
        expect(path.getLength(false) > 1500).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0261 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0262
     * @tc.name testPathApi0262
     * @tc.desc Verify a needle thin triangle tapers its interior width downwards.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0262', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0262 begin');
      await runCase('testPathApi0262', async () => {
        const points: common2D.Point[] = [point(0, 0), point(0.01, 0), point(0, 500)];
        const path: drawing.Path = new drawing.Path();
        path.addPolygon(points, true);
        expect(Math.round(path.getBounds().bottom)).assertEqual(500);
        expect(path.contains(0.005, 0.5)).assertTrue();
        expect(path.contains(0.05, 0.5)).assertFalse();
        expect(path.getLength(true) > 1000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0262 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0263
     * @tc.name testPathApi0263
     * @tc.desc Verify a half pixel radius circle has a pi sized circumference.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0263', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0263 begin');
      await runCase('testPathApi0263', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addCircle(0, 0, 0.5);
        expect(Math.abs(path.getLength(false) - Math.PI)).assertClose(0.31316557725007144, 0.01);
        expect(Math.abs(path.getBounds().right - 0.5) < 0.01).assertTrue();
        expect(path.contains(0, 0)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0263 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0264
     * @tc.name testPathApi0264
     * @tc.desc Verify ten small translations add up to one pixel of movement.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0264', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0264 begin');
      await runCase('testPathApi0264', async () => {
        const path: drawing.Path = rectPath(0, 0, 10, 10);
        for (let index: number = 0; index < 10; index++) {
          const matrix: drawing.Matrix = new drawing.Matrix();
          matrix.setTranslation(0.1, 0.1);
          path.transform(matrix);
        }
        expect(Math.abs(path.getBounds().left - 1) < 0.01).assertTrue();
        expect(Math.abs(path.getBounds().top - 1) < 0.01).assertTrue();
        expect(Math.round(path.getLength(true))).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0264 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0265
     * @tc.name testPathApi0265
     * @tc.desc Verify a thousandth scale shrinks a large square to a unit square.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0265', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0265 begin');
      await runCase('testPathApi0265', async () => {
        const path: drawing.Path = rectPath(0, 0, 1000, 1000);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(0.001, 0.001, 0, 0);
        path.transform(matrix);
        expect(Math.abs(path.getBounds().right - 1) < 0.01).assertTrue();
        expect(Math.abs(path.getLength(true) - 4) < 0.05).assertTrue();
        expect(path.contains(0.5, 0.5)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0265 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0266
     * @tc.name testPathApi0266
     * @tc.desc Verify a full turn rotation restores the original bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0266', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0266 begin');
      await runCase('testPathApi0266', async () => {
        const path: drawing.Path = rectPath(0, 0, 100, 40);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(360, 50, 20);
        path.transform(matrix);
        expect(Math.abs(path.getBounds().right - 100) < 0.01).assertTrue();
        expect(Math.abs(path.getBounds().bottom - 40) < 0.01).assertTrue();
        expect(Math.round(path.getLength(true))).assertEqual(280);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0266 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0267
     * @tc.name testPathApi0267
     * @tc.desc Verify containment still works one million pixels away from the origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathApi0267', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0267 begin');
      await runCase('testPathApi0267', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addCircle(1000000, 1000000, 100);
        expect(path.contains(1000000, 1000000)).assertTrue();
        expect(path.contains(1000200, 1000000)).assertFalse();
        expect(Math.abs(path.getLength(false) - 628) <= 1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0267 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0268
     * @tc.name testPathApi0268
     * @tc.desc Verify a half pixel negative offset lands halfway left of the origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0268', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0268 begin');
      await runCase('testPathApi0268', async () => {
        const shifted: drawing.Path = rectPath(0, 0, 10, 10).offset(-0.5, -0.5);
        expect(Math.abs(shifted.getBounds().left + 0.5) < 0.01).assertTrue();
        expect(Math.abs(shifted.getBounds().top + 0.5) < 0.01).assertTrue();
        expect(Math.round(shifted.getLength(true))).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0268 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0269
     * @tc.name testPathApi0269
     * @tc.desc Verify a zero scale collapses the contour to a single point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0269', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0269 begin');
      await runCase('testPathApi0269', async () => {
        const path: drawing.Path = rectPath(10, 10, 110, 110);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(0, 0, 0, 0);
        path.transform(matrix);
        expect(path.getBounds().right).assertEqual(0);
        expect(path.getBounds().bottom).assertEqual(0);
        expect(path.getLength(true)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0269 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0270
     * @tc.name testPathApi0270
     * @tc.desc Verify a many sided polygon perimeter approaches the circle circumference.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0270', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0270 begin');
      await runCase('testPathApi0270', async () => {
        const points: common2D.Point[] = [];
        for (let index: number = 0; index < 128; index++) {
          const angle: number = (2 * Math.PI * index) / 128;
          points.push(point(50 + 50 * Math.cos(angle), 50 + 50 * Math.sin(angle)));
        }
        const path: drawing.Path = new drawing.Path();
        path.addPolygon(points, true);
        const circumference: number = 2 * Math.PI * 50;
        expect(path.getLength(false) < circumference).assertTrue();
        expect(path.getLength(false) > circumference * 0.99).assertTrue();
        expect(path.getVerbData().length).assertEqual(129);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0270 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0271
     * @tc.name testPathApi0271
     * @tc.desc Verify an svg round trip survives a translation between the two conversions.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0271', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0271 begin');
      await runCase('testPathApi0271', async () => {
        const path: drawing.Path = fromSvg('M0 0 L100 0 L100 50 Z');
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(25, 25);
        path.transform(matrix);
        const restored: drawing.Path = fromSvg(path.convertToSvgString());
        expect(restored.contains(50, 30)).assertTrue();
        expect(restored.getBounds().left).assertEqual(25);
        expect(Math.round(restored.getLength(true))).assertEqual(262);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0271 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0272
     * @tc.name testPathApi0272
     * @tc.desc Verify an offset boolean result keeps the carved hole in place.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0272', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0272 begin');
      await runCase('testPathApi0272', async () => {
        const base: drawing.Path = rectPath(0, 0, 100, 100);
        const hole: drawing.Path = new drawing.Path();
        hole.addCircle(50, 50, 20);
        base.op(hole, drawing.PathOp.DIFFERENCE);
        const moved: drawing.Path = base.offset(200, 0);
        expect(moved.contains(250, 50)).assertFalse();
        expect(moved.contains(210, 50)).assertTrue();
        expect(base.contains(50, 50)).assertFalse();
        expect(moved.getBounds().left).assertEqual(200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0272 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0273
     * @tc.name testPathApi0273
     * @tc.desc Verify appending a contour with a rotation matrix rotates only the copy.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0273', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0273 begin');
      await runCase('testPathApi0273', async () => {
        const base: drawing.Path = rectPath(0, 0, 20, 20);
        const other: drawing.Path = rectPath(100, 0, 140, 40);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(90, 100, 0);
        base.addPath(other, matrix);
        expect(base.getBounds().left).assertEqual(0);
        expect(base.getBounds().bottom).assertEqual(40);
        expect(base.contains(10, 10)).assertTrue();
        expect(base.getBounds().top).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0273 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0274
     * @tc.name testPathApi0274
     * @tc.desc Verify appending a contour with a scale matrix doubles only the appended shape.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0274', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0274 begin');
      await runCase('testPathApi0274', async () => {
        const base: drawing.Path = rectPath(0, 0, 10, 10);
        const other: drawing.Path = rectPath(20, 0, 30, 10);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 20, 0);
        base.addPath(other, matrix);
        expect(base.getBounds().right).assertEqual(40);
        expect(base.getBounds().bottom).assertEqual(20);
        expect(base.contains(5, 5)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0274 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0275
     * @tc.name testPathApi0275
     * @tc.desc Verify a three shape boolean chain can still round trip through svg.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathApi0275', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0275 begin');
      await runCase('testPathApi0275', async () => {
        const base: drawing.Path = rectPath(0, 0, 60, 60);
        base.op(rectPath(40, 40, 100, 100), drawing.PathOp.UNION);
        const hole: drawing.Path = new drawing.Path();
        hole.addCircle(50, 50, 10);
        base.op(hole, drawing.PathOp.DIFFERENCE);
        const restored: drawing.Path = fromSvg(base.convertToSvgString());
        expect(restored.contains(10, 10)).assertTrue();
        expect(restored.contains(50, 50)).assertFalse();
        expect(restored.getBounds().right).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0275 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0276
     * @tc.name testPathApi0276
     * @tc.desc Verify a transformed path agrees with the matrix mapping of its points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0276', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0276 begin');
      await runCase('testPathApi0276', async () => {
        const path: drawing.Path = rectPath(0, 0, 20, 10);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(5, 7);
        const mapped: common2D.Point[] = matrix.mapPoints([point(0, 0), point(20, 10)]);
        path.transform(matrix);
        expect(mapped[0].x).assertEqual(5);
        expect(mapped[1].y).assertEqual(17);
        expect(path.getBounds().left).assertEqual(5);
        expect(path.getBounds().bottom).assertEqual(17);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0276 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0277
     * @tc.name testPathApi0277
     * @tc.desc Verify an extracted segment can be unioned with another contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0277', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0277 begin');
      await runCase('testPathApi0277', async () => {
        const source: drawing.Path = rectPath(0, 0, 100, 100);
        const segment: drawing.Path = new drawing.Path();
        source.getSegment(false, 0, 200, true, segment);
        expect(segment.op(rectPath(50, 50, 150, 150), drawing.PathOp.UNION)).assertTrue();
        expect(segment.getBounds().right).assertEqual(150);
        expect(segment.contains(120, 120)).assertTrue();
        expect(segment.getLength(true) > 400).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0277 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0278
     * @tc.name testPathApi0278
     * @tc.desc Verify an interpolated path can be transformed afterwards.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0278', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0278 begin');
      await runCase('testPathApi0278', async () => {
        const first: drawing.Path = rectPath(0, 0, 20, 20);
        const second: drawing.Path = rectPath(40, 40, 80, 80);
        const blended: drawing.Path = new drawing.Path();
        first.interpolate(second, 0.5, blended);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(100, 100);
        blended.transform(matrix);
        expect(Math.round(blended.getBounds().left)).assertEqual(120);
        expect(Math.round(blended.getBounds().right)).assertEqual(150);
        expect(blended.contains(130, 130)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0278 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0279
     * @tc.name testPathApi0279
     * @tc.desc Verify the chords of an approximation stay within the curve length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0279', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0279 begin');
      await runCase('testPathApi0279', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addCircle(50, 50, 30);
        const chords: number = chordLength(path.approximate(0.2));
        const length: number = path.getLength(false);
        expect(chords > length * 0.95).assertTrue();
        expect(chords <= length + 0.01).assertTrue();
        expect(chords > 150).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0279 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0280
     * @tc.name testPathApi0280
     * @tc.desc Verify a quarter arc midpoint sits one radius from the centre.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0280', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0280 begin');
      await runCase('testPathApi0280', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addArc(ltrb(0, 0, 100, 100), 0, 90);
        const half: number = path.getLength(false) / 2;
        const position: common2D.Point = point(0, 0);
        const tangent: common2D.Point = point(0, 0);
        expect(path.getPositionAndTangent(false, half, position, tangent)).assertTrue();
        const radius: number = Math.sqrt((position.x - 50) * (position.x - 50) +
          (position.y - 50) * (position.y - 50));
        expect(Math.abs(radius - 50) < 1).assertTrue();
        expect(Math.abs(tangent.x * tangent.x + tangent.y * tangent.y - 1) < 0.01).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0280 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0281
     * @tc.name testPathApi0281
     * @tc.desc Verify a matrix sampled from a circle carries a non zero translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0281', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0281 begin');
      await runCase('testPathApi0281', async () => {
        const circle: drawing.Path = new drawing.Path();
        circle.addCircle(50, 50, 50);
        const matrix: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = circle.getMatrix(false, Math.PI * 25, matrix,
          drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        expect(ok).assertTrue();
        expect(matrix.getValue(2) !== 0 || matrix.getValue(5) !== 0).assertTrue();
        expect(Math.abs(matrix.getValue(2) - 50) < 1).assertTrue();
        expect(Math.abs(matrix.getValue(5) - 100) < 1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0281 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0282
     * @tc.name testPathApi0282
     * @tc.desc Verify a boolean operation on a copy leaves the original outline alone.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0282', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0282 begin');
      await runCase('testPathApi0282', async () => {
        const source: drawing.Path = rectPath(0, 0, 80, 80);
        const copy: drawing.Path = new drawing.Path(source);
        copy.op(rectPath(40, 40, 120, 120), drawing.PathOp.INTERSECT);
        expect(source.getBounds().right).assertEqual(80);
        expect(copy.getBounds().left).assertEqual(40);
        expect(copy.getBounds().bottom).assertEqual(80);
        expect(source.contains(10, 10)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0282 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0283
     * @tc.name testPathApi0283
     * @tc.desc Verify two paths built from the same calls are equal in every query.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0283', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0283 begin');
      await runCase('testPathApi0283', async () => {
        const first: drawing.Path = fromSvg('M0 0 L40 0 L40 40 Z');
        const second: drawing.Path = fromSvg('M0 0 L40 0 L40 40 Z');
        expect(first.isEqual(second)).assertTrue();
        expect(first.getLength(true)).assertEqual(second.getLength(true));
        expect(first.getVerbData().length).assertEqual(second.getVerbData().length);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0283 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0284
     * @tc.name testPathApi0284
     * @tc.desc Verify a union of two touching boxes differs from a single large box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0284', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0284 begin');
      await runCase('testPathApi0284', async () => {
        const merged: drawing.Path = rectPath(0, 0, 50, 50);
        merged.op(rectPath(50, 0, 100, 50), drawing.PathOp.UNION);
        const single: drawing.Path = rectPath(0, 0, 100, 50);
        expect(merged.getBounds().right).assertEqual(single.getBounds().right);
        expect(Math.round(merged.getLength(true))).assertEqual(300);
        expect(Math.round(single.getLength(true))).assertEqual(300);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0284 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0285
     * @tc.name testPathApi0285
     * @tc.desc Verify offset carries the fill type over to the returned path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0285', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0285 begin');
      await runCase('testPathApi0285', async () => {
        const path: drawing.Path = rectPath(0, 0, 30, 30);
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        const moved: drawing.Path = path.offset(10, 10);
        expect(moved.getFillType()).assertEqual(drawing.PathFillType.EVEN_ODD);
        expect(moved.isInverseFillType()).assertFalse();
        expect(moved.getBounds().left).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0285 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0286
     * @tc.name testPathApi0286
     * @tc.desc Verify appending contours does not change the fill type of the target.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0286', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0286 begin');
      await runCase('testPathApi0286', async () => {
        const base: drawing.Path = rectPath(0, 0, 20, 20);
        base.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        base.addPath(rectPath(40, 40, 60, 60));
        expect(base.getFillType()).assertEqual(drawing.PathFillType.INVERSE_EVEN_ODD);
        expect(base.isInverseFillType()).assertTrue();
        expect(base.getBounds().right).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0286 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0287
     * @tc.name testPathApi0287
     * @tc.desc Verify a reset path accepts a fresh rectangle right away.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0287', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0287 begin');
      await runCase('testPathApi0287', async () => {
        const path: drawing.Path = rectPath(0, 0, 10, 10);
        path.reset();
        path.addRect(ltrb(100, 100, 140, 120));
        expect(path.getBounds().left).assertEqual(100);
        expect(path.getBounds().bottom).assertEqual(120);
        expect(Math.round(path.getLength(true))).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0287 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0288
     * @tc.name testPathApi0288
     * @tc.desc Verify a rewound path loses both its geometry and its custom fill type.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0288', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0288 begin');
      await runCase('testPathApi0288', async () => {
        const path: drawing.Path = rectPath(0, 0, 40, 40);
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        path.rewind();
        expect(path.getVerbData().length).assertEqual(0);
        expect(path.getFillType()).assertEqual(drawing.PathFillType.WINDING);
        expect(path.isEmpty()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0288 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0289
     * @tc.name testPathApi0289
     * @tc.desc Verify closing and reopening produces two separate contours and measures the first.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0289', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0289 begin');
      await runCase('testPathApi0289', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.lineTo(20, 0);
        path.close();
        path.moveTo(40, 0);
        path.lineTo(60, 0);
        expect(path.getVerbData().length).assertEqual(5);
        expect(Math.round(path.getLength(false))).assertEqual(40);
        expect(path.getBounds().right).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0289 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0290
     * @tc.name testPathApi0290
     * @tc.desc Verify a closed empty contour does not block later drawing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0290', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0290 begin');
      await runCase('testPathApi0290', async () => {
        const path: drawing.Path = new drawing.Path();
        path.close();
        path.addRect(ltrb(5, 5, 25, 25));
        expect(path.isEmpty()).assertFalse();
        expect(path.getBounds().right).assertEqual(25);
        expect(path.contains(10, 10)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0290 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0291
     * @tc.name testPathApi0291
     * @tc.desc Verify two copies transformed differently report their own bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0291', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0291 begin');
      await runCase('testPathApi0291', async () => {
        const source: drawing.Path = rectPath(0, 0, 20, 20);
        const doubled: drawing.Path = new drawing.Path(source);
        const shifted: drawing.Path = new drawing.Path(source);
        const scale: drawing.Matrix = new drawing.Matrix();
        scale.setScale(2, 2, 0, 0);
        const translate: drawing.Matrix = new drawing.Matrix();
        translate.setTranslation(30, 0);
        doubled.transform(scale);
        shifted.transform(translate);
        expect(doubled.getBounds().right).assertEqual(40);
        expect(shifted.getBounds().right).assertEqual(50);
        expect(source.getBounds().right).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0291 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0292
     * @tc.name testPathApi0292
     * @tc.desc Verify a carved path still yields a valid flattened outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0292', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0292 begin');
      await runCase('testPathApi0292', async () => {
        const base: drawing.Path = rectPath(0, 0, 100, 100);
        const hole: drawing.Path = new drawing.Path();
        hole.addCircle(50, 50, 20);
        base.op(hole, drawing.PathOp.DIFFERENCE);
        const flat: number[] = base.approximate(0.5);
        expect(flat.length % 3).assertEqual(0);
        expect(flat.length >= 12).assertTrue();
        expect(base.getLength(true)).assertEqual(400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0292 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0293
     * @tc.name testPathApi0293
     * @tc.desc Verify offset then scale differs from scale then offset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathApi0293', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0293 begin');
      await runCase('testPathApi0293', async () => {
        const scale: drawing.Matrix = new drawing.Matrix();
        scale.setScale(2, 2, 0, 0);
        const offsetFirst: drawing.Path = rectPath(0, 0, 10, 10).offset(10, 0);
        offsetFirst.transform(scale);
        const scaleFirst: drawing.Path = rectPath(0, 0, 10, 10);
        scaleFirst.transform(scale);
        const offsetLast: drawing.Path = scaleFirst.offset(10, 0);
        expect(offsetFirst.getBounds().left).assertEqual(20);
        expect(offsetLast.getBounds().left).assertEqual(10);
        expect(offsetFirst.getBounds().right).assertEqual(40);
        expect(offsetLast.getBounds().right).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0293 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0294
     * @tc.name testPathApi0294
     * @tc.desc Verify the first recorded point is the move target.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0294', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0294 begin');
      await runCase('testPathApi0294', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(3, 4);
        path.lineTo(30, 40);
        const points: common2D.Point[] = path.getPointData();
        expect(points[0].x).assertEqual(3);
        expect(points[0].y).assertEqual(4);
        expect(points[points.length - 1].x).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0294 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0295
     * @tc.name testPathApi0295
     * @tc.desc Verify a mixed contour reports verbs in drawing order ending with close.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0295', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0295 begin');
      await runCase('testPathApi0295', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.lineTo(10, 0);
        path.quadTo(20, 10, 30, 0);
        path.cubicTo(40, 10, 50, 10, 60, 0);
        path.close();
        const verbs: drawing.PathIteratorVerb[] = path.getVerbData();
        expect(verbs.length).assertEqual(5);
        expect(verbs[1]).assertEqual(drawing.PathIteratorVerb.LINE);
        expect(verbs[3]).assertEqual(drawing.PathIteratorVerb.CUBIC);
        expect(verbs[4]).assertEqual(drawing.PathIteratorVerb.CLOSE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0295 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0296
     * @tc.name testPathApi0296
     * @tc.desc Verify a hundred box union ends at the last box edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathApi0296', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0296 begin');
      await runCase('testPathApi0296', async () => {
        const base: drawing.Path = rectPath(0, 0, 20, 20);
        for (let index: number = 1; index < 100; index++) {
          base.op(rectPath(index * 20, 0, index * 20 + 20, 20), drawing.PathOp.UNION);
        }
        expect(base.getBounds().right).assertEqual(2000);
        expect(base.getBounds().bottom).assertEqual(20);
        expect(base.contains(1990, 10)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0296 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0297
     * @tc.name testPathApi0297
     * @tc.desc Verify a hundred cubic segments accumulate a positive length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathApi0297', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0297 begin');
      await runCase('testPathApi0297', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        for (let index: number = 0; index < 100; index++) {
          const start: number = index * 10;
          path.cubicTo(start + 3, 5, start + 7, 5, start + 10, 0);
        }
        expect(path.getVerbData().length).assertEqual(101);
        expect(path.getLength(false) > 900).assertTrue();
        expect(path.getBounds().right).assertEqual(1000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0297 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0298
     * @tc.name testPathApi0298
     * @tc.desc Verify fifty appended circles scale the verb count of one circle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathApi0298', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0298 begin');
      await runCase('testPathApi0298', async () => {
        const unit: drawing.Path = new drawing.Path();
        unit.addCircle(0, 0, 5);
        const verbs: number = unit.getVerbData().length;
        const many: drawing.Path = new drawing.Path();
        for (let index: number = 0; index < 50; index++) {
          const disc: drawing.Path = new drawing.Path();
          disc.addCircle(index * 20, 0, 5);
          many.addPath(disc);
        }
        expect(many.getVerbData().length).assertEqual(verbs * 50);
        expect(many.getBounds().right).assertEqual(985);
        expect(many.contains(0, 0)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0298 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0299
     * @tc.name testPathApi0299
     * @tc.desc Verify a hundred short contours hold two hundred verbs while length covers the first.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathApi0299', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0299 begin');
      await runCase('testPathApi0299', async () => {
        const path: drawing.Path = new drawing.Path();
        for (let index: number = 0; index < 100; index++) {
          path.moveTo(index * 5, 0);
          path.lineTo(index * 5, 10);
        }
        expect(path.getVerbData().length).assertEqual(200);
        expect(Math.round(path.getLength(false))).assertEqual(10);
        expect(path.getBounds().bottom).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0299 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0300
     * @tc.name testPathApi0300
     * @tc.desc Verify twenty unit translations accumulate twenty pixels of movement.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathApi0300', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0300 begin');
      await runCase('testPathApi0300', async () => {
        const path: drawing.Path = rectPath(0, 0, 5, 5);
        for (let index: number = 0; index < 20; index++) {
          const matrix: drawing.Matrix = new drawing.Matrix();
          matrix.setTranslation(1, 1);
          path.transform(matrix);
        }
        expect(path.getBounds().left).assertEqual(20);
        expect(path.getBounds().top).assertEqual(20);
        expect(Math.round(path.getLength(true))).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0300 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0301
     * @tc.name testPathApi0301
     * @tc.desc Verify an svg string with a hundred line commands parses fully.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathApi0301', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0301 begin');
      await runCase('testPathApi0301', async () => {
        let svg: string = 'M0 0';
        for (let index: number = 0; index < 100; index++) {
          svg += ' L' + (index + 1) * 2 + ' 0';
        }
        const path: drawing.Path = fromSvg(svg);
        expect(path.getVerbData().length).assertEqual(101);
        expect(path.getLength(false)).assertEqual(200);
        expect(path.getBounds().right).assertEqual(200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0301 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0302
     * @tc.name testPathApi0302
     * @tc.desc Verify ten chained unions of adjacent boxes span one continuous run.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathApi0302', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0302 begin');
      await runCase('testPathApi0302', async () => {
        const base: drawing.Path = rectPath(0, 0, 10, 10);
        for (let index: number = 1; index < 10; index++) {
          base.op(rectPath(index * 10, 0, index * 10 + 10, 10), drawing.PathOp.UNION);
        }
        expect(base.getBounds().right).assertEqual(100);
        expect(base.contains(50, 5)).assertTrue();
        expect(Math.round(base.getLength(true))).assertEqual(220);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0302 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0303
     * @tc.name testPathApi0303
     * @tc.desc Verify a five hundred point polygon stays just inside the circle it mirrors.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathApi0303', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0303 begin');
      await runCase('testPathApi0303', async () => {
        const points: common2D.Point[] = [];
        for (let index: number = 0; index < 512; index++) {
          const angle: number = (2 * Math.PI * index) / 512;
          points.push(point(200 + 50 * Math.cos(angle), 200 + 50 * Math.sin(angle)));
        }
        const path: drawing.Path = new drawing.Path();
        path.addPolygon(points, true);
        const circumference: number = 2 * Math.PI * 50;
        expect(path.getVerbData().length).assertEqual(513);
        expect(path.getLength(false) < circumference).assertTrue();
        expect(path.getLength(false) > circumference * 0.999).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0303 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0304
     * @tc.name testPathApi0304
     * @tc.desc Verify a middle window of a long path extracts the requested length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathApi0304', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0304 begin');
      await runCase('testPathApi0304', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        for (let index: number = 0; index < 100; index++) {
          path.lineTo((index + 1) * 10, 0);
        }
        const dst: drawing.Path = new drawing.Path();
        expect(path.getSegment(false, 200, 500, true, dst)).assertTrue();
        expect(Math.round(dst.getLength(false))).assertEqual(300);
        expect(Math.round(dst.getBounds().left)).assertEqual(200);
        expect(Math.round(dst.getBounds().right)).assertEqual(500);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0304 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0305
     * @tc.name testPathApi0305
     * @tc.desc Verify a zigzag outline flattens into many points without overflow.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathApi0305', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0305 begin');
      await runCase('testPathApi0305', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        for (let index: number = 0; index < 60; index++) {
          path.lineTo(index * 10 + 5, index % 2 === 0 ? 30 : 0);
        }
        const flat: number[] = path.approximate(0.1);
        expect(flat.length % 3).assertEqual(0);
        expect(flat.length > 100).assertTrue();
        expect(flat.length <= 61 * 3).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0305 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0306
     * @tc.name testPathApi0306
     * @tc.desc Verify a long mixed pipeline keeps its final geometry consistent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathApi0306', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0306 begin');
      await runCase('testPathApi0306', async () => {
        const base: drawing.Path = fromSvg('M0 0 L40 0 L40 40 Z');
        base.addPath(rectPath(60, 0, 100, 40));
        base.op(new drawing.Path(), drawing.PathOp.UNION);
        const scale: drawing.Matrix = new drawing.Matrix();
        scale.setScale(2, 2, 0, 0);
        base.transform(scale);
        const moved: drawing.Path = base.offset(20, 20);
        const restored: drawing.Path = fromSvg(moved.convertToSvgString());
        expect(restored.getBounds().right).assertEqual(220);
        expect(restored.getBounds().bottom).assertEqual(100);
        expect(restored.contains(30, 30)).assertTrue();
        expect(restored.contains(120, 50)).assertFalse();
        expect(restored.getLength(true) > 150).assertTrue();
        expect(restored.getLength(true) < 500).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0306 end');
    });
  });
}
