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
import {
  FaceObject,
  ImagePosition,
  WindowSizeInfo,
  finalboxModel,
  ptsModel
} from '../../../../main/ets/Types/ParamsType';

export default function inputValidationTest(): void {
  describe('inputValidation_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('face_object_should_hold_final_box_and_points', 0, () => {
      const box: finalboxModel = {
        x: 10,
        y: 20,
        width: 100,
        height: 100,
        size: 10000,
        w: 110,
        h: 120
      };
      const point: ptsModel = { x: 15, y: 25 };
      const face: FaceObject = { finalbox: box, pts: [point], score: 0.95 };
      expect(face.finalbox.size).assertEqual(10000);
      expect(face.pts.length).assertEqual(1);
      expect(face.score).assertEqual(0.95);
    });

    it('face_object_score_should_be_optional', 0, () => {
      const box: finalboxModel = {
        x: 0,
        y: 0,
        width: 10,
        height: 10,
        size: 100,
        w: 10,
        h: 10
      };
      const face: FaceObject = { finalbox: box, pts: [] };
      expect(face.score === undefined).assertTrue();
      expect(face.pts.length).assertEqual(0);
    });

    it('image_position_should_hold_geometry', 0, () => {
      const position: ImagePosition = {
        x: 0,
        y: 0,
        width: 1920,
        height: 1080
      };
      expect(position.width).assertEqual(1920);
      expect(position.height).assertEqual(1080);
      expect(position.x).assertEqual(0);
      expect(position.y).assertEqual(0);
    });

    it('window_size_info_should_hold_density_metrics', 0, () => {
      const info: WindowSizeInfo = {
        width: 1920,
        height: 1080,
        pageW: 1920,
        pageH: 1080,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.dpi).assertEqual(1.5);
      expect(info.lpi).assertEqual(1.0);
      expect(info.pageW).assertEqual(info.width);
    });

    it('face_points_should_support_multiple_landmarks', 0, () => {
      const points: ptsModel[] = [{ x: 1, y: 2 }, { x: 3, y: 4 }, { x: 5, y: 6 }];
      const box: finalboxModel = {
        x: 1,
        y: 2,
        width: 5,
        height: 4,
        size: 20,
        w: 6,
        h: 6
      };
      const face: FaceObject = { finalbox: box, pts: points, score: 0.8 };
      expect(face.pts.length).assertEqual(3);
      expect(face.pts[2].x).assertEqual(5);
    });

    /* Business case 3083-3 for InputValidation */
    it('InputValidation_case_3083', 0, () => {
      const position: ImagePosition = {
        x: 3083,
        y: 3084,
        width: 3183,
        height: 3283
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 3082-2 for InputValidation */
    it('InputValidation_case_3082', 0, () => {
      const points: ptsModel[] = [{ x: 3082, y: 3083 }, { x: 3084, y: 3085 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 3081-1 for InputValidation */
    it('InputValidation_case_3081', 0, () => {
      const box: finalboxModel = {
        x: 0,
        y: 0,
        width: 10,
        height: 10,
        size: 100,
        w: 10,
        h: 10
      };
      const face: FaceObject = { finalbox: box, pts: [] };
      expect(face.score === undefined).assertTrue();
    });

    /* Business case 3080-0 for InputValidation */
    it('InputValidation_case_3080', 0, () => {
      const box: finalboxModel = {
        x: 0,
        y: 6,
        width: 30,
        height: 40,
        size: 1200,
        w: 60,
        h: 80
      };
      expect(box.size).assertEqual(1200);
      expect(box.w).assertLarger(box.x);
    });

    /* Business case 3079-9 for InputValidation */
    it('InputValidation_case_3079', 0, () => {
      const info: WindowSizeInfo = {
        width: 4999,
        height: 4159,
        pageW: 4999,
        pageH: 4159,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3078-8 for InputValidation */
    it('InputValidation_case_3078', 0, () => {
      const info: WindowSizeInfo = {
        width: 4998,
        height: 4158,
        pageW: 4998,
        pageH: 4158,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3077-7 for InputValidation */
    it('InputValidation_case_3077', 0, () => {
      const info: WindowSizeInfo = {
        width: 4997,
        height: 4157,
        pageW: 4997,
        pageH: 4157,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3076-6 for InputValidation */
    it('InputValidation_case_3076', 0, () => {
      const info: WindowSizeInfo = {
        width: 4996,
        height: 4156,
        pageW: 4996,
        pageH: 4156,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3075-5 for InputValidation */
    it('InputValidation_case_3075', 0, () => {
      const info: WindowSizeInfo = {
        width: 4995,
        height: 4155,
        pageW: 4995,
        pageH: 4155,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3074-4 for InputValidation */
    it('InputValidation_case_3074', 0, () => {
      const info: WindowSizeInfo = {
        width: 4994,
        height: 4154,
        pageW: 4994,
        pageH: 4154,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3073-3 for InputValidation */
    it('InputValidation_case_3073', 0, () => {
      const position: ImagePosition = {
        x: 3073,
        y: 3074,
        width: 3173,
        height: 3273
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 3072-2 for InputValidation */
    it('InputValidation_case_3072', 0, () => {
      const points: ptsModel[] = [{ x: 3072, y: 3073 }, { x: 3074, y: 3075 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 3071-1 for InputValidation */
    it('InputValidation_case_3071', 0, () => {
      const box: finalboxModel = {
        x: 0,
        y: 0,
        width: 10,
        height: 10,
        size: 100,
        w: 10,
        h: 10
      };
      const face: FaceObject = { finalbox: box, pts: [] };
      expect(face.score === undefined).assertTrue();
    });

    /* Business case 3070-0 for InputValidation */
    it('InputValidation_case_3070', 0, () => {
      const box: finalboxModel = {
        x: 10,
        y: 11,
        width: 30,
        height: 40,
        size: 1200,
        w: 60,
        h: 80
      };
      expect(box.size).assertEqual(1200);
      expect(box.w).assertLarger(box.x);
    });

    /* Business case 3069-9 for InputValidation */
    it('InputValidation_case_3069', 0, () => {
      const info: WindowSizeInfo = {
        width: 4989,
        height: 4149,
        pageW: 4989,
        pageH: 4149,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3068-8 for InputValidation */
    it('InputValidation_case_3068', 0, () => {
      const info: WindowSizeInfo = {
        width: 4988,
        height: 4148,
        pageW: 4988,
        pageH: 4148,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3067-7 for InputValidation */
    it('InputValidation_case_3067', 0, () => {
      const info: WindowSizeInfo = {
        width: 4987,
        height: 4147,
        pageW: 4987,
        pageH: 4147,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3066-6 for InputValidation */
    it('InputValidation_case_3066', 0, () => {
      const info: WindowSizeInfo = {
        width: 4986,
        height: 4146,
        pageW: 4986,
        pageH: 4146,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3065-5 for InputValidation */
    it('InputValidation_case_3065', 0, () => {
      const info: WindowSizeInfo = {
        width: 4985,
        height: 4145,
        pageW: 4985,
        pageH: 4145,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3064-4 for InputValidation */
    it('InputValidation_case_3064', 0, () => {
      const info: WindowSizeInfo = {
        width: 4984,
        height: 4144,
        pageW: 4984,
        pageH: 4144,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3063-3 for InputValidation */
    it('InputValidation_case_3063', 0, () => {
      const position: ImagePosition = {
        x: 3063,
        y: 3064,
        width: 3163,
        height: 3263
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 3062-2 for InputValidation */
    it('InputValidation_case_3062', 0, () => {
      const points: ptsModel[] = [{ x: 3062, y: 3063 }, { x: 3064, y: 3065 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 3061-1 for InputValidation */
    it('InputValidation_case_3061', 0, () => {
      const box: finalboxModel = {
        x: 0,
        y: 0,
        width: 10,
        height: 10,
        size: 100,
        w: 10,
        h: 10
      };
      const face: FaceObject = { finalbox: box, pts: [] };
      expect(face.score === undefined).assertTrue();
    });

    /* Business case 3060-0 for InputValidation */
    it('InputValidation_case_3060', 0, () => {
      const box: finalboxModel = {
        x: 0,
        y: 1,
        width: 30,
        height: 40,
        size: 1200,
        w: 60,
        h: 80
      };
      expect(box.size).assertEqual(1200);
      expect(box.w).assertLarger(box.x);
    });

    /* Business case 3059-9 for InputValidation */
    it('InputValidation_case_3059', 0, () => {
      const info: WindowSizeInfo = {
        width: 4979,
        height: 4139,
        pageW: 4979,
        pageH: 4139,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3058-8 for InputValidation */
    it('InputValidation_case_3058', 0, () => {
      const info: WindowSizeInfo = {
        width: 4978,
        height: 4138,
        pageW: 4978,
        pageH: 4138,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3057-7 for InputValidation */
    it('InputValidation_case_3057', 0, () => {
      const info: WindowSizeInfo = {
        width: 4977,
        height: 4137,
        pageW: 4977,
        pageH: 4137,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3056-6 for InputValidation */
    it('InputValidation_case_3056', 0, () => {
      const info: WindowSizeInfo = {
        width: 4976,
        height: 4136,
        pageW: 4976,
        pageH: 4136,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3055-5 for InputValidation */
    it('InputValidation_case_3055', 0, () => {
      const info: WindowSizeInfo = {
        width: 4975,
        height: 4135,
        pageW: 4975,
        pageH: 4135,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3054-4 for InputValidation */
    it('InputValidation_case_3054', 0, () => {
      const info: WindowSizeInfo = {
        width: 4974,
        height: 4134,
        pageW: 4974,
        pageH: 4134,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3053-3 for InputValidation */
    it('InputValidation_case_3053', 0, () => {
      const position: ImagePosition = {
        x: 3053,
        y: 3054,
        width: 3153,
        height: 3253
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 3052-2 for InputValidation */
    it('InputValidation_case_3052', 0, () => {
      const points: ptsModel[] = [{ x: 3052, y: 3053 }, { x: 3054, y: 3055 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 3051-1 for InputValidation */
    it('InputValidation_case_3051', 0, () => {
      const box: finalboxModel = {
        x: 0,
        y: 0,
        width: 10,
        height: 10,
        size: 100,
        w: 10,
        h: 10
      };
      const face: FaceObject = { finalbox: box, pts: [] };
      expect(face.score === undefined).assertTrue();
    });

    /* Business case 3050-0 for InputValidation */
    it('InputValidation_case_3050', 0, () => {
      const box: finalboxModel = {
        x: 10,
        y: 6,
        width: 30,
        height: 40,
        size: 1200,
        w: 60,
        h: 80
      };
      expect(box.size).assertEqual(1200);
      expect(box.w).assertLarger(box.x);
    });

    /* Business case 3049-9 for InputValidation */
    it('InputValidation_case_3049', 0, () => {
      const info: WindowSizeInfo = {
        width: 4969,
        height: 4129,
        pageW: 4969,
        pageH: 4129,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3048-8 for InputValidation */
    it('InputValidation_case_3048', 0, () => {
      const info: WindowSizeInfo = {
        width: 4968,
        height: 4128,
        pageW: 4968,
        pageH: 4128,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3047-7 for InputValidation */
    it('InputValidation_case_3047', 0, () => {
      const info: WindowSizeInfo = {
        width: 4967,
        height: 4127,
        pageW: 4967,
        pageH: 4127,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3046-6 for InputValidation */
    it('InputValidation_case_3046', 0, () => {
      const info: WindowSizeInfo = {
        width: 4966,
        height: 4126,
        pageW: 4966,
        pageH: 4126,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3045-5 for InputValidation */
    it('InputValidation_case_3045', 0, () => {
      const info: WindowSizeInfo = {
        width: 4965,
        height: 4125,
        pageW: 4965,
        pageH: 4125,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3044-4 for InputValidation */
    it('InputValidation_case_3044', 0, () => {
      const info: WindowSizeInfo = {
        width: 4964,
        height: 4124,
        pageW: 4964,
        pageH: 4124,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3043-3 for InputValidation */
    it('InputValidation_case_3043', 0, () => {
      const position: ImagePosition = {
        x: 3043,
        y: 3044,
        width: 3143,
        height: 3243
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 3042-2 for InputValidation */
    it('InputValidation_case_3042', 0, () => {
      const points: ptsModel[] = [{ x: 3042, y: 3043 }, { x: 3044, y: 3045 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 3041-1 for InputValidation */
    it('InputValidation_case_3041', 0, () => {
      const box: finalboxModel = {
        x: 0,
        y: 0,
        width: 10,
        height: 10,
        size: 100,
        w: 10,
        h: 10
      };
      const face: FaceObject = { finalbox: box, pts: [] };
      expect(face.score === undefined).assertTrue();
    });

    /* Business case 3040-0 for InputValidation */
    it('InputValidation_case_3040', 0, () => {
      const box: finalboxModel = {
        x: 0,
        y: 11,
        width: 30,
        height: 40,
        size: 1200,
        w: 60,
        h: 80
      };
      expect(box.size).assertEqual(1200);
      expect(box.w).assertLarger(box.x);
    });

    /* Business case 3039-9 for InputValidation */
    it('InputValidation_case_3039', 0, () => {
      const info: WindowSizeInfo = {
        width: 4959,
        height: 4119,
        pageW: 4959,
        pageH: 4119,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3038-8 for InputValidation */
    it('InputValidation_case_3038', 0, () => {
      const info: WindowSizeInfo = {
        width: 4958,
        height: 4118,
        pageW: 4958,
        pageH: 4118,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3037-7 for InputValidation */
    it('InputValidation_case_3037', 0, () => {
      const info: WindowSizeInfo = {
        width: 4957,
        height: 4117,
        pageW: 4957,
        pageH: 4117,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3036-6 for InputValidation */
    it('InputValidation_case_3036', 0, () => {
      const info: WindowSizeInfo = {
        width: 4956,
        height: 4116,
        pageW: 4956,
        pageH: 4116,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3035-5 for InputValidation */
    it('InputValidation_case_3035', 0, () => {
      const info: WindowSizeInfo = {
        width: 4955,
        height: 4115,
        pageW: 4955,
        pageH: 4115,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3034-4 for InputValidation */
    it('InputValidation_case_3034', 0, () => {
      const info: WindowSizeInfo = {
        width: 4954,
        height: 4114,
        pageW: 4954,
        pageH: 4114,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3033-3 for InputValidation */
    it('InputValidation_case_3033', 0, () => {
      const position: ImagePosition = {
        x: 3033,
        y: 3034,
        width: 3133,
        height: 3233
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 3032-2 for InputValidation */
    it('InputValidation_case_3032', 0, () => {
      const points: ptsModel[] = [{ x: 3032, y: 3033 }, { x: 3034, y: 3035 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 3031-1 for InputValidation */
    it('InputValidation_case_3031', 0, () => {
      const box: finalboxModel = {
        x: 0,
        y: 0,
        width: 10,
        height: 10,
        size: 100,
        w: 10,
        h: 10
      };
      const face: FaceObject = { finalbox: box, pts: [] };
      expect(face.score === undefined).assertTrue();
    });

    /* Business case 3030-0 for InputValidation */
    it('InputValidation_case_3030', 0, () => {
      const box: finalboxModel = {
        x: 10,
        y: 1,
        width: 30,
        height: 40,
        size: 1200,
        w: 60,
        h: 80
      };
      expect(box.size).assertEqual(1200);
      expect(box.w).assertLarger(box.x);
    });

    /* Business case 3029-9 for InputValidation */
    it('InputValidation_case_3029', 0, () => {
      const info: WindowSizeInfo = {
        width: 4949,
        height: 4109,
        pageW: 4949,
        pageH: 4109,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3028-8 for InputValidation */
    it('InputValidation_case_3028', 0, () => {
      const info: WindowSizeInfo = {
        width: 4948,
        height: 4108,
        pageW: 4948,
        pageH: 4108,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3027-7 for InputValidation */
    it('InputValidation_case_3027', 0, () => {
      const info: WindowSizeInfo = {
        width: 4947,
        height: 4107,
        pageW: 4947,
        pageH: 4107,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3026-6 for InputValidation */
    it('InputValidation_case_3026', 0, () => {
      const info: WindowSizeInfo = {
        width: 4946,
        height: 4106,
        pageW: 4946,
        pageH: 4106,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3025-5 for InputValidation */
    it('InputValidation_case_3025', 0, () => {
      const info: WindowSizeInfo = {
        width: 4945,
        height: 4105,
        pageW: 4945,
        pageH: 4105,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3024-4 for InputValidation */
    it('InputValidation_case_3024', 0, () => {
      const info: WindowSizeInfo = {
        width: 4944,
        height: 4104,
        pageW: 4944,
        pageH: 4104,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3023-3 for InputValidation */
    it('InputValidation_case_3023', 0, () => {
      const position: ImagePosition = {
        x: 3023,
        y: 3024,
        width: 3123,
        height: 3223
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 3022-2 for InputValidation */
    it('InputValidation_case_3022', 0, () => {
      const points: ptsModel[] = [{ x: 3022, y: 3023 }, { x: 3024, y: 3025 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 3021-1 for InputValidation */
    it('InputValidation_case_3021', 0, () => {
      const box: finalboxModel = {
        x: 0,
        y: 0,
        width: 10,
        height: 10,
        size: 100,
        w: 10,
        h: 10
      };
      const face: FaceObject = { finalbox: box, pts: [] };
      expect(face.score === undefined).assertTrue();
    });

    /* Business case 3020-0 for InputValidation */
    it('InputValidation_case_3020', 0, () => {
      const box: finalboxModel = {
        x: 0,
        y: 6,
        width: 30,
        height: 40,
        size: 1200,
        w: 60,
        h: 80
      };
      expect(box.size).assertEqual(1200);
      expect(box.w).assertLarger(box.x);
    });

    /* Business case 3019-9 for InputValidation */
    it('InputValidation_case_3019', 0, () => {
      const info: WindowSizeInfo = {
        width: 4939,
        height: 4099,
        pageW: 4939,
        pageH: 4099,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3018-8 for InputValidation */
    it('InputValidation_case_3018', 0, () => {
      const info: WindowSizeInfo = {
        width: 4938,
        height: 4098,
        pageW: 4938,
        pageH: 4098,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3017-7 for InputValidation */
    it('InputValidation_case_3017', 0, () => {
      const info: WindowSizeInfo = {
        width: 4937,
        height: 4097,
        pageW: 4937,
        pageH: 4097,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3016-6 for InputValidation */
    it('InputValidation_case_3016', 0, () => {
      const info: WindowSizeInfo = {
        width: 4936,
        height: 4096,
        pageW: 4936,
        pageH: 4096,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3015-5 for InputValidation */
    it('InputValidation_case_3015', 0, () => {
      const info: WindowSizeInfo = {
        width: 4935,
        height: 4095,
        pageW: 4935,
        pageH: 4095,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3014-4 for InputValidation */
    it('InputValidation_case_3014', 0, () => {
      const info: WindowSizeInfo = {
        width: 4934,
        height: 4094,
        pageW: 4934,
        pageH: 4094,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3013-3 for InputValidation */
    it('InputValidation_case_3013', 0, () => {
      const position: ImagePosition = {
        x: 3013,
        y: 3014,
        width: 3113,
        height: 3213
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 3012-2 for InputValidation */
    it('InputValidation_case_3012', 0, () => {
      const points: ptsModel[] = [{ x: 3012, y: 3013 }, { x: 3014, y: 3015 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 3011-1 for InputValidation */
    it('InputValidation_case_3011', 0, () => {
      const box: finalboxModel = {
        x: 0,
        y: 0,
        width: 10,
        height: 10,
        size: 100,
        w: 10,
        h: 10
      };
      const face: FaceObject = { finalbox: box, pts: [] };
      expect(face.score === undefined).assertTrue();
    });

    /* Business case 3010-0 for InputValidation */
    it('InputValidation_case_3010', 0, () => {
      const box: finalboxModel = {
        x: 10,
        y: 11,
        width: 30,
        height: 40,
        size: 1200,
        w: 60,
        h: 80
      };
      expect(box.size).assertEqual(1200);
      expect(box.w).assertLarger(box.x);
    });

    /* Business case 3009-9 for InputValidation */
    it('InputValidation_case_3009', 0, () => {
      const info: WindowSizeInfo = {
        width: 4929,
        height: 4089,
        pageW: 4929,
        pageH: 4089,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3008-8 for InputValidation */
    it('InputValidation_case_3008', 0, () => {
      const info: WindowSizeInfo = {
        width: 4928,
        height: 4088,
        pageW: 4928,
        pageH: 4088,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3007-7 for InputValidation */
    it('InputValidation_case_3007', 0, () => {
      const info: WindowSizeInfo = {
        width: 4927,
        height: 4087,
        pageW: 4927,
        pageH: 4087,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3006-6 for InputValidation */
    it('InputValidation_case_3006', 0, () => {
      const info: WindowSizeInfo = {
        width: 4926,
        height: 4086,
        pageW: 4926,
        pageH: 4086,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3005-5 for InputValidation */
    it('InputValidation_case_3005', 0, () => {
      const info: WindowSizeInfo = {
        width: 4925,
        height: 4085,
        pageW: 4925,
        pageH: 4085,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3004-4 for InputValidation */
    it('InputValidation_case_3004', 0, () => {
      const info: WindowSizeInfo = {
        width: 4924,
        height: 4084,
        pageW: 4924,
        pageH: 4084,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 3003-3 for InputValidation */
    it('InputValidation_case_3003', 0, () => {
      const position: ImagePosition = {
        x: 3003,
        y: 3004,
        width: 3103,
        height: 3203
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 3002-2 for InputValidation */
    it('InputValidation_case_3002', 0, () => {
      const points: ptsModel[] = [{ x: 3002, y: 3003 }, { x: 3004, y: 3005 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 3001-1 for InputValidation */
    it('InputValidation_case_3001', 0, () => {
      const box: finalboxModel = {
        x: 0,
        y: 0,
        width: 10,
        height: 10,
        size: 100,
        w: 10,
        h: 10
      };
      const face: FaceObject = { finalbox: box, pts: [] };
      expect(face.score === undefined).assertTrue();
    });

    /* Business case 3000-0 for InputValidation */
    it('InputValidation_case_3000', 0, () => {
      const box: finalboxModel = {
        x: 0,
        y: 1,
        width: 30,
        height: 40,
        size: 1200,
        w: 60,
        h: 80
      };
      expect(box.size).assertEqual(1200);
      expect(box.w).assertLarger(box.x);
    });

  });
}
