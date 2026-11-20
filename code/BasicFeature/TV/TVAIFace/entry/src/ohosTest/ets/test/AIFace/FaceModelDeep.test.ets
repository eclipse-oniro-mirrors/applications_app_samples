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


export default function faceModelDeepTest(): void {
  describe('faceModelDeep_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('FaceModelDeep_ratio_anchor_4', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 19, 19], [0.6]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0][2] > anchors[0][0]).assertTrue();
    });


    it('FaceModelDeep_bbox_pred_4', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 15, 15], [0, 0, 0, 0], 2, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
    });


    /*
     * Face model scenario 485-5 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_485', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 15, 15], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 484-4 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_484', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 14, 14], [0, 0, 0, 0], 2, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 483-3 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_483', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 13, 13], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 13, 13], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 482-2 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_482', 0, () => {
      const box: BoxPrediction = bbox_pred([2, 5, 17, 20], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 481-1 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_481', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 11, 11], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.6, 1.6]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 480-0 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_480', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 10, 10], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 479-9 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_479', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(11, 2, 50, 41, 0.9), makeFaceBox(12, 3, 51, 42, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 478-8 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_478', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 38, 38, 0.9), makeFaceBox(100, 100, 138, 138, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 477-7 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_477', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 37, 37, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 476-6 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_476', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 475-5 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_475', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 35, 35], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 474-4 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_474', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 34, 34], [0, 0, 0, 0], 1, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 473-3 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_473', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 33, 33], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 33, 33], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 472-2 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_472', 0, () => {
      const box: BoxPrediction = bbox_pred([4, 4, 19, 19], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 471-1 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_471', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 31, 31], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.8, 1.8]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 470-0 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_470', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 30, 30], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 469-9 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_469', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(1, 1, 30, 30, 0.9), makeFaceBox(2, 2, 31, 31, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 468-8 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_468', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 28, 28, 0.9), makeFaceBox(100, 100, 128, 128, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 467-7 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_467', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 27, 27, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 466-6 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */

    /*
     * Face model scenario 465-5 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_465', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 25, 25], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 464-4 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_464', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 24, 24], [0, 0, 0, 0], 3, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 463-3 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_463', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 23, 23], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 23, 23], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 462-2 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_462', 0, () => {
      const box: BoxPrediction = bbox_pred([6, 3, 21, 18], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 461-1 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_461', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 21, 21], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.6, 1.6]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 460-0 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_460', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 20, 20], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 459-9 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_459', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(3, 0, 22, 19, 0.9), makeFaceBox(4, 1, 23, 20, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 458-8 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_458', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 18, 18, 0.9), makeFaceBox(100, 100, 118, 118, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 457-7 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_457', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 17, 17, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 456-6 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_456', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 455-5 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_455', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 15, 15], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 454-4 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_454', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 14, 14], [0, 0, 0, 0], 2, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 453-3 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_453', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 13, 13], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 13, 13], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 452-2 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_452', 0, () => {
      const box: BoxPrediction = bbox_pred([8, 2, 23, 17], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 451-1 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_451', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 11, 11], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.8, 1.8]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 450-0 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_450', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 10, 10], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 449-9 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_449', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(5, 8, 44, 47, 0.9), makeFaceBox(6, 9, 45, 48, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 448-8 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_448', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 38, 38, 0.9), makeFaceBox(100, 100, 138, 138, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 447-7 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_447', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 37, 37, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 446-6 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_446', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 445-5 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_445', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 35, 35], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 444-4 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_444', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 34, 34], [0, 0, 0, 0], 1, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 443-3 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_443', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 33, 33], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 33, 33], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 442-2 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_442', 0, () => {
      const box: BoxPrediction = bbox_pred([10, 1, 25, 16], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 441-1 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_441', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 31, 31], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.6, 1.6]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 440-0 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_440', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 30, 30], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 439-9 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_439', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(7, 7, 36, 36, 0.9), makeFaceBox(8, 8, 37, 37, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 438-8 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_438', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 28, 28, 0.9), makeFaceBox(100, 100, 128, 128, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 437-7 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */

    /*
     * Face model scenario 436-6 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */

    /*
     * Face model scenario 435-5 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_435', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 25, 25], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 434-4 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_434', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 24, 24], [0, 0, 0, 0], 3, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 433-3 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_433', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 23, 23], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 23, 23], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 432-2 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_432', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 15, 15], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 431-1 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_431', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 21, 21], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.8, 1.8]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 430-0 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_430', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 20, 20], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 429-9 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_429', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(9, 6, 28, 25, 0.9), makeFaceBox(10, 7, 29, 26, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 428-8 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_428', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 18, 18, 0.9), makeFaceBox(100, 100, 118, 118, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 427-7 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_427', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 17, 17, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 426-6 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_426', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 425-5 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_425', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 15, 15], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 424-4 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_424', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 14, 14], [0, 0, 0, 0], 2, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 423-3 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_423', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 13, 13], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 13, 13], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 422-2 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_422', 0, () => {
      const box: BoxPrediction = bbox_pred([2, 8, 17, 23], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 421-1 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_421', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 11, 11], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.6, 1.6]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 420-0 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_420', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 10, 10], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 419-9 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_419', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(11, 5, 50, 44, 0.9), makeFaceBox(12, 6, 51, 45, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 418-8 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_418', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 38, 38, 0.9), makeFaceBox(100, 100, 138, 138, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 417-7 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_417', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 37, 37, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 416-6 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_416', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 415-5 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_415', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 35, 35], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 414-4 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_414', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 34, 34], [0, 0, 0, 0], 1, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 413-3 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_413', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 33, 33], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 33, 33], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 412-2 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_412', 0, () => {
      const box: BoxPrediction = bbox_pred([4, 7, 19, 22], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 411-1 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_411', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 31, 31], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.8, 1.8]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 410-0 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_410', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 30, 30], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 409-9 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_409', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(1, 4, 30, 33, 0.9), makeFaceBox(2, 5, 31, 34, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 408-8 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_408', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 28, 28, 0.9), makeFaceBox(100, 100, 128, 128, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 407-7 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_407', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 27, 27, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 406-6 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_406', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 405-5 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_405', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 25, 25], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 404-4 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_404', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 24, 24], [0, 0, 0, 0], 3, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 403-3 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_403', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 23, 23], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 23, 23], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 402-2 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_402', 0, () => {
      const box: BoxPrediction = bbox_pred([6, 6, 21, 21], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 401-1 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_401', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 21, 21], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.6, 1.6]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 400-0 for FaceModelDeep.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('FaceModelDeep_face_case_400', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 20, 20], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

  });
}
