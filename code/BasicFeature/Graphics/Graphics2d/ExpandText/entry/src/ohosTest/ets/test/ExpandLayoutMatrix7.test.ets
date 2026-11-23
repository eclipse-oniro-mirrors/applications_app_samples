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

export default function expandLayoutMatrix7Test(): void {
  describe('ExpandLayoutMatrix7Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    EXPAND_LAYOUT_0463
     * @tc.name      expandLayout0463
     * @tc.desc      14px 字号 12 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0463 begin');
      const fontSize: number = 14;
      const chars: number = 12;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(168);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(168);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0463 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0464
     * @tc.name      expandLayout0464
     * @tc.desc      14px 字号 12 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0464 begin');
      const fontSize: number = 14;
      const chars: number = 12;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(168);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(168);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0464 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0465
     * @tc.name      expandLayout0465
     * @tc.desc      14px 字号 12 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0465 begin');
      const fontSize: number = 14;
      const chars: number = 12;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(168);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(168);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0465 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0466
     * @tc.name      expandLayout0466
     * @tc.desc      14px 字号 12 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0466 begin');
      const fontSize: number = 14;
      const chars: number = 12;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(168);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(168);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0466 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0467
     * @tc.name      expandLayout0467
     * @tc.desc      14px 字号 12 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0467 begin');
      const fontSize: number = 14;
      const chars: number = 12;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(168);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(168);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0467 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0468
     * @tc.name      expandLayout0468
     * @tc.desc      14px 字号 12 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0468 begin');
      const fontSize: number = 14;
      const chars: number = 12;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(168);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(168);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0468 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0469
     * @tc.name      expandLayout0469
     * @tc.desc      14px 字号 12 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0469 begin');
      const fontSize: number = 14;
      const chars: number = 12;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(168);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(168);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0469 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0470
     * @tc.name      expandLayout0470
     * @tc.desc      14px 字号 12 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0470 begin');
      const fontSize: number = 14;
      const chars: number = 12;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(168);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(168);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0470 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0471
     * @tc.name      expandLayout0471
     * @tc.desc      14px 字号 16 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0471 begin');
      const fontSize: number = 14;
      const chars: number = 16;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(224);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(104);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0471 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0472
     * @tc.name      expandLayout0472
     * @tc.desc      14px 字号 16 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0472 begin');
      const fontSize: number = 14;
      const chars: number = 16;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(224);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(64);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0472 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0473
     * @tc.name      expandLayout0473
     * @tc.desc      14px 字号 16 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0473 begin');
      const fontSize: number = 14;
      const chars: number = 16;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(224);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(24);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0473 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0474
     * @tc.name      expandLayout0474
     * @tc.desc      14px 字号 16 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0474 begin');
      const fontSize: number = 14;
      const chars: number = 16;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(224);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(224);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0474 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0475
     * @tc.name      expandLayout0475
     * @tc.desc      14px 字号 16 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0475 begin');
      const fontSize: number = 14;
      const chars: number = 16;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(224);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(224);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0475 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0476
     * @tc.name      expandLayout0476
     * @tc.desc      14px 字号 16 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0476 begin');
      const fontSize: number = 14;
      const chars: number = 16;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(224);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(224);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0476 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0477
     * @tc.name      expandLayout0477
     * @tc.desc      14px 字号 16 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0477 begin');
      const fontSize: number = 14;
      const chars: number = 16;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(224);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(224);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0477 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0478
     * @tc.name      expandLayout0478
     * @tc.desc      14px 字号 16 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0478 begin');
      const fontSize: number = 14;
      const chars: number = 16;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(224);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(224);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0478 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0479
     * @tc.name      expandLayout0479
     * @tc.desc      14px 字号 16 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0479 begin');
      const fontSize: number = 14;
      const chars: number = 16;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(224);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(224);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0479 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0480
     * @tc.name      expandLayout0480
     * @tc.desc      14px 字号 16 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0480 begin');
      const fontSize: number = 14;
      const chars: number = 16;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(224);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(224);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0480 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0481
     * @tc.name      expandLayout0481
     * @tc.desc      14px 字号 20 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0481 begin');
      const fontSize: number = 14;
      const chars: number = 20;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(280);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0481 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0482
     * @tc.name      expandLayout0482
     * @tc.desc      14px 字号 20 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0482 begin');
      const fontSize: number = 14;
      const chars: number = 20;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(280);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(120);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0482 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0483
     * @tc.name      expandLayout0483
     * @tc.desc      14px 字号 20 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0483 begin');
      const fontSize: number = 14;
      const chars: number = 20;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(280);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0483 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0484
     * @tc.name      expandLayout0484
     * @tc.desc      14px 字号 20 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0484 begin');
      const fontSize: number = 14;
      const chars: number = 20;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(280);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(280);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0484 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0485
     * @tc.name      expandLayout0485
     * @tc.desc      14px 字号 20 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0485 begin');
      const fontSize: number = 14;
      const chars: number = 20;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(280);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(280);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0485 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0486
     * @tc.name      expandLayout0486
     * @tc.desc      14px 字号 20 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0486 begin');
      const fontSize: number = 14;
      const chars: number = 20;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(280);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(280);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0486 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0487
     * @tc.name      expandLayout0487
     * @tc.desc      14px 字号 20 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0487 begin');
      const fontSize: number = 14;
      const chars: number = 20;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(280);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(280);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0487 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0488
     * @tc.name      expandLayout0488
     * @tc.desc      14px 字号 20 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0488 begin');
      const fontSize: number = 14;
      const chars: number = 20;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(280);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(280);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0488 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0489
     * @tc.name      expandLayout0489
     * @tc.desc      14px 字号 20 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0489 begin');
      const fontSize: number = 14;
      const chars: number = 20;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(280);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(280);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0489 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0490
     * @tc.name      expandLayout0490
     * @tc.desc      14px 字号 20 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0490 begin');
      const fontSize: number = 14;
      const chars: number = 20;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(280);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(280);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0490 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0491
     * @tc.name      expandLayout0491
     * @tc.desc      14px 字号 24 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0491 begin');
      const fontSize: number = 14;
      const chars: number = 24;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(336);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0491 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0492
     * @tc.name      expandLayout0492
     * @tc.desc      14px 字号 24 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0492 begin');
      const fontSize: number = 14;
      const chars: number = 24;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(336);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(16);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0492 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0493
     * @tc.name      expandLayout0493
     * @tc.desc      14px 字号 24 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0493 begin');
      const fontSize: number = 14;
      const chars: number = 24;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(336);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(136);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0493 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0494
     * @tc.name      expandLayout0494
     * @tc.desc      14px 字号 24 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0494 begin');
      const fontSize: number = 14;
      const chars: number = 24;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(336);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(56);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0494 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0495
     * @tc.name      expandLayout0495
     * @tc.desc      14px 字号 24 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0495 begin');
      const fontSize: number = 14;
      const chars: number = 24;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(336);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(16);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0495 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0496
     * @tc.name      expandLayout0496
     * @tc.desc      14px 字号 24 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0496 begin');
      const fontSize: number = 14;
      const chars: number = 24;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(336);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(336);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0496 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0497
     * @tc.name      expandLayout0497
     * @tc.desc      14px 字号 24 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0497 begin');
      const fontSize: number = 14;
      const chars: number = 24;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(336);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(336);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0497 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0498
     * @tc.name      expandLayout0498
     * @tc.desc      14px 字号 24 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0498 begin');
      const fontSize: number = 14;
      const chars: number = 24;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(336);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(336);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0498 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0499
     * @tc.name      expandLayout0499
     * @tc.desc      14px 字号 24 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0499 begin');
      const fontSize: number = 14;
      const chars: number = 24;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(336);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(336);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0499 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0500
     * @tc.name      expandLayout0500
     * @tc.desc      14px 字号 24 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0500 begin');
      const fontSize: number = 14;
      const chars: number = 24;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(336);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(336);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0500 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0501
     * @tc.name      expandLayout0501
     * @tc.desc      14px 字号 32 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0501 begin');
      const fontSize: number = 14;
      const chars: number = 32;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(448);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(88);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0501 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0502
     * @tc.name      expandLayout0502
     * @tc.desc      14px 字号 32 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0502 begin');
      const fontSize: number = 14;
      const chars: number = 32;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(448);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(128);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0502 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0503
     * @tc.name      expandLayout0503
     * @tc.desc      14px 字号 32 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0503 begin');
      const fontSize: number = 14;
      const chars: number = 32;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(448);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0503 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0504
     * @tc.name      expandLayout0504
     * @tc.desc      14px 字号 32 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0504 begin');
      const fontSize: number = 14;
      const chars: number = 32;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(448);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(168);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0504 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0505
     * @tc.name      expandLayout0505
     * @tc.desc      14px 字号 32 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0505 begin');
      const fontSize: number = 14;
      const chars: number = 32;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(448);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(128);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0505 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0506
     * @tc.name      expandLayout0506
     * @tc.desc      14px 字号 32 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0506 begin');
      const fontSize: number = 14;
      const chars: number = 32;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(448);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(88);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0506 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0507
     * @tc.name      expandLayout0507
     * @tc.desc      14px 字号 32 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0507 begin');
      const fontSize: number = 14;
      const chars: number = 32;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(448);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(448);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0507 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0508
     * @tc.name      expandLayout0508
     * @tc.desc      14px 字号 32 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0508 begin');
      const fontSize: number = 14;
      const chars: number = 32;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(448);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(448);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0508 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0509
     * @tc.name      expandLayout0509
     * @tc.desc      14px 字号 32 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0509 begin');
      const fontSize: number = 14;
      const chars: number = 32;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(448);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(448);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0509 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0510
     * @tc.name      expandLayout0510
     * @tc.desc      14px 字号 32 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0510 begin');
      const fontSize: number = 14;
      const chars: number = 32;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(448);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(448);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0510 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0511
     * @tc.name      expandLayout0511
     * @tc.desc      14px 字号 40 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0511 begin');
      const fontSize: number = 14;
      const chars: number = 40;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(560);
      expect(lines).assertEqual(5);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0511 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0512
     * @tc.name      expandLayout0512
     * @tc.desc      14px 字号 40 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0512 begin');
      const fontSize: number = 14;
      const chars: number = 40;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(560);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0512 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0513
     * @tc.name      expandLayout0513
     * @tc.desc      14px 字号 40 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0513 begin');
      const fontSize: number = 14;
      const chars: number = 40;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(560);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0513 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0514
     * @tc.name      expandLayout0514
     * @tc.desc      14px 字号 40 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0514 begin');
      const fontSize: number = 14;
      const chars: number = 40;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(560);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(280);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0514 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0515
     * @tc.name      expandLayout0515
     * @tc.desc      14px 字号 40 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0515 begin');
      const fontSize: number = 14;
      const chars: number = 40;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(560);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(240);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0515 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0516
     * @tc.name      expandLayout0516
     * @tc.desc      14px 字号 40 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0516 begin');
      const fontSize: number = 14;
      const chars: number = 40;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(560);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(200);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0516 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0517
     * @tc.name      expandLayout0517
     * @tc.desc      14px 字号 40 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0517 begin');
      const fontSize: number = 14;
      const chars: number = 40;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(560);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0517 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0518
     * @tc.name      expandLayout0518
     * @tc.desc      14px 字号 40 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0518 begin');
      const fontSize: number = 14;
      const chars: number = 40;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(560);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(560);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0518 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0519
     * @tc.name      expandLayout0519
     * @tc.desc      14px 字号 40 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0519 begin');
      const fontSize: number = 14;
      const chars: number = 40;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(560);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(560);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0519 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0520
     * @tc.name      expandLayout0520
     * @tc.desc      14px 字号 40 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0520 begin');
      const fontSize: number = 14;
      const chars: number = 40;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(560);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(560);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0520 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0521
     * @tc.name      expandLayout0521
     * @tc.desc      14px 字号 48 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0521 begin');
      const fontSize: number = 14;
      const chars: number = 48;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(672);
      expect(lines).assertEqual(6);
      expect(lastLine).assertEqual(72);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0521 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0522
     * @tc.name      expandLayout0522
     * @tc.desc      14px 字号 48 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0522 begin');
      const fontSize: number = 14;
      const chars: number = 48;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(672);
      expect(lines).assertEqual(5);
      expect(lastLine).assertEqual(32);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0522 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0523
     * @tc.name      expandLayout0523
     * @tc.desc      14px 字号 48 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0523 begin');
      const fontSize: number = 14;
      const chars: number = 48;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(672);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(72);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0523 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0524
     * @tc.name      expandLayout0524
     * @tc.desc      14px 字号 48 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0524 begin');
      const fontSize: number = 14;
      const chars: number = 48;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(672);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(112);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0524 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0525
     * @tc.name      expandLayout0525
     * @tc.desc      14px 字号 48 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0525 begin');
      const fontSize: number = 14;
      const chars: number = 48;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(672);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(32);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0525 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0526
     * @tc.name      expandLayout0526
     * @tc.desc      14px 字号 48 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0526 begin');
      const fontSize: number = 14;
      const chars: number = 48;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(672);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(312);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0526 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0527
     * @tc.name      expandLayout0527
     * @tc.desc      14px 字号 48 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0527 begin');
      const fontSize: number = 14;
      const chars: number = 48;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(672);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0527 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0528
     * @tc.name      expandLayout0528
     * @tc.desc      14px 字号 48 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0528 begin');
      const fontSize: number = 14;
      const chars: number = 48;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(672);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(32);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0528 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0529
     * @tc.name      expandLayout0529
     * @tc.desc      14px 字号 48 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0529 begin');
      const fontSize: number = 14;
      const chars: number = 48;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(672);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(672);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0529 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0530
     * @tc.name      expandLayout0530
     * @tc.desc      14px 字号 48 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0530 begin');
      const fontSize: number = 14;
      const chars: number = 48;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(672);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(672);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0530 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0531
     * @tc.name      expandLayout0531
     * @tc.desc      14px 字号 64 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0531 begin');
      const fontSize: number = 14;
      const chars: number = 64;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(896);
      expect(lines).assertEqual(8);
      expect(lastLine).assertEqual(56);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0531 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0532
     * @tc.name      expandLayout0532
     * @tc.desc      14px 字号 64 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0532 begin');
      const fontSize: number = 14;
      const chars: number = 64;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(896);
      expect(lines).assertEqual(6);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0532 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0533
     * @tc.name      expandLayout0533
     * @tc.desc      14px 字号 64 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0533 begin');
      const fontSize: number = 14;
      const chars: number = 64;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(896);
      expect(lines).assertEqual(5);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0533 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0534
     * @tc.name      expandLayout0534
     * @tc.desc      14px 字号 64 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0534 begin');
      const fontSize: number = 14;
      const chars: number = 64;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(896);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(56);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0534 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0535
     * @tc.name      expandLayout0535
     * @tc.desc      14px 字号 64 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0535 begin');
      const fontSize: number = 14;
      const chars: number = 64;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(896);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(256);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0535 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0536
     * @tc.name      expandLayout0536
     * @tc.desc      14px 字号 64 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0536 begin');
      const fontSize: number = 14;
      const chars: number = 64;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(896);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(176);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0536 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0537
     * @tc.name      expandLayout0537
     * @tc.desc      14px 字号 64 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0537 begin');
      const fontSize: number = 14;
      const chars: number = 64;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(896);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(416);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0537 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0538
     * @tc.name      expandLayout0538
     * @tc.desc      14px 字号 64 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0538 begin');
      const fontSize: number = 14;
      const chars: number = 64;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(896);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(256);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0538 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0539
     * @tc.name      expandLayout0539
     * @tc.desc      14px 字号 64 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0539 begin');
      const fontSize: number = 14;
      const chars: number = 64;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(896);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(176);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0539 end');
    })
  })
}
