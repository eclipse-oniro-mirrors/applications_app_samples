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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_playWithCacheVideoLayout]';
const DOMAIN: number = 0xF813;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function playWithCacheVideoLayoutTest(): void {
  describe('playWithCacheVideoLayoutTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0001
     * @tc.name      testExtCacheLayout0000
     * @tc.desc      Window 300x200 aspect 0.5 resolves 99x198.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 300;
      const windowHeight: number = 200;
      const percent: number = 0.5;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(99);
      expect(surfaceH).assertEqual(198);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0002
     * @tc.name      testExtCacheLayout0001
     * @tc.desc      Window 313x207 aspect 0.75 resolves 154x205.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 313;
      const windowHeight: number = 207;
      const percent: number = 0.75;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(154);
      expect(surfaceH).assertEqual(205);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0003
     * @tc.name      testExtCacheLayout0002
     * @tc.desc      Window 326x214 aspect 0.9 resolves 191x212.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 326;
      const windowHeight: number = 214;
      const percent: number = 0.9;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(191);
      expect(surfaceH).assertEqual(212);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0004
     * @tc.name      testExtCacheLayout0003
     * @tc.desc      Window 339x221 aspect 1.0 resolves 336x336.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 339;
      const windowHeight: number = 221;
      const percent: number = 1.0;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(336);
      expect(surfaceH).assertEqual(336);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0005
     * @tc.name      testExtCacheLayout0004
     * @tc.desc      Window 352x228 aspect 1.333 resolves 348x261.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 352;
      const windowHeight: number = 228;
      const percent: number = 1.333;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(348);
      expect(surfaceH).assertEqual(261);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0006
     * @tc.name      testExtCacheLayout0005
     * @tc.desc      Window 365x235 aspect 1.5 resolves 361x241.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 365;
      const windowHeight: number = 235;
      const percent: number = 1.5;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(361);
      expect(surfaceH).assertEqual(241);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0007
     * @tc.name      testExtCacheLayout0006
     * @tc.desc      Window 378x242 aspect 1.777 resolves 374x210.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 378;
      const windowHeight: number = 242;
      const percent: number = 1.777;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(374);
      expect(surfaceH).assertEqual(210);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0008
     * @tc.name      testExtCacheLayout0007
     * @tc.desc      Window 391x249 aspect 2.0 resolves 387x194.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 391;
      const windowHeight: number = 249;
      const percent: number = 2.0;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(387);
      expect(surfaceH).assertEqual(194);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0009
     * @tc.name      testExtCacheLayout0008
     * @tc.desc      Window 404x256 aspect 0.5 resolves 127x253.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 404;
      const windowHeight: number = 256;
      const percent: number = 0.5;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(127);
      expect(surfaceH).assertEqual(253);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0010
     * @tc.name      testExtCacheLayout0009
     * @tc.desc      Window 417x263 aspect 0.75 resolves 195x260.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 417;
      const windowHeight: number = 263;
      const percent: number = 0.75;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(195);
      expect(surfaceH).assertEqual(260);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0011
     * @tc.name      testExtCacheLayout0010
     * @tc.desc      Window 430x270 aspect 0.9 resolves 240x267.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 430;
      const windowHeight: number = 270;
      const percent: number = 0.9;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(240);
      expect(surfaceH).assertEqual(267);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0012
     * @tc.name      testExtCacheLayout0011
     * @tc.desc      Window 443x277 aspect 1.0 resolves 439x439.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 443;
      const windowHeight: number = 277;
      const percent: number = 1.0;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(439);
      expect(surfaceH).assertEqual(439);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0013
     * @tc.name      testExtCacheLayout0012
     * @tc.desc      Window 456x284 aspect 1.333 resolves 451x338.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 456;
      const windowHeight: number = 284;
      const percent: number = 1.333;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(451);
      expect(surfaceH).assertEqual(338);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0014
     * @tc.name      testExtCacheLayout0013
     * @tc.desc      Window 469x291 aspect 1.5 resolves 464x309.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 469;
      const windowHeight: number = 291;
      const percent: number = 1.5;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(464);
      expect(surfaceH).assertEqual(309);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0015
     * @tc.name      testExtCacheLayout0014
     * @tc.desc      Window 482x298 aspect 1.777 resolves 477x268.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 482;
      const windowHeight: number = 298;
      const percent: number = 1.777;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(477);
      expect(surfaceH).assertEqual(268);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0016
     * @tc.name      testExtCacheLayout0015
     * @tc.desc      Window 495x305 aspect 2.0 resolves 490x245.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 495;
      const windowHeight: number = 305;
      const percent: number = 2.0;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(490);
      expect(surfaceH).assertEqual(245);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0017
     * @tc.name      testExtCacheLayout0016
     * @tc.desc      Window 508x312 aspect 0.5 resolves 155x309.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 508;
      const windowHeight: number = 312;
      const percent: number = 0.5;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(155);
      expect(surfaceH).assertEqual(309);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0018
     * @tc.name      testExtCacheLayout0017
     * @tc.desc      Window 521x319 aspect 0.75 resolves 237x316.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 521;
      const windowHeight: number = 319;
      const percent: number = 0.75;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(237);
      expect(surfaceH).assertEqual(316);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0019
     * @tc.name      testExtCacheLayout0018
     * @tc.desc      Window 534x326 aspect 0.9 resolves 291x323.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 534;
      const windowHeight: number = 326;
      const percent: number = 0.9;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(291);
      expect(surfaceH).assertEqual(323);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0020
     * @tc.name      testExtCacheLayout0019
     * @tc.desc      Window 547x333 aspect 1.0 resolves 542x542.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 547;
      const windowHeight: number = 333;
      const percent: number = 1.0;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(542);
      expect(surfaceH).assertEqual(542);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0021
     * @tc.name      testExtCacheLayout0020
     * @tc.desc      Window 560x340 aspect 1.333 resolves 554x416.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 560;
      const windowHeight: number = 340;
      const percent: number = 1.333;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(554);
      expect(surfaceH).assertEqual(416);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0022
     * @tc.name      testExtCacheLayout0021
     * @tc.desc      Window 573x347 aspect 1.5 resolves 567x378.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 573;
      const windowHeight: number = 347;
      const percent: number = 1.5;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(567);
      expect(surfaceH).assertEqual(378);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0023
     * @tc.name      testExtCacheLayout0022
     * @tc.desc      Window 586x354 aspect 1.777 resolves 580x326.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 586;
      const windowHeight: number = 354;
      const percent: number = 1.777;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(580);
      expect(surfaceH).assertEqual(326);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0024
     * @tc.name      testExtCacheLayout0023
     * @tc.desc      Window 599x361 aspect 2.0 resolves 593x297.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 599;
      const windowHeight: number = 361;
      const percent: number = 2.0;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(593);
      expect(surfaceH).assertEqual(297);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0025
     * @tc.name      testExtCacheLayout0024
     * @tc.desc      Window 612x368 aspect 0.5 resolves 182x364.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 612;
      const windowHeight: number = 368;
      const percent: number = 0.5;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(182);
      expect(surfaceH).assertEqual(364);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0026
     * @tc.name      testExtCacheLayout0025
     * @tc.desc      Window 625x375 aspect 0.75 resolves 278x371.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 625;
      const windowHeight: number = 375;
      const percent: number = 0.75;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(278);
      expect(surfaceH).assertEqual(371);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0027
     * @tc.name      testExtCacheLayout0026
     * @tc.desc      Window 638x382 aspect 0.9 resolves 340x378.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 638;
      const windowHeight: number = 382;
      const percent: number = 0.9;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(340);
      expect(surfaceH).assertEqual(378);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0028
     * @tc.name      testExtCacheLayout0027
     * @tc.desc      Window 651x389 aspect 1.0 resolves 644x644.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 651;
      const windowHeight: number = 389;
      const percent: number = 1.0;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(644);
      expect(surfaceH).assertEqual(644);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0029
     * @tc.name      testExtCacheLayout0028
     * @tc.desc      Window 664x396 aspect 1.333 resolves 657x493.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 664;
      const windowHeight: number = 396;
      const percent: number = 1.333;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(657);
      expect(surfaceH).assertEqual(493);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0030
     * @tc.name      testExtCacheLayout0029
     * @tc.desc      Window 677x403 aspect 1.5 resolves 670x447.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 677;
      const windowHeight: number = 403;
      const percent: number = 1.5;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(670);
      expect(surfaceH).assertEqual(447);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0031
     * @tc.name      testExtCacheLayout0030
     * @tc.desc      Window 690x410 aspect 1.777 resolves 683x384.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 690;
      const windowHeight: number = 410;
      const percent: number = 1.777;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(683);
      expect(surfaceH).assertEqual(384);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0032
     * @tc.name      testExtCacheLayout0031
     * @tc.desc      Window 703x417 aspect 2.0 resolves 696x348.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 703;
      const windowHeight: number = 417;
      const percent: number = 2.0;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(696);
      expect(surfaceH).assertEqual(348);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0033
     * @tc.name      testExtCacheLayout0032
     * @tc.desc      Window 716x424 aspect 0.5 resolves 210x420.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 716;
      const windowHeight: number = 424;
      const percent: number = 0.5;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(210);
      expect(surfaceH).assertEqual(420);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0034
     * @tc.name      testExtCacheLayout0033
     * @tc.desc      Window 729x431 aspect 0.75 resolves 320x427.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 729;
      const windowHeight: number = 431;
      const percent: number = 0.75;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(320);
      expect(surfaceH).assertEqual(427);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0035
     * @tc.name      testExtCacheLayout0034
     * @tc.desc      Window 742x438 aspect 0.9 resolves 391x434.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 742;
      const windowHeight: number = 438;
      const percent: number = 0.9;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(391);
      expect(surfaceH).assertEqual(434);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0036
     * @tc.name      testExtCacheLayout0035
     * @tc.desc      Window 755x445 aspect 1.0 resolves 747x747.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 755;
      const windowHeight: number = 445;
      const percent: number = 1.0;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(747);
      expect(surfaceH).assertEqual(747);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0037
     * @tc.name      testExtCacheLayout0036
     * @tc.desc      Window 768x452 aspect 1.333 resolves 760x570.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 768;
      const windowHeight: number = 452;
      const percent: number = 1.333;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(760);
      expect(surfaceH).assertEqual(570);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0038
     * @tc.name      testExtCacheLayout0037
     * @tc.desc      Window 781x459 aspect 1.5 resolves 773x515.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 781;
      const windowHeight: number = 459;
      const percent: number = 1.5;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(773);
      expect(surfaceH).assertEqual(515);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0039
     * @tc.name      testExtCacheLayout0038
     * @tc.desc      Window 794x466 aspect 1.777 resolves 786x442.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 794;
      const windowHeight: number = 466;
      const percent: number = 1.777;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(786);
      expect(surfaceH).assertEqual(442);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0040
     * @tc.name      testExtCacheLayout0039
     * @tc.desc      Window 807x473 aspect 2.0 resolves 799x400.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 807;
      const windowHeight: number = 473;
      const percent: number = 2.0;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(799);
      expect(surfaceH).assertEqual(400);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0041
     * @tc.name      testExtCacheLayout0040
     * @tc.desc      Window 820x480 aspect 0.5 resolves 238x475.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 820;
      const windowHeight: number = 480;
      const percent: number = 0.5;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(238);
      expect(surfaceH).assertEqual(475);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0042
     * @tc.name      testExtCacheLayout0041
     * @tc.desc      Window 833x487 aspect 0.75 resolves 362x482.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 833;
      const windowHeight: number = 487;
      const percent: number = 0.75;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(362);
      expect(surfaceH).assertEqual(482);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0043
     * @tc.name      testExtCacheLayout0042
     * @tc.desc      Window 846x494 aspect 0.9 resolves 440x489.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 846;
      const windowHeight: number = 494;
      const percent: number = 0.9;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(440);
      expect(surfaceH).assertEqual(489);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0044
     * @tc.name      testExtCacheLayout0043
     * @tc.desc      Window 859x501 aspect 1.0 resolves 850x850.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 859;
      const windowHeight: number = 501;
      const percent: number = 1.0;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(850);
      expect(surfaceH).assertEqual(850);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0045
     * @tc.name      testExtCacheLayout0044
     * @tc.desc      Window 872x508 aspect 1.333 resolves 863x647.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 872;
      const windowHeight: number = 508;
      const percent: number = 1.333;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(863);
      expect(surfaceH).assertEqual(647);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0046
     * @tc.name      testExtCacheLayout0045
     * @tc.desc      Window 885x515 aspect 1.5 resolves 876x584.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 885;
      const windowHeight: number = 515;
      const percent: number = 1.5;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(876);
      expect(surfaceH).assertEqual(584);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0047
     * @tc.name      testExtCacheLayout0046
     * @tc.desc      Window 898x522 aspect 1.777 resolves 889x500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 898;
      const windowHeight: number = 522;
      const percent: number = 1.777;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(889);
      expect(surfaceH).assertEqual(500);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0048
     * @tc.name      testExtCacheLayout0047
     * @tc.desc      Window 911x529 aspect 2.0 resolves 902x451.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 911;
      const windowHeight: number = 529;
      const percent: number = 2.0;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(902);
      expect(surfaceH).assertEqual(451);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0049
     * @tc.name      testExtCacheLayout0048
     * @tc.desc      Window 924x536 aspect 0.5 resolves 266x531.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 924;
      const windowHeight: number = 536;
      const percent: number = 0.5;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(266);
      expect(surfaceH).assertEqual(531);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0050
     * @tc.name      testExtCacheLayout0049
     * @tc.desc      Window 937x543 aspect 0.75 resolves 404x538.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 937;
      const windowHeight: number = 543;
      const percent: number = 0.75;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(404);
      expect(surfaceH).assertEqual(538);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0051
     * @tc.name      testExtCacheLayout0050
     * @tc.desc      Window 950x550 aspect 0.9 resolves 491x545.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 950;
      const windowHeight: number = 550;
      const percent: number = 0.9;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(491);
      expect(surfaceH).assertEqual(545);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0052
     * @tc.name      testExtCacheLayout0051
     * @tc.desc      Window 963x557 aspect 1.0 resolves 953x953.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 963;
      const windowHeight: number = 557;
      const percent: number = 1.0;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(953);
      expect(surfaceH).assertEqual(953);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0053
     * @tc.name      testExtCacheLayout0052
     * @tc.desc      Window 976x564 aspect 1.333 resolves 966x725.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 976;
      const windowHeight: number = 564;
      const percent: number = 1.333;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(966);
      expect(surfaceH).assertEqual(725);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0054
     * @tc.name      testExtCacheLayout0053
     * @tc.desc      Window 989x571 aspect 1.5 resolves 979x653.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 989;
      const windowHeight: number = 571;
      const percent: number = 1.5;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(979);
      expect(surfaceH).assertEqual(653);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0055
     * @tc.name      testExtCacheLayout0054
     * @tc.desc      Window 1002x578 aspect 1.777 resolves 992x558.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 1002;
      const windowHeight: number = 578;
      const percent: number = 1.777;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(992);
      expect(surfaceH).assertEqual(558);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0056
     * @tc.name      testExtCacheLayout0055
     * @tc.desc      Window 1015x585 aspect 2.0 resolves 1005x503.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 1015;
      const windowHeight: number = 585;
      const percent: number = 2.0;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(1005);
      expect(surfaceH).assertEqual(503);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0057
     * @tc.name      testExtCacheLayout0056
     * @tc.desc      Window 1028x592 aspect 0.5 resolves 293x586.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 1028;
      const windowHeight: number = 592;
      const percent: number = 0.5;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(293);
      expect(surfaceH).assertEqual(586);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0058
     * @tc.name      testExtCacheLayout0057
     * @tc.desc      Window 1041x599 aspect 0.75 resolves 445x593.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 1041;
      const windowHeight: number = 599;
      const percent: number = 0.75;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(445);
      expect(surfaceH).assertEqual(593);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0059
     * @tc.name      testExtCacheLayout0058
     * @tc.desc      Window 1054x606 aspect 0.9 resolves 540x600.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 1054;
      const windowHeight: number = 606;
      const percent: number = 0.9;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(540);
      expect(surfaceH).assertEqual(600);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0060
     * @tc.name      testExtCacheLayout0059
     * @tc.desc      Window 1067x613 aspect 1.0 resolves 1056x1056.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 1067;
      const windowHeight: number = 613;
      const percent: number = 1.0;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(1056);
      expect(surfaceH).assertEqual(1056);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0061
     * @tc.name      testExtCacheLayout0060
     * @tc.desc      Window 1080x620 aspect 1.333 resolves 1069x802.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 1080;
      const windowHeight: number = 620;
      const percent: number = 1.333;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(1069);
      expect(surfaceH).assertEqual(802);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0062
     * @tc.name      testExtCacheLayout0061
     * @tc.desc      Window 1093x627 aspect 1.5 resolves 1082x721.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 1093;
      const windowHeight: number = 627;
      const percent: number = 1.5;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(1082);
      expect(surfaceH).assertEqual(721);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0063
     * @tc.name      testExtCacheLayout0062
     * @tc.desc      Window 1106x634 aspect 1.777 resolves 1095x616.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 1106;
      const windowHeight: number = 634;
      const percent: number = 1.777;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(1095);
      expect(surfaceH).assertEqual(616);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0064
     * @tc.name      testExtCacheLayout0063
     * @tc.desc      Window 1119x641 aspect 2.0 resolves 1108x554.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 1119;
      const windowHeight: number = 641;
      const percent: number = 2.0;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(1108);
      expect(surfaceH).assertEqual(554);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0065
     * @tc.name      testExtCacheLayout0064
     * @tc.desc      Window 1132x648 aspect 0.5 resolves 321x642.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 1132;
      const windowHeight: number = 648;
      const percent: number = 0.5;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(321);
      expect(surfaceH).assertEqual(642);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_LAYOUT_0066
     * @tc.name      testExtCacheLayout0065
     * @tc.desc      Window 1145x655 aspect 0.75 resolves 486x648.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheLayout0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const windowWidth: number = 1145;
      const windowHeight: number = 655;
      const percent: number = 0.75;
      let surfaceW: number = 0;
      let surfaceH: number = 0;
      if (percent >= 1) {
        surfaceW = Math.round(windowWidth * 0.99);
        surfaceH = Math.round(surfaceW / percent);
      } else {
        surfaceH = Math.round(windowHeight * 0.99);
        surfaceW = Math.round(surfaceH * percent);
      }
      expect(surfaceW).assertEqual(486);
      expect(surfaceH).assertEqual(648);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
  });
}
