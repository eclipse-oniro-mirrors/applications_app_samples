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

export default function expandLayoutMatrix9Test(): void {
  describe('ExpandLayoutMatrix9Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    EXPAND_LAYOUT_0617
     * @tc.name      expandLayout0617
     * @tc.desc      16px 字号 16 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0617', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0617 begin');
      const fontSize: number = 16;
      const chars: number = 16;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(256);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(256);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0617 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0618
     * @tc.name      expandLayout0618
     * @tc.desc      16px 字号 16 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0618', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0618 begin');
      const fontSize: number = 16;
      const chars: number = 16;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(256);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(256);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0618 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0619
     * @tc.name      expandLayout0619
     * @tc.desc      16px 字号 16 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0619', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0619 begin');
      const fontSize: number = 16;
      const chars: number = 16;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(256);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(256);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0619 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0620
     * @tc.name      expandLayout0620
     * @tc.desc      16px 字号 16 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0620', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0620 begin');
      const fontSize: number = 16;
      const chars: number = 16;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(256);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(256);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0620 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0621
     * @tc.name      expandLayout0621
     * @tc.desc      16px 字号 20 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0621', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0621 begin');
      const fontSize: number = 16;
      const chars: number = 20;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0621 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0622
     * @tc.name      expandLayout0622
     * @tc.desc      16px 字号 20 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0622', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0622 begin');
      const fontSize: number = 16;
      const chars: number = 20;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0622 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0623
     * @tc.name      expandLayout0623
     * @tc.desc      16px 字号 20 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0623', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0623 begin');
      const fontSize: number = 16;
      const chars: number = 20;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(120);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0623 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0624
     * @tc.name      expandLayout0624
     * @tc.desc      16px 字号 20 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0624', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0624 begin');
      const fontSize: number = 16;
      const chars: number = 20;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0624 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0625
     * @tc.name      expandLayout0625
     * @tc.desc      16px 字号 20 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0625', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0625 begin');
      const fontSize: number = 16;
      const chars: number = 20;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(320);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0625 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0626
     * @tc.name      expandLayout0626
     * @tc.desc      16px 字号 20 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0626', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0626 begin');
      const fontSize: number = 16;
      const chars: number = 20;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(320);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0626 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0627
     * @tc.name      expandLayout0627
     * @tc.desc      16px 字号 20 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0627', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0627 begin');
      const fontSize: number = 16;
      const chars: number = 20;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(320);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0627 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0628
     * @tc.name      expandLayout0628
     * @tc.desc      16px 字号 20 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0628', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0628 begin');
      const fontSize: number = 16;
      const chars: number = 20;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(320);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0628 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0629
     * @tc.name      expandLayout0629
     * @tc.desc      16px 字号 20 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0629', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0629 begin');
      const fontSize: number = 16;
      const chars: number = 20;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(320);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0629 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0630
     * @tc.name      expandLayout0630
     * @tc.desc      16px 字号 20 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0630', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0630 begin');
      const fontSize: number = 16;
      const chars: number = 20;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(320);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0630 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0631
     * @tc.name      expandLayout0631
     * @tc.desc      16px 字号 24 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0631', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0631 begin');
      const fontSize: number = 16;
      const chars: number = 24;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(24);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0631 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0632
     * @tc.name      expandLayout0632
     * @tc.desc      16px 字号 24 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0632', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0632 begin');
      const fontSize: number = 16;
      const chars: number = 24;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(64);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0632 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0633
     * @tc.name      expandLayout0633
     * @tc.desc      16px 字号 24 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0633', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0633 begin');
      const fontSize: number = 16;
      const chars: number = 24;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(184);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0633 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0634
     * @tc.name      expandLayout0634
     * @tc.desc      16px 字号 24 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0634', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0634 begin');
      const fontSize: number = 16;
      const chars: number = 24;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(104);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0634 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0635
     * @tc.name      expandLayout0635
     * @tc.desc      16px 字号 24 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0635', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0635 begin');
      const fontSize: number = 16;
      const chars: number = 24;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(64);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0635 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0636
     * @tc.name      expandLayout0636
     * @tc.desc      16px 字号 24 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0636', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0636 begin');
      const fontSize: number = 16;
      const chars: number = 24;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(24);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0636 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0637
     * @tc.name      expandLayout0637
     * @tc.desc      16px 字号 24 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0637', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0637 begin');
      const fontSize: number = 16;
      const chars: number = 24;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(384);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0637 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0638
     * @tc.name      expandLayout0638
     * @tc.desc      16px 字号 24 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0638', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0638 begin');
      const fontSize: number = 16;
      const chars: number = 24;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(384);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0638 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0639
     * @tc.name      expandLayout0639
     * @tc.desc      16px 字号 24 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0639', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0639 begin');
      const fontSize: number = 16;
      const chars: number = 24;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(384);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0639 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0640
     * @tc.name      expandLayout0640
     * @tc.desc      16px 字号 24 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0640', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0640 begin');
      const fontSize: number = 16;
      const chars: number = 24;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(384);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0640 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0641
     * @tc.name      expandLayout0641
     * @tc.desc      16px 字号 32 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0641', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0641 begin');
      const fontSize: number = 16;
      const chars: number = 32;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(512);
      expect(lines).assertEqual(5);
      expect(lastLine).assertEqual(32);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0641 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0642
     * @tc.name      expandLayout0642
     * @tc.desc      16px 字号 32 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0642', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0642 begin');
      const fontSize: number = 16;
      const chars: number = 32;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(512);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(32);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0642 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0643
     * @tc.name      expandLayout0643
     * @tc.desc      16px 字号 32 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0643', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0643 begin');
      const fontSize: number = 16;
      const chars: number = 32;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(512);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(112);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0643 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0644
     * @tc.name      expandLayout0644
     * @tc.desc      16px 字号 32 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0644', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0644 begin');
      const fontSize: number = 16;
      const chars: number = 32;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(512);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(232);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0644 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0645
     * @tc.name      expandLayout0645
     * @tc.desc      16px 字号 32 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0645', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0645 begin');
      const fontSize: number = 16;
      const chars: number = 32;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(512);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0645 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0646
     * @tc.name      expandLayout0646
     * @tc.desc      16px 字号 32 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0646', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0646 begin');
      const fontSize: number = 16;
      const chars: number = 32;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(512);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(152);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0646 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0647
     * @tc.name      expandLayout0647
     * @tc.desc      16px 字号 32 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0647', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0647 begin');
      const fontSize: number = 16;
      const chars: number = 32;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(512);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(32);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0647 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0648
     * @tc.name      expandLayout0648
     * @tc.desc      16px 字号 32 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0648', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0648 begin');
      const fontSize: number = 16;
      const chars: number = 32;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(512);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(512);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0648 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0649
     * @tc.name      expandLayout0649
     * @tc.desc      16px 字号 32 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0649', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0649 begin');
      const fontSize: number = 16;
      const chars: number = 32;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(512);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(512);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0649 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0650
     * @tc.name      expandLayout0650
     * @tc.desc      16px 字号 32 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0650', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0650 begin');
      const fontSize: number = 16;
      const chars: number = 32;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(512);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(512);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0650 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0651
     * @tc.name      expandLayout0651
     * @tc.desc      16px 字号 40 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0651', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0651 begin');
      const fontSize: number = 16;
      const chars: number = 40;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(6);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0651 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0652
     * @tc.name      expandLayout0652
     * @tc.desc      16px 字号 40 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0652', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0652 begin');
      const fontSize: number = 16;
      const chars: number = 40;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0652 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0653
     * @tc.name      expandLayout0653
     * @tc.desc      16px 字号 40 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0653', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0653 begin');
      const fontSize: number = 16;
      const chars: number = 40;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0653 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0654
     * @tc.name      expandLayout0654
     * @tc.desc      16px 字号 40 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0654', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0654 begin');
      const fontSize: number = 16;
      const chars: number = 40;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0654 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0655
     * @tc.name      expandLayout0655
     * @tc.desc      16px 字号 40 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0655', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0655 begin');
      const fontSize: number = 16;
      const chars: number = 40;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(320);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0655 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0656
     * @tc.name      expandLayout0656
     * @tc.desc      16px 字号 40 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0656', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0656 begin');
      const fontSize: number = 16;
      const chars: number = 40;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(280);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0656 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0657
     * @tc.name      expandLayout0657
     * @tc.desc      16px 字号 40 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0657', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0657 begin');
      const fontSize: number = 16;
      const chars: number = 40;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0657 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0658
     * @tc.name      expandLayout0658
     * @tc.desc      16px 字号 40 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0658', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0658 begin');
      const fontSize: number = 16;
      const chars: number = 40;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(640);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0658 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0659
     * @tc.name      expandLayout0659
     * @tc.desc      16px 字号 40 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0659', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0659 begin');
      const fontSize: number = 16;
      const chars: number = 40;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(640);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0659 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0660
     * @tc.name      expandLayout0660
     * @tc.desc      16px 字号 40 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0660', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0660 begin');
      const fontSize: number = 16;
      const chars: number = 40;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(640);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0660 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0661
     * @tc.name      expandLayout0661
     * @tc.desc      16px 字号 48 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0661', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0661 begin');
      const fontSize: number = 16;
      const chars: number = 48;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(7);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0661 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0662
     * @tc.name      expandLayout0662
     * @tc.desc      16px 字号 48 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0662', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0662 begin');
      const fontSize: number = 16;
      const chars: number = 48;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(5);
      expect(lastLine).assertEqual(128);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0662 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0663
     * @tc.name      expandLayout0663
     * @tc.desc      16px 字号 48 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0663', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0663 begin');
      const fontSize: number = 16;
      const chars: number = 48;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(168);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0663 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0664
     * @tc.name      expandLayout0664
     * @tc.desc      16px 字号 48 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0664', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0664 begin');
      const fontSize: number = 16;
      const chars: number = 48;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(208);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0664 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0665
     * @tc.name      expandLayout0665
     * @tc.desc      16px 字号 48 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0665', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0665 begin');
      const fontSize: number = 16;
      const chars: number = 48;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(128);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0665 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0666
     * @tc.name      expandLayout0666
     * @tc.desc      16px 字号 48 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0666', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0666 begin');
      const fontSize: number = 16;
      const chars: number = 48;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0666 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0667
     * @tc.name      expandLayout0667
     * @tc.desc      16px 字号 48 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0667', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0667 begin');
      const fontSize: number = 16;
      const chars: number = 48;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(288);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0667 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0668
     * @tc.name      expandLayout0668
     * @tc.desc      16px 字号 48 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0668', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0668 begin');
      const fontSize: number = 16;
      const chars: number = 48;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(128);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0668 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0669
     * @tc.name      expandLayout0669
     * @tc.desc      16px 字号 48 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0669', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0669 begin');
      const fontSize: number = 16;
      const chars: number = 48;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0669 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0670
     * @tc.name      expandLayout0670
     * @tc.desc      16px 字号 48 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0670', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0670 begin');
      const fontSize: number = 16;
      const chars: number = 48;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(768);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0670 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0671
     * @tc.name      expandLayout0671
     * @tc.desc      16px 字号 64 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0671', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0671 begin');
      const fontSize: number = 16;
      const chars: number = 64;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1024);
      expect(lines).assertEqual(9);
      expect(lastLine).assertEqual(64);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0671 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0672
     * @tc.name      expandLayout0672
     * @tc.desc      16px 字号 64 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0672', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0672 begin');
      const fontSize: number = 16;
      const chars: number = 64;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1024);
      expect(lines).assertEqual(7);
      expect(lastLine).assertEqual(64);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0672 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0673
     * @tc.name      expandLayout0673
     * @tc.desc      16px 字号 64 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0673', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0673 begin');
      const fontSize: number = 16;
      const chars: number = 64;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1024);
      expect(lines).assertEqual(6);
      expect(lastLine).assertEqual(24);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0673 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0674
     * @tc.name      expandLayout0674
     * @tc.desc      16px 字号 64 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0674', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0674 begin');
      const fontSize: number = 16;
      const chars: number = 64;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1024);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(184);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0674 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0675
     * @tc.name      expandLayout0675
     * @tc.desc      16px 字号 64 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0675', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0675 begin');
      const fontSize: number = 16;
      const chars: number = 64;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1024);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(64);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0675 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0676
     * @tc.name      expandLayout0676
     * @tc.desc      16px 字号 64 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0676', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0676 begin');
      const fontSize: number = 16;
      const chars: number = 64;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1024);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(304);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0676 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0677
     * @tc.name      expandLayout0677
     * @tc.desc      16px 字号 64 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0677', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0677 begin');
      const fontSize: number = 16;
      const chars: number = 64;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1024);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(64);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0677 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0678
     * @tc.name      expandLayout0678
     * @tc.desc      16px 字号 64 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0678', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0678 begin');
      const fontSize: number = 16;
      const chars: number = 64;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1024);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(384);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0678 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0679
     * @tc.name      expandLayout0679
     * @tc.desc      16px 字号 64 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0679', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0679 begin');
      const fontSize: number = 16;
      const chars: number = 64;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1024);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(304);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0679 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0680
     * @tc.name      expandLayout0680
     * @tc.desc      16px 字号 64 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0680', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0680 begin');
      const fontSize: number = 16;
      const chars: number = 64;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1024);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(1024);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0680 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0681
     * @tc.name      expandLayout0681
     * @tc.desc      16px 字号 96 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0681', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0681 begin');
      const fontSize: number = 16;
      const chars: number = 96;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1536);
      expect(lines).assertEqual(13);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0681 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0682
     * @tc.name      expandLayout0682
     * @tc.desc      16px 字号 96 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0682', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0682 begin');
      const fontSize: number = 16;
      const chars: number = 96;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1536);
      expect(lines).assertEqual(10);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0682 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0683
     * @tc.name      expandLayout0683
     * @tc.desc      16px 字号 96 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0683', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0683 begin');
      const fontSize: number = 16;
      const chars: number = 96;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1536);
      expect(lines).assertEqual(8);
      expect(lastLine).assertEqual(136);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0683 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0684
     * @tc.name      expandLayout0684
     * @tc.desc      16px 字号 96 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0684', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0684 begin');
      const fontSize: number = 16;
      const chars: number = 96;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1536);
      expect(lines).assertEqual(6);
      expect(lastLine).assertEqual(136);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0684 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0685
     * @tc.name      expandLayout0685
     * @tc.desc      16px 字号 96 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0685', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0685 begin');
      const fontSize: number = 16;
      const chars: number = 96;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1536);
      expect(lines).assertEqual(5);
      expect(lastLine).assertEqual(256);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0685 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0686
     * @tc.name      expandLayout0686
     * @tc.desc      16px 字号 96 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0686', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0686 begin');
      const fontSize: number = 16;
      const chars: number = 96;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1536);
      expect(lines).assertEqual(5);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0686 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0687
     * @tc.name      expandLayout0687
     * @tc.desc      16px 字号 96 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0687', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0687 begin');
      const fontSize: number = 16;
      const chars: number = 96;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1536);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0687 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0688
     * @tc.name      expandLayout0688
     * @tc.desc      16px 字号 96 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0688', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0688 begin');
      const fontSize: number = 16;
      const chars: number = 96;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1536);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(256);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0688 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0689
     * @tc.name      expandLayout0689
     * @tc.desc      16px 字号 96 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0689', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0689 begin');
      const fontSize: number = 16;
      const chars: number = 96;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1536);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0689 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0690
     * @tc.name      expandLayout0690
     * @tc.desc      16px 字号 96 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0690', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0690 begin');
      const fontSize: number = 16;
      const chars: number = 96;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1536);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(456);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0690 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0691
     * @tc.name      expandLayout0691
     * @tc.desc      16px 字号 128 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0691', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0691 begin');
      const fontSize: number = 16;
      const chars: number = 128;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(2048);
      expect(lines).assertEqual(18);
      expect(lastLine).assertEqual(8);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0691 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0692
     * @tc.name      expandLayout0692
     * @tc.desc      16px 字号 128 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0692', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0692 begin');
      const fontSize: number = 16;
      const chars: number = 128;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(2048);
      expect(lines).assertEqual(13);
      expect(lastLine).assertEqual(128);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0692 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_0693
     * @tc.name      expandLayout0693
     * @tc.desc      16px 字号 128 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout0693', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0693 begin');
      const fontSize: number = 16;
      const chars: number = 128;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(2048);
      expect(lines).assertEqual(11);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout0693 end');
    })
  })
}
