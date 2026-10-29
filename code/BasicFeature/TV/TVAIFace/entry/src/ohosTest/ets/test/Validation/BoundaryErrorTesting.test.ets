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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { _ratio_enum, _scale_enum, bbox_pred, landmark_pred, nms_cpu, CRect2f } from '../../../../main/ets/utils/caffe';


interface TestFinalBox {
  x: number;
  y: number;
  width: number;
  height: number;
  size: number;
  w: number;
  h: number;
}

interface TestPoint {
  x: number;
  y: number;
}

interface TestFaceBox {
  finalbox: TestFinalBox;
  pts: TestPoint[];
  score: number;
}

interface BoxPrediction {
  x: number;
  y: number;
  w: number;
  h: number;
}

interface LandmarkPoint {
  x: number;
  y: number;
}

function makeFaceBox(x: number, y: number, w: number, h: number, score: number): TestFaceBox {
  return {
    finalbox: {
      x: x,
      y: y,
      width: w - x,
      height: h - y,
      size: (w - x) * (h - y),
      w: w,
      h: h
    },
    pts: [],
    score: score
  };
}


export default function boundaryErrorTestingTest(): void {
  describe('boundaryErrorTesting_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('BoundaryErrorTesting_ratio_anchor_25', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 19, 19], [0.6]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0][2] > anchors[0][0]).assertTrue();
    });


    it('BoundaryErrorTesting_bbox_pred_25', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 15, 15], [0, 0, 0, 0], 2, 2);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
    });


    /*
     * Face model scenario 2557-7 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2557', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 17, 17, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 2556-6 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2556', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 2555-5 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2555', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 15, 15], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 2554-4 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2554', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 14, 14], [0, 0, 0, 0], 2, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 2553-3 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2553', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 13, 13], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 13, 13], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 2552-2 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2552', 0, () => {
      const box: BoxPrediction = bbox_pred([8, 5, 23, 20], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 2551-1 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2551', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 11, 11], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.8, 1.8]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 2550-0 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2550', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 10, 10], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 2549-9 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2549', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(5, 2, 44, 41, 0.9), makeFaceBox(6, 3, 45, 42, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 2548-8 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2548', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 38, 38, 0.9), makeFaceBox(100, 100, 138, 138, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 2547-7 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2547', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 37, 37, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 2546-6 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2546', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 2545-5 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2545', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 35, 35], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 2544-4 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2544', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 34, 34], [0, 0, 0, 0], 1, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 2543-3 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2543', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 33, 33], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 33, 33], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 2542-2 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2542', 0, () => {
      const box: BoxPrediction = bbox_pred([10, 4, 25, 19], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 2541-1 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2541', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 31, 31], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.6, 1.6]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 2540-0 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2540', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 30, 30], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 2539-9 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2539', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(7, 1, 36, 30, 0.9), makeFaceBox(8, 2, 37, 31, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 2538-8 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2538', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 28, 28, 0.9), makeFaceBox(100, 100, 128, 128, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 2537-7 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2537', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 27, 27, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 2536-6 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2536', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 2535-5 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2535', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 25, 25], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 2534-4 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2534', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 24, 24], [0, 0, 0, 0], 3, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 2533-3 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2533', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 23, 23], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 23, 23], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 2532-2 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2532', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 3, 15, 18], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 2531-1 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2531', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 21, 21], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.8, 1.8]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 2530-0 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2530', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 20, 20], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 2529-9 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2529', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(9, 0, 28, 19, 0.9), makeFaceBox(10, 1, 29, 20, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 2528-8 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2528', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 18, 18, 0.9), makeFaceBox(100, 100, 118, 118, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 2527-7 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2527', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 17, 17, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 2526-6 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2526', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 2525-5 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2525', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 15, 15], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 2524-4 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2524', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 14, 14], [0, 0, 0, 0], 2, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 2523-3 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2523', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 13, 13], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 13, 13], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 2522-2 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2522', 0, () => {
      const box: BoxPrediction = bbox_pred([2, 2, 17, 17], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 2521-1 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2521', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 11, 11], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.6, 1.6]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 2520-0 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2520', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 10, 10], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 2519-9 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2519', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(11, 8, 50, 47, 0.9), makeFaceBox(12, 9, 51, 48, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 2518-8 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2518', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 38, 38, 0.9), makeFaceBox(100, 100, 138, 138, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 2517-7 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2517', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 37, 37, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 2516-6 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2516', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 2515-5 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2515', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 35, 35], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 2514-4 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2514', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 34, 34], [0, 0, 0, 0], 1, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 2513-3 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2513', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 33, 33], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 33, 33], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 2512-2 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2512', 0, () => {
      const box: BoxPrediction = bbox_pred([4, 1, 19, 16], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 2511-1 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2511', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 31, 31], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.8, 1.8]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 2510-0 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2510', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 30, 30], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 2509-9 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2509', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(1, 7, 30, 36, 0.9), makeFaceBox(2, 8, 31, 37, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 2508-8 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2508', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 28, 28, 0.9), makeFaceBox(100, 100, 128, 128, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 2507-7 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2507', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 27, 27, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 2506-6 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2506', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 2505-5 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2505', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 25, 25], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 2504-4 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2504', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 24, 24], [0, 0, 0, 0], 3, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 2503-3 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2503', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 23, 23], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 23, 23], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 2502-2 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2502', 0, () => {
      const box: BoxPrediction = bbox_pred([6, 0, 21, 15], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 2501-1 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2501', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 21, 21], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.6, 1.6]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 2500-0 for BoundaryErrorTesting.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('BoundaryErrorTesting_face_case_2500', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 20, 20], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

  });
}
