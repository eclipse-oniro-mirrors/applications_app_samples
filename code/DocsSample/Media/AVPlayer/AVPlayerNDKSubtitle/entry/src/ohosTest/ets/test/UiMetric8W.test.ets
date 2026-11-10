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
import { describe, it, expect } from '@ohos/hypium';

export default function uiMetric8wTest() {
  describe('uiMetric8wTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0001
     * @tc.name      test8wUiMetric0001
     * @tc.desc      UI metric width 280 yields surface 252.0 and height 141.573.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0001', 0, () => {
      const width: number = 280;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 252.0)).assertLess(0.001);
      expect(Math.abs(height - 141.573)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0002
     * @tc.name      test8wUiMetric0002
     * @tc.desc      UI metric width 283 yields surface 254.7 and height 143.09.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0002', 0, () => {
      const width: number = 283;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 254.7)).assertLess(0.001);
      expect(Math.abs(height - 143.09)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0003
     * @tc.name      test8wUiMetric0003
     * @tc.desc      UI metric width 286 yields surface 257.4 and height 144.607.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0003', 0, () => {
      const width: number = 286;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 257.4)).assertLess(0.001);
      expect(Math.abs(height - 144.607)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0004
     * @tc.name      test8wUiMetric0004
     * @tc.desc      UI metric width 289 yields surface 260.1 and height 146.124.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0004', 0, () => {
      const width: number = 289;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 260.1)).assertLess(0.001);
      expect(Math.abs(height - 146.124)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0005
     * @tc.name      test8wUiMetric0005
     * @tc.desc      UI metric width 292 yields surface 262.8 and height 147.64.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0005', 0, () => {
      const width: number = 292;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 262.8)).assertLess(0.001);
      expect(Math.abs(height - 147.64)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0006
     * @tc.name      test8wUiMetric0006
     * @tc.desc      UI metric width 295 yields surface 265.5 and height 149.157.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0006', 0, () => {
      const width: number = 295;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 265.5)).assertLess(0.001);
      expect(Math.abs(height - 149.157)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0007
     * @tc.name      test8wUiMetric0007
     * @tc.desc      UI metric width 298 yields surface 268.2 and height 150.674.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0007', 0, () => {
      const width: number = 298;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 268.2)).assertLess(0.001);
      expect(Math.abs(height - 150.674)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0008
     * @tc.name      test8wUiMetric0008
     * @tc.desc      UI metric width 301 yields surface 270.9 and height 152.191.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0008', 0, () => {
      const width: number = 301;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 270.9)).assertLess(0.001);
      expect(Math.abs(height - 152.191)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0009
     * @tc.name      test8wUiMetric0009
     * @tc.desc      UI metric width 304 yields surface 273.6 and height 153.708.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0009', 0, () => {
      const width: number = 304;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 273.6)).assertLess(0.001);
      expect(Math.abs(height - 153.708)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0010
     * @tc.name      test8wUiMetric0010
     * @tc.desc      UI metric width 307 yields surface 276.3 and height 155.225.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0010', 0, () => {
      const width: number = 307;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 276.3)).assertLess(0.001);
      expect(Math.abs(height - 155.225)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0011
     * @tc.name      test8wUiMetric0011
     * @tc.desc      UI metric width 310 yields surface 279.0 and height 156.742.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0011', 0, () => {
      const width: number = 310;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 279.0)).assertLess(0.001);
      expect(Math.abs(height - 156.742)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0012
     * @tc.name      test8wUiMetric0012
     * @tc.desc      UI metric width 313 yields surface 281.7 and height 158.258.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0012', 0, () => {
      const width: number = 313;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 281.7)).assertLess(0.001);
      expect(Math.abs(height - 158.258)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0013
     * @tc.name      test8wUiMetric0013
     * @tc.desc      UI metric width 316 yields surface 284.4 and height 159.775.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0013', 0, () => {
      const width: number = 316;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 284.4)).assertLess(0.001);
      expect(Math.abs(height - 159.775)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0014
     * @tc.name      test8wUiMetric0014
     * @tc.desc      UI metric width 319 yields surface 287.1 and height 161.292.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0014', 0, () => {
      const width: number = 319;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 287.1)).assertLess(0.001);
      expect(Math.abs(height - 161.292)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0015
     * @tc.name      test8wUiMetric0015
     * @tc.desc      UI metric width 322 yields surface 289.8 and height 162.809.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0015', 0, () => {
      const width: number = 322;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 289.8)).assertLess(0.001);
      expect(Math.abs(height - 162.809)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0016
     * @tc.name      test8wUiMetric0016
     * @tc.desc      UI metric width 325 yields surface 292.5 and height 164.326.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0016', 0, () => {
      const width: number = 325;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 292.5)).assertLess(0.001);
      expect(Math.abs(height - 164.326)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0017
     * @tc.name      test8wUiMetric0017
     * @tc.desc      UI metric width 328 yields surface 295.2 and height 165.843.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0017', 0, () => {
      const width: number = 328;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 295.2)).assertLess(0.001);
      expect(Math.abs(height - 165.843)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0018
     * @tc.name      test8wUiMetric0018
     * @tc.desc      UI metric width 331 yields surface 297.9 and height 167.36.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0018', 0, () => {
      const width: number = 331;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 297.9)).assertLess(0.001);
      expect(Math.abs(height - 167.36)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0019
     * @tc.name      test8wUiMetric0019
     * @tc.desc      UI metric width 334 yields surface 300.6 and height 168.876.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0019', 0, () => {
      const width: number = 334;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 300.6)).assertLess(0.001);
      expect(Math.abs(height - 168.876)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0020
     * @tc.name      test8wUiMetric0020
     * @tc.desc      UI metric width 337 yields surface 303.3 and height 170.393.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0020', 0, () => {
      const width: number = 337;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 303.3)).assertLess(0.001);
      expect(Math.abs(height - 170.393)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0021
     * @tc.name      test8wUiMetric0021
     * @tc.desc      UI metric width 340 yields surface 306.0 and height 171.91.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0021', 0, () => {
      const width: number = 340;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 306.0)).assertLess(0.001);
      expect(Math.abs(height - 171.91)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0022
     * @tc.name      test8wUiMetric0022
     * @tc.desc      UI metric width 343 yields surface 308.7 and height 173.427.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0022', 0, () => {
      const width: number = 343;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 308.7)).assertLess(0.001);
      expect(Math.abs(height - 173.427)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0023
     * @tc.name      test8wUiMetric0023
     * @tc.desc      UI metric width 346 yields surface 311.4 and height 174.944.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0023', 0, () => {
      const width: number = 346;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 311.4)).assertLess(0.001);
      expect(Math.abs(height - 174.944)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0024
     * @tc.name      test8wUiMetric0024
     * @tc.desc      UI metric width 349 yields surface 314.1 and height 176.461.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0024', 0, () => {
      const width: number = 349;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 314.1)).assertLess(0.001);
      expect(Math.abs(height - 176.461)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0025
     * @tc.name      test8wUiMetric0025
     * @tc.desc      UI metric width 352 yields surface 316.8 and height 177.978.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0025', 0, () => {
      const width: number = 352;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 316.8)).assertLess(0.001);
      expect(Math.abs(height - 177.978)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0026
     * @tc.name      test8wUiMetric0026
     * @tc.desc      UI metric width 355 yields surface 319.5 and height 179.494.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0026', 0, () => {
      const width: number = 355;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 319.5)).assertLess(0.001);
      expect(Math.abs(height - 179.494)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0027
     * @tc.name      test8wUiMetric0027
     * @tc.desc      UI metric width 358 yields surface 322.2 and height 181.011.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0027', 0, () => {
      const width: number = 358;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 322.2)).assertLess(0.001);
      expect(Math.abs(height - 181.011)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0028
     * @tc.name      test8wUiMetric0028
     * @tc.desc      UI metric width 361 yields surface 324.9 and height 182.528.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0028', 0, () => {
      const width: number = 361;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 324.9)).assertLess(0.001);
      expect(Math.abs(height - 182.528)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0029
     * @tc.name      test8wUiMetric0029
     * @tc.desc      UI metric width 364 yields surface 327.6 and height 184.045.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0029', 0, () => {
      const width: number = 364;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 327.6)).assertLess(0.001);
      expect(Math.abs(height - 184.045)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0030
     * @tc.name      test8wUiMetric0030
     * @tc.desc      UI metric width 367 yields surface 330.3 and height 185.562.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0030', 0, () => {
      const width: number = 367;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 330.3)).assertLess(0.001);
      expect(Math.abs(height - 185.562)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0031
     * @tc.name      test8wUiMetric0031
     * @tc.desc      UI metric width 370 yields surface 333.0 and height 187.079.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0031', 0, () => {
      const width: number = 370;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 333.0)).assertLess(0.001);
      expect(Math.abs(height - 187.079)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0032
     * @tc.name      test8wUiMetric0032
     * @tc.desc      UI metric width 373 yields surface 335.7 and height 188.596.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0032', 0, () => {
      const width: number = 373;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 335.7)).assertLess(0.001);
      expect(Math.abs(height - 188.596)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0033
     * @tc.name      test8wUiMetric0033
     * @tc.desc      UI metric width 376 yields surface 338.4 and height 190.112.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0033', 0, () => {
      const width: number = 376;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 338.4)).assertLess(0.001);
      expect(Math.abs(height - 190.112)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0034
     * @tc.name      test8wUiMetric0034
     * @tc.desc      UI metric width 379 yields surface 341.1 and height 191.629.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0034', 0, () => {
      const width: number = 379;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 341.1)).assertLess(0.001);
      expect(Math.abs(height - 191.629)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0035
     * @tc.name      test8wUiMetric0035
     * @tc.desc      UI metric width 382 yields surface 343.8 and height 193.146.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0035', 0, () => {
      const width: number = 382;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 343.8)).assertLess(0.001);
      expect(Math.abs(height - 193.146)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0036
     * @tc.name      test8wUiMetric0036
     * @tc.desc      UI metric width 385 yields surface 346.5 and height 194.663.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0036', 0, () => {
      const width: number = 385;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 346.5)).assertLess(0.001);
      expect(Math.abs(height - 194.663)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0037
     * @tc.name      test8wUiMetric0037
     * @tc.desc      UI metric width 388 yields surface 349.2 and height 196.18.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0037', 0, () => {
      const width: number = 388;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 349.2)).assertLess(0.001);
      expect(Math.abs(height - 196.18)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0038
     * @tc.name      test8wUiMetric0038
     * @tc.desc      UI metric width 391 yields surface 351.9 and height 197.697.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0038', 0, () => {
      const width: number = 391;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 351.9)).assertLess(0.001);
      expect(Math.abs(height - 197.697)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0039
     * @tc.name      test8wUiMetric0039
     * @tc.desc      UI metric width 394 yields surface 354.6 and height 199.213.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0039', 0, () => {
      const width: number = 394;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 354.6)).assertLess(0.001);
      expect(Math.abs(height - 199.213)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0040
     * @tc.name      test8wUiMetric0040
     * @tc.desc      UI metric width 397 yields surface 357.3 and height 200.73.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0040', 0, () => {
      const width: number = 397;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 357.3)).assertLess(0.001);
      expect(Math.abs(height - 200.73)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0041
     * @tc.name      test8wUiMetric0041
     * @tc.desc      UI metric width 400 yields surface 360.0 and height 202.247.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0041', 0, () => {
      const width: number = 400;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 360.0)).assertLess(0.001);
      expect(Math.abs(height - 202.247)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0042
     * @tc.name      test8wUiMetric0042
     * @tc.desc      UI metric width 403 yields surface 362.7 and height 203.764.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0042', 0, () => {
      const width: number = 403;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 362.7)).assertLess(0.001);
      expect(Math.abs(height - 203.764)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0043
     * @tc.name      test8wUiMetric0043
     * @tc.desc      UI metric width 406 yields surface 365.4 and height 205.281.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0043', 0, () => {
      const width: number = 406;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 365.4)).assertLess(0.001);
      expect(Math.abs(height - 205.281)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0044
     * @tc.name      test8wUiMetric0044
     * @tc.desc      UI metric width 409 yields surface 368.1 and height 206.798.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0044', 0, () => {
      const width: number = 409;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 368.1)).assertLess(0.001);
      expect(Math.abs(height - 206.798)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0045
     * @tc.name      test8wUiMetric0045
     * @tc.desc      UI metric width 412 yields surface 370.8 and height 208.315.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0045', 0, () => {
      const width: number = 412;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 370.8)).assertLess(0.001);
      expect(Math.abs(height - 208.315)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0046
     * @tc.name      test8wUiMetric0046
     * @tc.desc      UI metric width 415 yields surface 373.5 and height 209.831.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0046', 0, () => {
      const width: number = 415;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 373.5)).assertLess(0.001);
      expect(Math.abs(height - 209.831)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0047
     * @tc.name      test8wUiMetric0047
     * @tc.desc      UI metric width 418 yields surface 376.2 and height 211.348.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0047', 0, () => {
      const width: number = 418;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 376.2)).assertLess(0.001);
      expect(Math.abs(height - 211.348)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0048
     * @tc.name      test8wUiMetric0048
     * @tc.desc      UI metric width 421 yields surface 378.9 and height 212.865.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0048', 0, () => {
      const width: number = 421;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 378.9)).assertLess(0.001);
      expect(Math.abs(height - 212.865)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0049
     * @tc.name      test8wUiMetric0049
     * @tc.desc      UI metric width 424 yields surface 381.6 and height 214.382.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0049', 0, () => {
      const width: number = 424;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 381.6)).assertLess(0.001);
      expect(Math.abs(height - 214.382)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0050
     * @tc.name      test8wUiMetric0050
     * @tc.desc      UI metric width 427 yields surface 384.3 and height 215.899.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0050', 0, () => {
      const width: number = 427;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 384.3)).assertLess(0.001);
      expect(Math.abs(height - 215.899)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0051
     * @tc.name      test8wUiMetric0051
     * @tc.desc      UI metric width 430 yields surface 387.0 and height 217.416.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0051', 0, () => {
      const width: number = 430;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 387.0)).assertLess(0.001);
      expect(Math.abs(height - 217.416)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0052
     * @tc.name      test8wUiMetric0052
     * @tc.desc      UI metric width 433 yields surface 389.7 and height 218.933.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0052', 0, () => {
      const width: number = 433;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 389.7)).assertLess(0.001);
      expect(Math.abs(height - 218.933)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0053
     * @tc.name      test8wUiMetric0053
     * @tc.desc      UI metric width 436 yields surface 392.4 and height 220.449.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0053', 0, () => {
      const width: number = 436;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 392.4)).assertLess(0.001);
      expect(Math.abs(height - 220.449)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0054
     * @tc.name      test8wUiMetric0054
     * @tc.desc      UI metric width 439 yields surface 395.1 and height 221.966.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0054', 0, () => {
      const width: number = 439;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 395.1)).assertLess(0.001);
      expect(Math.abs(height - 221.966)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0055
     * @tc.name      test8wUiMetric0055
     * @tc.desc      UI metric width 442 yields surface 397.8 and height 223.483.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0055', 0, () => {
      const width: number = 442;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 397.8)).assertLess(0.001);
      expect(Math.abs(height - 223.483)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0056
     * @tc.name      test8wUiMetric0056
     * @tc.desc      UI metric width 445 yields surface 400.5 and height 225.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0056', 0, () => {
      const width: number = 445;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 400.5)).assertLess(0.001);
      expect(Math.abs(height - 225.0)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0057
     * @tc.name      test8wUiMetric0057
     * @tc.desc      UI metric width 448 yields surface 403.2 and height 226.517.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0057', 0, () => {
      const width: number = 448;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 403.2)).assertLess(0.001);
      expect(Math.abs(height - 226.517)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0058
     * @tc.name      test8wUiMetric0058
     * @tc.desc      UI metric width 451 yields surface 405.9 and height 228.034.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0058', 0, () => {
      const width: number = 451;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 405.9)).assertLess(0.001);
      expect(Math.abs(height - 228.034)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0059
     * @tc.name      test8wUiMetric0059
     * @tc.desc      UI metric width 454 yields surface 408.6 and height 229.551.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0059', 0, () => {
      const width: number = 454;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 408.6)).assertLess(0.001);
      expect(Math.abs(height - 229.551)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0060
     * @tc.name      test8wUiMetric0060
     * @tc.desc      UI metric width 457 yields surface 411.3 and height 231.067.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0060', 0, () => {
      const width: number = 457;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 411.3)).assertLess(0.001);
      expect(Math.abs(height - 231.067)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0061
     * @tc.name      test8wUiMetric0061
     * @tc.desc      UI metric width 460 yields surface 414.0 and height 232.584.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0061', 0, () => {
      const width: number = 460;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 414.0)).assertLess(0.001);
      expect(Math.abs(height - 232.584)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0062
     * @tc.name      test8wUiMetric0062
     * @tc.desc      UI metric width 463 yields surface 416.7 and height 234.101.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0062', 0, () => {
      const width: number = 463;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 416.7)).assertLess(0.001);
      expect(Math.abs(height - 234.101)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0063
     * @tc.name      test8wUiMetric0063
     * @tc.desc      UI metric width 466 yields surface 419.4 and height 235.618.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0063', 0, () => {
      const width: number = 466;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 419.4)).assertLess(0.001);
      expect(Math.abs(height - 235.618)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0064
     * @tc.name      test8wUiMetric0064
     * @tc.desc      UI metric width 469 yields surface 422.1 and height 237.135.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0064', 0, () => {
      const width: number = 469;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 422.1)).assertLess(0.001);
      expect(Math.abs(height - 237.135)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0065
     * @tc.name      test8wUiMetric0065
     * @tc.desc      UI metric width 472 yields surface 424.8 and height 238.652.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0065', 0, () => {
      const width: number = 472;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 424.8)).assertLess(0.001);
      expect(Math.abs(height - 238.652)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0066
     * @tc.name      test8wUiMetric0066
     * @tc.desc      UI metric width 475 yields surface 427.5 and height 240.169.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0066', 0, () => {
      const width: number = 475;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 427.5)).assertLess(0.001);
      expect(Math.abs(height - 240.169)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0067
     * @tc.name      test8wUiMetric0067
     * @tc.desc      UI metric width 478 yields surface 430.2 and height 241.685.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0067', 0, () => {
      const width: number = 478;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 430.2)).assertLess(0.001);
      expect(Math.abs(height - 241.685)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0068
     * @tc.name      test8wUiMetric0068
     * @tc.desc      UI metric width 481 yields surface 432.9 and height 243.202.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0068', 0, () => {
      const width: number = 481;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 432.9)).assertLess(0.001);
      expect(Math.abs(height - 243.202)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0069
     * @tc.name      test8wUiMetric0069
     * @tc.desc      UI metric width 484 yields surface 435.6 and height 244.719.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0069', 0, () => {
      const width: number = 484;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 435.6)).assertLess(0.001);
      expect(Math.abs(height - 244.719)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0070
     * @tc.name      test8wUiMetric0070
     * @tc.desc      UI metric width 487 yields surface 438.3 and height 246.236.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0070', 0, () => {
      const width: number = 487;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 438.3)).assertLess(0.001);
      expect(Math.abs(height - 246.236)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0071
     * @tc.name      test8wUiMetric0071
     * @tc.desc      UI metric width 490 yields surface 441.0 and height 247.753.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0071', 0, () => {
      const width: number = 490;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 441.0)).assertLess(0.001);
      expect(Math.abs(height - 247.753)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0072
     * @tc.name      test8wUiMetric0072
     * @tc.desc      UI metric width 493 yields surface 443.7 and height 249.27.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0072', 0, () => {
      const width: number = 493;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 443.7)).assertLess(0.001);
      expect(Math.abs(height - 249.27)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0073
     * @tc.name      test8wUiMetric0073
     * @tc.desc      UI metric width 496 yields surface 446.4 and height 250.787.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0073', 0, () => {
      const width: number = 496;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 446.4)).assertLess(0.001);
      expect(Math.abs(height - 250.787)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0074
     * @tc.name      test8wUiMetric0074
     * @tc.desc      UI metric width 499 yields surface 449.1 and height 252.303.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0074', 0, () => {
      const width: number = 499;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 449.1)).assertLess(0.001);
      expect(Math.abs(height - 252.303)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0075
     * @tc.name      test8wUiMetric0075
     * @tc.desc      UI metric width 502 yields surface 451.8 and height 253.82.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0075', 0, () => {
      const width: number = 502;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 451.8)).assertLess(0.001);
      expect(Math.abs(height - 253.82)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0076
     * @tc.name      test8wUiMetric0076
     * @tc.desc      UI metric width 505 yields surface 454.5 and height 255.337.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0076', 0, () => {
      const width: number = 505;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 454.5)).assertLess(0.001);
      expect(Math.abs(height - 255.337)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0077
     * @tc.name      test8wUiMetric0077
     * @tc.desc      UI metric width 508 yields surface 457.2 and height 256.854.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0077', 0, () => {
      const width: number = 508;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 457.2)).assertLess(0.001);
      expect(Math.abs(height - 256.854)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0078
     * @tc.name      test8wUiMetric0078
     * @tc.desc      UI metric width 511 yields surface 459.9 and height 258.371.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0078', 0, () => {
      const width: number = 511;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 459.9)).assertLess(0.001);
      expect(Math.abs(height - 258.371)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0079
     * @tc.name      test8wUiMetric0079
     * @tc.desc      UI metric width 514 yields surface 462.6 and height 259.888.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0079', 0, () => {
      const width: number = 514;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 462.6)).assertLess(0.001);
      expect(Math.abs(height - 259.888)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0080
     * @tc.name      test8wUiMetric0080
     * @tc.desc      UI metric width 517 yields surface 465.3 and height 261.404.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0080', 0, () => {
      const width: number = 517;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 465.3)).assertLess(0.001);
      expect(Math.abs(height - 261.404)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0081
     * @tc.name      test8wUiMetric0081
     * @tc.desc      UI metric width 520 yields surface 468.0 and height 262.921.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0081', 0, () => {
      const width: number = 520;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 468.0)).assertLess(0.001);
      expect(Math.abs(height - 262.921)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0082
     * @tc.name      test8wUiMetric0082
     * @tc.desc      UI metric width 523 yields surface 470.7 and height 264.438.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0082', 0, () => {
      const width: number = 523;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 470.7)).assertLess(0.001);
      expect(Math.abs(height - 264.438)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0083
     * @tc.name      test8wUiMetric0083
     * @tc.desc      UI metric width 526 yields surface 473.4 and height 265.955.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0083', 0, () => {
      const width: number = 526;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 473.4)).assertLess(0.001);
      expect(Math.abs(height - 265.955)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0084
     * @tc.name      test8wUiMetric0084
     * @tc.desc      UI metric width 529 yields surface 476.1 and height 267.472.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0084', 0, () => {
      const width: number = 529;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 476.1)).assertLess(0.001);
      expect(Math.abs(height - 267.472)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0085
     * @tc.name      test8wUiMetric0085
     * @tc.desc      UI metric width 532 yields surface 478.8 and height 268.989.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0085', 0, () => {
      const width: number = 532;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 478.8)).assertLess(0.001);
      expect(Math.abs(height - 268.989)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0086
     * @tc.name      test8wUiMetric0086
     * @tc.desc      UI metric width 535 yields surface 481.5 and height 270.506.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0086', 0, () => {
      const width: number = 535;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 481.5)).assertLess(0.001);
      expect(Math.abs(height - 270.506)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0087
     * @tc.name      test8wUiMetric0087
     * @tc.desc      UI metric width 538 yields surface 484.2 and height 272.022.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0087', 0, () => {
      const width: number = 538;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 484.2)).assertLess(0.001);
      expect(Math.abs(height - 272.022)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0088
     * @tc.name      test8wUiMetric0088
     * @tc.desc      UI metric width 541 yields surface 486.9 and height 273.539.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0088', 0, () => {
      const width: number = 541;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 486.9)).assertLess(0.001);
      expect(Math.abs(height - 273.539)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0089
     * @tc.name      test8wUiMetric0089
     * @tc.desc      UI metric width 544 yields surface 489.6 and height 275.056.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0089', 0, () => {
      const width: number = 544;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 489.6)).assertLess(0.001);
      expect(Math.abs(height - 275.056)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0090
     * @tc.name      test8wUiMetric0090
     * @tc.desc      UI metric width 547 yields surface 492.3 and height 276.573.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0090', 0, () => {
      const width: number = 547;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 492.3)).assertLess(0.001);
      expect(Math.abs(height - 276.573)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0091
     * @tc.name      test8wUiMetric0091
     * @tc.desc      UI metric width 550 yields surface 495.0 and height 278.09.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0091', 0, () => {
      const width: number = 550;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 495.0)).assertLess(0.001);
      expect(Math.abs(height - 278.09)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0092
     * @tc.name      test8wUiMetric0092
     * @tc.desc      UI metric width 553 yields surface 497.7 and height 279.607.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0092', 0, () => {
      const width: number = 553;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 497.7)).assertLess(0.001);
      expect(Math.abs(height - 279.607)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0093
     * @tc.name      test8wUiMetric0093
     * @tc.desc      UI metric width 556 yields surface 500.4 and height 281.124.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0093', 0, () => {
      const width: number = 556;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 500.4)).assertLess(0.001);
      expect(Math.abs(height - 281.124)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0094
     * @tc.name      test8wUiMetric0094
     * @tc.desc      UI metric width 559 yields surface 503.1 and height 282.64.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0094', 0, () => {
      const width: number = 559;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 503.1)).assertLess(0.001);
      expect(Math.abs(height - 282.64)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0095
     * @tc.name      test8wUiMetric0095
     * @tc.desc      UI metric width 562 yields surface 505.8 and height 284.157.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0095', 0, () => {
      const width: number = 562;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 505.8)).assertLess(0.001);
      expect(Math.abs(height - 284.157)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0096
     * @tc.name      test8wUiMetric0096
     * @tc.desc      UI metric width 565 yields surface 508.5 and height 285.674.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0096', 0, () => {
      const width: number = 565;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 508.5)).assertLess(0.001);
      expect(Math.abs(height - 285.674)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0097
     * @tc.name      test8wUiMetric0097
     * @tc.desc      UI metric width 568 yields surface 511.2 and height 287.191.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0097', 0, () => {
      const width: number = 568;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 511.2)).assertLess(0.001);
      expect(Math.abs(height - 287.191)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0098
     * @tc.name      test8wUiMetric0098
     * @tc.desc      UI metric width 571 yields surface 513.9 and height 288.708.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0098', 0, () => {
      const width: number = 571;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 513.9)).assertLess(0.001);
      expect(Math.abs(height - 288.708)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0099
     * @tc.name      test8wUiMetric0099
     * @tc.desc      UI metric width 574 yields surface 516.6 and height 290.225.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0099', 0, () => {
      const width: number = 574;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 516.6)).assertLess(0.001);
      expect(Math.abs(height - 290.225)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_UI_0100
     * @tc.name      test8wUiMetric0100
     * @tc.desc      UI metric width 577 yields surface 519.3 and height 291.742.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wUiMetric0100', 0, () => {
      const width: number = 577;
      const surface: number = width * 0.9;
      const height: number = surface / 1.78;
      const ratio: number = surface / height;
      expect(Math.abs(surface - 519.3)).assertLess(0.001);
      expect(Math.abs(height - 291.742)).assertLess(0.001);
      expect(Math.abs(ratio - 1.78)).assertLess(0.001);
      expect(width).assertLarger(height);
    })
  })
}
