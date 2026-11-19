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

export default function expandWrapMatrix1Test(): void {
  describe('ExpandWrapMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    EXPAND_WRAP_0001
     * @tc.name      expandWrap0001
     * @tc.desc      行高 1 倍字号 10 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0001 begin');
      const fontSize: number = 10;
      const multiplier: number = 1;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(10);
      expect(totalHeight).assertEqual(10);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0001 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0002
     * @tc.name      expandWrap0002
     * @tc.desc      行高 1 倍字号 12 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0002 begin');
      const fontSize: number = 12;
      const multiplier: number = 1;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(12);
      expect(totalHeight).assertEqual(12);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0002 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0003
     * @tc.name      expandWrap0003
     * @tc.desc      行高 1 倍字号 16 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0003 begin');
      const fontSize: number = 16;
      const multiplier: number = 1;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(16);
      expect(totalHeight).assertEqual(16);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0003 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0004
     * @tc.name      expandWrap0004
     * @tc.desc      行高 1 倍字号 20 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0004 begin');
      const fontSize: number = 20;
      const multiplier: number = 1;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(20);
      expect(totalHeight).assertEqual(20);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0004 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0005
     * @tc.name      expandWrap0005
     * @tc.desc      行高 1 倍字号 24 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0005 begin');
      const fontSize: number = 24;
      const multiplier: number = 1;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(24);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0005 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0006
     * @tc.name      expandWrap0006
     * @tc.desc      行高 1 倍字号 28 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0006 begin');
      const fontSize: number = 28;
      const multiplier: number = 1;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(28);
      expect(totalHeight).assertEqual(28);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0006 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0007
     * @tc.name      expandWrap0007
     * @tc.desc      行高 1 倍字号 32 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0007 begin');
      const fontSize: number = 32;
      const multiplier: number = 1;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(32);
      expect(totalHeight).assertEqual(32);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0007 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0008
     * @tc.name      expandWrap0008
     * @tc.desc      行高 1 倍字号 40 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0008 begin');
      const fontSize: number = 40;
      const multiplier: number = 1;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(40);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0008 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0009
     * @tc.name      expandWrap0009
     * @tc.desc      行高 1 倍字号 48 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0009 begin');
      const fontSize: number = 48;
      const multiplier: number = 1;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(48);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0009 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0010
     * @tc.name      expandWrap0010
     * @tc.desc      行高 1 倍字号 56 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0010 begin');
      const fontSize: number = 56;
      const multiplier: number = 1;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(56);
      expect(totalHeight).assertEqual(56);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0010 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0011
     * @tc.name      expandWrap0011
     * @tc.desc      行高 1 倍字号 10 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0011 begin');
      const fontSize: number = 10;
      const multiplier: number = 1;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(10);
      expect(totalHeight).assertEqual(20);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0011 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0012
     * @tc.name      expandWrap0012
     * @tc.desc      行高 1 倍字号 12 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0012 begin');
      const fontSize: number = 12;
      const multiplier: number = 1;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(12);
      expect(totalHeight).assertEqual(24);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0012 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0013
     * @tc.name      expandWrap0013
     * @tc.desc      行高 1 倍字号 16 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0013 begin');
      const fontSize: number = 16;
      const multiplier: number = 1;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(16);
      expect(totalHeight).assertEqual(32);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0013 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0014
     * @tc.name      expandWrap0014
     * @tc.desc      行高 1 倍字号 20 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0014 begin');
      const fontSize: number = 20;
      const multiplier: number = 1;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(20);
      expect(totalHeight).assertEqual(40);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0014 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0015
     * @tc.name      expandWrap0015
     * @tc.desc      行高 1 倍字号 24 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0015 begin');
      const fontSize: number = 24;
      const multiplier: number = 1;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(48);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0015 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0016
     * @tc.name      expandWrap0016
     * @tc.desc      行高 1 倍字号 28 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0016 begin');
      const fontSize: number = 28;
      const multiplier: number = 1;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(28);
      expect(totalHeight).assertEqual(56);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0016 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0017
     * @tc.name      expandWrap0017
     * @tc.desc      行高 1 倍字号 32 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0017 begin');
      const fontSize: number = 32;
      const multiplier: number = 1;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(32);
      expect(totalHeight).assertEqual(64);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0017 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0018
     * @tc.name      expandWrap0018
     * @tc.desc      行高 1 倍字号 40 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0018 begin');
      const fontSize: number = 40;
      const multiplier: number = 1;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(80);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0018 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0019
     * @tc.name      expandWrap0019
     * @tc.desc      行高 1 倍字号 48 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0019 begin');
      const fontSize: number = 48;
      const multiplier: number = 1;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(96);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0019 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0020
     * @tc.name      expandWrap0020
     * @tc.desc      行高 1 倍字号 56 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0020 begin');
      const fontSize: number = 56;
      const multiplier: number = 1;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(56);
      expect(totalHeight).assertEqual(112);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0020 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0021
     * @tc.name      expandWrap0021
     * @tc.desc      行高 1 倍字号 10 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0021 begin');
      const fontSize: number = 10;
      const multiplier: number = 1;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(10);
      expect(totalHeight).assertEqual(30);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0021 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0022
     * @tc.name      expandWrap0022
     * @tc.desc      行高 1 倍字号 12 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0022 begin');
      const fontSize: number = 12;
      const multiplier: number = 1;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(12);
      expect(totalHeight).assertEqual(36);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0022 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0023
     * @tc.name      expandWrap0023
     * @tc.desc      行高 1 倍字号 16 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0023 begin');
      const fontSize: number = 16;
      const multiplier: number = 1;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(16);
      expect(totalHeight).assertEqual(48);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0023 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0024
     * @tc.name      expandWrap0024
     * @tc.desc      行高 1 倍字号 20 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0024 begin');
      const fontSize: number = 20;
      const multiplier: number = 1;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(20);
      expect(totalHeight).assertEqual(60);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0024 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0025
     * @tc.name      expandWrap0025
     * @tc.desc      行高 1 倍字号 24 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0025 begin');
      const fontSize: number = 24;
      const multiplier: number = 1;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(72);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0025 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0026
     * @tc.name      expandWrap0026
     * @tc.desc      行高 1 倍字号 28 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0026 begin');
      const fontSize: number = 28;
      const multiplier: number = 1;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(28);
      expect(totalHeight).assertEqual(84);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0026 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0027
     * @tc.name      expandWrap0027
     * @tc.desc      行高 1 倍字号 32 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0027 begin');
      const fontSize: number = 32;
      const multiplier: number = 1;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(32);
      expect(totalHeight).assertEqual(96);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0027 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0028
     * @tc.name      expandWrap0028
     * @tc.desc      行高 1 倍字号 40 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0028 begin');
      const fontSize: number = 40;
      const multiplier: number = 1;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(120);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0028 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0029
     * @tc.name      expandWrap0029
     * @tc.desc      行高 1 倍字号 48 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0029 begin');
      const fontSize: number = 48;
      const multiplier: number = 1;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(144);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0029 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0030
     * @tc.name      expandWrap0030
     * @tc.desc      行高 1 倍字号 56 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0030 begin');
      const fontSize: number = 56;
      const multiplier: number = 1;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(56);
      expect(totalHeight).assertEqual(168);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0030 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0031
     * @tc.name      expandWrap0031
     * @tc.desc      行高 1 倍字号 10 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0031 begin');
      const fontSize: number = 10;
      const multiplier: number = 1;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(10);
      expect(totalHeight).assertEqual(40);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0031 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0032
     * @tc.name      expandWrap0032
     * @tc.desc      行高 1 倍字号 12 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0032 begin');
      const fontSize: number = 12;
      const multiplier: number = 1;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(12);
      expect(totalHeight).assertEqual(48);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0032 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0033
     * @tc.name      expandWrap0033
     * @tc.desc      行高 1 倍字号 16 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0033 begin');
      const fontSize: number = 16;
      const multiplier: number = 1;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(16);
      expect(totalHeight).assertEqual(64);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0033 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0034
     * @tc.name      expandWrap0034
     * @tc.desc      行高 1 倍字号 20 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0034 begin');
      const fontSize: number = 20;
      const multiplier: number = 1;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(20);
      expect(totalHeight).assertEqual(80);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0034 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0035
     * @tc.name      expandWrap0035
     * @tc.desc      行高 1 倍字号 24 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0035 begin');
      const fontSize: number = 24;
      const multiplier: number = 1;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(96);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0035 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0036
     * @tc.name      expandWrap0036
     * @tc.desc      行高 1 倍字号 28 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0036 begin');
      const fontSize: number = 28;
      const multiplier: number = 1;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(28);
      expect(totalHeight).assertEqual(112);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0036 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0037
     * @tc.name      expandWrap0037
     * @tc.desc      行高 1 倍字号 32 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0037 begin');
      const fontSize: number = 32;
      const multiplier: number = 1;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(32);
      expect(totalHeight).assertEqual(128);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0037 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0038
     * @tc.name      expandWrap0038
     * @tc.desc      行高 1 倍字号 40 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0038 begin');
      const fontSize: number = 40;
      const multiplier: number = 1;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(160);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0038 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0039
     * @tc.name      expandWrap0039
     * @tc.desc      行高 1 倍字号 48 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0039 begin');
      const fontSize: number = 48;
      const multiplier: number = 1;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(192);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0039 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0040
     * @tc.name      expandWrap0040
     * @tc.desc      行高 1 倍字号 56 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0040 begin');
      const fontSize: number = 56;
      const multiplier: number = 1;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(56);
      expect(totalHeight).assertEqual(224);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0040 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0041
     * @tc.name      expandWrap0041
     * @tc.desc      行高 1 倍字号 10 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0041 begin');
      const fontSize: number = 10;
      const multiplier: number = 1;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(10);
      expect(totalHeight).assertEqual(50);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0041 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0042
     * @tc.name      expandWrap0042
     * @tc.desc      行高 1 倍字号 12 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0042 begin');
      const fontSize: number = 12;
      const multiplier: number = 1;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(12);
      expect(totalHeight).assertEqual(60);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0042 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0043
     * @tc.name      expandWrap0043
     * @tc.desc      行高 1 倍字号 16 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0043 begin');
      const fontSize: number = 16;
      const multiplier: number = 1;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(16);
      expect(totalHeight).assertEqual(80);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0043 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0044
     * @tc.name      expandWrap0044
     * @tc.desc      行高 1 倍字号 20 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0044 begin');
      const fontSize: number = 20;
      const multiplier: number = 1;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(20);
      expect(totalHeight).assertEqual(100);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0044 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0045
     * @tc.name      expandWrap0045
     * @tc.desc      行高 1 倍字号 24 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0045 begin');
      const fontSize: number = 24;
      const multiplier: number = 1;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(120);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0045 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0046
     * @tc.name      expandWrap0046
     * @tc.desc      行高 1 倍字号 28 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0046 begin');
      const fontSize: number = 28;
      const multiplier: number = 1;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(28);
      expect(totalHeight).assertEqual(140);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0046 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0047
     * @tc.name      expandWrap0047
     * @tc.desc      行高 1 倍字号 32 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0047 begin');
      const fontSize: number = 32;
      const multiplier: number = 1;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(32);
      expect(totalHeight).assertEqual(160);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0047 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0048
     * @tc.name      expandWrap0048
     * @tc.desc      行高 1 倍字号 40 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0048 begin');
      const fontSize: number = 40;
      const multiplier: number = 1;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(200);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0048 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0049
     * @tc.name      expandWrap0049
     * @tc.desc      行高 1 倍字号 48 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0049 begin');
      const fontSize: number = 48;
      const multiplier: number = 1;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(240);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0049 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0050
     * @tc.name      expandWrap0050
     * @tc.desc      行高 1 倍字号 56 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0050 begin');
      const fontSize: number = 56;
      const multiplier: number = 1;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(56);
      expect(totalHeight).assertEqual(280);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0050 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0051
     * @tc.name      expandWrap0051
     * @tc.desc      行高 1 倍字号 10 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0051 begin');
      const fontSize: number = 10;
      const multiplier: number = 1;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(10);
      expect(totalHeight).assertEqual(60);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0051 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0052
     * @tc.name      expandWrap0052
     * @tc.desc      行高 1 倍字号 12 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0052 begin');
      const fontSize: number = 12;
      const multiplier: number = 1;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(12);
      expect(totalHeight).assertEqual(72);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0052 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0053
     * @tc.name      expandWrap0053
     * @tc.desc      行高 1 倍字号 16 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0053 begin');
      const fontSize: number = 16;
      const multiplier: number = 1;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(16);
      expect(totalHeight).assertEqual(96);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0053 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0054
     * @tc.name      expandWrap0054
     * @tc.desc      行高 1 倍字号 20 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0054 begin');
      const fontSize: number = 20;
      const multiplier: number = 1;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(20);
      expect(totalHeight).assertEqual(120);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0054 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0055
     * @tc.name      expandWrap0055
     * @tc.desc      行高 1 倍字号 24 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0055 begin');
      const fontSize: number = 24;
      const multiplier: number = 1;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(144);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0055 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0056
     * @tc.name      expandWrap0056
     * @tc.desc      行高 1 倍字号 28 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0056 begin');
      const fontSize: number = 28;
      const multiplier: number = 1;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(28);
      expect(totalHeight).assertEqual(168);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0056 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0057
     * @tc.name      expandWrap0057
     * @tc.desc      行高 1 倍字号 32 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0057 begin');
      const fontSize: number = 32;
      const multiplier: number = 1;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(32);
      expect(totalHeight).assertEqual(192);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0057 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0058
     * @tc.name      expandWrap0058
     * @tc.desc      行高 1 倍字号 40 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0058 begin');
      const fontSize: number = 40;
      const multiplier: number = 1;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(240);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0058 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0059
     * @tc.name      expandWrap0059
     * @tc.desc      行高 1 倍字号 48 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0059 begin');
      const fontSize: number = 48;
      const multiplier: number = 1;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(288);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0059 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0060
     * @tc.name      expandWrap0060
     * @tc.desc      行高 1 倍字号 56 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0060 begin');
      const fontSize: number = 56;
      const multiplier: number = 1;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(56);
      expect(totalHeight).assertEqual(336);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0060 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0061
     * @tc.name      expandWrap0061
     * @tc.desc      行高 1.2 倍字号 10 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0061 begin');
      const fontSize: number = 10;
      const multiplier: number = 1.2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(12);
      expect(totalHeight).assertEqual(12);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0061 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0062
     * @tc.name      expandWrap0062
     * @tc.desc      行高 1.2 倍字号 12 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0062 begin');
      const fontSize: number = 12;
      const multiplier: number = 1.2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(14);
      expect(totalHeight).assertEqual(14);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0062 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0063
     * @tc.name      expandWrap0063
     * @tc.desc      行高 1.2 倍字号 16 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0063 begin');
      const fontSize: number = 16;
      const multiplier: number = 1.2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(19);
      expect(totalHeight).assertEqual(19);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0063 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0064
     * @tc.name      expandWrap0064
     * @tc.desc      行高 1.2 倍字号 20 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0064 begin');
      const fontSize: number = 20;
      const multiplier: number = 1.2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(24);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0064 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0065
     * @tc.name      expandWrap0065
     * @tc.desc      行高 1.2 倍字号 24 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0065 begin');
      const fontSize: number = 24;
      const multiplier: number = 1.2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(29);
      expect(totalHeight).assertEqual(29);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0065 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0066
     * @tc.name      expandWrap0066
     * @tc.desc      行高 1.2 倍字号 28 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0066 begin');
      const fontSize: number = 28;
      const multiplier: number = 1.2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(34);
      expect(totalHeight).assertEqual(34);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0066 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0067
     * @tc.name      expandWrap0067
     * @tc.desc      行高 1.2 倍字号 32 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0067 begin');
      const fontSize: number = 32;
      const multiplier: number = 1.2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(38);
      expect(totalHeight).assertEqual(38);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0067 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0068
     * @tc.name      expandWrap0068
     * @tc.desc      行高 1.2 倍字号 40 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0068 begin');
      const fontSize: number = 40;
      const multiplier: number = 1.2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(48);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0068 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0069
     * @tc.name      expandWrap0069
     * @tc.desc      行高 1.2 倍字号 48 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0069 begin');
      const fontSize: number = 48;
      const multiplier: number = 1.2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(58);
      expect(totalHeight).assertEqual(58);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0069 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0070
     * @tc.name      expandWrap0070
     * @tc.desc      行高 1.2 倍字号 56 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0070 begin');
      const fontSize: number = 56;
      const multiplier: number = 1.2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(67);
      expect(totalHeight).assertEqual(67);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0070 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0071
     * @tc.name      expandWrap0071
     * @tc.desc      行高 1.2 倍字号 10 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0071 begin');
      const fontSize: number = 10;
      const multiplier: number = 1.2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(12);
      expect(totalHeight).assertEqual(24);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0071 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0072
     * @tc.name      expandWrap0072
     * @tc.desc      行高 1.2 倍字号 12 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0072 begin');
      const fontSize: number = 12;
      const multiplier: number = 1.2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(14);
      expect(totalHeight).assertEqual(28);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0072 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0073
     * @tc.name      expandWrap0073
     * @tc.desc      行高 1.2 倍字号 16 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0073 begin');
      const fontSize: number = 16;
      const multiplier: number = 1.2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(19);
      expect(totalHeight).assertEqual(38);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0073 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0074
     * @tc.name      expandWrap0074
     * @tc.desc      行高 1.2 倍字号 20 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0074 begin');
      const fontSize: number = 20;
      const multiplier: number = 1.2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(48);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0074 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0075
     * @tc.name      expandWrap0075
     * @tc.desc      行高 1.2 倍字号 24 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0075 begin');
      const fontSize: number = 24;
      const multiplier: number = 1.2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(29);
      expect(totalHeight).assertEqual(58);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0075 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0076
     * @tc.name      expandWrap0076
     * @tc.desc      行高 1.2 倍字号 28 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0076 begin');
      const fontSize: number = 28;
      const multiplier: number = 1.2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(34);
      expect(totalHeight).assertEqual(68);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0076 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0077
     * @tc.name      expandWrap0077
     * @tc.desc      行高 1.2 倍字号 32 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0077 begin');
      const fontSize: number = 32;
      const multiplier: number = 1.2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(38);
      expect(totalHeight).assertEqual(76);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0077 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0078
     * @tc.name      expandWrap0078
     * @tc.desc      行高 1.2 倍字号 40 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0078 begin');
      const fontSize: number = 40;
      const multiplier: number = 1.2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(96);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0078 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0079
     * @tc.name      expandWrap0079
     * @tc.desc      行高 1.2 倍字号 48 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0079 begin');
      const fontSize: number = 48;
      const multiplier: number = 1.2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(58);
      expect(totalHeight).assertEqual(116);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0079 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0080
     * @tc.name      expandWrap0080
     * @tc.desc      行高 1.2 倍字号 56 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0080 begin');
      const fontSize: number = 56;
      const multiplier: number = 1.2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(67);
      expect(totalHeight).assertEqual(134);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0080 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0081
     * @tc.name      expandWrap0081
     * @tc.desc      行高 1.2 倍字号 10 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0081 begin');
      const fontSize: number = 10;
      const multiplier: number = 1.2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(12);
      expect(totalHeight).assertEqual(36);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0081 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0082
     * @tc.name      expandWrap0082
     * @tc.desc      行高 1.2 倍字号 12 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0082 begin');
      const fontSize: number = 12;
      const multiplier: number = 1.2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(14);
      expect(totalHeight).assertEqual(42);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0082 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0083
     * @tc.name      expandWrap0083
     * @tc.desc      行高 1.2 倍字号 16 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0083 begin');
      const fontSize: number = 16;
      const multiplier: number = 1.2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(19);
      expect(totalHeight).assertEqual(57);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0083 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0084
     * @tc.name      expandWrap0084
     * @tc.desc      行高 1.2 倍字号 20 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0084 begin');
      const fontSize: number = 20;
      const multiplier: number = 1.2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(72);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0084 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0085
     * @tc.name      expandWrap0085
     * @tc.desc      行高 1.2 倍字号 24 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0085 begin');
      const fontSize: number = 24;
      const multiplier: number = 1.2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(29);
      expect(totalHeight).assertEqual(87);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0085 end');
    })
  })
}
