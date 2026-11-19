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

export default function expandLayoutMatrix5Test(): void {
  describe('ExpandLayoutMatrix5Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    EXPAND_LAYOUT_0309
     * @tc.name      expandLayout0309
     * @tc.desc      12px 字号 4 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0309 begin');
      const fontSize: number = 12;
      const chars: number = 4;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(48);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0309 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0310
     * @tc.name      expandLayout0310
     * @tc.desc      12px 字号 4 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0310 begin');
      const fontSize: number = 12;
      const chars: number = 4;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(48);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0310 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0311
     * @tc.name      expandLayout0311
     * @tc.desc      12px 字号 8 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0311 begin');
      const fontSize: number = 12;
      const chars: number = 8;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0311 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0312
     * @tc.name      expandLayout0312
     * @tc.desc      12px 字号 8 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0312 begin');
      const fontSize: number = 12;
      const chars: number = 8;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0312 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0313
     * @tc.name      expandLayout0313
     * @tc.desc      12px 字号 8 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0313 begin');
      const fontSize: number = 12;
      const chars: number = 8;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0313 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0314
     * @tc.name      expandLayout0314
     * @tc.desc      12px 字号 8 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0314 begin');
      const fontSize: number = 12;
      const chars: number = 8;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0314 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0315
     * @tc.name      expandLayout0315
     * @tc.desc      12px 字号 8 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0315 begin');
      const fontSize: number = 12;
      const chars: number = 8;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0315 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0316
     * @tc.name      expandLayout0316
     * @tc.desc      12px 字号 8 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0316 begin');
      const fontSize: number = 12;
      const chars: number = 8;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0316 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0317
     * @tc.name      expandLayout0317
     * @tc.desc      12px 字号 8 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0317 begin');
      const fontSize: number = 12;
      const chars: number = 8;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0317 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0318
     * @tc.name      expandLayout0318
     * @tc.desc      12px 字号 8 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0318 begin');
      const fontSize: number = 12;
      const chars: number = 8;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0318 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0319
     * @tc.name      expandLayout0319
     * @tc.desc      12px 字号 8 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0319 begin');
      const fontSize: number = 12;
      const chars: number = 8;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0319 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0320
     * @tc.name      expandLayout0320
     * @tc.desc      12px 字号 8 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0320 begin');
      const fontSize: number = 12;
      const chars: number = 8;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0320 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0321
     * @tc.name      expandLayout0321
     * @tc.desc      12px 字号 12 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0321 begin');
      const fontSize: number = 12;
      const chars: number = 12;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(144);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(24);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0321 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0322
     * @tc.name      expandLayout0322
     * @tc.desc      12px 字号 12 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0322 begin');
      const fontSize: number = 12;
      const chars: number = 12;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(144);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(144);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0322 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0323
     * @tc.name      expandLayout0323
     * @tc.desc      12px 字号 12 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0323 begin');
      const fontSize: number = 12;
      const chars: number = 12;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(144);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(144);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0323 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0324
     * @tc.name      expandLayout0324
     * @tc.desc      12px 字号 12 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0324 begin');
      const fontSize: number = 12;
      const chars: number = 12;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(144);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(144);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0324 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0325
     * @tc.name      expandLayout0325
     * @tc.desc      12px 字号 12 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0325 begin');
      const fontSize: number = 12;
      const chars: number = 12;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(144);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(144);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0325 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0326
     * @tc.name      expandLayout0326
     * @tc.desc      12px 字号 12 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0326 begin');
      const fontSize: number = 12;
      const chars: number = 12;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(144);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(144);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0326 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0327
     * @tc.name      expandLayout0327
     * @tc.desc      12px 字号 12 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0327 begin');
      const fontSize: number = 12;
      const chars: number = 12;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(144);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(144);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0327 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0328
     * @tc.name      expandLayout0328
     * @tc.desc      12px 字号 12 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0328 begin');
      const fontSize: number = 12;
      const chars: number = 12;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(144);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(144);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0328 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0329
     * @tc.name      expandLayout0329
     * @tc.desc      12px 字号 12 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0329 begin');
      const fontSize: number = 12;
      const chars: number = 12;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(144);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(144);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0329 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0330
     * @tc.name      expandLayout0330
     * @tc.desc      12px 字号 12 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0330 begin');
      const fontSize: number = 12;
      const chars: number = 12;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(144);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(144);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0330 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0331
     * @tc.name      expandLayout0331
     * @tc.desc      12px 字号 16 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0331 begin');
      const fontSize: number = 12;
      const chars: number = 16;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(72);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0331 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0332
     * @tc.name      expandLayout0332
     * @tc.desc      12px 字号 16 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0332 begin');
      const fontSize: number = 12;
      const chars: number = 16;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(32);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0332 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0333
     * @tc.name      expandLayout0333
     * @tc.desc      12px 字号 16 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0333 begin');
      const fontSize: number = 12;
      const chars: number = 16;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0333 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0334
     * @tc.name      expandLayout0334
     * @tc.desc      12px 字号 16 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0334 begin');
      const fontSize: number = 12;
      const chars: number = 16;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0334 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0335
     * @tc.name      expandLayout0335
     * @tc.desc      12px 字号 16 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0335 begin');
      const fontSize: number = 12;
      const chars: number = 16;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0335 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0336
     * @tc.name      expandLayout0336
     * @tc.desc      12px 字号 16 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0336 begin');
      const fontSize: number = 12;
      const chars: number = 16;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0336 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0337
     * @tc.name      expandLayout0337
     * @tc.desc      12px 字号 16 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0337 begin');
      const fontSize: number = 12;
      const chars: number = 16;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0337 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0338
     * @tc.name      expandLayout0338
     * @tc.desc      12px 字号 16 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0338 begin');
      const fontSize: number = 12;
      const chars: number = 16;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0338 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0339
     * @tc.name      expandLayout0339
     * @tc.desc      12px 字号 16 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0339 begin');
      const fontSize: number = 12;
      const chars: number = 16;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0339 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0340
     * @tc.name      expandLayout0340
     * @tc.desc      12px 字号 16 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0340 begin');
      const fontSize: number = 12;
      const chars: number = 16;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0340 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0341
     * @tc.name      expandLayout0341
     * @tc.desc      12px 字号 20 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0341 begin');
      const fontSize: number = 12;
      const chars: number = 20;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(240);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(120);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0341 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0342
     * @tc.name      expandLayout0342
     * @tc.desc      12px 字号 20 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0342 begin');
      const fontSize: number = 12;
      const chars: number = 20;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(240);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0342 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0343
     * @tc.name      expandLayout0343
     * @tc.desc      12px 字号 20 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0343 begin');
      const fontSize: number = 12;
      const chars: number = 20;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(240);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0343 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0344
     * @tc.name      expandLayout0344
     * @tc.desc      12px 字号 20 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0344 begin');
      const fontSize: number = 12;
      const chars: number = 20;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(240);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(240);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0344 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0345
     * @tc.name      expandLayout0345
     * @tc.desc      12px 字号 20 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0345 begin');
      const fontSize: number = 12;
      const chars: number = 20;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(240);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(240);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0345 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0346
     * @tc.name      expandLayout0346
     * @tc.desc      12px 字号 20 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0346 begin');
      const fontSize: number = 12;
      const chars: number = 20;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(240);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(240);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0346 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0347
     * @tc.name      expandLayout0347
     * @tc.desc      12px 字号 20 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0347 begin');
      const fontSize: number = 12;
      const chars: number = 20;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(240);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(240);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0347 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0348
     * @tc.name      expandLayout0348
     * @tc.desc      12px 字号 20 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0348 begin');
      const fontSize: number = 12;
      const chars: number = 20;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(240);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(240);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0348 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0349
     * @tc.name      expandLayout0349
     * @tc.desc      12px 字号 20 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0349 begin');
      const fontSize: number = 12;
      const chars: number = 20;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(240);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(240);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0349 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0350
     * @tc.name      expandLayout0350
     * @tc.desc      12px 字号 20 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0350 begin');
      const fontSize: number = 12;
      const chars: number = 20;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(240);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(240);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0350 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0351
     * @tc.name      expandLayout0351
     * @tc.desc      12px 字号 24 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0351 begin');
      const fontSize: number = 12;
      const chars: number = 24;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(288);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0351 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0352
     * @tc.name      expandLayout0352
     * @tc.desc      12px 字号 24 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0352 begin');
      const fontSize: number = 12;
      const chars: number = 24;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(288);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(128);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0352 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0353
     * @tc.name      expandLayout0353
     * @tc.desc      12px 字号 24 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0353 begin');
      const fontSize: number = 12;
      const chars: number = 24;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(288);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(88);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0353 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0354
     * @tc.name      expandLayout0354
     * @tc.desc      12px 字号 24 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0354 begin');
      const fontSize: number = 12;
      const chars: number = 24;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(288);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(8);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0354 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0355
     * @tc.name      expandLayout0355
     * @tc.desc      12px 字号 24 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0355 begin');
      const fontSize: number = 12;
      const chars: number = 24;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(288);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(288);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0355 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0356
     * @tc.name      expandLayout0356
     * @tc.desc      12px 字号 24 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0356 begin');
      const fontSize: number = 12;
      const chars: number = 24;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(288);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(288);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0356 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0357
     * @tc.name      expandLayout0357
     * @tc.desc      12px 字号 24 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0357 begin');
      const fontSize: number = 12;
      const chars: number = 24;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(288);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(288);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0357 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0358
     * @tc.name      expandLayout0358
     * @tc.desc      12px 字号 24 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0358 begin');
      const fontSize: number = 12;
      const chars: number = 24;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(288);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(288);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0358 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0359
     * @tc.name      expandLayout0359
     * @tc.desc      12px 字号 24 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0359 begin');
      const fontSize: number = 12;
      const chars: number = 24;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(288);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(288);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0359 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0360
     * @tc.name      expandLayout0360
     * @tc.desc      12px 字号 24 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0360 begin');
      const fontSize: number = 12;
      const chars: number = 24;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(288);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(288);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0360 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0361
     * @tc.name      expandLayout0361
     * @tc.desc      12px 字号 32 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0361 begin');
      const fontSize: number = 12;
      const chars: number = 32;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(24);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0361 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0362
     * @tc.name      expandLayout0362
     * @tc.desc      12px 字号 32 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0362 begin');
      const fontSize: number = 12;
      const chars: number = 32;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(64);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0362 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0363
     * @tc.name      expandLayout0363
     * @tc.desc      12px 字号 32 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0363 begin');
      const fontSize: number = 12;
      const chars: number = 32;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(184);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0363 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0364
     * @tc.name      expandLayout0364
     * @tc.desc      12px 字号 32 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0364 begin');
      const fontSize: number = 12;
      const chars: number = 32;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(104);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0364 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0365
     * @tc.name      expandLayout0365
     * @tc.desc      12px 字号 32 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0365 begin');
      const fontSize: number = 12;
      const chars: number = 32;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(64);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0365 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0366
     * @tc.name      expandLayout0366
     * @tc.desc      12px 字号 32 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0366 begin');
      const fontSize: number = 12;
      const chars: number = 32;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(24);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0366 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0367
     * @tc.name      expandLayout0367
     * @tc.desc      12px 字号 32 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0367 begin');
      const fontSize: number = 12;
      const chars: number = 32;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(384);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0367 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0368
     * @tc.name      expandLayout0368
     * @tc.desc      12px 字号 32 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0368 begin');
      const fontSize: number = 12;
      const chars: number = 32;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(384);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0368 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0369
     * @tc.name      expandLayout0369
     * @tc.desc      12px 字号 32 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0369 begin');
      const fontSize: number = 12;
      const chars: number = 32;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(384);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0369 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0370
     * @tc.name      expandLayout0370
     * @tc.desc      12px 字号 32 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0370 begin');
      const fontSize: number = 12;
      const chars: number = 32;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(384);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0370 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0371
     * @tc.name      expandLayout0371
     * @tc.desc      12px 字号 40 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0371 begin');
      const fontSize: number = 12;
      const chars: number = 40;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(120);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0371 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0372
     * @tc.name      expandLayout0372
     * @tc.desc      12px 字号 40 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0372 begin');
      const fontSize: number = 12;
      const chars: number = 40;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0372 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0373
     * @tc.name      expandLayout0373
     * @tc.desc      12px 字号 40 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0373 begin');
      const fontSize: number = 12;
      const chars: number = 40;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0373 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0374
     * @tc.name      expandLayout0374
     * @tc.desc      12px 字号 40 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0374 begin');
      const fontSize: number = 12;
      const chars: number = 40;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(200);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0374 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0375
     * @tc.name      expandLayout0375
     * @tc.desc      12px 字号 40 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0375 begin');
      const fontSize: number = 12;
      const chars: number = 40;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0375 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0376
     * @tc.name      expandLayout0376
     * @tc.desc      12px 字号 40 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0376 begin');
      const fontSize: number = 12;
      const chars: number = 40;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(120);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0376 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0377
     * @tc.name      expandLayout0377
     * @tc.desc      12px 字号 40 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0377 begin');
      const fontSize: number = 12;
      const chars: number = 40;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(480);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0377 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0378
     * @tc.name      expandLayout0378
     * @tc.desc      12px 字号 40 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0378 begin');
      const fontSize: number = 12;
      const chars: number = 40;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(480);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0378 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0379
     * @tc.name      expandLayout0379
     * @tc.desc      12px 字号 40 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0379 begin');
      const fontSize: number = 12;
      const chars: number = 40;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(480);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0379 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0380
     * @tc.name      expandLayout0380
     * @tc.desc      12px 字号 40 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0380 begin');
      const fontSize: number = 12;
      const chars: number = 40;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(480);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0380 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0381
     * @tc.name      expandLayout0381
     * @tc.desc      12px 字号 48 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0381 begin');
      const fontSize: number = 12;
      const chars: number = 48;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(576);
      expect(lines).assertEqual(5);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0381 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0382
     * @tc.name      expandLayout0382
     * @tc.desc      12px 字号 48 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0382 begin');
      const fontSize: number = 12;
      const chars: number = 48;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(576);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0382 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0383
     * @tc.name      expandLayout0383
     * @tc.desc      12px 字号 48 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0383 begin');
      const fontSize: number = 12;
      const chars: number = 48;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(576);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(176);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0383 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0384
     * @tc.name      expandLayout0384
     * @tc.desc      12px 字号 48 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0384 begin');
      const fontSize: number = 12;
      const chars: number = 48;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(576);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(16);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0384 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0385
     * @tc.name      expandLayout0385
     * @tc.desc      12px 字号 48 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0385 begin');
      const fontSize: number = 12;
      const chars: number = 48;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(576);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(256);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0385 end');
    })
  })
}
