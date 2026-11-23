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

export default function expandWrapMatrix6Test(): void {
  describe('ExpandWrapMatrix6Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    EXPAND_WRAP_0426
     * @tc.name      expandWrap0426
     * @tc.desc      行高 4 倍字号 28 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0426 begin');
      const fontSize: number = 28;
      const multiplier: number = 4;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(112);
      expect(totalHeight).assertEqual(112);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0426 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0427
     * @tc.name      expandWrap0427
     * @tc.desc      行高 4 倍字号 32 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0427 begin');
      const fontSize: number = 32;
      const multiplier: number = 4;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(128);
      expect(totalHeight).assertEqual(128);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0427 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0428
     * @tc.name      expandWrap0428
     * @tc.desc      行高 4 倍字号 40 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0428 begin');
      const fontSize: number = 40;
      const multiplier: number = 4;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(160);
      expect(totalHeight).assertEqual(160);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0428 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0429
     * @tc.name      expandWrap0429
     * @tc.desc      行高 4 倍字号 48 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0429 begin');
      const fontSize: number = 48;
      const multiplier: number = 4;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(192);
      expect(totalHeight).assertEqual(192);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0429 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0430
     * @tc.name      expandWrap0430
     * @tc.desc      行高 4 倍字号 56 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0430 begin');
      const fontSize: number = 56;
      const multiplier: number = 4;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(224);
      expect(totalHeight).assertEqual(224);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0430 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0431
     * @tc.name      expandWrap0431
     * @tc.desc      行高 4 倍字号 10 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0431 begin');
      const fontSize: number = 10;
      const multiplier: number = 4;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(80);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0431 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0432
     * @tc.name      expandWrap0432
     * @tc.desc      行高 4 倍字号 12 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0432 begin');
      const fontSize: number = 12;
      const multiplier: number = 4;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(96);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0432 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0433
     * @tc.name      expandWrap0433
     * @tc.desc      行高 4 倍字号 16 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0433 begin');
      const fontSize: number = 16;
      const multiplier: number = 4;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(64);
      expect(totalHeight).assertEqual(128);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0433 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0434
     * @tc.name      expandWrap0434
     * @tc.desc      行高 4 倍字号 20 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0434 begin');
      const fontSize: number = 20;
      const multiplier: number = 4;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(80);
      expect(totalHeight).assertEqual(160);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0434 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0435
     * @tc.name      expandWrap0435
     * @tc.desc      行高 4 倍字号 24 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0435 begin');
      const fontSize: number = 24;
      const multiplier: number = 4;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(96);
      expect(totalHeight).assertEqual(192);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0435 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0436
     * @tc.name      expandWrap0436
     * @tc.desc      行高 4 倍字号 28 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0436 begin');
      const fontSize: number = 28;
      const multiplier: number = 4;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(112);
      expect(totalHeight).assertEqual(224);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0436 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0437
     * @tc.name      expandWrap0437
     * @tc.desc      行高 4 倍字号 32 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0437 begin');
      const fontSize: number = 32;
      const multiplier: number = 4;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(128);
      expect(totalHeight).assertEqual(256);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0437 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0438
     * @tc.name      expandWrap0438
     * @tc.desc      行高 4 倍字号 40 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0438 begin');
      const fontSize: number = 40;
      const multiplier: number = 4;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(160);
      expect(totalHeight).assertEqual(320);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0438 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0439
     * @tc.name      expandWrap0439
     * @tc.desc      行高 4 倍字号 48 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0439 begin');
      const fontSize: number = 48;
      const multiplier: number = 4;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(192);
      expect(totalHeight).assertEqual(384);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0439 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0440
     * @tc.name      expandWrap0440
     * @tc.desc      行高 4 倍字号 56 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0440 begin');
      const fontSize: number = 56;
      const multiplier: number = 4;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(224);
      expect(totalHeight).assertEqual(448);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0440 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0441
     * @tc.name      expandWrap0441
     * @tc.desc      行高 4 倍字号 10 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0441 begin');
      const fontSize: number = 10;
      const multiplier: number = 4;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(120);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0441 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0442
     * @tc.name      expandWrap0442
     * @tc.desc      行高 4 倍字号 12 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0442 begin');
      const fontSize: number = 12;
      const multiplier: number = 4;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(144);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0442 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0443
     * @tc.name      expandWrap0443
     * @tc.desc      行高 4 倍字号 16 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0443 begin');
      const fontSize: number = 16;
      const multiplier: number = 4;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(64);
      expect(totalHeight).assertEqual(192);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0443 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0444
     * @tc.name      expandWrap0444
     * @tc.desc      行高 4 倍字号 20 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0444 begin');
      const fontSize: number = 20;
      const multiplier: number = 4;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(80);
      expect(totalHeight).assertEqual(240);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0444 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0445
     * @tc.name      expandWrap0445
     * @tc.desc      行高 4 倍字号 24 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0445 begin');
      const fontSize: number = 24;
      const multiplier: number = 4;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(96);
      expect(totalHeight).assertEqual(288);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0445 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0446
     * @tc.name      expandWrap0446
     * @tc.desc      行高 4 倍字号 28 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0446 begin');
      const fontSize: number = 28;
      const multiplier: number = 4;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(112);
      expect(totalHeight).assertEqual(336);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0446 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0447
     * @tc.name      expandWrap0447
     * @tc.desc      行高 4 倍字号 32 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0447 begin');
      const fontSize: number = 32;
      const multiplier: number = 4;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(128);
      expect(totalHeight).assertEqual(384);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0447 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0448
     * @tc.name      expandWrap0448
     * @tc.desc      行高 4 倍字号 40 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0448 begin');
      const fontSize: number = 40;
      const multiplier: number = 4;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(160);
      expect(totalHeight).assertEqual(480);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0448 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0449
     * @tc.name      expandWrap0449
     * @tc.desc      行高 4 倍字号 48 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0449 begin');
      const fontSize: number = 48;
      const multiplier: number = 4;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(192);
      expect(totalHeight).assertEqual(576);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0449 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0450
     * @tc.name      expandWrap0450
     * @tc.desc      行高 4 倍字号 56 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0450 begin');
      const fontSize: number = 56;
      const multiplier: number = 4;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(224);
      expect(totalHeight).assertEqual(672);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0450 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0451
     * @tc.name      expandWrap0451
     * @tc.desc      行高 4 倍字号 10 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0451 begin');
      const fontSize: number = 10;
      const multiplier: number = 4;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(160);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0451 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0452
     * @tc.name      expandWrap0452
     * @tc.desc      行高 4 倍字号 12 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0452 begin');
      const fontSize: number = 12;
      const multiplier: number = 4;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(192);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0452 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0453
     * @tc.name      expandWrap0453
     * @tc.desc      行高 4 倍字号 16 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0453 begin');
      const fontSize: number = 16;
      const multiplier: number = 4;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(64);
      expect(totalHeight).assertEqual(256);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0453 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0454
     * @tc.name      expandWrap0454
     * @tc.desc      行高 4 倍字号 20 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0454 begin');
      const fontSize: number = 20;
      const multiplier: number = 4;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(80);
      expect(totalHeight).assertEqual(320);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0454 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0455
     * @tc.name      expandWrap0455
     * @tc.desc      行高 4 倍字号 24 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0455 begin');
      const fontSize: number = 24;
      const multiplier: number = 4;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(96);
      expect(totalHeight).assertEqual(384);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0455 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0456
     * @tc.name      expandWrap0456
     * @tc.desc      行高 4 倍字号 28 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0456 begin');
      const fontSize: number = 28;
      const multiplier: number = 4;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(112);
      expect(totalHeight).assertEqual(448);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0456 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0457
     * @tc.name      expandWrap0457
     * @tc.desc      行高 4 倍字号 32 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0457 begin');
      const fontSize: number = 32;
      const multiplier: number = 4;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(128);
      expect(totalHeight).assertEqual(512);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0457 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0458
     * @tc.name      expandWrap0458
     * @tc.desc      行高 4 倍字号 40 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0458 begin');
      const fontSize: number = 40;
      const multiplier: number = 4;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(160);
      expect(totalHeight).assertEqual(640);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0458 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0459
     * @tc.name      expandWrap0459
     * @tc.desc      行高 4 倍字号 48 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0459 begin');
      const fontSize: number = 48;
      const multiplier: number = 4;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(192);
      expect(totalHeight).assertEqual(768);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0459 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0460
     * @tc.name      expandWrap0460
     * @tc.desc      行高 4 倍字号 56 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0460 begin');
      const fontSize: number = 56;
      const multiplier: number = 4;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(224);
      expect(totalHeight).assertEqual(896);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0460 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0461
     * @tc.name      expandWrap0461
     * @tc.desc      行高 4 倍字号 10 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0461 begin');
      const fontSize: number = 10;
      const multiplier: number = 4;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(200);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0461 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0462
     * @tc.name      expandWrap0462
     * @tc.desc      行高 4 倍字号 12 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0462 begin');
      const fontSize: number = 12;
      const multiplier: number = 4;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(240);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0462 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0463
     * @tc.name      expandWrap0463
     * @tc.desc      行高 4 倍字号 16 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0463 begin');
      const fontSize: number = 16;
      const multiplier: number = 4;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(64);
      expect(totalHeight).assertEqual(320);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0463 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0464
     * @tc.name      expandWrap0464
     * @tc.desc      行高 4 倍字号 20 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0464 begin');
      const fontSize: number = 20;
      const multiplier: number = 4;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(80);
      expect(totalHeight).assertEqual(400);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0464 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0465
     * @tc.name      expandWrap0465
     * @tc.desc      行高 4 倍字号 24 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0465 begin');
      const fontSize: number = 24;
      const multiplier: number = 4;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(96);
      expect(totalHeight).assertEqual(480);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0465 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0466
     * @tc.name      expandWrap0466
     * @tc.desc      行高 4 倍字号 28 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0466 begin');
      const fontSize: number = 28;
      const multiplier: number = 4;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(112);
      expect(totalHeight).assertEqual(560);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0466 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0467
     * @tc.name      expandWrap0467
     * @tc.desc      行高 4 倍字号 32 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0467 begin');
      const fontSize: number = 32;
      const multiplier: number = 4;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(128);
      expect(totalHeight).assertEqual(640);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0467 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0468
     * @tc.name      expandWrap0468
     * @tc.desc      行高 4 倍字号 40 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0468 begin');
      const fontSize: number = 40;
      const multiplier: number = 4;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(160);
      expect(totalHeight).assertEqual(800);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0468 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0469
     * @tc.name      expandWrap0469
     * @tc.desc      行高 4 倍字号 48 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0469 begin');
      const fontSize: number = 48;
      const multiplier: number = 4;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(192);
      expect(totalHeight).assertEqual(960);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0469 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0470
     * @tc.name      expandWrap0470
     * @tc.desc      行高 4 倍字号 56 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0470 begin');
      const fontSize: number = 56;
      const multiplier: number = 4;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(224);
      expect(totalHeight).assertEqual(1120);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0470 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0471
     * @tc.name      expandWrap0471
     * @tc.desc      行高 4 倍字号 10 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0471 begin');
      const fontSize: number = 10;
      const multiplier: number = 4;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(240);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0471 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0472
     * @tc.name      expandWrap0472
     * @tc.desc      行高 4 倍字号 12 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0472 begin');
      const fontSize: number = 12;
      const multiplier: number = 4;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(288);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0472 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0473
     * @tc.name      expandWrap0473
     * @tc.desc      行高 4 倍字号 16 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0473 begin');
      const fontSize: number = 16;
      const multiplier: number = 4;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(64);
      expect(totalHeight).assertEqual(384);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0473 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0474
     * @tc.name      expandWrap0474
     * @tc.desc      行高 4 倍字号 20 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0474 begin');
      const fontSize: number = 20;
      const multiplier: number = 4;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(80);
      expect(totalHeight).assertEqual(480);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0474 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0475
     * @tc.name      expandWrap0475
     * @tc.desc      行高 4 倍字号 24 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0475 begin');
      const fontSize: number = 24;
      const multiplier: number = 4;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(96);
      expect(totalHeight).assertEqual(576);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0475 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0476
     * @tc.name      expandWrap0476
     * @tc.desc      行高 4 倍字号 28 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0476 begin');
      const fontSize: number = 28;
      const multiplier: number = 4;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(112);
      expect(totalHeight).assertEqual(672);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0476 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0477
     * @tc.name      expandWrap0477
     * @tc.desc      行高 4 倍字号 32 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0477 begin');
      const fontSize: number = 32;
      const multiplier: number = 4;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(128);
      expect(totalHeight).assertEqual(768);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0477 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0478
     * @tc.name      expandWrap0478
     * @tc.desc      行高 4 倍字号 40 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0478 begin');
      const fontSize: number = 40;
      const multiplier: number = 4;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(160);
      expect(totalHeight).assertEqual(960);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0478 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0479
     * @tc.name      expandWrap0479
     * @tc.desc      行高 4 倍字号 48 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0479 begin');
      const fontSize: number = 48;
      const multiplier: number = 4;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(192);
      expect(totalHeight).assertEqual(1152);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0479 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0480
     * @tc.name      expandWrap0480
     * @tc.desc      行高 4 倍字号 56 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0480 begin');
      const fontSize: number = 56;
      const multiplier: number = 4;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(224);
      expect(totalHeight).assertEqual(1344);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0480 end');
    })
  })
}
