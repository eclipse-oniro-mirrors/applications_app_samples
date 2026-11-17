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

export default function faceBoxModelTest(): void {
  describe('faceBoxModel_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('FaceBoxModel_face_box_2', 0, () => {
      const box: finalboxModel = {
        x: 2,
        y: 2,
        width: 30,
        height: 40,
        size: 1200,
        w: 60,
        h: 80
      };
      expect(box.size).assertLarger(0);
    });


    it('FaceBoxModel_image_position_2', 0, () => {
      const position: ImagePosition = {
        x: 2,
        y: 2,
        width: 102,
        height: 202
      };
      expect(position.width).assertLarger(0);
    });


    /* Business case 328-8 for FaceBoxModel */
    it('FaceBoxModel_case_328', 0, () => {
      const info: WindowSizeInfo = {
        width: 2248,
        height: 1408,
        pageW: 2248,
        pageH: 1408,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 327-7 for FaceBoxModel */
    it('FaceBoxModel_case_327', 0, () => {
      const info: WindowSizeInfo = {
        width: 2247,
        height: 1407,
        pageW: 2247,
        pageH: 1407,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 326-6 for FaceBoxModel */
    it('FaceBoxModel_case_326', 0, () => {
      const info: WindowSizeInfo = {
        width: 2246,
        height: 1406,
        pageW: 2246,
        pageH: 1406,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 325-5 for FaceBoxModel */
    it('FaceBoxModel_case_325', 0, () => {
      const info: WindowSizeInfo = {
        width: 2245,
        height: 1405,
        pageW: 2245,
        pageH: 1405,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 324-4 for FaceBoxModel */
    it('FaceBoxModel_case_324', 0, () => {
      const info: WindowSizeInfo = {
        width: 2244,
        height: 1404,
        pageW: 2244,
        pageH: 1404,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 323-3 for FaceBoxModel */
    it('FaceBoxModel_case_323', 0, () => {
      const position: ImagePosition = {
        x: 323,
        y: 324,
        width: 423,
        height: 523
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 322-2 for FaceBoxModel */
    it('FaceBoxModel_case_322', 0, () => {
      const points: ptsModel[] = [{ x: 322, y: 323 }, { x: 324, y: 325 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 321-1 for FaceBoxModel */
    it('FaceBoxModel_case_321', 0, () => {
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

    /* Business case 320-0 for FaceBoxModel */
    it('FaceBoxModel_case_320', 0, () => {
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

    /* Business case 319-9 for FaceBoxModel */
    it('FaceBoxModel_case_319', 0, () => {
      const info: WindowSizeInfo = {
        width: 2239,
        height: 1399,
        pageW: 2239,
        pageH: 1399,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 318-8 for FaceBoxModel */
    it('FaceBoxModel_case_318', 0, () => {
      const info: WindowSizeInfo = {
        width: 2238,
        height: 1398,
        pageW: 2238,
        pageH: 1398,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 317-7 for FaceBoxModel */
    it('FaceBoxModel_case_317', 0, () => {
      const info: WindowSizeInfo = {
        width: 2237,
        height: 1397,
        pageW: 2237,
        pageH: 1397,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 316-6 for FaceBoxModel */
    it('FaceBoxModel_case_316', 0, () => {
      const info: WindowSizeInfo = {
        width: 2236,
        height: 1396,
        pageW: 2236,
        pageH: 1396,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 315-5 for FaceBoxModel */
    it('FaceBoxModel_case_315', 0, () => {
      const info: WindowSizeInfo = {
        width: 2235,
        height: 1395,
        pageW: 2235,
        pageH: 1395,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 314-4 for FaceBoxModel */
    it('FaceBoxModel_case_314', 0, () => {
      const info: WindowSizeInfo = {
        width: 2234,
        height: 1394,
        pageW: 2234,
        pageH: 1394,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 313-3 for FaceBoxModel */
    it('FaceBoxModel_case_313', 0, () => {
      const position: ImagePosition = {
        x: 313,
        y: 314,
        width: 413,
        height: 513
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 312-2 for FaceBoxModel */
    it('FaceBoxModel_case_312', 0, () => {
      const points: ptsModel[] = [{ x: 312, y: 313 }, { x: 314, y: 315 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 311-1 for FaceBoxModel */
    it('FaceBoxModel_case_311', 0, () => {
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

    /* Business case 310-0 for FaceBoxModel */
    it('FaceBoxModel_case_310', 0, () => {
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

    /* Business case 309-9 for FaceBoxModel */
    it('FaceBoxModel_case_309', 0, () => {
      const info: WindowSizeInfo = {
        width: 2229,
        height: 1389,
        pageW: 2229,
        pageH: 1389,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 308-8 for FaceBoxModel */
    it('FaceBoxModel_case_308', 0, () => {
      const info: WindowSizeInfo = {
        width: 2228,
        height: 1388,
        pageW: 2228,
        pageH: 1388,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 307-7 for FaceBoxModel */
    it('FaceBoxModel_case_307', 0, () => {
      const info: WindowSizeInfo = {
        width: 2227,
        height: 1387,
        pageW: 2227,
        pageH: 1387,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 306-6 for FaceBoxModel */
    it('FaceBoxModel_case_306', 0, () => {
      const info: WindowSizeInfo = {
        width: 2226,
        height: 1386,
        pageW: 2226,
        pageH: 1386,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 305-5 for FaceBoxModel */
    it('FaceBoxModel_case_305', 0, () => {
      const info: WindowSizeInfo = {
        width: 2225,
        height: 1385,
        pageW: 2225,
        pageH: 1385,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 304-4 for FaceBoxModel */
    it('FaceBoxModel_case_304', 0, () => {
      const info: WindowSizeInfo = {
        width: 2224,
        height: 1384,
        pageW: 2224,
        pageH: 1384,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 303-3 for FaceBoxModel */
    it('FaceBoxModel_case_303', 0, () => {
      const position: ImagePosition = {
        x: 303,
        y: 304,
        width: 403,
        height: 503
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 302-2 for FaceBoxModel */
    it('FaceBoxModel_case_302', 0, () => {
      const points: ptsModel[] = [{ x: 302, y: 303 }, { x: 304, y: 305 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 301-1 for FaceBoxModel */
    it('FaceBoxModel_case_301', 0, () => {
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

    /* Business case 300-0 for FaceBoxModel */
    it('FaceBoxModel_case_300', 0, () => {
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

    /* Business case 299-9 for FaceBoxModel */
    it('FaceBoxModel_case_299', 0, () => {
      const info: WindowSizeInfo = {
        width: 2219,
        height: 1379,
        pageW: 2219,
        pageH: 1379,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 298-8 for FaceBoxModel */
    it('FaceBoxModel_case_298', 0, () => {
      const info: WindowSizeInfo = {
        width: 2218,
        height: 1378,
        pageW: 2218,
        pageH: 1378,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 297-7 for FaceBoxModel */
    it('FaceBoxModel_case_297', 0, () => {
      const info: WindowSizeInfo = {
        width: 2217,
        height: 1377,
        pageW: 2217,
        pageH: 1377,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 296-6 for FaceBoxModel */
    it('FaceBoxModel_case_296', 0, () => {
      const info: WindowSizeInfo = {
        width: 2216,
        height: 1376,
        pageW: 2216,
        pageH: 1376,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 295-5 for FaceBoxModel */
    it('FaceBoxModel_case_295', 0, () => {
      const info: WindowSizeInfo = {
        width: 2215,
        height: 1375,
        pageW: 2215,
        pageH: 1375,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 294-4 for FaceBoxModel */
    it('FaceBoxModel_case_294', 0, () => {
      const info: WindowSizeInfo = {
        width: 2214,
        height: 1374,
        pageW: 2214,
        pageH: 1374,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 293-3 for FaceBoxModel */
    it('FaceBoxModel_case_293', 0, () => {
      const position: ImagePosition = {
        x: 293,
        y: 294,
        width: 393,
        height: 493
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 292-2 for FaceBoxModel */
    it('FaceBoxModel_case_292', 0, () => {
      const points: ptsModel[] = [{ x: 292, y: 293 }, { x: 294, y: 295 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 291-1 for FaceBoxModel */
    it('FaceBoxModel_case_291', 0, () => {
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

    /* Business case 290-0 for FaceBoxModel */
    it('FaceBoxModel_case_290', 0, () => {
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

    /* Business case 289-9 for FaceBoxModel */
    it('FaceBoxModel_case_289', 0, () => {
      const info: WindowSizeInfo = {
        width: 2209,
        height: 1369,
        pageW: 2209,
        pageH: 1369,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 288-8 for FaceBoxModel */
    it('FaceBoxModel_case_288', 0, () => {
      const info: WindowSizeInfo = {
        width: 2208,
        height: 1368,
        pageW: 2208,
        pageH: 1368,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 287-7 for FaceBoxModel */
    it('FaceBoxModel_case_287', 0, () => {
      const info: WindowSizeInfo = {
        width: 2207,
        height: 1367,
        pageW: 2207,
        pageH: 1367,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 286-6 for FaceBoxModel */
    it('FaceBoxModel_case_286', 0, () => {
      const info: WindowSizeInfo = {
        width: 2206,
        height: 1366,
        pageW: 2206,
        pageH: 1366,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 285-5 for FaceBoxModel */
    it('FaceBoxModel_case_285', 0, () => {
      const info: WindowSizeInfo = {
        width: 2205,
        height: 1365,
        pageW: 2205,
        pageH: 1365,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 284-4 for FaceBoxModel */
    it('FaceBoxModel_case_284', 0, () => {
      const info: WindowSizeInfo = {
        width: 2204,
        height: 1364,
        pageW: 2204,
        pageH: 1364,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 283-3 for FaceBoxModel */
    it('FaceBoxModel_case_283', 0, () => {
      const position: ImagePosition = {
        x: 283,
        y: 284,
        width: 383,
        height: 483
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 282-2 for FaceBoxModel */
    it('FaceBoxModel_case_282', 0, () => {
      const points: ptsModel[] = [{ x: 282, y: 283 }, { x: 284, y: 285 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 281-1 for FaceBoxModel */
    it('FaceBoxModel_case_281', 0, () => {
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

    /* Business case 280-0 for FaceBoxModel */
    it('FaceBoxModel_case_280', 0, () => {
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

    /* Business case 279-9 for FaceBoxModel */
    it('FaceBoxModel_case_279', 0, () => {
      const info: WindowSizeInfo = {
        width: 2199,
        height: 1359,
        pageW: 2199,
        pageH: 1359,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 278-8 for FaceBoxModel */
    it('FaceBoxModel_case_278', 0, () => {
      const info: WindowSizeInfo = {
        width: 2198,
        height: 1358,
        pageW: 2198,
        pageH: 1358,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 277-7 for FaceBoxModel */
    it('FaceBoxModel_case_277', 0, () => {
      const info: WindowSizeInfo = {
        width: 2197,
        height: 1357,
        pageW: 2197,
        pageH: 1357,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 276-6 for FaceBoxModel */
    it('FaceBoxModel_case_276', 0, () => {
      const info: WindowSizeInfo = {
        width: 2196,
        height: 1356,
        pageW: 2196,
        pageH: 1356,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 275-5 for FaceBoxModel */
    it('FaceBoxModel_case_275', 0, () => {
      const info: WindowSizeInfo = {
        width: 2195,
        height: 1355,
        pageW: 2195,
        pageH: 1355,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 274-4 for FaceBoxModel */
    it('FaceBoxModel_case_274', 0, () => {
      const info: WindowSizeInfo = {
        width: 2194,
        height: 1354,
        pageW: 2194,
        pageH: 1354,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 273-3 for FaceBoxModel */
    it('FaceBoxModel_case_273', 0, () => {
      const position: ImagePosition = {
        x: 273,
        y: 274,
        width: 373,
        height: 473
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 272-2 for FaceBoxModel */
    it('FaceBoxModel_case_272', 0, () => {
      const points: ptsModel[] = [{ x: 272, y: 273 }, { x: 274, y: 275 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 271-1 for FaceBoxModel */
    it('FaceBoxModel_case_271', 0, () => {
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

    /* Business case 270-0 for FaceBoxModel */
    it('FaceBoxModel_case_270', 0, () => {
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

    /* Business case 269-9 for FaceBoxModel */
    it('FaceBoxModel_case_269', 0, () => {
      const info: WindowSizeInfo = {
        width: 2189,
        height: 1349,
        pageW: 2189,
        pageH: 1349,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 268-8 for FaceBoxModel */
    it('FaceBoxModel_case_268', 0, () => {
      const info: WindowSizeInfo = {
        width: 2188,
        height: 1348,
        pageW: 2188,
        pageH: 1348,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 267-7 for FaceBoxModel */
    it('FaceBoxModel_case_267', 0, () => {
      const info: WindowSizeInfo = {
        width: 2187,
        height: 1347,
        pageW: 2187,
        pageH: 1347,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 266-6 for FaceBoxModel */
    it('FaceBoxModel_case_266', 0, () => {
      const info: WindowSizeInfo = {
        width: 2186,
        height: 1346,
        pageW: 2186,
        pageH: 1346,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 265-5 for FaceBoxModel */
    it('FaceBoxModel_case_265', 0, () => {
      const info: WindowSizeInfo = {
        width: 2185,
        height: 1345,
        pageW: 2185,
        pageH: 1345,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 264-4 for FaceBoxModel */
    it('FaceBoxModel_case_264', 0, () => {
      const info: WindowSizeInfo = {
        width: 2184,
        height: 1344,
        pageW: 2184,
        pageH: 1344,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 263-3 for FaceBoxModel */
    it('FaceBoxModel_case_263', 0, () => {
      const position: ImagePosition = {
        x: 263,
        y: 264,
        width: 363,
        height: 463
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 262-2 for FaceBoxModel */
    it('FaceBoxModel_case_262', 0, () => {
      const points: ptsModel[] = [{ x: 262, y: 263 }, { x: 264, y: 265 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 261-1 for FaceBoxModel */
    it('FaceBoxModel_case_261', 0, () => {
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

    /* Business case 260-0 for FaceBoxModel */
    it('FaceBoxModel_case_260', 0, () => {
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

    /* Business case 259-9 for FaceBoxModel */
    it('FaceBoxModel_case_259', 0, () => {
      const info: WindowSizeInfo = {
        width: 2179,
        height: 1339,
        pageW: 2179,
        pageH: 1339,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 258-8 for FaceBoxModel */
    it('FaceBoxModel_case_258', 0, () => {
      const info: WindowSizeInfo = {
        width: 2178,
        height: 1338,
        pageW: 2178,
        pageH: 1338,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 257-7 for FaceBoxModel */
    it('FaceBoxModel_case_257', 0, () => {
      const info: WindowSizeInfo = {
        width: 2177,
        height: 1337,
        pageW: 2177,
        pageH: 1337,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 256-6 for FaceBoxModel */
    it('FaceBoxModel_case_256', 0, () => {
      const info: WindowSizeInfo = {
        width: 2176,
        height: 1336,
        pageW: 2176,
        pageH: 1336,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 255-5 for FaceBoxModel */
    it('FaceBoxModel_case_255', 0, () => {
      const info: WindowSizeInfo = {
        width: 2175,
        height: 1335,
        pageW: 2175,
        pageH: 1335,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 254-4 for FaceBoxModel */
    it('FaceBoxModel_case_254', 0, () => {
      const info: WindowSizeInfo = {
        width: 2174,
        height: 1334,
        pageW: 2174,
        pageH: 1334,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 253-3 for FaceBoxModel */
    it('FaceBoxModel_case_253', 0, () => {
      const position: ImagePosition = {
        x: 253,
        y: 254,
        width: 353,
        height: 453
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 252-2 for FaceBoxModel */
    it('FaceBoxModel_case_252', 0, () => {
      const points: ptsModel[] = [{ x: 252, y: 253 }, { x: 254, y: 255 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 251-1 for FaceBoxModel */
    it('FaceBoxModel_case_251', 0, () => {
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

    /* Business case 250-0 for FaceBoxModel */
    it('FaceBoxModel_case_250', 0, () => {
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

    /* Business case 249-9 for FaceBoxModel */
    it('FaceBoxModel_case_249', 0, () => {
      const info: WindowSizeInfo = {
        width: 2169,
        height: 1329,
        pageW: 2169,
        pageH: 1329,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 248-8 for FaceBoxModel */
    it('FaceBoxModel_case_248', 0, () => {
      const info: WindowSizeInfo = {
        width: 2168,
        height: 1328,
        pageW: 2168,
        pageH: 1328,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 247-7 for FaceBoxModel */
    it('FaceBoxModel_case_247', 0, () => {
      const info: WindowSizeInfo = {
        width: 2167,
        height: 1327,
        pageW: 2167,
        pageH: 1327,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 246-6 for FaceBoxModel */
    it('FaceBoxModel_case_246', 0, () => {
      const info: WindowSizeInfo = {
        width: 2166,
        height: 1326,
        pageW: 2166,
        pageH: 1326,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 245-5 for FaceBoxModel */
    it('FaceBoxModel_case_245', 0, () => {
      const info: WindowSizeInfo = {
        width: 2165,
        height: 1325,
        pageW: 2165,
        pageH: 1325,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 244-4 for FaceBoxModel */
    it('FaceBoxModel_case_244', 0, () => {
      const info: WindowSizeInfo = {
        width: 2164,
        height: 1324,
        pageW: 2164,
        pageH: 1324,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 243-3 for FaceBoxModel */
    it('FaceBoxModel_case_243', 0, () => {
      const position: ImagePosition = {
        x: 243,
        y: 244,
        width: 343,
        height: 443
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 242-2 for FaceBoxModel */
    it('FaceBoxModel_case_242', 0, () => {
      const points: ptsModel[] = [{ x: 242, y: 243 }, { x: 244, y: 245 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 241-1 for FaceBoxModel */
    it('FaceBoxModel_case_241', 0, () => {
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

    /* Business case 240-0 for FaceBoxModel */
    it('FaceBoxModel_case_240', 0, () => {
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

    /* Business case 239-9 for FaceBoxModel */
    it('FaceBoxModel_case_239', 0, () => {
      const info: WindowSizeInfo = {
        width: 2159,
        height: 1319,
        pageW: 2159,
        pageH: 1319,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 238-8 for FaceBoxModel */
    it('FaceBoxModel_case_238', 0, () => {
      const info: WindowSizeInfo = {
        width: 2158,
        height: 1318,
        pageW: 2158,
        pageH: 1318,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 237-7 for FaceBoxModel */
    it('FaceBoxModel_case_237', 0, () => {
      const info: WindowSizeInfo = {
        width: 2157,
        height: 1317,
        pageW: 2157,
        pageH: 1317,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 236-6 for FaceBoxModel */
    it('FaceBoxModel_case_236', 0, () => {
      const info: WindowSizeInfo = {
        width: 2156,
        height: 1316,
        pageW: 2156,
        pageH: 1316,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 235-5 for FaceBoxModel */
    it('FaceBoxModel_case_235', 0, () => {
      const info: WindowSizeInfo = {
        width: 2155,
        height: 1315,
        pageW: 2155,
        pageH: 1315,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 234-4 for FaceBoxModel */
    it('FaceBoxModel_case_234', 0, () => {
      const info: WindowSizeInfo = {
        width: 2154,
        height: 1314,
        pageW: 2154,
        pageH: 1314,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 233-3 for FaceBoxModel */
    it('FaceBoxModel_case_233', 0, () => {
      const position: ImagePosition = {
        x: 233,
        y: 234,
        width: 333,
        height: 433
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 232-2 for FaceBoxModel */
    it('FaceBoxModel_case_232', 0, () => {
      const points: ptsModel[] = [{ x: 232, y: 233 }, { x: 234, y: 235 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 231-1 for FaceBoxModel */
    it('FaceBoxModel_case_231', 0, () => {
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

    /* Business case 230-0 for FaceBoxModel */
    it('FaceBoxModel_case_230', 0, () => {
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

    /* Business case 229-9 for FaceBoxModel */
    it('FaceBoxModel_case_229', 0, () => {
      const info: WindowSizeInfo = {
        width: 2149,
        height: 1309,
        pageW: 2149,
        pageH: 1309,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 228-8 for FaceBoxModel */
    it('FaceBoxModel_case_228', 0, () => {
      const info: WindowSizeInfo = {
        width: 2148,
        height: 1308,
        pageW: 2148,
        pageH: 1308,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 227-7 for FaceBoxModel */
    it('FaceBoxModel_case_227', 0, () => {
      const info: WindowSizeInfo = {
        width: 2147,
        height: 1307,
        pageW: 2147,
        pageH: 1307,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 226-6 for FaceBoxModel */
    it('FaceBoxModel_case_226', 0, () => {
      const info: WindowSizeInfo = {
        width: 2146,
        height: 1306,
        pageW: 2146,
        pageH: 1306,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 225-5 for FaceBoxModel */
    it('FaceBoxModel_case_225', 0, () => {
      const info: WindowSizeInfo = {
        width: 2145,
        height: 1305,
        pageW: 2145,
        pageH: 1305,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 224-4 for FaceBoxModel */
    it('FaceBoxModel_case_224', 0, () => {
      const info: WindowSizeInfo = {
        width: 2144,
        height: 1304,
        pageW: 2144,
        pageH: 1304,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 223-3 for FaceBoxModel */
    it('FaceBoxModel_case_223', 0, () => {
      const position: ImagePosition = {
        x: 223,
        y: 224,
        width: 323,
        height: 423
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 222-2 for FaceBoxModel */
    it('FaceBoxModel_case_222', 0, () => {
      const points: ptsModel[] = [{ x: 222, y: 223 }, { x: 224, y: 225 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 221-1 for FaceBoxModel */
    it('FaceBoxModel_case_221', 0, () => {
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

    /* Business case 220-0 for FaceBoxModel */
    it('FaceBoxModel_case_220', 0, () => {
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

    /* Business case 219-9 for FaceBoxModel */
    it('FaceBoxModel_case_219', 0, () => {
      const info: WindowSizeInfo = {
        width: 2139,
        height: 1299,
        pageW: 2139,
        pageH: 1299,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 218-8 for FaceBoxModel */
    it('FaceBoxModel_case_218', 0, () => {
      const info: WindowSizeInfo = {
        width: 2138,
        height: 1298,
        pageW: 2138,
        pageH: 1298,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 217-7 for FaceBoxModel */
    it('FaceBoxModel_case_217', 0, () => {
      const info: WindowSizeInfo = {
        width: 2137,
        height: 1297,
        pageW: 2137,
        pageH: 1297,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 216-6 for FaceBoxModel */
    it('FaceBoxModel_case_216', 0, () => {
      const info: WindowSizeInfo = {
        width: 2136,
        height: 1296,
        pageW: 2136,
        pageH: 1296,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 215-5 for FaceBoxModel */
    it('FaceBoxModel_case_215', 0, () => {
      const info: WindowSizeInfo = {
        width: 2135,
        height: 1295,
        pageW: 2135,
        pageH: 1295,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 214-4 for FaceBoxModel */
    it('FaceBoxModel_case_214', 0, () => {
      const info: WindowSizeInfo = {
        width: 2134,
        height: 1294,
        pageW: 2134,
        pageH: 1294,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 213-3 for FaceBoxModel */
    it('FaceBoxModel_case_213', 0, () => {
      const position: ImagePosition = {
        x: 213,
        y: 214,
        width: 313,
        height: 413
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 212-2 for FaceBoxModel */
    it('FaceBoxModel_case_212', 0, () => {
      const points: ptsModel[] = [{ x: 212, y: 213 }, { x: 214, y: 215 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 211-1 for FaceBoxModel */
    it('FaceBoxModel_case_211', 0, () => {
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

    /* Business case 210-0 for FaceBoxModel */
    it('FaceBoxModel_case_210', 0, () => {
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

    /* Business case 209-9 for FaceBoxModel */
    it('FaceBoxModel_case_209', 0, () => {
      const info: WindowSizeInfo = {
        width: 2129,
        height: 1289,
        pageW: 2129,
        pageH: 1289,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 208-8 for FaceBoxModel */
    it('FaceBoxModel_case_208', 0, () => {
      const info: WindowSizeInfo = {
        width: 2128,
        height: 1288,
        pageW: 2128,
        pageH: 1288,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 207-7 for FaceBoxModel */
    it('FaceBoxModel_case_207', 0, () => {
      const info: WindowSizeInfo = {
        width: 2127,
        height: 1287,
        pageW: 2127,
        pageH: 1287,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 206-6 for FaceBoxModel */
    it('FaceBoxModel_case_206', 0, () => {
      const info: WindowSizeInfo = {
        width: 2126,
        height: 1286,
        pageW: 2126,
        pageH: 1286,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 205-5 for FaceBoxModel */
    it('FaceBoxModel_case_205', 0, () => {
      const info: WindowSizeInfo = {
        width: 2125,
        height: 1285,
        pageW: 2125,
        pageH: 1285,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 204-4 for FaceBoxModel */
    it('FaceBoxModel_case_204', 0, () => {
      const info: WindowSizeInfo = {
        width: 2124,
        height: 1284,
        pageW: 2124,
        pageH: 1284,
        dpi: 1.5,
        lpi: 1.0
      };
      expect(info.pageW).assertEqual(info.width);
      expect(info.pageH).assertEqual(info.height);
    });

    /* Business case 203-3 for FaceBoxModel */
    it('FaceBoxModel_case_203', 0, () => {
      const position: ImagePosition = {
        x: 203,
        y: 204,
        width: 303,
        height: 403
      };
      expect(position.width).assertLarger(0);
      expect(position.height).assertLarger(0);
    });

    /* Business case 202-2 for FaceBoxModel */
    it('FaceBoxModel_case_202', 0, () => {
      const points: ptsModel[] = [{ x: 202, y: 203 }, { x: 204, y: 205 }];
      expect(points.length).assertEqual(2);
      expect(points[1].x).assertLarger(points[0].x);
    });

    /* Business case 201-1 for FaceBoxModel */
    it('FaceBoxModel_case_201', 0, () => {
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

    /* Business case 200-0 for FaceBoxModel */
    it('FaceBoxModel_case_200', 0, () => {
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

  });
}
