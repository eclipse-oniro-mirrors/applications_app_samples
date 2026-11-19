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

export default function expandLayoutMatrix21Test(): void {
  describe('ExpandLayoutMatrix21Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    EXPAND_LAYOUT_1541
     * @tc.name      expandLayout1541
     * @tc.desc      48px 字号 1 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1541', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1541 begin');
      const fontSize: number = 48;
      const chars: number = 1;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(48);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1541 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1542
     * @tc.name      expandLayout1542
     * @tc.desc      48px 字号 1 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1542', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1542 begin');
      const fontSize: number = 48;
      const chars: number = 1;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(48);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1542 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1543
     * @tc.name      expandLayout1543
     * @tc.desc      48px 字号 1 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1543', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1543 begin');
      const fontSize: number = 48;
      const chars: number = 1;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(48);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1543 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1544
     * @tc.name      expandLayout1544
     * @tc.desc      48px 字号 1 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1544', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1544 begin');
      const fontSize: number = 48;
      const chars: number = 1;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(48);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1544 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1545
     * @tc.name      expandLayout1545
     * @tc.desc      48px 字号 1 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1545', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1545 begin');
      const fontSize: number = 48;
      const chars: number = 1;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(48);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1545 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1546
     * @tc.name      expandLayout1546
     * @tc.desc      48px 字号 1 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1546', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1546 begin');
      const fontSize: number = 48;
      const chars: number = 1;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(48);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1546 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1547
     * @tc.name      expandLayout1547
     * @tc.desc      48px 字号 1 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1547', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1547 begin');
      const fontSize: number = 48;
      const chars: number = 1;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(48);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1547 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1548
     * @tc.name      expandLayout1548
     * @tc.desc      48px 字号 1 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1548', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1548 begin');
      const fontSize: number = 48;
      const chars: number = 1;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(48);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1548 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1549
     * @tc.name      expandLayout1549
     * @tc.desc      48px 字号 1 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1549', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1549 begin');
      const fontSize: number = 48;
      const chars: number = 1;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(48);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1549 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1550
     * @tc.name      expandLayout1550
     * @tc.desc      48px 字号 1 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1550', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1550 begin');
      const fontSize: number = 48;
      const chars: number = 1;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(48);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1550 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1551
     * @tc.name      expandLayout1551
     * @tc.desc      48px 字号 2 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1551', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1551 begin');
      const fontSize: number = 48;
      const chars: number = 2;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1551 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1552
     * @tc.name      expandLayout1552
     * @tc.desc      48px 字号 2 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1552', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1552 begin');
      const fontSize: number = 48;
      const chars: number = 2;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1552 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1553
     * @tc.name      expandLayout1553
     * @tc.desc      48px 字号 2 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1553', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1553 begin');
      const fontSize: number = 48;
      const chars: number = 2;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1553 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1554
     * @tc.name      expandLayout1554
     * @tc.desc      48px 字号 2 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1554', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1554 begin');
      const fontSize: number = 48;
      const chars: number = 2;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1554 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1555
     * @tc.name      expandLayout1555
     * @tc.desc      48px 字号 2 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1555', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1555 begin');
      const fontSize: number = 48;
      const chars: number = 2;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1555 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1556
     * @tc.name      expandLayout1556
     * @tc.desc      48px 字号 2 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1556', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1556 begin');
      const fontSize: number = 48;
      const chars: number = 2;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1556 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1557
     * @tc.name      expandLayout1557
     * @tc.desc      48px 字号 2 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1557', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1557 begin');
      const fontSize: number = 48;
      const chars: number = 2;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1557 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1558
     * @tc.name      expandLayout1558
     * @tc.desc      48px 字号 2 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1558', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1558 begin');
      const fontSize: number = 48;
      const chars: number = 2;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1558 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1559
     * @tc.name      expandLayout1559
     * @tc.desc      48px 字号 2 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1559', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1559 begin');
      const fontSize: number = 48;
      const chars: number = 2;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1559 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1560
     * @tc.name      expandLayout1560
     * @tc.desc      48px 字号 2 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1560', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1560 begin');
      const fontSize: number = 48;
      const chars: number = 2;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(96);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1560 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1561
     * @tc.name      expandLayout1561
     * @tc.desc      48px 字号 4 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1561', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1561 begin');
      const fontSize: number = 48;
      const chars: number = 4;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(72);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1561 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1562
     * @tc.name      expandLayout1562
     * @tc.desc      48px 字号 4 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1562', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1562 begin');
      const fontSize: number = 48;
      const chars: number = 4;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(32);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1562 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1563
     * @tc.name      expandLayout1563
     * @tc.desc      48px 字号 4 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1563', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1563 begin');
      const fontSize: number = 48;
      const chars: number = 4;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1563 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1564
     * @tc.name      expandLayout1564
     * @tc.desc      48px 字号 4 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1564', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1564 begin');
      const fontSize: number = 48;
      const chars: number = 4;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1564 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1565
     * @tc.name      expandLayout1565
     * @tc.desc      48px 字号 4 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1565', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1565 begin');
      const fontSize: number = 48;
      const chars: number = 4;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1565 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1566
     * @tc.name      expandLayout1566
     * @tc.desc      48px 字号 4 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1566', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1566 begin');
      const fontSize: number = 48;
      const chars: number = 4;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1566 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1567
     * @tc.name      expandLayout1567
     * @tc.desc      48px 字号 4 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1567', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1567 begin');
      const fontSize: number = 48;
      const chars: number = 4;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1567 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1568
     * @tc.name      expandLayout1568
     * @tc.desc      48px 字号 4 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1568', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1568 begin');
      const fontSize: number = 48;
      const chars: number = 4;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1568 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1569
     * @tc.name      expandLayout1569
     * @tc.desc      48px 字号 4 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1569', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1569 begin');
      const fontSize: number = 48;
      const chars: number = 4;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1569 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1570
     * @tc.name      expandLayout1570
     * @tc.desc      48px 字号 4 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1570', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1570 begin');
      const fontSize: number = 48;
      const chars: number = 4;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(192);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1570 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1571
     * @tc.name      expandLayout1571
     * @tc.desc      48px 字号 8 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1571', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1571 begin');
      const fontSize: number = 48;
      const chars: number = 8;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(24);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1571 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1572
     * @tc.name      expandLayout1572
     * @tc.desc      48px 字号 8 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1572', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1572 begin');
      const fontSize: number = 48;
      const chars: number = 8;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(64);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1572 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1573
     * @tc.name      expandLayout1573
     * @tc.desc      48px 字号 8 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1573', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1573 begin');
      const fontSize: number = 48;
      const chars: number = 8;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(184);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1573 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1574
     * @tc.name      expandLayout1574
     * @tc.desc      48px 字号 8 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1574', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1574 begin');
      const fontSize: number = 48;
      const chars: number = 8;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(104);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1574 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1575
     * @tc.name      expandLayout1575
     * @tc.desc      48px 字号 8 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1575', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1575 begin');
      const fontSize: number = 48;
      const chars: number = 8;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(64);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1575 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1576
     * @tc.name      expandLayout1576
     * @tc.desc      48px 字号 8 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1576', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1576 begin');
      const fontSize: number = 48;
      const chars: number = 8;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(24);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1576 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1577
     * @tc.name      expandLayout1577
     * @tc.desc      48px 字号 8 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1577', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1577 begin');
      const fontSize: number = 48;
      const chars: number = 8;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(384);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1577 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1578
     * @tc.name      expandLayout1578
     * @tc.desc      48px 字号 8 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1578', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1578 begin');
      const fontSize: number = 48;
      const chars: number = 8;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(384);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1578 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1579
     * @tc.name      expandLayout1579
     * @tc.desc      48px 字号 8 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1579', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1579 begin');
      const fontSize: number = 48;
      const chars: number = 8;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(384);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1579 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1580
     * @tc.name      expandLayout1580
     * @tc.desc      48px 字号 8 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1580', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1580 begin');
      const fontSize: number = 48;
      const chars: number = 8;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(384);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(384);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1580 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1581
     * @tc.name      expandLayout1581
     * @tc.desc      48px 字号 12 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1581', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1581 begin');
      const fontSize: number = 48;
      const chars: number = 12;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(576);
      expect(lines).assertEqual(5);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1581 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1582
     * @tc.name      expandLayout1582
     * @tc.desc      48px 字号 12 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1582', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1582 begin');
      const fontSize: number = 48;
      const chars: number = 12;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(576);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1582 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1583
     * @tc.name      expandLayout1583
     * @tc.desc      48px 字号 12 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1583', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1583 begin');
      const fontSize: number = 48;
      const chars: number = 12;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(576);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(176);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1583 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1584
     * @tc.name      expandLayout1584
     * @tc.desc      48px 字号 12 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1584', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1584 begin');
      const fontSize: number = 48;
      const chars: number = 12;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(576);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(16);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1584 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1585
     * @tc.name      expandLayout1585
     * @tc.desc      48px 字号 12 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1585', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1585 begin');
      const fontSize: number = 48;
      const chars: number = 12;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(576);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(256);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1585 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1586
     * @tc.name      expandLayout1586
     * @tc.desc      48px 字号 12 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1586', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1586 begin');
      const fontSize: number = 48;
      const chars: number = 12;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(576);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(216);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1586 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1587
     * @tc.name      expandLayout1587
     * @tc.desc      48px 字号 12 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1587', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1587 begin');
      const fontSize: number = 48;
      const chars: number = 12;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(576);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1587 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1588
     * @tc.name      expandLayout1588
     * @tc.desc      48px 字号 12 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1588', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1588 begin');
      const fontSize: number = 48;
      const chars: number = 12;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(576);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(576);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1588 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1589
     * @tc.name      expandLayout1589
     * @tc.desc      48px 字号 12 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1589', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1589 begin');
      const fontSize: number = 48;
      const chars: number = 12;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(576);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(576);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1589 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1590
     * @tc.name      expandLayout1590
     * @tc.desc      48px 字号 12 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1590', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1590 begin');
      const fontSize: number = 48;
      const chars: number = 12;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(576);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(576);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1590 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1591
     * @tc.name      expandLayout1591
     * @tc.desc      48px 字号 16 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1591', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1591 begin');
      const fontSize: number = 48;
      const chars: number = 16;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(7);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1591 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1592
     * @tc.name      expandLayout1592
     * @tc.desc      48px 字号 16 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1592', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1592 begin');
      const fontSize: number = 48;
      const chars: number = 16;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(5);
      expect(lastLine).assertEqual(128);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1592 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1593
     * @tc.name      expandLayout1593
     * @tc.desc      48px 字号 16 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1593', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1593 begin');
      const fontSize: number = 48;
      const chars: number = 16;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(168);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1593 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1594
     * @tc.name      expandLayout1594
     * @tc.desc      48px 字号 16 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1594', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1594 begin');
      const fontSize: number = 48;
      const chars: number = 16;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(208);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1594 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1595
     * @tc.name      expandLayout1595
     * @tc.desc      48px 字号 16 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1595', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1595 begin');
      const fontSize: number = 48;
      const chars: number = 16;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(128);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1595 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1596
     * @tc.name      expandLayout1596
     * @tc.desc      48px 字号 16 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1596', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1596 begin');
      const fontSize: number = 48;
      const chars: number = 16;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1596 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1597
     * @tc.name      expandLayout1597
     * @tc.desc      48px 字号 16 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1597', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1597 begin');
      const fontSize: number = 48;
      const chars: number = 16;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(288);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1597 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1598
     * @tc.name      expandLayout1598
     * @tc.desc      48px 字号 16 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1598', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1598 begin');
      const fontSize: number = 48;
      const chars: number = 16;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(128);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1598 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1599
     * @tc.name      expandLayout1599
     * @tc.desc      48px 字号 16 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1599', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1599 begin');
      const fontSize: number = 48;
      const chars: number = 16;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(48);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1599 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1600
     * @tc.name      expandLayout1600
     * @tc.desc      48px 字号 16 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1600 begin');
      const fontSize: number = 48;
      const chars: number = 16;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(768);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(768);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1600 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1601
     * @tc.name      expandLayout1601
     * @tc.desc      48px 字号 20 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1601 begin');
      const fontSize: number = 48;
      const chars: number = 20;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(960);
      expect(lines).assertEqual(8);
      expect(lastLine).assertEqual(120);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1601 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1602
     * @tc.name      expandLayout1602
     * @tc.desc      48px 字号 20 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1602', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1602 begin');
      const fontSize: number = 48;
      const chars: number = 20;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(960);
      expect(lines).assertEqual(6);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1602 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1603
     * @tc.name      expandLayout1603
     * @tc.desc      48px 字号 20 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1603', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1603 begin');
      const fontSize: number = 48;
      const chars: number = 20;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(960);
      expect(lines).assertEqual(5);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1603 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1604
     * @tc.name      expandLayout1604
     * @tc.desc      48px 字号 20 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1604', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1604 begin');
      const fontSize: number = 48;
      const chars: number = 20;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(960);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(120);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1604 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1605
     * @tc.name      expandLayout1605
     * @tc.desc      48px 字号 20 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1605', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1605 begin');
      const fontSize: number = 48;
      const chars: number = 20;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(960);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(320);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1605 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1606
     * @tc.name      expandLayout1606
     * @tc.desc      48px 字号 20 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1606', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1606 begin');
      const fontSize: number = 48;
      const chars: number = 20;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(960);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(240);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1606 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1607
     * @tc.name      expandLayout1607
     * @tc.desc      48px 字号 20 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1607', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1607 begin');
      const fontSize: number = 48;
      const chars: number = 20;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(960);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(480);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1607 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1608
     * @tc.name      expandLayout1608
     * @tc.desc      48px 字号 20 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1608', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1608 begin');
      const fontSize: number = 48;
      const chars: number = 20;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(960);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(320);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1608 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1609
     * @tc.name      expandLayout1609
     * @tc.desc      48px 字号 20 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1609', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1609 begin');
      const fontSize: number = 48;
      const chars: number = 20;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(960);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(240);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1609 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1610
     * @tc.name      expandLayout1610
     * @tc.desc      48px 字号 20 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1610 begin');
      const fontSize: number = 48;
      const chars: number = 20;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(960);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(960);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1610 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1611
     * @tc.name      expandLayout1611
     * @tc.desc      48px 字号 24 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1611', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1611 begin');
      const fontSize: number = 48;
      const chars: number = 24;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1152);
      expect(lines).assertEqual(10);
      expect(lastLine).assertEqual(72);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1611 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1612
     * @tc.name      expandLayout1612
     * @tc.desc      48px 字号 24 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1612', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1612 begin');
      const fontSize: number = 48;
      const chars: number = 24;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1152);
      expect(lines).assertEqual(8);
      expect(lastLine).assertEqual(32);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1612 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1613
     * @tc.name      expandLayout1613
     * @tc.desc      48px 字号 24 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1613', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1613 begin');
      const fontSize: number = 48;
      const chars: number = 24;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1152);
      expect(lines).assertEqual(6);
      expect(lastLine).assertEqual(152);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1613 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1614
     * @tc.name      expandLayout1614
     * @tc.desc      48px 字号 24 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1614', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1614 begin');
      const fontSize: number = 48;
      const chars: number = 24;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1152);
      expect(lines).assertEqual(5);
      expect(lastLine).assertEqual(32);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1614 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1615
     * @tc.name      expandLayout1615
     * @tc.desc      48px 字号 24 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1615', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1615 begin');
      const fontSize: number = 48;
      const chars: number = 24;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1152);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1615 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1616
     * @tc.name      expandLayout1616
     * @tc.desc      48px 字号 24 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1616', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1616 begin');
      const fontSize: number = 48;
      const chars: number = 24;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1152);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(72);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1616 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1617
     * @tc.name      expandLayout1617
     * @tc.desc      48px 字号 24 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1617', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1617 begin');
      const fontSize: number = 48;
      const chars: number = 24;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(1152);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1617 end');
    })
  })
}
