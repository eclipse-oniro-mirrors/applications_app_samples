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

export default function expandWrapMatrix2Test(): void {
  describe('ExpandWrapMatrix2Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    EXPAND_WRAP_0086
     * @tc.name      expandWrap0086
     * @tc.desc      行高 1.2 倍字号 28 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0086 begin');
      const fontSize: number = 28;
      const multiplier: number = 1.2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(34);
      expect(totalHeight).assertEqual(102);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0086 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0087
     * @tc.name      expandWrap0087
     * @tc.desc      行高 1.2 倍字号 32 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0087 begin');
      const fontSize: number = 32;
      const multiplier: number = 1.2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(38);
      expect(totalHeight).assertEqual(114);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0087 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0088
     * @tc.name      expandWrap0088
     * @tc.desc      行高 1.2 倍字号 40 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0088 begin');
      const fontSize: number = 40;
      const multiplier: number = 1.2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(144);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0088 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0089
     * @tc.name      expandWrap0089
     * @tc.desc      行高 1.2 倍字号 48 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0089 begin');
      const fontSize: number = 48;
      const multiplier: number = 1.2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(58);
      expect(totalHeight).assertEqual(174);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0089 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0090
     * @tc.name      expandWrap0090
     * @tc.desc      行高 1.2 倍字号 56 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0090 begin');
      const fontSize: number = 56;
      const multiplier: number = 1.2;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(67);
      expect(totalHeight).assertEqual(201);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0090 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0091
     * @tc.name      expandWrap0091
     * @tc.desc      行高 1.2 倍字号 10 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0091 begin');
      const fontSize: number = 10;
      const multiplier: number = 1.2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(12);
      expect(totalHeight).assertEqual(48);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0091 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0092
     * @tc.name      expandWrap0092
     * @tc.desc      行高 1.2 倍字号 12 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0092 begin');
      const fontSize: number = 12;
      const multiplier: number = 1.2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(14);
      expect(totalHeight).assertEqual(56);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0092 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0093
     * @tc.name      expandWrap0093
     * @tc.desc      行高 1.2 倍字号 16 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0093 begin');
      const fontSize: number = 16;
      const multiplier: number = 1.2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(19);
      expect(totalHeight).assertEqual(76);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0093 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0094
     * @tc.name      expandWrap0094
     * @tc.desc      行高 1.2 倍字号 20 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0094 begin');
      const fontSize: number = 20;
      const multiplier: number = 1.2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(96);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0094 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0095
     * @tc.name      expandWrap0095
     * @tc.desc      行高 1.2 倍字号 24 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0095 begin');
      const fontSize: number = 24;
      const multiplier: number = 1.2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(29);
      expect(totalHeight).assertEqual(116);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0095 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0096
     * @tc.name      expandWrap0096
     * @tc.desc      行高 1.2 倍字号 28 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0096 begin');
      const fontSize: number = 28;
      const multiplier: number = 1.2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(34);
      expect(totalHeight).assertEqual(136);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0096 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0097
     * @tc.name      expandWrap0097
     * @tc.desc      行高 1.2 倍字号 32 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0097 begin');
      const fontSize: number = 32;
      const multiplier: number = 1.2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(38);
      expect(totalHeight).assertEqual(152);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0097 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0098
     * @tc.name      expandWrap0098
     * @tc.desc      行高 1.2 倍字号 40 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0098 begin');
      const fontSize: number = 40;
      const multiplier: number = 1.2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(192);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0098 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0099
     * @tc.name      expandWrap0099
     * @tc.desc      行高 1.2 倍字号 48 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0099 begin');
      const fontSize: number = 48;
      const multiplier: number = 1.2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(58);
      expect(totalHeight).assertEqual(232);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0099 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0100
     * @tc.name      expandWrap0100
     * @tc.desc      行高 1.2 倍字号 56 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0100 begin');
      const fontSize: number = 56;
      const multiplier: number = 1.2;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(67);
      expect(totalHeight).assertEqual(268);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0100 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0101
     * @tc.name      expandWrap0101
     * @tc.desc      行高 1.2 倍字号 10 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0101 begin');
      const fontSize: number = 10;
      const multiplier: number = 1.2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(12);
      expect(totalHeight).assertEqual(60);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0101 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0102
     * @tc.name      expandWrap0102
     * @tc.desc      行高 1.2 倍字号 12 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0102 begin');
      const fontSize: number = 12;
      const multiplier: number = 1.2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(14);
      expect(totalHeight).assertEqual(70);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0102 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0103
     * @tc.name      expandWrap0103
     * @tc.desc      行高 1.2 倍字号 16 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0103 begin');
      const fontSize: number = 16;
      const multiplier: number = 1.2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(19);
      expect(totalHeight).assertEqual(95);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0103 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0104
     * @tc.name      expandWrap0104
     * @tc.desc      行高 1.2 倍字号 20 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0104 begin');
      const fontSize: number = 20;
      const multiplier: number = 1.2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(120);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0104 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0105
     * @tc.name      expandWrap0105
     * @tc.desc      行高 1.2 倍字号 24 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0105 begin');
      const fontSize: number = 24;
      const multiplier: number = 1.2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(29);
      expect(totalHeight).assertEqual(145);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0105 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0106
     * @tc.name      expandWrap0106
     * @tc.desc      行高 1.2 倍字号 28 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0106 begin');
      const fontSize: number = 28;
      const multiplier: number = 1.2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(34);
      expect(totalHeight).assertEqual(170);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0106 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0107
     * @tc.name      expandWrap0107
     * @tc.desc      行高 1.2 倍字号 32 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0107 begin');
      const fontSize: number = 32;
      const multiplier: number = 1.2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(38);
      expect(totalHeight).assertEqual(190);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0107 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0108
     * @tc.name      expandWrap0108
     * @tc.desc      行高 1.2 倍字号 40 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0108 begin');
      const fontSize: number = 40;
      const multiplier: number = 1.2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(240);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0108 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0109
     * @tc.name      expandWrap0109
     * @tc.desc      行高 1.2 倍字号 48 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0109 begin');
      const fontSize: number = 48;
      const multiplier: number = 1.2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(58);
      expect(totalHeight).assertEqual(290);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0109 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0110
     * @tc.name      expandWrap0110
     * @tc.desc      行高 1.2 倍字号 56 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0110 begin');
      const fontSize: number = 56;
      const multiplier: number = 1.2;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(67);
      expect(totalHeight).assertEqual(335);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0110 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0111
     * @tc.name      expandWrap0111
     * @tc.desc      行高 1.2 倍字号 10 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0111 begin');
      const fontSize: number = 10;
      const multiplier: number = 1.2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(12);
      expect(totalHeight).assertEqual(72);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0111 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0112
     * @tc.name      expandWrap0112
     * @tc.desc      行高 1.2 倍字号 12 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0112 begin');
      const fontSize: number = 12;
      const multiplier: number = 1.2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(14);
      expect(totalHeight).assertEqual(84);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0112 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0113
     * @tc.name      expandWrap0113
     * @tc.desc      行高 1.2 倍字号 16 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0113 begin');
      const fontSize: number = 16;
      const multiplier: number = 1.2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(19);
      expect(totalHeight).assertEqual(114);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0113 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0114
     * @tc.name      expandWrap0114
     * @tc.desc      行高 1.2 倍字号 20 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0114 begin');
      const fontSize: number = 20;
      const multiplier: number = 1.2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(144);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0114 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0115
     * @tc.name      expandWrap0115
     * @tc.desc      行高 1.2 倍字号 24 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0115 begin');
      const fontSize: number = 24;
      const multiplier: number = 1.2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(29);
      expect(totalHeight).assertEqual(174);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0115 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0116
     * @tc.name      expandWrap0116
     * @tc.desc      行高 1.2 倍字号 28 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0116 begin');
      const fontSize: number = 28;
      const multiplier: number = 1.2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(34);
      expect(totalHeight).assertEqual(204);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0116 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0117
     * @tc.name      expandWrap0117
     * @tc.desc      行高 1.2 倍字号 32 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0117 begin');
      const fontSize: number = 32;
      const multiplier: number = 1.2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(38);
      expect(totalHeight).assertEqual(228);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0117 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0118
     * @tc.name      expandWrap0118
     * @tc.desc      行高 1.2 倍字号 40 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0118 begin');
      const fontSize: number = 40;
      const multiplier: number = 1.2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(288);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0118 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0119
     * @tc.name      expandWrap0119
     * @tc.desc      行高 1.2 倍字号 48 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0119 begin');
      const fontSize: number = 48;
      const multiplier: number = 1.2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(58);
      expect(totalHeight).assertEqual(348);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0119 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0120
     * @tc.name      expandWrap0120
     * @tc.desc      行高 1.2 倍字号 56 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0120 begin');
      const fontSize: number = 56;
      const multiplier: number = 1.2;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(67);
      expect(totalHeight).assertEqual(402);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0120 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0121
     * @tc.name      expandWrap0121
     * @tc.desc      行高 1.5 倍字号 10 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0121 begin');
      const fontSize: number = 10;
      const multiplier: number = 1.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(15);
      expect(totalHeight).assertEqual(15);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0121 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0122
     * @tc.name      expandWrap0122
     * @tc.desc      行高 1.5 倍字号 12 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0122 begin');
      const fontSize: number = 12;
      const multiplier: number = 1.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(18);
      expect(totalHeight).assertEqual(18);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0122 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0123
     * @tc.name      expandWrap0123
     * @tc.desc      行高 1.5 倍字号 16 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0123 begin');
      const fontSize: number = 16;
      const multiplier: number = 1.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(24);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0123 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0124
     * @tc.name      expandWrap0124
     * @tc.desc      行高 1.5 倍字号 20 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0124 begin');
      const fontSize: number = 20;
      const multiplier: number = 1.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(30);
      expect(totalHeight).assertEqual(30);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0124 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0125
     * @tc.name      expandWrap0125
     * @tc.desc      行高 1.5 倍字号 24 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0125 begin');
      const fontSize: number = 24;
      const multiplier: number = 1.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(36);
      expect(totalHeight).assertEqual(36);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0125 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0126
     * @tc.name      expandWrap0126
     * @tc.desc      行高 1.5 倍字号 28 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0126 begin');
      const fontSize: number = 28;
      const multiplier: number = 1.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(42);
      expect(totalHeight).assertEqual(42);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0126 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0127
     * @tc.name      expandWrap0127
     * @tc.desc      行高 1.5 倍字号 32 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0127 begin');
      const fontSize: number = 32;
      const multiplier: number = 1.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(48);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0127 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0128
     * @tc.name      expandWrap0128
     * @tc.desc      行高 1.5 倍字号 40 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0128 begin');
      const fontSize: number = 40;
      const multiplier: number = 1.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(60);
      expect(totalHeight).assertEqual(60);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0128 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0129
     * @tc.name      expandWrap0129
     * @tc.desc      行高 1.5 倍字号 48 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0129 begin');
      const fontSize: number = 48;
      const multiplier: number = 1.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(72);
      expect(totalHeight).assertEqual(72);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0129 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0130
     * @tc.name      expandWrap0130
     * @tc.desc      行高 1.5 倍字号 56 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0130 begin');
      const fontSize: number = 56;
      const multiplier: number = 1.5;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(84);
      expect(totalHeight).assertEqual(84);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0130 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0131
     * @tc.name      expandWrap0131
     * @tc.desc      行高 1.5 倍字号 10 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0131 begin');
      const fontSize: number = 10;
      const multiplier: number = 1.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(15);
      expect(totalHeight).assertEqual(30);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0131 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0132
     * @tc.name      expandWrap0132
     * @tc.desc      行高 1.5 倍字号 12 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0132 begin');
      const fontSize: number = 12;
      const multiplier: number = 1.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(18);
      expect(totalHeight).assertEqual(36);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0132 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0133
     * @tc.name      expandWrap0133
     * @tc.desc      行高 1.5 倍字号 16 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0133 begin');
      const fontSize: number = 16;
      const multiplier: number = 1.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(48);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0133 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0134
     * @tc.name      expandWrap0134
     * @tc.desc      行高 1.5 倍字号 20 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0134 begin');
      const fontSize: number = 20;
      const multiplier: number = 1.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(30);
      expect(totalHeight).assertEqual(60);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0134 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0135
     * @tc.name      expandWrap0135
     * @tc.desc      行高 1.5 倍字号 24 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0135 begin');
      const fontSize: number = 24;
      const multiplier: number = 1.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(36);
      expect(totalHeight).assertEqual(72);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0135 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0136
     * @tc.name      expandWrap0136
     * @tc.desc      行高 1.5 倍字号 28 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0136 begin');
      const fontSize: number = 28;
      const multiplier: number = 1.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(42);
      expect(totalHeight).assertEqual(84);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0136 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0137
     * @tc.name      expandWrap0137
     * @tc.desc      行高 1.5 倍字号 32 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0137 begin');
      const fontSize: number = 32;
      const multiplier: number = 1.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(96);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0137 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0138
     * @tc.name      expandWrap0138
     * @tc.desc      行高 1.5 倍字号 40 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0138 begin');
      const fontSize: number = 40;
      const multiplier: number = 1.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(60);
      expect(totalHeight).assertEqual(120);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0138 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0139
     * @tc.name      expandWrap0139
     * @tc.desc      行高 1.5 倍字号 48 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0139 begin');
      const fontSize: number = 48;
      const multiplier: number = 1.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(72);
      expect(totalHeight).assertEqual(144);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0139 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0140
     * @tc.name      expandWrap0140
     * @tc.desc      行高 1.5 倍字号 56 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0140 begin');
      const fontSize: number = 56;
      const multiplier: number = 1.5;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(84);
      expect(totalHeight).assertEqual(168);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0140 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0141
     * @tc.name      expandWrap0141
     * @tc.desc      行高 1.5 倍字号 10 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0141 begin');
      const fontSize: number = 10;
      const multiplier: number = 1.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(15);
      expect(totalHeight).assertEqual(45);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0141 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0142
     * @tc.name      expandWrap0142
     * @tc.desc      行高 1.5 倍字号 12 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0142 begin');
      const fontSize: number = 12;
      const multiplier: number = 1.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(18);
      expect(totalHeight).assertEqual(54);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0142 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0143
     * @tc.name      expandWrap0143
     * @tc.desc      行高 1.5 倍字号 16 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0143 begin');
      const fontSize: number = 16;
      const multiplier: number = 1.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(72);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0143 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0144
     * @tc.name      expandWrap0144
     * @tc.desc      行高 1.5 倍字号 20 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0144 begin');
      const fontSize: number = 20;
      const multiplier: number = 1.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(30);
      expect(totalHeight).assertEqual(90);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0144 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0145
     * @tc.name      expandWrap0145
     * @tc.desc      行高 1.5 倍字号 24 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0145 begin');
      const fontSize: number = 24;
      const multiplier: number = 1.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(36);
      expect(totalHeight).assertEqual(108);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0145 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0146
     * @tc.name      expandWrap0146
     * @tc.desc      行高 1.5 倍字号 28 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0146 begin');
      const fontSize: number = 28;
      const multiplier: number = 1.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(42);
      expect(totalHeight).assertEqual(126);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0146 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0147
     * @tc.name      expandWrap0147
     * @tc.desc      行高 1.5 倍字号 32 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0147 begin');
      const fontSize: number = 32;
      const multiplier: number = 1.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(144);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0147 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0148
     * @tc.name      expandWrap0148
     * @tc.desc      行高 1.5 倍字号 40 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0148 begin');
      const fontSize: number = 40;
      const multiplier: number = 1.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(60);
      expect(totalHeight).assertEqual(180);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0148 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0149
     * @tc.name      expandWrap0149
     * @tc.desc      行高 1.5 倍字号 48 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0149 begin');
      const fontSize: number = 48;
      const multiplier: number = 1.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(72);
      expect(totalHeight).assertEqual(216);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0149 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0150
     * @tc.name      expandWrap0150
     * @tc.desc      行高 1.5 倍字号 56 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0150 begin');
      const fontSize: number = 56;
      const multiplier: number = 1.5;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(84);
      expect(totalHeight).assertEqual(252);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0150 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0151
     * @tc.name      expandWrap0151
     * @tc.desc      行高 1.5 倍字号 10 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0151 begin');
      const fontSize: number = 10;
      const multiplier: number = 1.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(15);
      expect(totalHeight).assertEqual(60);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0151 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0152
     * @tc.name      expandWrap0152
     * @tc.desc      行高 1.5 倍字号 12 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0152 begin');
      const fontSize: number = 12;
      const multiplier: number = 1.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(18);
      expect(totalHeight).assertEqual(72);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0152 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0153
     * @tc.name      expandWrap0153
     * @tc.desc      行高 1.5 倍字号 16 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0153 begin');
      const fontSize: number = 16;
      const multiplier: number = 1.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(96);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0153 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0154
     * @tc.name      expandWrap0154
     * @tc.desc      行高 1.5 倍字号 20 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0154 begin');
      const fontSize: number = 20;
      const multiplier: number = 1.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(30);
      expect(totalHeight).assertEqual(120);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0154 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0155
     * @tc.name      expandWrap0155
     * @tc.desc      行高 1.5 倍字号 24 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0155 begin');
      const fontSize: number = 24;
      const multiplier: number = 1.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(36);
      expect(totalHeight).assertEqual(144);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0155 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0156
     * @tc.name      expandWrap0156
     * @tc.desc      行高 1.5 倍字号 28 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0156 begin');
      const fontSize: number = 28;
      const multiplier: number = 1.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(42);
      expect(totalHeight).assertEqual(168);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0156 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0157
     * @tc.name      expandWrap0157
     * @tc.desc      行高 1.5 倍字号 32 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0157 begin');
      const fontSize: number = 32;
      const multiplier: number = 1.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(192);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0157 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0158
     * @tc.name      expandWrap0158
     * @tc.desc      行高 1.5 倍字号 40 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0158 begin');
      const fontSize: number = 40;
      const multiplier: number = 1.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(60);
      expect(totalHeight).assertEqual(240);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0158 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0159
     * @tc.name      expandWrap0159
     * @tc.desc      行高 1.5 倍字号 48 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0159 begin');
      const fontSize: number = 48;
      const multiplier: number = 1.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(72);
      expect(totalHeight).assertEqual(288);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0159 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0160
     * @tc.name      expandWrap0160
     * @tc.desc      行高 1.5 倍字号 56 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0160 begin');
      const fontSize: number = 56;
      const multiplier: number = 1.5;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(84);
      expect(totalHeight).assertEqual(336);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0160 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0161
     * @tc.name      expandWrap0161
     * @tc.desc      行高 1.5 倍字号 10 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0161 begin');
      const fontSize: number = 10;
      const multiplier: number = 1.5;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(15);
      expect(totalHeight).assertEqual(75);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0161 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0162
     * @tc.name      expandWrap0162
     * @tc.desc      行高 1.5 倍字号 12 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0162 begin');
      const fontSize: number = 12;
      const multiplier: number = 1.5;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(18);
      expect(totalHeight).assertEqual(90);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0162 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0163
     * @tc.name      expandWrap0163
     * @tc.desc      行高 1.5 倍字号 16 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0163 begin');
      const fontSize: number = 16;
      const multiplier: number = 1.5;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(120);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0163 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0164
     * @tc.name      expandWrap0164
     * @tc.desc      行高 1.5 倍字号 20 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0164 begin');
      const fontSize: number = 20;
      const multiplier: number = 1.5;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(30);
      expect(totalHeight).assertEqual(150);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0164 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0165
     * @tc.name      expandWrap0165
     * @tc.desc      行高 1.5 倍字号 24 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0165 begin');
      const fontSize: number = 24;
      const multiplier: number = 1.5;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(36);
      expect(totalHeight).assertEqual(180);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0165 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0166
     * @tc.name      expandWrap0166
     * @tc.desc      行高 1.5 倍字号 28 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0166 begin');
      const fontSize: number = 28;
      const multiplier: number = 1.5;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(42);
      expect(totalHeight).assertEqual(210);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0166 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0167
     * @tc.name      expandWrap0167
     * @tc.desc      行高 1.5 倍字号 32 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0167 begin');
      const fontSize: number = 32;
      const multiplier: number = 1.5;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(240);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0167 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0168
     * @tc.name      expandWrap0168
     * @tc.desc      行高 1.5 倍字号 40 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0168 begin');
      const fontSize: number = 40;
      const multiplier: number = 1.5;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(60);
      expect(totalHeight).assertEqual(300);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0168 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0169
     * @tc.name      expandWrap0169
     * @tc.desc      行高 1.5 倍字号 48 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0169 begin');
      const fontSize: number = 48;
      const multiplier: number = 1.5;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(72);
      expect(totalHeight).assertEqual(360);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0169 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0170
     * @tc.name      expandWrap0170
     * @tc.desc      行高 1.5 倍字号 56 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0170 begin');
      const fontSize: number = 56;
      const multiplier: number = 1.5;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(84);
      expect(totalHeight).assertEqual(420);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0170 end');
    })
  })
}
