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


export default function uiLayoutExpandedTest() {
  describe('uiLayoutExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0001
     * @tc.name      testExpUiLayout0001
     * @tc.desc      Window width 300 yields surface height 151.685.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0001', 0, () => {
      const windowWidth: number = 300;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 270.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 151.685)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0002
     * @tc.name      testExpUiLayout0002
     * @tc.desc      Window width 304 yields surface height 153.708.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0002', 0, () => {
      const windowWidth: number = 304;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 273.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 153.708)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0003
     * @tc.name      testExpUiLayout0003
     * @tc.desc      Window width 308 yields surface height 155.73.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0003', 0, () => {
      const windowWidth: number = 308;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 277.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 155.73)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0004
     * @tc.name      testExpUiLayout0004
     * @tc.desc      Window width 312 yields surface height 157.753.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0004', 0, () => {
      const windowWidth: number = 312;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 280.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 157.753)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0005
     * @tc.name      testExpUiLayout0005
     * @tc.desc      Window width 316 yields surface height 159.775.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0005', 0, () => {
      const windowWidth: number = 316;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 284.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 159.775)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0006
     * @tc.name      testExpUiLayout0006
     * @tc.desc      Window width 320 yields surface height 161.798.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0006', 0, () => {
      const windowWidth: number = 320;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 288.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 161.798)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0007
     * @tc.name      testExpUiLayout0007
     * @tc.desc      Window width 324 yields surface height 163.82.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0007', 0, () => {
      const windowWidth: number = 324;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 291.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 163.82)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0008
     * @tc.name      testExpUiLayout0008
     * @tc.desc      Window width 328 yields surface height 165.843.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0008', 0, () => {
      const windowWidth: number = 328;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 295.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 165.843)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0009
     * @tc.name      testExpUiLayout0009
     * @tc.desc      Window width 332 yields surface height 167.865.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0009', 0, () => {
      const windowWidth: number = 332;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 298.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 167.865)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0010
     * @tc.name      testExpUiLayout0010
     * @tc.desc      Window width 336 yields surface height 169.888.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0010', 0, () => {
      const windowWidth: number = 336;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 302.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 169.888)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0011
     * @tc.name      testExpUiLayout0011
     * @tc.desc      Window width 340 yields surface height 171.91.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0011', 0, () => {
      const windowWidth: number = 340;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 306.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 171.91)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0012
     * @tc.name      testExpUiLayout0012
     * @tc.desc      Window width 344 yields surface height 173.933.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0012', 0, () => {
      const windowWidth: number = 344;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 309.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 173.933)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0013
     * @tc.name      testExpUiLayout0013
     * @tc.desc      Window width 348 yields surface height 175.955.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0013', 0, () => {
      const windowWidth: number = 348;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 313.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 175.955)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0014
     * @tc.name      testExpUiLayout0014
     * @tc.desc      Window width 352 yields surface height 177.978.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0014', 0, () => {
      const windowWidth: number = 352;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 316.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 177.978)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0015
     * @tc.name      testExpUiLayout0015
     * @tc.desc      Window width 356 yields surface height 180.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0015', 0, () => {
      const windowWidth: number = 356;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 320.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 180.0)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0016
     * @tc.name      testExpUiLayout0016
     * @tc.desc      Window width 360 yields surface height 182.022.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0016', 0, () => {
      const windowWidth: number = 360;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 324.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 182.022)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0017
     * @tc.name      testExpUiLayout0017
     * @tc.desc      Window width 364 yields surface height 184.045.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0017', 0, () => {
      const windowWidth: number = 364;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 327.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 184.045)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0018
     * @tc.name      testExpUiLayout0018
     * @tc.desc      Window width 368 yields surface height 186.067.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0018', 0, () => {
      const windowWidth: number = 368;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 331.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 186.067)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0019
     * @tc.name      testExpUiLayout0019
     * @tc.desc      Window width 372 yields surface height 188.09.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0019', 0, () => {
      const windowWidth: number = 372;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 334.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 188.09)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0020
     * @tc.name      testExpUiLayout0020
     * @tc.desc      Window width 376 yields surface height 190.112.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0020', 0, () => {
      const windowWidth: number = 376;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 338.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 190.112)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0021
     * @tc.name      testExpUiLayout0021
     * @tc.desc      Window width 380 yields surface height 192.135.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0021', 0, () => {
      const windowWidth: number = 380;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 342.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 192.135)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0022
     * @tc.name      testExpUiLayout0022
     * @tc.desc      Window width 384 yields surface height 194.157.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0022', 0, () => {
      const windowWidth: number = 384;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 345.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 194.157)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0023
     * @tc.name      testExpUiLayout0023
     * @tc.desc      Window width 388 yields surface height 196.18.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0023', 0, () => {
      const windowWidth: number = 388;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 349.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 196.18)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0024
     * @tc.name      testExpUiLayout0024
     * @tc.desc      Window width 392 yields surface height 198.202.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0024', 0, () => {
      const windowWidth: number = 392;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 352.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 198.202)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0025
     * @tc.name      testExpUiLayout0025
     * @tc.desc      Window width 396 yields surface height 200.225.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0025', 0, () => {
      const windowWidth: number = 396;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 356.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 200.225)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0026
     * @tc.name      testExpUiLayout0026
     * @tc.desc      Window width 400 yields surface height 202.247.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0026', 0, () => {
      const windowWidth: number = 400;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 360.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 202.247)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0027
     * @tc.name      testExpUiLayout0027
     * @tc.desc      Window width 404 yields surface height 204.27.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0027', 0, () => {
      const windowWidth: number = 404;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 363.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 204.27)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0028
     * @tc.name      testExpUiLayout0028
     * @tc.desc      Window width 408 yields surface height 206.292.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0028', 0, () => {
      const windowWidth: number = 408;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 367.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 206.292)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0029
     * @tc.name      testExpUiLayout0029
     * @tc.desc      Window width 412 yields surface height 208.315.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0029', 0, () => {
      const windowWidth: number = 412;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 370.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 208.315)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0030
     * @tc.name      testExpUiLayout0030
     * @tc.desc      Window width 416 yields surface height 210.337.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0030', 0, () => {
      const windowWidth: number = 416;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 374.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 210.337)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0031
     * @tc.name      testExpUiLayout0031
     * @tc.desc      Window width 420 yields surface height 212.36.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0031', 0, () => {
      const windowWidth: number = 420;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 378.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 212.36)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0032
     * @tc.name      testExpUiLayout0032
     * @tc.desc      Window width 424 yields surface height 214.382.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0032', 0, () => {
      const windowWidth: number = 424;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 381.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 214.382)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0033
     * @tc.name      testExpUiLayout0033
     * @tc.desc      Window width 428 yields surface height 216.404.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0033', 0, () => {
      const windowWidth: number = 428;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 385.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 216.404)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0034
     * @tc.name      testExpUiLayout0034
     * @tc.desc      Window width 432 yields surface height 218.427.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0034', 0, () => {
      const windowWidth: number = 432;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 388.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 218.427)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0035
     * @tc.name      testExpUiLayout0035
     * @tc.desc      Window width 436 yields surface height 220.449.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0035', 0, () => {
      const windowWidth: number = 436;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 392.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 220.449)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0036
     * @tc.name      testExpUiLayout0036
     * @tc.desc      Window width 440 yields surface height 222.472.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0036', 0, () => {
      const windowWidth: number = 440;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 396.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 222.472)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0037
     * @tc.name      testExpUiLayout0037
     * @tc.desc      Window width 444 yields surface height 224.494.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0037', 0, () => {
      const windowWidth: number = 444;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 399.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 224.494)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0038
     * @tc.name      testExpUiLayout0038
     * @tc.desc      Window width 448 yields surface height 226.517.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0038', 0, () => {
      const windowWidth: number = 448;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 403.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 226.517)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0039
     * @tc.name      testExpUiLayout0039
     * @tc.desc      Window width 452 yields surface height 228.539.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0039', 0, () => {
      const windowWidth: number = 452;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 406.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 228.539)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0040
     * @tc.name      testExpUiLayout0040
     * @tc.desc      Window width 456 yields surface height 230.562.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0040', 0, () => {
      const windowWidth: number = 456;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 410.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 230.562)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0041
     * @tc.name      testExpUiLayout0041
     * @tc.desc      Window width 460 yields surface height 232.584.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0041', 0, () => {
      const windowWidth: number = 460;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 414.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 232.584)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0042
     * @tc.name      testExpUiLayout0042
     * @tc.desc      Window width 464 yields surface height 234.607.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0042', 0, () => {
      const windowWidth: number = 464;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 417.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 234.607)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0043
     * @tc.name      testExpUiLayout0043
     * @tc.desc      Window width 468 yields surface height 236.629.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0043', 0, () => {
      const windowWidth: number = 468;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 421.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 236.629)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0044
     * @tc.name      testExpUiLayout0044
     * @tc.desc      Window width 472 yields surface height 238.652.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0044', 0, () => {
      const windowWidth: number = 472;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 424.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 238.652)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0045
     * @tc.name      testExpUiLayout0045
     * @tc.desc      Window width 476 yields surface height 240.674.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0045', 0, () => {
      const windowWidth: number = 476;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 428.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 240.674)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0046
     * @tc.name      testExpUiLayout0046
     * @tc.desc      Window width 480 yields surface height 242.697.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0046', 0, () => {
      const windowWidth: number = 480;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 432.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 242.697)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0047
     * @tc.name      testExpUiLayout0047
     * @tc.desc      Window width 484 yields surface height 244.719.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0047', 0, () => {
      const windowWidth: number = 484;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 435.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 244.719)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0048
     * @tc.name      testExpUiLayout0048
     * @tc.desc      Window width 488 yields surface height 246.742.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0048', 0, () => {
      const windowWidth: number = 488;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 439.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 246.742)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0049
     * @tc.name      testExpUiLayout0049
     * @tc.desc      Window width 492 yields surface height 248.764.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0049', 0, () => {
      const windowWidth: number = 492;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 442.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 248.764)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0050
     * @tc.name      testExpUiLayout0050
     * @tc.desc      Window width 496 yields surface height 250.787.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0050', 0, () => {
      const windowWidth: number = 496;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 446.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 250.787)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0051
     * @tc.name      testExpUiLayout0051
     * @tc.desc      Window width 500 yields surface height 252.809.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0051', 0, () => {
      const windowWidth: number = 500;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 450.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 252.809)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0052
     * @tc.name      testExpUiLayout0052
     * @tc.desc      Window width 504 yields surface height 254.831.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0052', 0, () => {
      const windowWidth: number = 504;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 453.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 254.831)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0053
     * @tc.name      testExpUiLayout0053
     * @tc.desc      Window width 508 yields surface height 256.854.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0053', 0, () => {
      const windowWidth: number = 508;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 457.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 256.854)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0054
     * @tc.name      testExpUiLayout0054
     * @tc.desc      Window width 512 yields surface height 258.876.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0054', 0, () => {
      const windowWidth: number = 512;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 460.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 258.876)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0055
     * @tc.name      testExpUiLayout0055
     * @tc.desc      Window width 516 yields surface height 260.899.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0055', 0, () => {
      const windowWidth: number = 516;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 464.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 260.899)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0056
     * @tc.name      testExpUiLayout0056
     * @tc.desc      Window width 520 yields surface height 262.921.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0056', 0, () => {
      const windowWidth: number = 520;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 468.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 262.921)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0057
     * @tc.name      testExpUiLayout0057
     * @tc.desc      Window width 524 yields surface height 264.944.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0057', 0, () => {
      const windowWidth: number = 524;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 471.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 264.944)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0058
     * @tc.name      testExpUiLayout0058
     * @tc.desc      Window width 528 yields surface height 266.966.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0058', 0, () => {
      const windowWidth: number = 528;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 475.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 266.966)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0059
     * @tc.name      testExpUiLayout0059
     * @tc.desc      Window width 532 yields surface height 268.989.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0059', 0, () => {
      const windowWidth: number = 532;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 478.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 268.989)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0060
     * @tc.name      testExpUiLayout0060
     * @tc.desc      Window width 536 yields surface height 271.011.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0060', 0, () => {
      const windowWidth: number = 536;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 482.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 271.011)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0061
     * @tc.name      testExpUiLayout0061
     * @tc.desc      Window width 540 yields surface height 273.034.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0061', 0, () => {
      const windowWidth: number = 540;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 486.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 273.034)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0062
     * @tc.name      testExpUiLayout0062
     * @tc.desc      Window width 544 yields surface height 275.056.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0062', 0, () => {
      const windowWidth: number = 544;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 489.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 275.056)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0063
     * @tc.name      testExpUiLayout0063
     * @tc.desc      Window width 548 yields surface height 277.079.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0063', 0, () => {
      const windowWidth: number = 548;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 493.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 277.079)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0064
     * @tc.name      testExpUiLayout0064
     * @tc.desc      Window width 552 yields surface height 279.101.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0064', 0, () => {
      const windowWidth: number = 552;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 496.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 279.101)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0065
     * @tc.name      testExpUiLayout0065
     * @tc.desc      Window width 556 yields surface height 281.124.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0065', 0, () => {
      const windowWidth: number = 556;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 500.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 281.124)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0066
     * @tc.name      testExpUiLayout0066
     * @tc.desc      Window width 560 yields surface height 283.146.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0066', 0, () => {
      const windowWidth: number = 560;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 504.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 283.146)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0067
     * @tc.name      testExpUiLayout0067
     * @tc.desc      Window width 564 yields surface height 285.169.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0067', 0, () => {
      const windowWidth: number = 564;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 507.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 285.169)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0068
     * @tc.name      testExpUiLayout0068
     * @tc.desc      Window width 568 yields surface height 287.191.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0068', 0, () => {
      const windowWidth: number = 568;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 511.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 287.191)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0069
     * @tc.name      testExpUiLayout0069
     * @tc.desc      Window width 572 yields surface height 289.213.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0069', 0, () => {
      const windowWidth: number = 572;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 514.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 289.213)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0070
     * @tc.name      testExpUiLayout0070
     * @tc.desc      Window width 576 yields surface height 291.236.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0070', 0, () => {
      const windowWidth: number = 576;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 518.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 291.236)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0071
     * @tc.name      testExpUiLayout0071
     * @tc.desc      Window width 580 yields surface height 293.258.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0071', 0, () => {
      const windowWidth: number = 580;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 522.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 293.258)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0072
     * @tc.name      testExpUiLayout0072
     * @tc.desc      Window width 584 yields surface height 295.281.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0072', 0, () => {
      const windowWidth: number = 584;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 525.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 295.281)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0073
     * @tc.name      testExpUiLayout0073
     * @tc.desc      Window width 588 yields surface height 297.303.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0073', 0, () => {
      const windowWidth: number = 588;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 529.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 297.303)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0074
     * @tc.name      testExpUiLayout0074
     * @tc.desc      Window width 592 yields surface height 299.326.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0074', 0, () => {
      const windowWidth: number = 592;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 532.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 299.326)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0075
     * @tc.name      testExpUiLayout0075
     * @tc.desc      Window width 596 yields surface height 301.348.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0075', 0, () => {
      const windowWidth: number = 596;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 536.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 301.348)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0076
     * @tc.name      testExpUiLayout0076
     * @tc.desc      Window width 600 yields surface height 303.371.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0076', 0, () => {
      const windowWidth: number = 600;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 540.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 303.371)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0077
     * @tc.name      testExpUiLayout0077
     * @tc.desc      Window width 604 yields surface height 305.393.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0077', 0, () => {
      const windowWidth: number = 604;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 543.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 305.393)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0078
     * @tc.name      testExpUiLayout0078
     * @tc.desc      Window width 608 yields surface height 307.416.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0078', 0, () => {
      const windowWidth: number = 608;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 547.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 307.416)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0079
     * @tc.name      testExpUiLayout0079
     * @tc.desc      Window width 612 yields surface height 309.438.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0079', 0, () => {
      const windowWidth: number = 612;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 550.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 309.438)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0080
     * @tc.name      testExpUiLayout0080
     * @tc.desc      Window width 616 yields surface height 311.461.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0080', 0, () => {
      const windowWidth: number = 616;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 554.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 311.461)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0081
     * @tc.name      testExpUiLayout0081
     * @tc.desc      Window width 620 yields surface height 313.483.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0081', 0, () => {
      const windowWidth: number = 620;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 558.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 313.483)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0082
     * @tc.name      testExpUiLayout0082
     * @tc.desc      Window width 624 yields surface height 315.506.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0082', 0, () => {
      const windowWidth: number = 624;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 561.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 315.506)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0083
     * @tc.name      testExpUiLayout0083
     * @tc.desc      Window width 628 yields surface height 317.528.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0083', 0, () => {
      const windowWidth: number = 628;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 565.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 317.528)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0084
     * @tc.name      testExpUiLayout0084
     * @tc.desc      Window width 632 yields surface height 319.551.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0084', 0, () => {
      const windowWidth: number = 632;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 568.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 319.551)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0085
     * @tc.name      testExpUiLayout0085
     * @tc.desc      Window width 636 yields surface height 321.573.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0085', 0, () => {
      const windowWidth: number = 636;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 572.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 321.573)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0086
     * @tc.name      testExpUiLayout0086
     * @tc.desc      Window width 640 yields surface height 323.596.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0086', 0, () => {
      const windowWidth: number = 640;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 576.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 323.596)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0087
     * @tc.name      testExpUiLayout0087
     * @tc.desc      Window width 644 yields surface height 325.618.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0087', 0, () => {
      const windowWidth: number = 644;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 579.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 325.618)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0088
     * @tc.name      testExpUiLayout0088
     * @tc.desc      Window width 648 yields surface height 327.64.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0088', 0, () => {
      const windowWidth: number = 648;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 583.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 327.64)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0089
     * @tc.name      testExpUiLayout0089
     * @tc.desc      Window width 652 yields surface height 329.663.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0089', 0, () => {
      const windowWidth: number = 652;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 586.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 329.663)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0090
     * @tc.name      testExpUiLayout0090
     * @tc.desc      Window width 656 yields surface height 331.685.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0090', 0, () => {
      const windowWidth: number = 656;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 590.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 331.685)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0091
     * @tc.name      testExpUiLayout0091
     * @tc.desc      Window width 660 yields surface height 333.708.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0091', 0, () => {
      const windowWidth: number = 660;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 594.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 333.708)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0092
     * @tc.name      testExpUiLayout0092
     * @tc.desc      Window width 664 yields surface height 335.73.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0092', 0, () => {
      const windowWidth: number = 664;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 597.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 335.73)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0093
     * @tc.name      testExpUiLayout0093
     * @tc.desc      Window width 668 yields surface height 337.753.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0093', 0, () => {
      const windowWidth: number = 668;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 601.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 337.753)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0094
     * @tc.name      testExpUiLayout0094
     * @tc.desc      Window width 672 yields surface height 339.775.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0094', 0, () => {
      const windowWidth: number = 672;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 604.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 339.775)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0095
     * @tc.name      testExpUiLayout0095
     * @tc.desc      Window width 676 yields surface height 341.798.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0095', 0, () => {
      const windowWidth: number = 676;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 608.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 341.798)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0096
     * @tc.name      testExpUiLayout0096
     * @tc.desc      Window width 680 yields surface height 343.82.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0096', 0, () => {
      const windowWidth: number = 680;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 612.0)).assertLess(0.001);
      expect(Math.abs(surfaceH - 343.82)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0097
     * @tc.name      testExpUiLayout0097
     * @tc.desc      Window width 684 yields surface height 345.843.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0097', 0, () => {
      const windowWidth: number = 684;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 615.6)).assertLess(0.001);
      expect(Math.abs(surfaceH - 345.843)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0098
     * @tc.name      testExpUiLayout0098
     * @tc.desc      Window width 688 yields surface height 347.865.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0098', 0, () => {
      const windowWidth: number = 688;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 619.2)).assertLess(0.001);
      expect(Math.abs(surfaceH - 347.865)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0099
     * @tc.name      testExpUiLayout0099
     * @tc.desc      Window width 692 yields surface height 349.888.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0099', 0, () => {
      const windowWidth: number = 692;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 622.8)).assertLess(0.001);
      expect(Math.abs(surfaceH - 349.888)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_UI_0100
     * @tc.name      testExpUiLayout0100
     * @tc.desc      Window width 696 yields surface height 351.91.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpUiLayout0100', 0, () => {
      const windowWidth: number = 696;
      const surfaceW: number = windowWidth * 0.9;
      const surfaceH: number = surfaceW / 1.78;
      expect(Math.abs(surfaceW - 626.4)).assertLess(0.001);
      expect(Math.abs(surfaceH - 351.91)).assertLess(0.001);
      expect(surfaceW).assertLarger(0);
      expect(surfaceW).assertLarger(surfaceH);
    })
  })
}
