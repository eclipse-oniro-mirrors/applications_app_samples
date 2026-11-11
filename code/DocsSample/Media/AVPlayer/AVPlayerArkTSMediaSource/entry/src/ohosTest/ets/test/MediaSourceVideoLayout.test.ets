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
import { beforeEach, describe, it as hypiumIt, expect as hypiumExpect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_MediaSourceVideoLayout]';
const DOMAIN: number = 0xF812;

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

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceVideoLayoutTest(): void {
  describe('mediaSourceVideoLayoutTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0001
     * @tc.name      testExtVideoLayout0000
     * @tc.desc      Window 300x200 with aspect 0.5 resolves to 99x198.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(99);
      expect(surfaceH).assertEqual(198);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0002
     * @tc.name      testExtVideoLayout0001
     * @tc.desc      Window 313x207 with aspect 0.75 resolves to 154x205.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(154);
      expect(surfaceH).assertEqual(205);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0003
     * @tc.name      testExtVideoLayout0002
     * @tc.desc      Window 326x214 with aspect 0.9 resolves to 191x212.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(191);
      expect(surfaceH).assertEqual(212);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0004
     * @tc.name      testExtVideoLayout0003
     * @tc.desc      Window 339x221 with aspect 1.0 resolves to 336x336.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(336);
      expect(surfaceH).assertEqual(336);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0005
     * @tc.name      testExtVideoLayout0004
     * @tc.desc      Window 352x228 with aspect 1.333 resolves to 348x261.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(348);
      expect(surfaceH).assertEqual(261);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0006
     * @tc.name      testExtVideoLayout0005
     * @tc.desc      Window 365x235 with aspect 1.5 resolves to 361x241.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(361);
      expect(surfaceH).assertEqual(241);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0007
     * @tc.name      testExtVideoLayout0006
     * @tc.desc      Window 378x242 with aspect 1.777 resolves to 374x210.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(374);
      expect(surfaceH).assertEqual(210);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0008
     * @tc.name      testExtVideoLayout0007
     * @tc.desc      Window 391x249 with aspect 2.0 resolves to 387x194.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(387);
      expect(surfaceH).assertEqual(194);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0009
     * @tc.name      testExtVideoLayout0008
     * @tc.desc      Window 404x256 with aspect 0.5 resolves to 127x253.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(127);
      expect(surfaceH).assertEqual(253);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0010
     * @tc.name      testExtVideoLayout0009
     * @tc.desc      Window 417x263 with aspect 0.75 resolves to 195x260.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(195);
      expect(surfaceH).assertEqual(260);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0011
     * @tc.name      testExtVideoLayout0010
     * @tc.desc      Window 430x270 with aspect 0.9 resolves to 240x267.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(240);
      expect(surfaceH).assertEqual(267);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0012
     * @tc.name      testExtVideoLayout0011
     * @tc.desc      Window 443x277 with aspect 1.0 resolves to 439x439.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(439);
      expect(surfaceH).assertEqual(439);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0013
     * @tc.name      testExtVideoLayout0012
     * @tc.desc      Window 456x284 with aspect 1.333 resolves to 451x338.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(451);
      expect(surfaceH).assertEqual(338);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0014
     * @tc.name      testExtVideoLayout0013
     * @tc.desc      Window 469x291 with aspect 1.5 resolves to 464x309.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(464);
      expect(surfaceH).assertEqual(309);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0015
     * @tc.name      testExtVideoLayout0014
     * @tc.desc      Window 482x298 with aspect 1.777 resolves to 477x268.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(477);
      expect(surfaceH).assertEqual(268);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0016
     * @tc.name      testExtVideoLayout0015
     * @tc.desc      Window 495x305 with aspect 2.0 resolves to 490x245.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(490);
      expect(surfaceH).assertEqual(245);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0017
     * @tc.name      testExtVideoLayout0016
     * @tc.desc      Window 508x312 with aspect 0.5 resolves to 155x309.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(155);
      expect(surfaceH).assertEqual(309);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0018
     * @tc.name      testExtVideoLayout0017
     * @tc.desc      Window 521x319 with aspect 0.75 resolves to 237x316.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(237);
      expect(surfaceH).assertEqual(316);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0019
     * @tc.name      testExtVideoLayout0018
     * @tc.desc      Window 534x326 with aspect 0.9 resolves to 291x323.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(291);
      expect(surfaceH).assertEqual(323);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0020
     * @tc.name      testExtVideoLayout0019
     * @tc.desc      Window 547x333 with aspect 1.0 resolves to 542x542.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(542);
      expect(surfaceH).assertEqual(542);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0021
     * @tc.name      testExtVideoLayout0020
     * @tc.desc      Window 560x340 with aspect 1.333 resolves to 554x416.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(554);
      expect(surfaceH).assertEqual(416);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0022
     * @tc.name      testExtVideoLayout0021
     * @tc.desc      Window 573x347 with aspect 1.5 resolves to 567x378.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(567);
      expect(surfaceH).assertEqual(378);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0023
     * @tc.name      testExtVideoLayout0022
     * @tc.desc      Window 586x354 with aspect 1.777 resolves to 580x326.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(580);
      expect(surfaceH).assertEqual(326);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0024
     * @tc.name      testExtVideoLayout0023
     * @tc.desc      Window 599x361 with aspect 2.0 resolves to 593x297.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(593);
      expect(surfaceH).assertEqual(297);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0025
     * @tc.name      testExtVideoLayout0024
     * @tc.desc      Window 612x368 with aspect 0.5 resolves to 182x364.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(182);
      expect(surfaceH).assertEqual(364);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0026
     * @tc.name      testExtVideoLayout0025
     * @tc.desc      Window 625x375 with aspect 0.75 resolves to 278x371.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(278);
      expect(surfaceH).assertEqual(371);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0027
     * @tc.name      testExtVideoLayout0026
     * @tc.desc      Window 638x382 with aspect 0.9 resolves to 340x378.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(340);
      expect(surfaceH).assertEqual(378);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0028
     * @tc.name      testExtVideoLayout0027
     * @tc.desc      Window 651x389 with aspect 1.0 resolves to 644x644.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(644);
      expect(surfaceH).assertEqual(644);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0029
     * @tc.name      testExtVideoLayout0028
     * @tc.desc      Window 664x396 with aspect 1.333 resolves to 657x493.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(657);
      expect(surfaceH).assertEqual(493);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0030
     * @tc.name      testExtVideoLayout0029
     * @tc.desc      Window 677x403 with aspect 1.5 resolves to 670x447.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(670);
      expect(surfaceH).assertEqual(447);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0031
     * @tc.name      testExtVideoLayout0030
     * @tc.desc      Window 690x410 with aspect 1.777 resolves to 683x384.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(683);
      expect(surfaceH).assertEqual(384);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0032
     * @tc.name      testExtVideoLayout0031
     * @tc.desc      Window 703x417 with aspect 2.0 resolves to 696x348.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(696);
      expect(surfaceH).assertEqual(348);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0033
     * @tc.name      testExtVideoLayout0032
     * @tc.desc      Window 716x424 with aspect 0.5 resolves to 210x420.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(210);
      expect(surfaceH).assertEqual(420);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0034
     * @tc.name      testExtVideoLayout0033
     * @tc.desc      Window 729x431 with aspect 0.75 resolves to 320x427.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(320);
      expect(surfaceH).assertEqual(427);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0035
     * @tc.name      testExtVideoLayout0034
     * @tc.desc      Window 742x438 with aspect 0.9 resolves to 391x434.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(391);
      expect(surfaceH).assertEqual(434);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0036
     * @tc.name      testExtVideoLayout0035
     * @tc.desc      Window 755x445 with aspect 1.0 resolves to 747x747.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(747);
      expect(surfaceH).assertEqual(747);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0037
     * @tc.name      testExtVideoLayout0036
     * @tc.desc      Window 768x452 with aspect 1.333 resolves to 760x570.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(760);
      expect(surfaceH).assertEqual(570);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0038
     * @tc.name      testExtVideoLayout0037
     * @tc.desc      Window 781x459 with aspect 1.5 resolves to 773x515.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(773);
      expect(surfaceH).assertEqual(515);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0039
     * @tc.name      testExtVideoLayout0038
     * @tc.desc      Window 794x466 with aspect 1.777 resolves to 786x442.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(786);
      expect(surfaceH).assertEqual(442);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0040
     * @tc.name      testExtVideoLayout0039
     * @tc.desc      Window 807x473 with aspect 2.0 resolves to 799x400.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(799);
      expect(surfaceH).assertEqual(400);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0041
     * @tc.name      testExtVideoLayout0040
     * @tc.desc      Window 820x480 with aspect 0.5 resolves to 238x475.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(238);
      expect(surfaceH).assertEqual(475);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0042
     * @tc.name      testExtVideoLayout0041
     * @tc.desc      Window 833x487 with aspect 0.75 resolves to 362x482.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(362);
      expect(surfaceH).assertEqual(482);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0043
     * @tc.name      testExtVideoLayout0042
     * @tc.desc      Window 846x494 with aspect 0.9 resolves to 440x489.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(440);
      expect(surfaceH).assertEqual(489);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0044
     * @tc.name      testExtVideoLayout0043
     * @tc.desc      Window 859x501 with aspect 1.0 resolves to 850x850.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(850);
      expect(surfaceH).assertEqual(850);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0045
     * @tc.name      testExtVideoLayout0044
     * @tc.desc      Window 872x508 with aspect 1.333 resolves to 863x647.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(863);
      expect(surfaceH).assertEqual(647);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0046
     * @tc.name      testExtVideoLayout0045
     * @tc.desc      Window 885x515 with aspect 1.5 resolves to 876x584.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(876);
      expect(surfaceH).assertEqual(584);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0047
     * @tc.name      testExtVideoLayout0046
     * @tc.desc      Window 898x522 with aspect 1.777 resolves to 889x500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(889);
      expect(surfaceH).assertEqual(500);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0048
     * @tc.name      testExtVideoLayout0047
     * @tc.desc      Window 911x529 with aspect 2.0 resolves to 902x451.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(902);
      expect(surfaceH).assertEqual(451);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0049
     * @tc.name      testExtVideoLayout0048
     * @tc.desc      Window 924x536 with aspect 0.5 resolves to 266x531.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(266);
      expect(surfaceH).assertEqual(531);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0050
     * @tc.name      testExtVideoLayout0049
     * @tc.desc      Window 937x543 with aspect 0.75 resolves to 404x538.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(404);
      expect(surfaceH).assertEqual(538);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0051
     * @tc.name      testExtVideoLayout0050
     * @tc.desc      Window 950x550 with aspect 0.9 resolves to 491x545.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(491);
      expect(surfaceH).assertEqual(545);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0052
     * @tc.name      testExtVideoLayout0051
     * @tc.desc      Window 963x557 with aspect 1.0 resolves to 953x953.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(953);
      expect(surfaceH).assertEqual(953);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0053
     * @tc.name      testExtVideoLayout0052
     * @tc.desc      Window 976x564 with aspect 1.333 resolves to 966x725.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(966);
      expect(surfaceH).assertEqual(725);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0054
     * @tc.name      testExtVideoLayout0053
     * @tc.desc      Window 989x571 with aspect 1.5 resolves to 979x653.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(979);
      expect(surfaceH).assertEqual(653);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0055
     * @tc.name      testExtVideoLayout0054
     * @tc.desc      Window 1002x578 with aspect 1.777 resolves to 992x558.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(992);
      expect(surfaceH).assertEqual(558);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0056
     * @tc.name      testExtVideoLayout0055
     * @tc.desc      Window 1015x585 with aspect 2.0 resolves to 1005x503.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(1005);
      expect(surfaceH).assertEqual(503);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0057
     * @tc.name      testExtVideoLayout0056
     * @tc.desc      Window 1028x592 with aspect 0.5 resolves to 293x586.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(293);
      expect(surfaceH).assertEqual(586);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0058
     * @tc.name      testExtVideoLayout0057
     * @tc.desc      Window 1041x599 with aspect 0.75 resolves to 445x593.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(445);
      expect(surfaceH).assertEqual(593);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0059
     * @tc.name      testExtVideoLayout0058
     * @tc.desc      Window 1054x606 with aspect 0.9 resolves to 540x600.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(540);
      expect(surfaceH).assertEqual(600);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0060
     * @tc.name      testExtVideoLayout0059
     * @tc.desc      Window 1067x613 with aspect 1.0 resolves to 1056x1056.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(1056);
      expect(surfaceH).assertEqual(1056);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0061
     * @tc.name      testExtVideoLayout0060
     * @tc.desc      Window 1080x620 with aspect 1.333 resolves to 1069x802.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(1069);
      expect(surfaceH).assertEqual(802);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0062
     * @tc.name      testExtVideoLayout0061
     * @tc.desc      Window 1093x627 with aspect 1.5 resolves to 1082x721.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(1082);
      expect(surfaceH).assertEqual(721);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0063
     * @tc.name      testExtVideoLayout0062
     * @tc.desc      Window 1106x634 with aspect 1.777 resolves to 1095x616.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(1095);
      expect(surfaceH).assertEqual(616);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0064
     * @tc.name      testExtVideoLayout0063
     * @tc.desc      Window 1119x641 with aspect 2.0 resolves to 1108x554.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(true);
      expect(surfaceW).assertEqual(1108);
      expect(surfaceH).assertEqual(554);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0065
     * @tc.name      testExtVideoLayout0064
     * @tc.desc      Window 1132x648 with aspect 0.5 resolves to 321x642.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(321);
      expect(surfaceH).assertEqual(642);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LAYOUT_0066
     * @tc.name      testExtVideoLayout0065
     * @tc.desc      Window 1145x655 with aspect 0.75 resolves to 486x648.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtVideoLayout0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(percent >= 1).assertEqual(false);
      expect(surfaceW).assertEqual(486);
      expect(surfaceH).assertEqual(648);
      expect(surfaceW).assertLarger(0);
      expect(surfaceH).assertLarger(0);
    })
  });
}
