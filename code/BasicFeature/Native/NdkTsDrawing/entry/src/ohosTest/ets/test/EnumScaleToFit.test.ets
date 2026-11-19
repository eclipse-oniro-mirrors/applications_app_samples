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
import {
  fitRectToRect,
  mapPoints,
  mapRect,
  matrixValueAt
} from '../../../main/ets/drawing/DrawingMatrix';
import { ltrb, point } from '../../../main/ets/drawing/DrawingTypes';
import { DRAWING_TAG, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const SRC_EDGE: number = 100;
const DST_W: number = 200;
const DST_H: number = 100;
const HALF: number = 50;
const QUARTER: number = 25;

/**
 * Build the square source rectangle shared by every fit mode.
 *
 * @returns { common2D.Rect } Source rectangle.
 */
function srcRect(): common2D.Rect {
  return ltrb(0, 0, SRC_EDGE, SRC_EDGE);
}

/**
 * Build the wide destination rectangle shared by every fit mode.
 *
 * @returns { common2D.Rect } Destination rectangle.
 */
function dstRect(): common2D.Rect {
  return ltrb(0, 0, DST_W, DST_H);
}

/**
 * Build a matrix that fits the source rectangle into the destination rectangle.
 *
 * @param { drawing.ScaleToFit } mode - Fit mode.
 * @returns { drawing.Matrix } Matrix holding the mapping.
 */
function matrixOf(mode: drawing.ScaleToFit): drawing.Matrix {
  const matrix: drawing.Matrix = new drawing.Matrix();
  matrix.setRectToRect(srcRect(), dstRect(), mode);
  return matrix;
}

/**
 * Map one point with the matrix of a fit mode.
 *
 * @param { drawing.ScaleToFit } mode - Fit mode.
 * @param { number } x - Source horizontal coordinate.
 * @param { number } y - Source vertical coordinate.
 * @returns { number[] } Mapped horizontal and vertical coordinates.
 */
function mappedPair(mode: drawing.ScaleToFit, x: number, y: number): number[] {
  return mapPoints(matrixOf(mode), [point(x, y)]);
}

/**
 * Map the source rectangle with the matrix of a fit mode.
 *
 * @param { drawing.ScaleToFit } mode - Fit mode.
 * @returns { number[] } Mapped left, top, right and bottom.
 */
function boxOf(mode: drawing.ScaleToFit): number[] {
  return mapRect(matrixOf(mode), srcRect());
}

export default function enumScaleToFitTest() {
  describe('EnumScaleToFitTest', () => {
    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0578
     * @tc.name testEnumScaleToFit0578
     * @tc.desc Verify the four fit modes hold the documented values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumScaleToFit0578', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0578 begin');
      await runCase('testEnumScaleToFit0578', async () => {
        expect(drawing.ScaleToFit.FILL_SCALE_TO_FIT).assertEqual(0);
        expect(drawing.ScaleToFit.START_SCALE_TO_FIT).assertEqual(1);
        expect(drawing.ScaleToFit.CENTER_SCALE_TO_FIT).assertEqual(2);
        expect(drawing.ScaleToFit.END_SCALE_TO_FIT).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0578 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0579
     * @tc.name testEnumScaleToFit0579
     * @tc.desc Verify the fill mode builds a matrix that stretches both axes independently.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumScaleToFit0579', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0579 begin');
      await runCase('testEnumScaleToFit0579', async () => {
        const matrix: drawing.Matrix = matrixOf(drawing.ScaleToFit.FILL_SCALE_TO_FIT);
        expect(fitRectToRect(srcRect(), dstRect(), drawing.ScaleToFit.FILL_SCALE_TO_FIT)).assertTrue();
        expect(matrix.isIdentity()).assertFalse();
        expect(matrixValueAt(matrix, 0)).assertEqual(2);
        expect(matrixValueAt(matrix, 4)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0579 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0580
     * @tc.name testEnumScaleToFit0580
     * @tc.desc Verify the fill mode maps the whole source square onto the whole destination rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumScaleToFit0580', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0580 begin');
      await runCase('testEnumScaleToFit0580', async () => {
        const topLeft: number[] = mappedPair(drawing.ScaleToFit.FILL_SCALE_TO_FIT, 0, 0);
        const bottomRight: number[] = mappedPair(drawing.ScaleToFit.FILL_SCALE_TO_FIT, SRC_EDGE, SRC_EDGE);
        expect(topLeft[0]).assertEqual(0);
        expect(topLeft[1]).assertEqual(0);
        expect(bottomRight[0]).assertEqual(DST_W);
        expect(bottomRight[1]).assertEqual(DST_H);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0580 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0581
     * @tc.name testEnumScaleToFit0581
     * @tc.desc Verify the fill mode sends the source center to the middle of the destination width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumScaleToFit0581', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0581 begin');
      await runCase('testEnumScaleToFit0581', async () => {
        const center: number[] = mappedPair(drawing.ScaleToFit.FILL_SCALE_TO_FIT, HALF, HALF);
        expect(center[0]).assertEqual(DST_W / 2);
        expect(center[1]).assertEqual(HALF);
        expect(center[0] > HALF).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0581 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0582
     * @tc.name testEnumScaleToFit0582
     * @tc.desc Verify the fill mode doubles the horizontal coordinate and keeps the vertical one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumScaleToFit0582', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0582 begin');
      await runCase('testEnumScaleToFit0582', async () => {
        const pair: number[] = mapPoints(matrixOf(drawing.ScaleToFit.FILL_SCALE_TO_FIT),
          [point(QUARTER, HALF), point(QUARTER, 0)]);
        expect(pair[0]).assertEqual(HALF);
        expect(pair[1]).assertEqual(HALF);
        expect(pair[2]).assertEqual(HALF);
        expect(pair[3]).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0582 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0583
     * @tc.name testEnumScaleToFit0583
     * @tc.desc Verify the start mode follows the fill mode in the enumeration order.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumScaleToFit0583', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0583 begin');
      await runCase('testEnumScaleToFit0583', async () => {
        expect(drawing.ScaleToFit.START_SCALE_TO_FIT - drawing.ScaleToFit.FILL_SCALE_TO_FIT).assertEqual(1);
        expect(drawing.ScaleToFit.START_SCALE_TO_FIT > drawing.ScaleToFit.FILL_SCALE_TO_FIT).assertTrue();
        expect(drawing.ScaleToFit.START_SCALE_TO_FIT < drawing.ScaleToFit.CENTER_SCALE_TO_FIT).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0583 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0584
     * @tc.name testEnumScaleToFit0584
     * @tc.desc Verify the start mode pins the source top left corner to the destination top left corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumScaleToFit0584', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0584 begin');
      await runCase('testEnumScaleToFit0584', async () => {
        const topLeft: number[] = mappedPair(drawing.ScaleToFit.START_SCALE_TO_FIT, 0, 0);
        expect(topLeft[0]).assertEqual(0);
        expect(topLeft[1]).assertEqual(0);
        expect(fitRectToRect(srcRect(), dstRect(), drawing.ScaleToFit.START_SCALE_TO_FIT)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0584 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0585
     * @tc.name testEnumScaleToFit0585
     * @tc.desc Verify the start mode keeps the aspect ratio so the bottom right corner stays inside.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumScaleToFit0585', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0585 begin');
      await runCase('testEnumScaleToFit0585', async () => {
        const bottomRight: number[] = mappedPair(drawing.ScaleToFit.START_SCALE_TO_FIT, SRC_EDGE, SRC_EDGE);
        expect(bottomRight[0]).assertEqual(SRC_EDGE);
        expect(bottomRight[1]).assertEqual(SRC_EDGE);
        expect(bottomRight[0] < DST_W).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0585 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0586
     * @tc.name testEnumScaleToFit0586
     * @tc.desc Verify the start mode leaves the source center left of the destination center.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumScaleToFit0586', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0586 begin');
      await runCase('testEnumScaleToFit0586', async () => {
        const center: number[] = mappedPair(drawing.ScaleToFit.START_SCALE_TO_FIT, HALF, HALF);
        expect(center[0]).assertEqual(HALF);
        expect(center[1]).assertEqual(HALF);
        expect(center[0] < DST_W / 2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0586 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0587
     * @tc.name testEnumScaleToFit0587
     * @tc.desc Verify the start mode box keeps the source size and leaves the right half empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumScaleToFit0587', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0587 begin');
      await runCase('testEnumScaleToFit0587', async () => {
        const box: number[] = boxOf(drawing.ScaleToFit.START_SCALE_TO_FIT);
        expect(box.length).assertEqual(4);
        expect(box[2] - box[0]).assertEqual(SRC_EDGE);
        expect(box[3] - box[1]).assertEqual(SRC_EDGE);
        expect(box[2] < DST_W).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0587 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0588
     * @tc.name testEnumScaleToFit0588
     * @tc.desc Verify the center mode follows the start mode in the enumeration order.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumScaleToFit0588', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0588 begin');
      await runCase('testEnumScaleToFit0588', async () => {
        expect(drawing.ScaleToFit.CENTER_SCALE_TO_FIT - drawing.ScaleToFit.START_SCALE_TO_FIT).assertEqual(1);
        expect(drawing.ScaleToFit.CENTER_SCALE_TO_FIT > drawing.ScaleToFit.START_SCALE_TO_FIT).assertTrue();
        expect(drawing.ScaleToFit.CENTER_SCALE_TO_FIT < drawing.ScaleToFit.END_SCALE_TO_FIT).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0588 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0589
     * @tc.name testEnumScaleToFit0589
     * @tc.desc Verify the center mode sends the source center to the destination center.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumScaleToFit0589', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0589 begin');
      await runCase('testEnumScaleToFit0589', async () => {
        const center: number[] = mappedPair(drawing.ScaleToFit.CENTER_SCALE_TO_FIT, HALF, HALF);
        expect(center[0]).assertEqual(DST_W / 2);
        expect(center[1]).assertEqual(DST_H / 2);
        expect(boxOf(drawing.ScaleToFit.CENTER_SCALE_TO_FIT)[0]).assertEqual((DST_W - SRC_EDGE) / 2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0589 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0590
     * @tc.name testEnumScaleToFit0590
     * @tc.desc Verify the center mode shifts the left edge by half of the leftover width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumScaleToFit0590', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0590 begin');
      await runCase('testEnumScaleToFit0590', async () => {
        const topLeft: number[] = mappedPair(drawing.ScaleToFit.CENTER_SCALE_TO_FIT, 0, 0);
        const bottomLeft: number[] = mappedPair(drawing.ScaleToFit.CENTER_SCALE_TO_FIT, 0, SRC_EDGE);
        expect(topLeft[0]).assertEqual(QUARTER * 2);
        expect(topLeft[1]).assertEqual(0);
        expect(bottomLeft[1]).assertEqual(SRC_EDGE);
        expect(bottomLeft[0]).assertEqual(topLeft[0]);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0590 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0591
     * @tc.name testEnumScaleToFit0591
     * @tc.desc Verify the center mode leaves the right edge short of the destination width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumScaleToFit0591', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0591 begin');
      await runCase('testEnumScaleToFit0591', async () => {
        const rightEdge: number[] = mappedPair(drawing.ScaleToFit.CENTER_SCALE_TO_FIT, SRC_EDGE, HALF);
        expect(rightEdge[0]).assertEqual(DST_W - QUARTER * 2);
        expect(rightEdge[1]).assertEqual(HALF);
        expect(rightEdge[0] < DST_W).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0591 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0592
     * @tc.name testEnumScaleToFit0592
     * @tc.desc Verify the center mode splits the leftover width into two equal gaps.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumScaleToFit0592', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0592 begin');
      await runCase('testEnumScaleToFit0592', async () => {
        const box: number[] = boxOf(drawing.ScaleToFit.CENTER_SCALE_TO_FIT);
        const leftGap: number = box[0];
        const rightGap: number = DST_W - box[2];
        expect(leftGap).assertEqual(rightGap);
        expect(leftGap > 0).assertTrue();
        expect(box[1]).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0592 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0593
     * @tc.name testEnumScaleToFit0593
     * @tc.desc Verify the end mode is the last value of the enumeration.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumScaleToFit0593', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0593 begin');
      await runCase('testEnumScaleToFit0593', async () => {
        expect(drawing.ScaleToFit.END_SCALE_TO_FIT - drawing.ScaleToFit.CENTER_SCALE_TO_FIT).assertEqual(1);
        expect(drawing.ScaleToFit.END_SCALE_TO_FIT > drawing.ScaleToFit.CENTER_SCALE_TO_FIT).assertTrue();
        expect(drawing.ScaleToFit.END_SCALE_TO_FIT > drawing.ScaleToFit.FILL_SCALE_TO_FIT).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0593 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0594
     * @tc.name testEnumScaleToFit0594
     * @tc.desc Verify the end mode pushes the source left edge to the right half.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumScaleToFit0594', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0594 begin');
      await runCase('testEnumScaleToFit0594', async () => {
        const topLeft: number[] = mappedPair(drawing.ScaleToFit.END_SCALE_TO_FIT, 0, 0);
        const topRight: number[] = mappedPair(drawing.ScaleToFit.END_SCALE_TO_FIT, SRC_EDGE, 0);
        expect(topLeft[0]).assertEqual(DST_W - SRC_EDGE);
        expect(topLeft[1]).assertEqual(0);
        expect(topRight[0]).assertEqual(DST_W);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0594 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0595
     * @tc.name testEnumScaleToFit0595
     * @tc.desc Verify the end mode box covers the right half of the destination rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumScaleToFit0595', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0595 begin');
      await runCase('testEnumScaleToFit0595', async () => {
        const box: number[] = boxOf(drawing.ScaleToFit.END_SCALE_TO_FIT);
        expect(box[2]).assertEqual(DST_W);
        expect(box[3]).assertEqual(DST_H);
        expect(box[0]).assertEqual(DST_W - SRC_EDGE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0595 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0596
     * @tc.name testEnumScaleToFit0596
     * @tc.desc Verify the end mode center sits one full gap right of the center mode center.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumScaleToFit0596', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0596 begin');
      await runCase('testEnumScaleToFit0596', async () => {
        const center: number[] = mappedPair(drawing.ScaleToFit.END_SCALE_TO_FIT, HALF, HALF);
        const centered: number[] = mappedPair(drawing.ScaleToFit.CENTER_SCALE_TO_FIT, HALF, HALF);
        expect(center[0]).assertEqual(DST_W - HALF);
        expect(center[1]).assertEqual(HALF);
        expect(center[0] - centered[0]).assertEqual(HALF);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0596 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0597
     * @tc.name testEnumScaleToFit0597
     * @tc.desc Verify the end mode keeps the source size and touches the right and bottom edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumScaleToFit0597', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0597 begin');
      await runCase('testEnumScaleToFit0597', async () => {
        const box: number[] = boxOf(drawing.ScaleToFit.END_SCALE_TO_FIT);
        expect(box[3] - box[1]).assertEqual(SRC_EDGE);
        expect(box[2] - box[0]).assertEqual(SRC_EDGE);
        expect(DST_W - box[2]).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumScaleToFit0597 end');
    });
  });
}
