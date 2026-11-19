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

export default function expandLayoutMatrix19Test(): void {
  describe('ExpandLayoutMatrix19Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    EXPAND_LAYOUT_1387
     * @tc.name      expandLayout1387
     * @tc.desc      32px 字号 96 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1387 begin');
      const fontSize: number = 32;
      const chars: number = 96;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(3072);
      expect(lines).assertEqual(7);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1387 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1388
     * @tc.name      expandLayout1388
     * @tc.desc      32px 字号 96 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1388 begin');
      const fontSize: number = 32;
      const chars: number = 96;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(3072);
      expect(lines).assertEqual(5);
      expect(lastLine).assertEqual(512);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1388 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1389
     * @tc.name      expandLayout1389
     * @tc.desc      32px 字号 96 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1389 begin');
      const fontSize: number = 32;
      const chars: number = 96;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(3072);
      expect(lines).assertEqual(5);
      expect(lastLine).assertEqual(192);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1389 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1390
     * @tc.name      expandLayout1390
     * @tc.desc      32px 字号 96 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1390 begin');
      const fontSize: number = 32;
      const chars: number = 96;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(3072);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(912);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1390 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1391
     * @tc.name      expandLayout1391
     * @tc.desc      32px 字号 128 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1391 begin');
      const fontSize: number = 32;
      const chars: number = 128;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(4096);
      expect(lines).assertEqual(35);
      expect(lastLine).assertEqual(16);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1391 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1392
     * @tc.name      expandLayout1392
     * @tc.desc      32px 字号 128 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1392 begin');
      const fontSize: number = 32;
      const chars: number = 128;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(4096);
      expect(lines).assertEqual(26);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1392 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1393
     * @tc.name      expandLayout1393
     * @tc.desc      32px 字号 128 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1393 begin');
      const fontSize: number = 32;
      const chars: number = 128;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(4096);
      expect(lines).assertEqual(21);
      expect(lastLine).assertEqual(96);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1393 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1394
     * @tc.name      expandLayout1394
     * @tc.desc      32px 字号 128 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1394 begin');
      const fontSize: number = 32;
      const chars: number = 128;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(4096);
      expect(lines).assertEqual(15);
      expect(lastLine).assertEqual(176);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1394 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1395
     * @tc.name      expandLayout1395
     * @tc.desc      32px 字号 128 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1395 begin');
      const fontSize: number = 32;
      const chars: number = 128;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(4096);
      expect(lines).assertEqual(13);
      expect(lastLine).assertEqual(256);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1395 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1396
     * @tc.name      expandLayout1396
     * @tc.desc      32px 字号 128 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1396 begin');
      const fontSize: number = 32;
      const chars: number = 128;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(4096);
      expect(lines).assertEqual(12);
      expect(lastLine).assertEqual(136);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1396 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1397
     * @tc.name      expandLayout1397
     * @tc.desc      32px 字号 128 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1397 begin');
      const fontSize: number = 32;
      const chars: number = 128;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(4096);
      expect(lines).assertEqual(9);
      expect(lastLine).assertEqual(256);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1397 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1398
     * @tc.name      expandLayout1398
     * @tc.desc      32px 字号 128 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1398 begin');
      const fontSize: number = 32;
      const chars: number = 128;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(4096);
      expect(lines).assertEqual(7);
      expect(lastLine).assertEqual(256);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1398 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1399
     * @tc.name      expandLayout1399
     * @tc.desc      32px 字号 128 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1399 begin');
      const fontSize: number = 32;
      const chars: number = 128;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(4096);
      expect(lines).assertEqual(6);
      expect(lastLine).assertEqual(496);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1399 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1400
     * @tc.name      expandLayout1400
     * @tc.desc      32px 字号 128 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1400 begin');
      const fontSize: number = 32;
      const chars: number = 128;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(4096);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(856);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1400 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1401
     * @tc.name      expandLayout1401
     * @tc.desc      40px 字号 1 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1401 begin');
      const fontSize: number = 40;
      const chars: number = 1;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(40);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1401 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1402
     * @tc.name      expandLayout1402
     * @tc.desc      40px 字号 1 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1402 begin');
      const fontSize: number = 40;
      const chars: number = 1;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(40);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1402 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1403
     * @tc.name      expandLayout1403
     * @tc.desc      40px 字号 1 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1403 begin');
      const fontSize: number = 40;
      const chars: number = 1;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(40);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1403 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1404
     * @tc.name      expandLayout1404
     * @tc.desc      40px 字号 1 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1404 begin');
      const fontSize: number = 40;
      const chars: number = 1;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(40);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1404 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1405
     * @tc.name      expandLayout1405
     * @tc.desc      40px 字号 1 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1405 begin');
      const fontSize: number = 40;
      const chars: number = 1;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(40);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1405 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1406
     * @tc.name      expandLayout1406
     * @tc.desc      40px 字号 1 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1406 begin');
      const fontSize: number = 40;
      const chars: number = 1;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(40);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1406 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1407
     * @tc.name      expandLayout1407
     * @tc.desc      40px 字号 1 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1407 begin');
      const fontSize: number = 40;
      const chars: number = 1;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(40);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1407 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1408
     * @tc.name      expandLayout1408
     * @tc.desc      40px 字号 1 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1408 begin');
      const fontSize: number = 40;
      const chars: number = 1;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(40);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1408 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1409
     * @tc.name      expandLayout1409
     * @tc.desc      40px 字号 1 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1409 begin');
      const fontSize: number = 40;
      const chars: number = 1;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(40);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1409 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1410
     * @tc.name      expandLayout1410
     * @tc.desc      40px 字号 1 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1410 begin');
      const fontSize: number = 40;
      const chars: number = 1;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(40);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1410 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1411
     * @tc.name      expandLayout1411
     * @tc.desc      40px 字号 2 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1411 begin');
      const fontSize: number = 40;
      const chars: number = 2;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(80);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1411 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1412
     * @tc.name      expandLayout1412
     * @tc.desc      40px 字号 2 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1412 begin');
      const fontSize: number = 40;
      const chars: number = 2;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(80);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1412 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1413
     * @tc.name      expandLayout1413
     * @tc.desc      40px 字号 2 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1413 begin');
      const fontSize: number = 40;
      const chars: number = 2;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(80);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1413 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1414
     * @tc.name      expandLayout1414
     * @tc.desc      40px 字号 2 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1414 begin');
      const fontSize: number = 40;
      const chars: number = 2;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(80);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1414 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1415
     * @tc.name      expandLayout1415
     * @tc.desc      40px 字号 2 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1415 begin');
      const fontSize: number = 40;
      const chars: number = 2;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(80);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1415 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1416
     * @tc.name      expandLayout1416
     * @tc.desc      40px 字号 2 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1416 begin');
      const fontSize: number = 40;
      const chars: number = 2;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(80);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1416 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1417
     * @tc.name      expandLayout1417
     * @tc.desc      40px 字号 2 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1417 begin');
      const fontSize: number = 40;
      const chars: number = 2;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(80);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1417 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1418
     * @tc.name      expandLayout1418
     * @tc.desc      40px 字号 2 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1418 begin');
      const fontSize: number = 40;
      const chars: number = 2;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(80);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1418 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1419
     * @tc.name      expandLayout1419
     * @tc.desc      40px 字号 2 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1419 begin');
      const fontSize: number = 40;
      const chars: number = 2;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(80);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1419 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1420
     * @tc.name      expandLayout1420
     * @tc.desc      40px 字号 2 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1420 begin');
      const fontSize: number = 40;
      const chars: number = 2;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(80);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1420 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1421
     * @tc.name      expandLayout1421
     * @tc.desc      40px 字号 4 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1421 begin');
      const fontSize: number = 40;
      const chars: number = 4;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(160);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1421 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1422
     * @tc.name      expandLayout1422
     * @tc.desc      40px 字号 4 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1422 begin');
      const fontSize: number = 40;
      const chars: number = 4;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(160);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1422 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1423
     * @tc.name      expandLayout1423
     * @tc.desc      40px 字号 4 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1423 begin');
      const fontSize: number = 40;
      const chars: number = 4;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(160);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1423 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1424
     * @tc.name      expandLayout1424
     * @tc.desc      40px 字号 4 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1424 begin');
      const fontSize: number = 40;
      const chars: number = 4;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(160);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1424 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1425
     * @tc.name      expandLayout1425
     * @tc.desc      40px 字号 4 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1425 begin');
      const fontSize: number = 40;
      const chars: number = 4;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(160);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1425 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1426
     * @tc.name      expandLayout1426
     * @tc.desc      40px 字号 4 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1426 begin');
      const fontSize: number = 40;
      const chars: number = 4;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(160);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1426 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1427
     * @tc.name      expandLayout1427
     * @tc.desc      40px 字号 4 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1427 begin');
      const fontSize: number = 40;
      const chars: number = 4;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(160);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1427 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1428
     * @tc.name      expandLayout1428
     * @tc.desc      40px 字号 4 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1428 begin');
      const fontSize: number = 40;
      const chars: number = 4;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(160);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1428 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1429
     * @tc.name      expandLayout1429
     * @tc.desc      40px 字号 4 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1429 begin');
      const fontSize: number = 40;
      const chars: number = 4;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(160);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1429 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1430
     * @tc.name      expandLayout1430
     * @tc.desc      40px 字号 4 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1430 begin');
      const fontSize: number = 40;
      const chars: number = 4;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(160);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1430 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1431
     * @tc.name      expandLayout1431
     * @tc.desc      40px 字号 8 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1431 begin');
      const fontSize: number = 40;
      const chars: number = 8;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1431 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1432
     * @tc.name      expandLayout1432
     * @tc.desc      40px 字号 8 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1432 begin');
      const fontSize: number = 40;
      const chars: number = 8;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1432 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1433
     * @tc.name      expandLayout1433
     * @tc.desc      40px 字号 8 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1433 begin');
      const fontSize: number = 40;
      const chars: number = 8;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(120);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1433 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1434
     * @tc.name      expandLayout1434
     * @tc.desc      40px 字号 8 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1434 begin');
      const fontSize: number = 40;
      const chars: number = 8;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1434 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1435
     * @tc.name      expandLayout1435
     * @tc.desc      40px 字号 8 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1435 begin');
      const fontSize: number = 40;
      const chars: number = 8;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(320);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1435 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1436
     * @tc.name      expandLayout1436
     * @tc.desc      40px 字号 8 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1436 begin');
      const fontSize: number = 40;
      const chars: number = 8;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(320);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1436 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1437
     * @tc.name      expandLayout1437
     * @tc.desc      40px 字号 8 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1437 begin');
      const fontSize: number = 40;
      const chars: number = 8;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(320);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1437 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1438
     * @tc.name      expandLayout1438
     * @tc.desc      40px 字号 8 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1438 begin');
      const fontSize: number = 40;
      const chars: number = 8;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(320);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1438 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1439
     * @tc.name      expandLayout1439
     * @tc.desc      40px 字号 8 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1439 begin');
      const fontSize: number = 40;
      const chars: number = 8;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(320);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1439 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1440
     * @tc.name      expandLayout1440
     * @tc.desc      40px 字号 8 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1440 begin');
      const fontSize: number = 40;
      const chars: number = 8;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(320);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(320);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1440 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1441
     * @tc.name      expandLayout1441
     * @tc.desc      40px 字号 12 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1441 begin');
      const fontSize: number = 40;
      const chars: number = 12;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(120);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1441 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1442
     * @tc.name      expandLayout1442
     * @tc.desc      40px 字号 12 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1442 begin');
      const fontSize: number = 40;
      const chars: number = 12;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1442 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1443
     * @tc.name      expandLayout1443
     * @tc.desc      40px 字号 12 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1443 begin');
      const fontSize: number = 40;
      const chars: number = 12;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1443 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1444
     * @tc.name      expandLayout1444
     * @tc.desc      40px 字号 12 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1444 begin');
      const fontSize: number = 40;
      const chars: number = 12;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(200);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1444 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1445
     * @tc.name      expandLayout1445
     * @tc.desc      40px 字号 12 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1445 begin');
      const fontSize: number = 40;
      const chars: number = 12;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1445 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1446
     * @tc.name      expandLayout1446
     * @tc.desc      40px 字号 12 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1446 begin');
      const fontSize: number = 40;
      const chars: number = 12;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(120);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1446 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1447
     * @tc.name      expandLayout1447
     * @tc.desc      40px 字号 12 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1447 begin');
      const fontSize: number = 40;
      const chars: number = 12;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(480);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1447 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1448
     * @tc.name      expandLayout1448
     * @tc.desc      40px 字号 12 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1448 begin');
      const fontSize: number = 40;
      const chars: number = 12;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(480);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1448 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1449
     * @tc.name      expandLayout1449
     * @tc.desc      40px 字号 12 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1449 begin');
      const fontSize: number = 40;
      const chars: number = 12;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(480);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1449 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1450
     * @tc.name      expandLayout1450
     * @tc.desc      40px 字号 12 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1450 begin');
      const fontSize: number = 40;
      const chars: number = 12;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(480);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(480);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1450 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1451
     * @tc.name      expandLayout1451
     * @tc.desc      40px 字号 16 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1451 begin');
      const fontSize: number = 40;
      const chars: number = 16;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(6);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1451 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1452
     * @tc.name      expandLayout1452
     * @tc.desc      40px 字号 16 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1452 begin');
      const fontSize: number = 40;
      const chars: number = 16;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1452 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1453
     * @tc.name      expandLayout1453
     * @tc.desc      40px 字号 16 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1453 begin');
      const fontSize: number = 40;
      const chars: number = 16;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(40);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1453 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1454
     * @tc.name      expandLayout1454
     * @tc.desc      40px 字号 16 字符在 280px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1454 begin');
      const fontSize: number = 40;
      const chars: number = 16;
      const boxWidth: number = 280;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(3);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1454 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1455
     * @tc.name      expandLayout1455
     * @tc.desc      40px 字号 16 字符在 320px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1455 begin');
      const fontSize: number = 40;
      const chars: number = 16;
      const boxWidth: number = 320;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(320);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1455 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1456
     * @tc.name      expandLayout1456
     * @tc.desc      40px 字号 16 字符在 360px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1456 begin');
      const fontSize: number = 40;
      const chars: number = 16;
      const boxWidth: number = 360;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(280);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1456 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1457
     * @tc.name      expandLayout1457
     * @tc.desc      40px 字号 16 字符在 480px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1457 begin');
      const fontSize: number = 40;
      const chars: number = 16;
      const boxWidth: number = 480;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(2);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1457 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1458
     * @tc.name      expandLayout1458
     * @tc.desc      40px 字号 16 字符在 640px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1458 begin');
      const fontSize: number = 40;
      const chars: number = 16;
      const boxWidth: number = 640;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(640);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1458 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1459
     * @tc.name      expandLayout1459
     * @tc.desc      40px 字号 16 字符在 720px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1459 begin');
      const fontSize: number = 40;
      const chars: number = 16;
      const boxWidth: number = 720;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(640);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1459 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1460
     * @tc.name      expandLayout1460
     * @tc.desc      40px 字号 16 字符在 1080px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1460 begin');
      const fontSize: number = 40;
      const chars: number = 16;
      const boxWidth: number = 1080;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(640);
      expect(lines).assertEqual(1);
      expect(lastLine).assertEqual(640);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1460 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1461
     * @tc.name      expandLayout1461
     * @tc.desc      40px 字号 20 字符在 120px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1461 begin');
      const fontSize: number = 40;
      const chars: number = 20;
      const boxWidth: number = 120;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(800);
      expect(lines).assertEqual(7);
      expect(lastLine).assertEqual(80);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1461 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1462
     * @tc.name      expandLayout1462
     * @tc.desc      40px 字号 20 字符在 160px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1462 begin');
      const fontSize: number = 40;
      const chars: number = 20;
      const boxWidth: number = 160;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(800);
      expect(lines).assertEqual(5);
      expect(lastLine).assertEqual(160);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1462 end');
    })

    /**
     * @tc.number    EXPAND_LAYOUT_1463
     * @tc.name      expandLayout1463
     * @tc.desc      40px 字号 20 字符在 200px 容器内的行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandLayout1463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1463 begin');
      const fontSize: number = 40;
      const chars: number = 20;
      const boxWidth: number = 200;
      const width: number = chars * fontSize;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      const lastLine: number = width - (lines - 1) * boxWidth;
      expect(width).assertEqual(800);
      expect(lines).assertEqual(4);
      expect(lastLine).assertEqual(200);
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandLayout1463 end');
    })
  })
}
