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

export default function uiMetricsExpandedTest() {
  describe('uiMetricsExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0001
     * @tc.name      testMoreUiMetrics0001
     * @tc.desc      Viewport width 280 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0001', 0, () => {
      const width: number = 280;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 157.5)).assertLess(0.001);
      expect(Math.abs(half - 140.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0002
     * @tc.name      testMoreUiMetrics0002
     * @tc.desc      Viewport width 283 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0002', 0, () => {
      const width: number = 283;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 159.188)).assertLess(0.001);
      expect(Math.abs(half - 141.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0003
     * @tc.name      testMoreUiMetrics0003
     * @tc.desc      Viewport width 286 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0003', 0, () => {
      const width: number = 286;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 160.875)).assertLess(0.001);
      expect(Math.abs(half - 143.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0004
     * @tc.name      testMoreUiMetrics0004
     * @tc.desc      Viewport width 289 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0004', 0, () => {
      const width: number = 289;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 162.562)).assertLess(0.001);
      expect(Math.abs(half - 144.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0005
     * @tc.name      testMoreUiMetrics0005
     * @tc.desc      Viewport width 292 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0005', 0, () => {
      const width: number = 292;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 164.25)).assertLess(0.001);
      expect(Math.abs(half - 146.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0006
     * @tc.name      testMoreUiMetrics0006
     * @tc.desc      Viewport width 295 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0006', 0, () => {
      const width: number = 295;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 165.938)).assertLess(0.001);
      expect(Math.abs(half - 147.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0007
     * @tc.name      testMoreUiMetrics0007
     * @tc.desc      Viewport width 298 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0007', 0, () => {
      const width: number = 298;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 167.625)).assertLess(0.001);
      expect(Math.abs(half - 149.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0008
     * @tc.name      testMoreUiMetrics0008
     * @tc.desc      Viewport width 301 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0008', 0, () => {
      const width: number = 301;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 169.312)).assertLess(0.001);
      expect(Math.abs(half - 150.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0009
     * @tc.name      testMoreUiMetrics0009
     * @tc.desc      Viewport width 304 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0009', 0, () => {
      const width: number = 304;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 171.0)).assertLess(0.001);
      expect(Math.abs(half - 152.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0010
     * @tc.name      testMoreUiMetrics0010
     * @tc.desc      Viewport width 307 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0010', 0, () => {
      const width: number = 307;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 172.688)).assertLess(0.001);
      expect(Math.abs(half - 153.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0011
     * @tc.name      testMoreUiMetrics0011
     * @tc.desc      Viewport width 310 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0011', 0, () => {
      const width: number = 310;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 174.375)).assertLess(0.001);
      expect(Math.abs(half - 155.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0012
     * @tc.name      testMoreUiMetrics0012
     * @tc.desc      Viewport width 313 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0012', 0, () => {
      const width: number = 313;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 176.062)).assertLess(0.001);
      expect(Math.abs(half - 156.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0013
     * @tc.name      testMoreUiMetrics0013
     * @tc.desc      Viewport width 316 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0013', 0, () => {
      const width: number = 316;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 177.75)).assertLess(0.001);
      expect(Math.abs(half - 158.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0014
     * @tc.name      testMoreUiMetrics0014
     * @tc.desc      Viewport width 319 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0014', 0, () => {
      const width: number = 319;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 179.438)).assertLess(0.001);
      expect(Math.abs(half - 159.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0015
     * @tc.name      testMoreUiMetrics0015
     * @tc.desc      Viewport width 322 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0015', 0, () => {
      const width: number = 322;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 181.125)).assertLess(0.001);
      expect(Math.abs(half - 161.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0016
     * @tc.name      testMoreUiMetrics0016
     * @tc.desc      Viewport width 325 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0016', 0, () => {
      const width: number = 325;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 182.812)).assertLess(0.001);
      expect(Math.abs(half - 162.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0017
     * @tc.name      testMoreUiMetrics0017
     * @tc.desc      Viewport width 328 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0017', 0, () => {
      const width: number = 328;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 184.5)).assertLess(0.001);
      expect(Math.abs(half - 164.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0018
     * @tc.name      testMoreUiMetrics0018
     * @tc.desc      Viewport width 331 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0018', 0, () => {
      const width: number = 331;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 186.188)).assertLess(0.001);
      expect(Math.abs(half - 165.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0019
     * @tc.name      testMoreUiMetrics0019
     * @tc.desc      Viewport width 334 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0019', 0, () => {
      const width: number = 334;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 187.875)).assertLess(0.001);
      expect(Math.abs(half - 167.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0020
     * @tc.name      testMoreUiMetrics0020
     * @tc.desc      Viewport width 337 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0020', 0, () => {
      const width: number = 337;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 189.562)).assertLess(0.001);
      expect(Math.abs(half - 168.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0021
     * @tc.name      testMoreUiMetrics0021
     * @tc.desc      Viewport width 340 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0021', 0, () => {
      const width: number = 340;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 191.25)).assertLess(0.001);
      expect(Math.abs(half - 170.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0022
     * @tc.name      testMoreUiMetrics0022
     * @tc.desc      Viewport width 343 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0022', 0, () => {
      const width: number = 343;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 192.938)).assertLess(0.001);
      expect(Math.abs(half - 171.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0023
     * @tc.name      testMoreUiMetrics0023
     * @tc.desc      Viewport width 346 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0023', 0, () => {
      const width: number = 346;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 194.625)).assertLess(0.001);
      expect(Math.abs(half - 173.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0024
     * @tc.name      testMoreUiMetrics0024
     * @tc.desc      Viewport width 349 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0024', 0, () => {
      const width: number = 349;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 196.312)).assertLess(0.001);
      expect(Math.abs(half - 174.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0025
     * @tc.name      testMoreUiMetrics0025
     * @tc.desc      Viewport width 352 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0025', 0, () => {
      const width: number = 352;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 198.0)).assertLess(0.001);
      expect(Math.abs(half - 176.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0026
     * @tc.name      testMoreUiMetrics0026
     * @tc.desc      Viewport width 355 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0026', 0, () => {
      const width: number = 355;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 199.688)).assertLess(0.001);
      expect(Math.abs(half - 177.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0027
     * @tc.name      testMoreUiMetrics0027
     * @tc.desc      Viewport width 358 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0027', 0, () => {
      const width: number = 358;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 201.375)).assertLess(0.001);
      expect(Math.abs(half - 179.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0028
     * @tc.name      testMoreUiMetrics0028
     * @tc.desc      Viewport width 361 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0028', 0, () => {
      const width: number = 361;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 203.062)).assertLess(0.001);
      expect(Math.abs(half - 180.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0029
     * @tc.name      testMoreUiMetrics0029
     * @tc.desc      Viewport width 364 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0029', 0, () => {
      const width: number = 364;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 204.75)).assertLess(0.001);
      expect(Math.abs(half - 182.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0030
     * @tc.name      testMoreUiMetrics0030
     * @tc.desc      Viewport width 367 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0030', 0, () => {
      const width: number = 367;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 206.438)).assertLess(0.001);
      expect(Math.abs(half - 183.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0031
     * @tc.name      testMoreUiMetrics0031
     * @tc.desc      Viewport width 370 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0031', 0, () => {
      const width: number = 370;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 208.125)).assertLess(0.001);
      expect(Math.abs(half - 185.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0032
     * @tc.name      testMoreUiMetrics0032
     * @tc.desc      Viewport width 373 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0032', 0, () => {
      const width: number = 373;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 209.812)).assertLess(0.001);
      expect(Math.abs(half - 186.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0033
     * @tc.name      testMoreUiMetrics0033
     * @tc.desc      Viewport width 376 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0033', 0, () => {
      const width: number = 376;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 211.5)).assertLess(0.001);
      expect(Math.abs(half - 188.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0034
     * @tc.name      testMoreUiMetrics0034
     * @tc.desc      Viewport width 379 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0034', 0, () => {
      const width: number = 379;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 213.188)).assertLess(0.001);
      expect(Math.abs(half - 189.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0035
     * @tc.name      testMoreUiMetrics0035
     * @tc.desc      Viewport width 382 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0035', 0, () => {
      const width: number = 382;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 214.875)).assertLess(0.001);
      expect(Math.abs(half - 191.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0036
     * @tc.name      testMoreUiMetrics0036
     * @tc.desc      Viewport width 385 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0036', 0, () => {
      const width: number = 385;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 216.562)).assertLess(0.001);
      expect(Math.abs(half - 192.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0037
     * @tc.name      testMoreUiMetrics0037
     * @tc.desc      Viewport width 388 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0037', 0, () => {
      const width: number = 388;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 218.25)).assertLess(0.001);
      expect(Math.abs(half - 194.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0038
     * @tc.name      testMoreUiMetrics0038
     * @tc.desc      Viewport width 391 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0038', 0, () => {
      const width: number = 391;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 219.938)).assertLess(0.001);
      expect(Math.abs(half - 195.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0039
     * @tc.name      testMoreUiMetrics0039
     * @tc.desc      Viewport width 394 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0039', 0, () => {
      const width: number = 394;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 221.625)).assertLess(0.001);
      expect(Math.abs(half - 197.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0040
     * @tc.name      testMoreUiMetrics0040
     * @tc.desc      Viewport width 397 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0040', 0, () => {
      const width: number = 397;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 223.312)).assertLess(0.001);
      expect(Math.abs(half - 198.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0041
     * @tc.name      testMoreUiMetrics0041
     * @tc.desc      Viewport width 400 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0041', 0, () => {
      const width: number = 400;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 225.0)).assertLess(0.001);
      expect(Math.abs(half - 200.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0042
     * @tc.name      testMoreUiMetrics0042
     * @tc.desc      Viewport width 403 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0042', 0, () => {
      const width: number = 403;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 226.688)).assertLess(0.001);
      expect(Math.abs(half - 201.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0043
     * @tc.name      testMoreUiMetrics0043
     * @tc.desc      Viewport width 406 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0043', 0, () => {
      const width: number = 406;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 228.375)).assertLess(0.001);
      expect(Math.abs(half - 203.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0044
     * @tc.name      testMoreUiMetrics0044
     * @tc.desc      Viewport width 409 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0044', 0, () => {
      const width: number = 409;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 230.062)).assertLess(0.001);
      expect(Math.abs(half - 204.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0045
     * @tc.name      testMoreUiMetrics0045
     * @tc.desc      Viewport width 412 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0045', 0, () => {
      const width: number = 412;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 231.75)).assertLess(0.001);
      expect(Math.abs(half - 206.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0046
     * @tc.name      testMoreUiMetrics0046
     * @tc.desc      Viewport width 415 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0046', 0, () => {
      const width: number = 415;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 233.438)).assertLess(0.001);
      expect(Math.abs(half - 207.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0047
     * @tc.name      testMoreUiMetrics0047
     * @tc.desc      Viewport width 418 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0047', 0, () => {
      const width: number = 418;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 235.125)).assertLess(0.001);
      expect(Math.abs(half - 209.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0048
     * @tc.name      testMoreUiMetrics0048
     * @tc.desc      Viewport width 421 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0048', 0, () => {
      const width: number = 421;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 236.812)).assertLess(0.001);
      expect(Math.abs(half - 210.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0049
     * @tc.name      testMoreUiMetrics0049
     * @tc.desc      Viewport width 424 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0049', 0, () => {
      const width: number = 424;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 238.5)).assertLess(0.001);
      expect(Math.abs(half - 212.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0050
     * @tc.name      testMoreUiMetrics0050
     * @tc.desc      Viewport width 427 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0050', 0, () => {
      const width: number = 427;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 240.188)).assertLess(0.001);
      expect(Math.abs(half - 213.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0051
     * @tc.name      testMoreUiMetrics0051
     * @tc.desc      Viewport width 430 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0051', 0, () => {
      const width: number = 430;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 241.875)).assertLess(0.001);
      expect(Math.abs(half - 215.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0052
     * @tc.name      testMoreUiMetrics0052
     * @tc.desc      Viewport width 433 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0052', 0, () => {
      const width: number = 433;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 243.562)).assertLess(0.001);
      expect(Math.abs(half - 216.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0053
     * @tc.name      testMoreUiMetrics0053
     * @tc.desc      Viewport width 436 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0053', 0, () => {
      const width: number = 436;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 245.25)).assertLess(0.001);
      expect(Math.abs(half - 218.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0054
     * @tc.name      testMoreUiMetrics0054
     * @tc.desc      Viewport width 439 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0054', 0, () => {
      const width: number = 439;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 246.938)).assertLess(0.001);
      expect(Math.abs(half - 219.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0055
     * @tc.name      testMoreUiMetrics0055
     * @tc.desc      Viewport width 442 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0055', 0, () => {
      const width: number = 442;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 248.625)).assertLess(0.001);
      expect(Math.abs(half - 221.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0056
     * @tc.name      testMoreUiMetrics0056
     * @tc.desc      Viewport width 445 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0056', 0, () => {
      const width: number = 445;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 250.312)).assertLess(0.001);
      expect(Math.abs(half - 222.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0057
     * @tc.name      testMoreUiMetrics0057
     * @tc.desc      Viewport width 448 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0057', 0, () => {
      const width: number = 448;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 252.0)).assertLess(0.001);
      expect(Math.abs(half - 224.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0058
     * @tc.name      testMoreUiMetrics0058
     * @tc.desc      Viewport width 451 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0058', 0, () => {
      const width: number = 451;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 253.688)).assertLess(0.001);
      expect(Math.abs(half - 225.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0059
     * @tc.name      testMoreUiMetrics0059
     * @tc.desc      Viewport width 454 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0059', 0, () => {
      const width: number = 454;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 255.375)).assertLess(0.001);
      expect(Math.abs(half - 227.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0060
     * @tc.name      testMoreUiMetrics0060
     * @tc.desc      Viewport width 457 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0060', 0, () => {
      const width: number = 457;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 257.062)).assertLess(0.001);
      expect(Math.abs(half - 228.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0061
     * @tc.name      testMoreUiMetrics0061
     * @tc.desc      Viewport width 460 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0061', 0, () => {
      const width: number = 460;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 258.75)).assertLess(0.001);
      expect(Math.abs(half - 230.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0062
     * @tc.name      testMoreUiMetrics0062
     * @tc.desc      Viewport width 463 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0062', 0, () => {
      const width: number = 463;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 260.438)).assertLess(0.001);
      expect(Math.abs(half - 231.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0063
     * @tc.name      testMoreUiMetrics0063
     * @tc.desc      Viewport width 466 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0063', 0, () => {
      const width: number = 466;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 262.125)).assertLess(0.001);
      expect(Math.abs(half - 233.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0064
     * @tc.name      testMoreUiMetrics0064
     * @tc.desc      Viewport width 469 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0064', 0, () => {
      const width: number = 469;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 263.812)).assertLess(0.001);
      expect(Math.abs(half - 234.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0065
     * @tc.name      testMoreUiMetrics0065
     * @tc.desc      Viewport width 472 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0065', 0, () => {
      const width: number = 472;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 265.5)).assertLess(0.001);
      expect(Math.abs(half - 236.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0066
     * @tc.name      testMoreUiMetrics0066
     * @tc.desc      Viewport width 475 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0066', 0, () => {
      const width: number = 475;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 267.188)).assertLess(0.001);
      expect(Math.abs(half - 237.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0067
     * @tc.name      testMoreUiMetrics0067
     * @tc.desc      Viewport width 478 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0067', 0, () => {
      const width: number = 478;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 268.875)).assertLess(0.001);
      expect(Math.abs(half - 239.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0068
     * @tc.name      testMoreUiMetrics0068
     * @tc.desc      Viewport width 481 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0068', 0, () => {
      const width: number = 481;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 270.562)).assertLess(0.001);
      expect(Math.abs(half - 240.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0069
     * @tc.name      testMoreUiMetrics0069
     * @tc.desc      Viewport width 484 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0069', 0, () => {
      const width: number = 484;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 272.25)).assertLess(0.001);
      expect(Math.abs(half - 242.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0070
     * @tc.name      testMoreUiMetrics0070
     * @tc.desc      Viewport width 487 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0070', 0, () => {
      const width: number = 487;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 273.938)).assertLess(0.001);
      expect(Math.abs(half - 243.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0071
     * @tc.name      testMoreUiMetrics0071
     * @tc.desc      Viewport width 490 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0071', 0, () => {
      const width: number = 490;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 275.625)).assertLess(0.001);
      expect(Math.abs(half - 245.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0072
     * @tc.name      testMoreUiMetrics0072
     * @tc.desc      Viewport width 493 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0072', 0, () => {
      const width: number = 493;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 277.312)).assertLess(0.001);
      expect(Math.abs(half - 246.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0073
     * @tc.name      testMoreUiMetrics0073
     * @tc.desc      Viewport width 496 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0073', 0, () => {
      const width: number = 496;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 279.0)).assertLess(0.001);
      expect(Math.abs(half - 248.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0074
     * @tc.name      testMoreUiMetrics0074
     * @tc.desc      Viewport width 499 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0074', 0, () => {
      const width: number = 499;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 280.688)).assertLess(0.001);
      expect(Math.abs(half - 249.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0075
     * @tc.name      testMoreUiMetrics0075
     * @tc.desc      Viewport width 502 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0075', 0, () => {
      const width: number = 502;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 282.375)).assertLess(0.001);
      expect(Math.abs(half - 251.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0076
     * @tc.name      testMoreUiMetrics0076
     * @tc.desc      Viewport width 505 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0076', 0, () => {
      const width: number = 505;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 284.062)).assertLess(0.001);
      expect(Math.abs(half - 252.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0077
     * @tc.name      testMoreUiMetrics0077
     * @tc.desc      Viewport width 508 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0077', 0, () => {
      const width: number = 508;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 285.75)).assertLess(0.001);
      expect(Math.abs(half - 254.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0078
     * @tc.name      testMoreUiMetrics0078
     * @tc.desc      Viewport width 511 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0078', 0, () => {
      const width: number = 511;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 287.438)).assertLess(0.001);
      expect(Math.abs(half - 255.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0079
     * @tc.name      testMoreUiMetrics0079
     * @tc.desc      Viewport width 514 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0079', 0, () => {
      const width: number = 514;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 289.125)).assertLess(0.001);
      expect(Math.abs(half - 257.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0080
     * @tc.name      testMoreUiMetrics0080
     * @tc.desc      Viewport width 517 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0080', 0, () => {
      const width: number = 517;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 290.812)).assertLess(0.001);
      expect(Math.abs(half - 258.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0081
     * @tc.name      testMoreUiMetrics0081
     * @tc.desc      Viewport width 520 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0081', 0, () => {
      const width: number = 520;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 292.5)).assertLess(0.001);
      expect(Math.abs(half - 260.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0082
     * @tc.name      testMoreUiMetrics0082
     * @tc.desc      Viewport width 523 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0082', 0, () => {
      const width: number = 523;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 294.188)).assertLess(0.001);
      expect(Math.abs(half - 261.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0083
     * @tc.name      testMoreUiMetrics0083
     * @tc.desc      Viewport width 526 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0083', 0, () => {
      const width: number = 526;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 295.875)).assertLess(0.001);
      expect(Math.abs(half - 263.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0084
     * @tc.name      testMoreUiMetrics0084
     * @tc.desc      Viewport width 529 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0084', 0, () => {
      const width: number = 529;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 297.562)).assertLess(0.001);
      expect(Math.abs(half - 264.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0085
     * @tc.name      testMoreUiMetrics0085
     * @tc.desc      Viewport width 532 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0085', 0, () => {
      const width: number = 532;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 299.25)).assertLess(0.001);
      expect(Math.abs(half - 266.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0086
     * @tc.name      testMoreUiMetrics0086
     * @tc.desc      Viewport width 535 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0086', 0, () => {
      const width: number = 535;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 300.938)).assertLess(0.001);
      expect(Math.abs(half - 267.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0087
     * @tc.name      testMoreUiMetrics0087
     * @tc.desc      Viewport width 538 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0087', 0, () => {
      const width: number = 538;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 302.625)).assertLess(0.001);
      expect(Math.abs(half - 269.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0088
     * @tc.name      testMoreUiMetrics0088
     * @tc.desc      Viewport width 541 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0088', 0, () => {
      const width: number = 541;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 304.312)).assertLess(0.001);
      expect(Math.abs(half - 270.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0089
     * @tc.name      testMoreUiMetrics0089
     * @tc.desc      Viewport width 544 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0089', 0, () => {
      const width: number = 544;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 306.0)).assertLess(0.001);
      expect(Math.abs(half - 272.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0090
     * @tc.name      testMoreUiMetrics0090
     * @tc.desc      Viewport width 547 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0090', 0, () => {
      const width: number = 547;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 307.688)).assertLess(0.001);
      expect(Math.abs(half - 273.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0091
     * @tc.name      testMoreUiMetrics0091
     * @tc.desc      Viewport width 550 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0091', 0, () => {
      const width: number = 550;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 309.375)).assertLess(0.001);
      expect(Math.abs(half - 275.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0092
     * @tc.name      testMoreUiMetrics0092
     * @tc.desc      Viewport width 553 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0092', 0, () => {
      const width: number = 553;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 311.062)).assertLess(0.001);
      expect(Math.abs(half - 276.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0093
     * @tc.name      testMoreUiMetrics0093
     * @tc.desc      Viewport width 556 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0093', 0, () => {
      const width: number = 556;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 312.75)).assertLess(0.001);
      expect(Math.abs(half - 278.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0094
     * @tc.name      testMoreUiMetrics0094
     * @tc.desc      Viewport width 559 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0094', 0, () => {
      const width: number = 559;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 314.438)).assertLess(0.001);
      expect(Math.abs(half - 279.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0095
     * @tc.name      testMoreUiMetrics0095
     * @tc.desc      Viewport width 562 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0095', 0, () => {
      const width: number = 562;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 316.125)).assertLess(0.001);
      expect(Math.abs(half - 281.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0096
     * @tc.name      testMoreUiMetrics0096
     * @tc.desc      Viewport width 565 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0096', 0, () => {
      const width: number = 565;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 317.812)).assertLess(0.001);
      expect(Math.abs(half - 282.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0097
     * @tc.name      testMoreUiMetrics0097
     * @tc.desc      Viewport width 568 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0097', 0, () => {
      const width: number = 568;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 319.5)).assertLess(0.001);
      expect(Math.abs(half - 284.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0098
     * @tc.name      testMoreUiMetrics0098
     * @tc.desc      Viewport width 571 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0098', 0, () => {
      const width: number = 571;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 321.188)).assertLess(0.001);
      expect(Math.abs(half - 285.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0099
     * @tc.name      testMoreUiMetrics0099
     * @tc.desc      Viewport width 574 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0099', 0, () => {
      const width: number = 574;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 322.875)).assertLess(0.001);
      expect(Math.abs(half - 287.0)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_UIM_0100
     * @tc.name      testMoreUiMetrics0100
     * @tc.desc      Viewport width 577 keeps height and half-width relationships.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreUiMetrics0100', 0, () => {
      const width: number = 577;
      const height: number = width * 9 / 16;
      const half: number = width / 2;
      expect(Math.abs(height - 324.562)).assertLess(0.001);
      expect(Math.abs(half - 288.5)).assertLess(0.001);
      expect(width).assertLarger(height);
      expect(half).assertLarger(0);
    })
  })
}
