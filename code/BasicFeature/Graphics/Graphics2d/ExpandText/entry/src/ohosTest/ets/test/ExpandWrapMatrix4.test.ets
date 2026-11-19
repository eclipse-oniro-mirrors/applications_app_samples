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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandText]';

export default function expandWrapMatrix4Test(): void {
  describe('ExpandWrapMatrix4Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    EXPAND_WRAP_0256
     * @tc.name      expandWrap0256
     * @tc.desc      行高 2 倍字号 28 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0256 begin');
      const fontSize: number = 28;
      const multiplier: number = 2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(56);
      expect(totalHeight).assertEqual(112);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0256 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0257
     * @tc.name      expandWrap0257
     * @tc.desc      行高 2 倍字号 32 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0257 begin');
      const fontSize: number = 32;
      const multiplier: number = 2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(64);
      expect(totalHeight).assertEqual(128);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0257 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0258
     * @tc.name      expandWrap0258
     * @tc.desc      行高 2 倍字号 40 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0258 begin');
      const fontSize: number = 40;
      const multiplier: number = 2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(80);
      expect(totalHeight).assertEqual(160);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0258 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0259
     * @tc.name      expandWrap0259
     * @tc.desc      行高 2 倍字号 48 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0259 begin');
      const fontSize: number = 48;
      const multiplier: number = 2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(96);
      expect(totalHeight).assertEqual(192);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0259 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0260
     * @tc.name      expandWrap0260
     * @tc.desc      行高 2 倍字号 56 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0260 begin');
      const fontSize: number = 56;
      const multiplier: number = 2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(112);
      expect(totalHeight).assertEqual(224);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0260 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0261
     * @tc.name      expandWrap0261
     * @tc.desc      行高 2 倍字号 10 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0261 begin');
      const fontSize: number = 10;
      const multiplier: number = 2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(20);
      expect(totalHeight).assertEqual(60);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0261 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0262
     * @tc.name      expandWrap0262
     * @tc.desc      行高 2 倍字号 12 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0262 begin');
      const fontSize: number = 12;
      const multiplier: number = 2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(72);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0262 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0263
     * @tc.name      expandWrap0263
     * @tc.desc      行高 2 倍字号 16 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0263 begin');
      const fontSize: number = 16;
      const multiplier: number = 2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(32);
      expect(totalHeight).assertEqual(96);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0263 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0264
     * @tc.name      expandWrap0264
     * @tc.desc      行高 2 倍字号 20 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0264 begin');
      const fontSize: number = 20;
      const multiplier: number = 2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(120);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0264 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0265
     * @tc.name      expandWrap0265
     * @tc.desc      行高 2 倍字号 24 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0265 begin');
      const fontSize: number = 24;
      const multiplier: number = 2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(144);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0265 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0266
     * @tc.name      expandWrap0266
     * @tc.desc      行高 2 倍字号 28 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0266 begin');
      const fontSize: number = 28;
      const multiplier: number = 2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(56);
      expect(totalHeight).assertEqual(168);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0266 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0267
     * @tc.name      expandWrap0267
     * @tc.desc      行高 2 倍字号 32 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0267 begin');
      const fontSize: number = 32;
      const multiplier: number = 2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(64);
      expect(totalHeight).assertEqual(192);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0267 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0268
     * @tc.name      expandWrap0268
     * @tc.desc      行高 2 倍字号 40 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0268 begin');
      const fontSize: number = 40;
      const multiplier: number = 2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(80);
      expect(totalHeight).assertEqual(240);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0268 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0269
     * @tc.name      expandWrap0269
     * @tc.desc      行高 2 倍字号 48 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0269 begin');
      const fontSize: number = 48;
      const multiplier: number = 2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(96);
      expect(totalHeight).assertEqual(288);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0269 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0270
     * @tc.name      expandWrap0270
     * @tc.desc      行高 2 倍字号 56 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0270 begin');
      const fontSize: number = 56;
      const multiplier: number = 2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(112);
      expect(totalHeight).assertEqual(336);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0270 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0271
     * @tc.name      expandWrap0271
     * @tc.desc      行高 2 倍字号 10 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0271 begin');
      const fontSize: number = 10;
      const multiplier: number = 2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(20);
      expect(totalHeight).assertEqual(80);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0271 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0272
     * @tc.name      expandWrap0272
     * @tc.desc      行高 2 倍字号 12 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0272 begin');
      const fontSize: number = 12;
      const multiplier: number = 2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(96);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0272 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0273
     * @tc.name      expandWrap0273
     * @tc.desc      行高 2 倍字号 16 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0273 begin');
      const fontSize: number = 16;
      const multiplier: number = 2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(32);
      expect(totalHeight).assertEqual(128);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0273 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0274
     * @tc.name      expandWrap0274
     * @tc.desc      行高 2 倍字号 20 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0274 begin');
      const fontSize: number = 20;
      const multiplier: number = 2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(160);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0274 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0275
     * @tc.name      expandWrap0275
     * @tc.desc      行高 2 倍字号 24 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0275 begin');
      const fontSize: number = 24;
      const multiplier: number = 2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(192);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0275 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0276
     * @tc.name      expandWrap0276
     * @tc.desc      行高 2 倍字号 28 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0276 begin');
      const fontSize: number = 28;
      const multiplier: number = 2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(56);
      expect(totalHeight).assertEqual(224);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0276 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0277
     * @tc.name      expandWrap0277
     * @tc.desc      行高 2 倍字号 32 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0277 begin');
      const fontSize: number = 32;
      const multiplier: number = 2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(64);
      expect(totalHeight).assertEqual(256);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0277 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0278
     * @tc.name      expandWrap0278
     * @tc.desc      行高 2 倍字号 40 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0278 begin');
      const fontSize: number = 40;
      const multiplier: number = 2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(80);
      expect(totalHeight).assertEqual(320);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0278 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0279
     * @tc.name      expandWrap0279
     * @tc.desc      行高 2 倍字号 48 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0279 begin');
      const fontSize: number = 48;
      const multiplier: number = 2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(96);
      expect(totalHeight).assertEqual(384);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0279 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0280
     * @tc.name      expandWrap0280
     * @tc.desc      行高 2 倍字号 56 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0280 begin');
      const fontSize: number = 56;
      const multiplier: number = 2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(112);
      expect(totalHeight).assertEqual(448);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0280 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0281
     * @tc.name      expandWrap0281
     * @tc.desc      行高 2 倍字号 10 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0281 begin');
      const fontSize: number = 10;
      const multiplier: number = 2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(20);
      expect(totalHeight).assertEqual(100);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0281 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0282
     * @tc.name      expandWrap0282
     * @tc.desc      行高 2 倍字号 12 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0282 begin');
      const fontSize: number = 12;
      const multiplier: number = 2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(120);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0282 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0283
     * @tc.name      expandWrap0283
     * @tc.desc      行高 2 倍字号 16 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0283 begin');
      const fontSize: number = 16;
      const multiplier: number = 2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(32);
      expect(totalHeight).assertEqual(160);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0283 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0284
     * @tc.name      expandWrap0284
     * @tc.desc      行高 2 倍字号 20 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0284 begin');
      const fontSize: number = 20;
      const multiplier: number = 2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(200);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0284 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0285
     * @tc.name      expandWrap0285
     * @tc.desc      行高 2 倍字号 24 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0285 begin');
      const fontSize: number = 24;
      const multiplier: number = 2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(240);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0285 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0286
     * @tc.name      expandWrap0286
     * @tc.desc      行高 2 倍字号 28 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0286 begin');
      const fontSize: number = 28;
      const multiplier: number = 2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(56);
      expect(totalHeight).assertEqual(280);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0286 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0287
     * @tc.name      expandWrap0287
     * @tc.desc      行高 2 倍字号 32 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0287 begin');
      const fontSize: number = 32;
      const multiplier: number = 2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(64);
      expect(totalHeight).assertEqual(320);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0287 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0288
     * @tc.name      expandWrap0288
     * @tc.desc      行高 2 倍字号 40 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0288 begin');
      const fontSize: number = 40;
      const multiplier: number = 2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(80);
      expect(totalHeight).assertEqual(400);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0288 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0289
     * @tc.name      expandWrap0289
     * @tc.desc      行高 2 倍字号 48 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0289 begin');
      const fontSize: number = 48;
      const multiplier: number = 2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(96);
      expect(totalHeight).assertEqual(480);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0289 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0290
     * @tc.name      expandWrap0290
     * @tc.desc      行高 2 倍字号 56 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0290 begin');
      const fontSize: number = 56;
      const multiplier: number = 2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(112);
      expect(totalHeight).assertEqual(560);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0290 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0291
     * @tc.name      expandWrap0291
     * @tc.desc      行高 2 倍字号 10 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0291 begin');
      const fontSize: number = 10;
      const multiplier: number = 2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(20);
      expect(totalHeight).assertEqual(120);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0291 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0292
     * @tc.name      expandWrap0292
     * @tc.desc      行高 2 倍字号 12 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0292 begin');
      const fontSize: number = 12;
      const multiplier: number = 2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(144);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0292 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0293
     * @tc.name      expandWrap0293
     * @tc.desc      行高 2 倍字号 16 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0293 begin');
      const fontSize: number = 16;
      const multiplier: number = 2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(32);
      expect(totalHeight).assertEqual(192);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0293 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0294
     * @tc.name      expandWrap0294
     * @tc.desc      行高 2 倍字号 20 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0294 begin');
      const fontSize: number = 20;
      const multiplier: number = 2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(240);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0294 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0295
     * @tc.name      expandWrap0295
     * @tc.desc      行高 2 倍字号 24 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0295 begin');
      const fontSize: number = 24;
      const multiplier: number = 2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(288);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0295 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0296
     * @tc.name      expandWrap0296
     * @tc.desc      行高 2 倍字号 28 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0296 begin');
      const fontSize: number = 28;
      const multiplier: number = 2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(56);
      expect(totalHeight).assertEqual(336);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0296 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0297
     * @tc.name      expandWrap0297
     * @tc.desc      行高 2 倍字号 32 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0297 begin');
      const fontSize: number = 32;
      const multiplier: number = 2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(64);
      expect(totalHeight).assertEqual(384);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0297 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0298
     * @tc.name      expandWrap0298
     * @tc.desc      行高 2 倍字号 40 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0298 begin');
      const fontSize: number = 40;
      const multiplier: number = 2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(80);
      expect(totalHeight).assertEqual(480);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0298 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0299
     * @tc.name      expandWrap0299
     * @tc.desc      行高 2 倍字号 48 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0299 begin');
      const fontSize: number = 48;
      const multiplier: number = 2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(96);
      expect(totalHeight).assertEqual(576);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0299 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0300
     * @tc.name      expandWrap0300
     * @tc.desc      行高 2 倍字号 56 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0300 begin');
      const fontSize: number = 56;
      const multiplier: number = 2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(112);
      expect(totalHeight).assertEqual(672);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0300 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0301
     * @tc.name      expandWrap0301
     * @tc.desc      行高 2.5 倍字号 10 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0301 begin');
      const fontSize: number = 10;
      const multiplier: number = 2.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(25);
      expect(totalHeight).assertEqual(25);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0301 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0302
     * @tc.name      expandWrap0302
     * @tc.desc      行高 2.5 倍字号 12 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0302 begin');
      const fontSize: number = 12;
      const multiplier: number = 2.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(30);
      expect(totalHeight).assertEqual(30);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0302 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0303
     * @tc.name      expandWrap0303
     * @tc.desc      行高 2.5 倍字号 16 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0303 begin');
      const fontSize: number = 16;
      const multiplier: number = 2.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(40);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0303 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0304
     * @tc.name      expandWrap0304
     * @tc.desc      行高 2.5 倍字号 20 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0304 begin');
      const fontSize: number = 20;
      const multiplier: number = 2.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(50);
      expect(totalHeight).assertEqual(50);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0304 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0305
     * @tc.name      expandWrap0305
     * @tc.desc      行高 2.5 倍字号 24 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0305 begin');
      const fontSize: number = 24;
      const multiplier: number = 2.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(60);
      expect(totalHeight).assertEqual(60);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0305 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0306
     * @tc.name      expandWrap0306
     * @tc.desc      行高 2.5 倍字号 28 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0306 begin');
      const fontSize: number = 28;
      const multiplier: number = 2.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(70);
      expect(totalHeight).assertEqual(70);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0306 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0307
     * @tc.name      expandWrap0307
     * @tc.desc      行高 2.5 倍字号 32 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0307 begin');
      const fontSize: number = 32;
      const multiplier: number = 2.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(80);
      expect(totalHeight).assertEqual(80);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0307 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0308
     * @tc.name      expandWrap0308
     * @tc.desc      行高 2.5 倍字号 40 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0308 begin');
      const fontSize: number = 40;
      const multiplier: number = 2.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(100);
      expect(totalHeight).assertEqual(100);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0308 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0309
     * @tc.name      expandWrap0309
     * @tc.desc      行高 2.5 倍字号 48 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0309 begin');
      const fontSize: number = 48;
      const multiplier: number = 2.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(120);
      expect(totalHeight).assertEqual(120);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0309 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0310
     * @tc.name      expandWrap0310
     * @tc.desc      行高 2.5 倍字号 56 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0310 begin');
      const fontSize: number = 56;
      const multiplier: number = 2.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(140);
      expect(totalHeight).assertEqual(140);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0310 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0311
     * @tc.name      expandWrap0311
     * @tc.desc      行高 2.5 倍字号 10 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0311 begin');
      const fontSize: number = 10;
      const multiplier: number = 2.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(25);
      expect(totalHeight).assertEqual(50);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0311 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0312
     * @tc.name      expandWrap0312
     * @tc.desc      行高 2.5 倍字号 12 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0312 begin');
      const fontSize: number = 12;
      const multiplier: number = 2.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(30);
      expect(totalHeight).assertEqual(60);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0312 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0313
     * @tc.name      expandWrap0313
     * @tc.desc      行高 2.5 倍字号 16 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0313 begin');
      const fontSize: number = 16;
      const multiplier: number = 2.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(80);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0313 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0314
     * @tc.name      expandWrap0314
     * @tc.desc      行高 2.5 倍字号 20 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0314 begin');
      const fontSize: number = 20;
      const multiplier: number = 2.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(50);
      expect(totalHeight).assertEqual(100);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0314 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0315
     * @tc.name      expandWrap0315
     * @tc.desc      行高 2.5 倍字号 24 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0315 begin');
      const fontSize: number = 24;
      const multiplier: number = 2.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(60);
      expect(totalHeight).assertEqual(120);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0315 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0316
     * @tc.name      expandWrap0316
     * @tc.desc      行高 2.5 倍字号 28 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0316 begin');
      const fontSize: number = 28;
      const multiplier: number = 2.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(70);
      expect(totalHeight).assertEqual(140);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0316 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0317
     * @tc.name      expandWrap0317
     * @tc.desc      行高 2.5 倍字号 32 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0317 begin');
      const fontSize: number = 32;
      const multiplier: number = 2.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(80);
      expect(totalHeight).assertEqual(160);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0317 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0318
     * @tc.name      expandWrap0318
     * @tc.desc      行高 2.5 倍字号 40 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0318 begin');
      const fontSize: number = 40;
      const multiplier: number = 2.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(100);
      expect(totalHeight).assertEqual(200);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0318 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0319
     * @tc.name      expandWrap0319
     * @tc.desc      行高 2.5 倍字号 48 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0319 begin');
      const fontSize: number = 48;
      const multiplier: number = 2.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(120);
      expect(totalHeight).assertEqual(240);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0319 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0320
     * @tc.name      expandWrap0320
     * @tc.desc      行高 2.5 倍字号 56 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0320 begin');
      const fontSize: number = 56;
      const multiplier: number = 2.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(140);
      expect(totalHeight).assertEqual(280);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0320 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0321
     * @tc.name      expandWrap0321
     * @tc.desc      行高 2.5 倍字号 10 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0321 begin');
      const fontSize: number = 10;
      const multiplier: number = 2.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(25);
      expect(totalHeight).assertEqual(75);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0321 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0322
     * @tc.name      expandWrap0322
     * @tc.desc      行高 2.5 倍字号 12 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0322 begin');
      const fontSize: number = 12;
      const multiplier: number = 2.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(30);
      expect(totalHeight).assertEqual(90);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0322 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0323
     * @tc.name      expandWrap0323
     * @tc.desc      行高 2.5 倍字号 16 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0323 begin');
      const fontSize: number = 16;
      const multiplier: number = 2.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(120);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0323 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0324
     * @tc.name      expandWrap0324
     * @tc.desc      行高 2.5 倍字号 20 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0324 begin');
      const fontSize: number = 20;
      const multiplier: number = 2.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(50);
      expect(totalHeight).assertEqual(150);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0324 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0325
     * @tc.name      expandWrap0325
     * @tc.desc      行高 2.5 倍字号 24 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0325 begin');
      const fontSize: number = 24;
      const multiplier: number = 2.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(60);
      expect(totalHeight).assertEqual(180);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0325 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0326
     * @tc.name      expandWrap0326
     * @tc.desc      行高 2.5 倍字号 28 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0326 begin');
      const fontSize: number = 28;
      const multiplier: number = 2.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(70);
      expect(totalHeight).assertEqual(210);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0326 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0327
     * @tc.name      expandWrap0327
     * @tc.desc      行高 2.5 倍字号 32 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0327 begin');
      const fontSize: number = 32;
      const multiplier: number = 2.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(80);
      expect(totalHeight).assertEqual(240);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0327 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0328
     * @tc.name      expandWrap0328
     * @tc.desc      行高 2.5 倍字号 40 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0328 begin');
      const fontSize: number = 40;
      const multiplier: number = 2.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(100);
      expect(totalHeight).assertEqual(300);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0328 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0329
     * @tc.name      expandWrap0329
     * @tc.desc      行高 2.5 倍字号 48 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0329 begin');
      const fontSize: number = 48;
      const multiplier: number = 2.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(120);
      expect(totalHeight).assertEqual(360);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0329 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0330
     * @tc.name      expandWrap0330
     * @tc.desc      行高 2.5 倍字号 56 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0330 begin');
      const fontSize: number = 56;
      const multiplier: number = 2.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(140);
      expect(totalHeight).assertEqual(420);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0330 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0331
     * @tc.name      expandWrap0331
     * @tc.desc      行高 2.5 倍字号 10 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0331 begin');
      const fontSize: number = 10;
      const multiplier: number = 2.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(25);
      expect(totalHeight).assertEqual(100);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0331 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0332
     * @tc.name      expandWrap0332
     * @tc.desc      行高 2.5 倍字号 12 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0332 begin');
      const fontSize: number = 12;
      const multiplier: number = 2.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(30);
      expect(totalHeight).assertEqual(120);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0332 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0333
     * @tc.name      expandWrap0333
     * @tc.desc      行高 2.5 倍字号 16 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0333 begin');
      const fontSize: number = 16;
      const multiplier: number = 2.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(160);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0333 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0334
     * @tc.name      expandWrap0334
     * @tc.desc      行高 2.5 倍字号 20 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0334 begin');
      const fontSize: number = 20;
      const multiplier: number = 2.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(50);
      expect(totalHeight).assertEqual(200);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0334 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0335
     * @tc.name      expandWrap0335
     * @tc.desc      行高 2.5 倍字号 24 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0335 begin');
      const fontSize: number = 24;
      const multiplier: number = 2.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(60);
      expect(totalHeight).assertEqual(240);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0335 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0336
     * @tc.name      expandWrap0336
     * @tc.desc      行高 2.5 倍字号 28 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0336 begin');
      const fontSize: number = 28;
      const multiplier: number = 2.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(70);
      expect(totalHeight).assertEqual(280);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0336 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0337
     * @tc.name      expandWrap0337
     * @tc.desc      行高 2.5 倍字号 32 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0337 begin');
      const fontSize: number = 32;
      const multiplier: number = 2.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(80);
      expect(totalHeight).assertEqual(320);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0337 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0338
     * @tc.name      expandWrap0338
     * @tc.desc      行高 2.5 倍字号 40 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0338 begin');
      const fontSize: number = 40;
      const multiplier: number = 2.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(100);
      expect(totalHeight).assertEqual(400);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0338 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0339
     * @tc.name      expandWrap0339
     * @tc.desc      行高 2.5 倍字号 48 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0339 begin');
      const fontSize: number = 48;
      const multiplier: number = 2.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(120);
      expect(totalHeight).assertEqual(480);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0339 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0340
     * @tc.name      expandWrap0340
     * @tc.desc      行高 2.5 倍字号 56 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0340 begin');
      const fontSize: number = 56;
      const multiplier: number = 2.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(140);
      expect(totalHeight).assertEqual(560);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0340 end');
    })
  })
}
