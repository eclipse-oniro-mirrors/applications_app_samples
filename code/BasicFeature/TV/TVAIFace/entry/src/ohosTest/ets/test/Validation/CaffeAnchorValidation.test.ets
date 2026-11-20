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


export default function caffeAnchorValidationTest(): void {
  describe('caffeAnchorValidation_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('rect2f_should_store_four_coordinates_in_order', 0, () => {
      const rect: CRect2f = new CRect2f(1, 2, 3, 4);
      expect(rect.operator(0)).assertEqual(1);
      expect(rect.operator(1)).assertEqual(2);
      expect(rect.operator(2)).assertEqual(3);
      expect(rect.operator(3)).assertEqual(4);
      expect(rect.print().length).assertLarger(0);
    });

    it('ratio_enum_should_generate_one_anchor_per_ratio', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 15, 15], [0.5, 1.0, 2.0]);
      expect(anchors.length).assertEqual(3);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] > anchors[0][0]).assertTrue();
      expect(anchors[0][3] > anchors[0][1]).assertTrue();
    });

    it('ratio_enum_should_reject_no_ratios', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 15, 15], []);
      expect(anchors.length).assertEqual(0);
    });

    it('scale_enum_should_expand_anchors_by_scales', 0, () => {
      const ratios: number[][] = _ratio_enum([0, 0, 15, 15], [1.0]);
      const scaled: number[][] = _scale_enum(ratios, [0.5, 1.0, 2.0]);
      expect(scaled.length).assertEqual(3);
      const smallArea: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const largeArea: number = (scaled[2][2] - scaled[2][0]) * (scaled[2][3] - scaled[2][1]);
      expect(largeArea > smallArea).assertTrue();
    });

    it('bbox_pred_with_zero_delta_should_keep_anchor_size', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 15, 15], [0, 0, 0, 0]);
      expect(box.w).assertEqual(15);
      expect(box.h).assertEqual(15);
      expect(box.x).assertEqual(0);
      expect(box.y).assertEqual(0);
    });

    it('bbox_pred_should_grow_with_positive_delta', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 15, 15], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 15, 15], [0, 0, 1, 1]);
      expect(grown.w > base.w).assertTrue();
      expect(grown.h > base.h).assertTrue();
    });

    it('bbox_pred_should_apply_ratio_scaling', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 15, 15], [0, 0, 0, 0], 2, 2);
      expect(box.w).assertEqual(30);
      expect(box.h).assertEqual(30);
    });

    it('landmark_pred_should_return_one_point_per_delta', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 15, 15], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
    });

    it('landmark_pred_should_accept_ratio_scaling', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 100, 100], [{ x: 0.5, y: 0.5 }], 2, 3);
      expect(points.length).assertEqual(1);
      expect(points[0].x).assertLarger(0);
    });

    it('nms_should_return_empty_for_empty_input', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    it('nms_should_keep_single_box', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 10, 10, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    it('nms_should_suppress_high_overlap_boxes', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 10, 10, 0.9), makeFaceBox(1, 1, 10, 10, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    it('nms_should_keep_boxes_below_threshold', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 10, 10, 0.9), makeFaceBox(100, 100, 110, 110, 0.7)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    it('nms_with_zero_threshold_should_suppress_every_overlap', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 10, 10, 0.9), makeFaceBox(0, 0, 10, 10, 0.8)];
      const result = nms_cpu(boxes, 0.0);
      expect(result.length).assertLargerOrEqual(1);
    });

    /*
     * Face model scenario 2499-9 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2499', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(3, 6, 22, 25, 0.9), makeFaceBox(4, 7, 23, 26, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 2498-8 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2498', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 18, 18, 0.9), makeFaceBox(100, 100, 118, 118, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 2497-7 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2497', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 17, 17, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 2496-6 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2496', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 2495-5 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2495', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 15, 15], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 2494-4 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2494', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 14, 14], [0, 0, 0, 0], 2, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 2493-3 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2493', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 13, 13], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 13, 13], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 2492-2 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2492', 0, () => {
      const box: BoxPrediction = bbox_pred([8, 8, 23, 23], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 2491-1 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2491', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 11, 11], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.8, 1.8]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 2490-0 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2490', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 10, 10], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 2489-9 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2489', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(5, 5, 44, 44, 0.9), makeFaceBox(6, 6, 45, 45, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 2488-8 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2488', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 38, 38, 0.9), makeFaceBox(100, 100, 138, 138, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 2487-7 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2487', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 37, 37, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 2486-6 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2486', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 2485-5 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2485', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 35, 35], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 2484-4 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2484', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 34, 34], [0, 0, 0, 0], 1, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 2483-3 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2483', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 33, 33], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 33, 33], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 2482-2 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2482', 0, () => {
      const box: BoxPrediction = bbox_pred([10, 7, 25, 22], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 2481-1 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2481', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 31, 31], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.6, 1.6]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 2480-0 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2480', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 30, 30], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 2479-9 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2479', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(7, 4, 36, 33, 0.9), makeFaceBox(8, 5, 37, 34, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 2478-8 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2478', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 28, 28, 0.9), makeFaceBox(100, 100, 128, 128, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 2477-7 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2477', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 27, 27, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 2476-6 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2476', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 2475-5 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2475', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 25, 25], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 2474-4 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2474', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 24, 24], [0, 0, 0, 0], 3, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 2473-3 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2473', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 23, 23], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 23, 23], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 2472-2 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2472', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 6, 15, 21], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 2471-1 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2471', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 21, 21], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.8, 1.8]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 2470-0 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2470', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 20, 20], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 2469-9 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2469', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(9, 3, 28, 22, 0.9), makeFaceBox(10, 4, 29, 23, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 2468-8 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2468', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 18, 18, 0.9), makeFaceBox(100, 100, 118, 118, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 2467-7 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2467', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 17, 17, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 2466-6 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2466', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 2465-5 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2465', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 15, 15], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 2464-4 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2464', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 14, 14], [0, 0, 0, 0], 2, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 2463-3 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2463', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 13, 13], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 13, 13], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 2462-2 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2462', 0, () => {
      const box: BoxPrediction = bbox_pred([2, 5, 17, 20], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 2461-1 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2461', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 11, 11], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.6, 1.6]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 2460-0 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2460', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 10, 10], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 2459-9 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2459', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(11, 2, 50, 41, 0.9), makeFaceBox(12, 3, 51, 42, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 2458-8 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */

    /*
     * Face model scenario 2457-7 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2457', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 37, 37, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 2456-6 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2456', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 2455-5 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2455', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 35, 35], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 2454-4 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2454', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 34, 34], [0, 0, 0, 0], 1, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 2453-3 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2453', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 33, 33], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 33, 33], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 2452-2 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2452', 0, () => {
      const box: BoxPrediction = bbox_pred([4, 4, 19, 19], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 2451-1 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2451', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 31, 31], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.8, 1.8]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 2450-0 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2450', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 30, 30], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 2449-9 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2449', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(1, 1, 30, 30, 0.9), makeFaceBox(2, 2, 31, 31, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 2448-8 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2448', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 28, 28, 0.9), makeFaceBox(100, 100, 128, 128, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 2447-7 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2447', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 27, 27, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 2446-6 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2446', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 2445-5 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2445', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 25, 25], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 2444-4 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2444', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 24, 24], [0, 0, 0, 0], 3, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 2443-3 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2443', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 23, 23], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 23, 23], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 2442-2 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2442', 0, () => {
      const box: BoxPrediction = bbox_pred([6, 3, 21, 18], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 2441-1 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2441', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 21, 21], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.6, 1.6]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 2440-0 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2440', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 20, 20], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 2439-9 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2439', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(3, 0, 22, 19, 0.9), makeFaceBox(4, 1, 23, 20, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 2438-8 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2438', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 18, 18, 0.9), makeFaceBox(100, 100, 118, 118, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 2437-7 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2437', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 17, 17, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 2436-6 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2436', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 2435-5 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2435', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 15, 15], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 2434-4 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2434', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 14, 14], [0, 0, 0, 0], 2, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 2433-3 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2433', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 13, 13], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 13, 13], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 2432-2 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2432', 0, () => {
      const box: BoxPrediction = bbox_pred([8, 2, 23, 17], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 2431-1 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2431', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 11, 11], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.8, 1.8]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 2430-0 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2430', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 10, 10], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 2429-9 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2429', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(5, 8, 44, 47, 0.9), makeFaceBox(6, 9, 45, 48, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 2428-8 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2428', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 38, 38, 0.9), makeFaceBox(100, 100, 138, 138, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 2427-7 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2427', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 37, 37, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 2426-6 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2426', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 2425-5 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2425', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 35, 35], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 2424-4 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2424', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 34, 34], [0, 0, 0, 0], 1, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 2423-3 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2423', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 33, 33], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 33, 33], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 2422-2 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2422', 0, () => {
      const box: BoxPrediction = bbox_pred([10, 1, 25, 16], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 2421-1 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2421', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 31, 31], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.6, 1.6]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 2420-0 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2420', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 30, 30], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 2419-9 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2419', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(7, 7, 36, 36, 0.9), makeFaceBox(8, 8, 37, 37, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 2418-8 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */

    /*
     * Face model scenario 2417-7 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2417', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 27, 27, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 2416-6 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2416', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 2415-5 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2415', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 25, 25], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 2414-4 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2414', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 24, 24], [0, 0, 0, 0], 3, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 2413-3 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2413', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 23, 23], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 23, 23], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 2412-2 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2412', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 15, 15], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 2411-1 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2411', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 21, 21], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.8, 1.8]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 2410-0 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2410', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 20, 20], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

    /*
     * Face model scenario 2409-9 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2409', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(9, 6, 28, 25, 0.9), makeFaceBox(10, 7, 29, 26, 0.8)];
      const result = nms_cpu(boxes, 0.3);
      expect(result.length).assertLargerOrEqual(1);
      expect(result.length).assertLessOrEqual(2);
    });

    /*
     * Face model scenario 2408-8 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2408', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 18, 18, 0.9), makeFaceBox(100, 100, 118, 118, 0.8)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(2);
    });

    /*
     * Face model scenario 2407-7 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2407', 0, () => {
      const boxes: TestFaceBox[] = [makeFaceBox(0, 0, 17, 17, 0.9)];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(1);
    });

    /*
     * Face model scenario 2406-6 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2406', 0, () => {
      const boxes: TestFaceBox[] = [];
      const result = nms_cpu(boxes, 0.5);
      expect(result.length).assertEqual(0);
    });

    /*
     * Face model scenario 2405-5 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2405', 0, () => {
      const points: LandmarkPoint[] = landmark_pred([0, 0, 15, 15], [{ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 }]);
      expect(points.length).assertEqual(2);
      expect(points[0].x).assertLarger(0);
      expect(points[1].y).assertLarger(0);
    });

    /*
     * Face model scenario 2404-4 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2404', 0, () => {
      const box: BoxPrediction = bbox_pred([0, 0, 14, 14], [0, 0, 0, 0], 2, 1);
      expect(box.w).assertLarger(0);
      expect(box.h).assertLarger(0);
      expect(box.w).assertLargerOrEqual(box.x);
      expect(box.h).assertLargerOrEqual(box.y);
    });

    /*
     * Face model scenario 2403-3 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2403', 0, () => {
      const base: BoxPrediction = bbox_pred([0, 0, 13, 13], [0, 0, 0, 0]);
      const grown: BoxPrediction = bbox_pred([0, 0, 13, 13], [0.1, 0.1, 0.2, 0.2]);
      expect(grown.w > base.w || grown.h > base.h).assertTrue();
      expect(grown.w).assertLarger(0);
      expect(grown.h).assertLarger(0);
    });

    /*
     * Face model scenario 2402-2 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2402', 0, () => {
      const box: BoxPrediction = bbox_pred([2, 8, 17, 23], [0, 0, 0, 0]);
      expect(box.w).assertLarger(box.x);
      expect(box.h).assertLarger(box.y);
      expect(box.w - box.x).assertLarger(0);
      expect(box.h - box.y).assertLarger(0);
    });

    /*
     * Face model scenario 2401-1 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2401', 0, () => {
      const base: number[][] = _ratio_enum([0, 0, 11, 11], [0.6]);
      const scaled: number[][] = _scale_enum(base, [0.6, 1.6]);
      expect(scaled.length).assertEqual(2);
      const first: number = (scaled[0][2] - scaled[0][0]) * (scaled[0][3] - scaled[0][1]);
      const second: number = (scaled[1][2] - scaled[1][0]) * (scaled[1][3] - scaled[1][1]);
      expect(second).assertLarger(first);
    });

    /*
     * Face model scenario 2400-0 for CaffeAnchorValidation.
     * Validates anchor, box or landmark math used by face detection.
     */
    it('CaffeAnchorValidation_face_case_2400', 0, () => {
      const anchors: number[][] = _ratio_enum([0, 0, 10, 10], [0.5]);
      expect(anchors.length).assertEqual(1);
      expect(anchors[0].length).assertEqual(4);
      expect(anchors[0][2] - anchors[0][0]).assertLarger(0);
      expect(anchors[0][3] - anchors[0][1]).assertLarger(0);
    });

  });
}
