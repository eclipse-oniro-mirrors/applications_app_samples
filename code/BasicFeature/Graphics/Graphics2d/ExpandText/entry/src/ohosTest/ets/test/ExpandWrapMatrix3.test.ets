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

export default function expandWrapMatrix3Test(): void {
  describe('ExpandWrapMatrix3Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    EXPAND_WRAP_0171
     * @tc.name      expandWrap0171
     * @tc.desc      行高 1.5 倍字号 10 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0171 begin');
      const fontSize: number = 10;
      const multiplier: number = 1.5;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(15);
      expect(totalHeight).assertEqual(90);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0171 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0172
     * @tc.name      expandWrap0172
     * @tc.desc      行高 1.5 倍字号 12 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0172 begin');
      const fontSize: number = 12;
      const multiplier: number = 1.5;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(18);
      expect(totalHeight).assertEqual(108);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0172 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0173
     * @tc.name      expandWrap0173
     * @tc.desc      行高 1.5 倍字号 16 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0173 begin');
      const fontSize: number = 16;
      const multiplier: number = 1.5;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(144);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0173 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0174
     * @tc.name      expandWrap0174
     * @tc.desc      行高 1.5 倍字号 20 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0174 begin');
      const fontSize: number = 20;
      const multiplier: number = 1.5;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(30);
      expect(totalHeight).assertEqual(180);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0174 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0175
     * @tc.name      expandWrap0175
     * @tc.desc      行高 1.5 倍字号 24 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0175 begin');
      const fontSize: number = 24;
      const multiplier: number = 1.5;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(36);
      expect(totalHeight).assertEqual(216);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0175 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0176
     * @tc.name      expandWrap0176
     * @tc.desc      行高 1.5 倍字号 28 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0176 begin');
      const fontSize: number = 28;
      const multiplier: number = 1.5;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(42);
      expect(totalHeight).assertEqual(252);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0176 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0177
     * @tc.name      expandWrap0177
     * @tc.desc      行高 1.5 倍字号 32 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0177 begin');
      const fontSize: number = 32;
      const multiplier: number = 1.5;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(288);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0177 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0178
     * @tc.name      expandWrap0178
     * @tc.desc      行高 1.5 倍字号 40 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0178 begin');
      const fontSize: number = 40;
      const multiplier: number = 1.5;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(60);
      expect(totalHeight).assertEqual(360);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0178 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0179
     * @tc.name      expandWrap0179
     * @tc.desc      行高 1.5 倍字号 48 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0179 begin');
      const fontSize: number = 48;
      const multiplier: number = 1.5;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(72);
      expect(totalHeight).assertEqual(432);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0179 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0180
     * @tc.name      expandWrap0180
     * @tc.desc      行高 1.5 倍字号 56 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0180 begin');
      const fontSize: number = 56;
      const multiplier: number = 1.5;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(84);
      expect(totalHeight).assertEqual(504);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0180 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0181
     * @tc.name      expandWrap0181
     * @tc.desc      行高 1.8 倍字号 10 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0181 begin');
      const fontSize: number = 10;
      const multiplier: number = 1.8;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(18);
      expect(totalHeight).assertEqual(18);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0181 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0182
     * @tc.name      expandWrap0182
     * @tc.desc      行高 1.8 倍字号 12 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0182 begin');
      const fontSize: number = 12;
      const multiplier: number = 1.8;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(22);
      expect(totalHeight).assertEqual(22);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0182 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0183
     * @tc.name      expandWrap0183
     * @tc.desc      行高 1.8 倍字号 16 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0183 begin');
      const fontSize: number = 16;
      const multiplier: number = 1.8;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(29);
      expect(totalHeight).assertEqual(29);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0183 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0184
     * @tc.name      expandWrap0184
     * @tc.desc      行高 1.8 倍字号 20 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0184 begin');
      const fontSize: number = 20;
      const multiplier: number = 1.8;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(36);
      expect(totalHeight).assertEqual(36);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0184 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0185
     * @tc.name      expandWrap0185
     * @tc.desc      行高 1.8 倍字号 24 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0185 begin');
      const fontSize: number = 24;
      const multiplier: number = 1.8;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(43);
      expect(totalHeight).assertEqual(43);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0185 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0186
     * @tc.name      expandWrap0186
     * @tc.desc      行高 1.8 倍字号 28 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0186 begin');
      const fontSize: number = 28;
      const multiplier: number = 1.8;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(50);
      expect(totalHeight).assertEqual(50);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0186 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0187
     * @tc.name      expandWrap0187
     * @tc.desc      行高 1.8 倍字号 32 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0187 begin');
      const fontSize: number = 32;
      const multiplier: number = 1.8;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(58);
      expect(totalHeight).assertEqual(58);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0187 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0188
     * @tc.name      expandWrap0188
     * @tc.desc      行高 1.8 倍字号 40 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0188 begin');
      const fontSize: number = 40;
      const multiplier: number = 1.8;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(72);
      expect(totalHeight).assertEqual(72);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0188 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0189
     * @tc.name      expandWrap0189
     * @tc.desc      行高 1.8 倍字号 48 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0189 begin');
      const fontSize: number = 48;
      const multiplier: number = 1.8;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(86);
      expect(totalHeight).assertEqual(86);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0189 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0190
     * @tc.name      expandWrap0190
     * @tc.desc      行高 1.8 倍字号 56 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0190 begin');
      const fontSize: number = 56;
      const multiplier: number = 1.8;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(101);
      expect(totalHeight).assertEqual(101);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0190 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0191
     * @tc.name      expandWrap0191
     * @tc.desc      行高 1.8 倍字号 10 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0191 begin');
      const fontSize: number = 10;
      const multiplier: number = 1.8;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(18);
      expect(totalHeight).assertEqual(36);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0191 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0192
     * @tc.name      expandWrap0192
     * @tc.desc      行高 1.8 倍字号 12 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0192 begin');
      const fontSize: number = 12;
      const multiplier: number = 1.8;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(22);
      expect(totalHeight).assertEqual(44);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0192 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0193
     * @tc.name      expandWrap0193
     * @tc.desc      行高 1.8 倍字号 16 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0193 begin');
      const fontSize: number = 16;
      const multiplier: number = 1.8;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(29);
      expect(totalHeight).assertEqual(58);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0193 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0194
     * @tc.name      expandWrap0194
     * @tc.desc      行高 1.8 倍字号 20 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0194 begin');
      const fontSize: number = 20;
      const multiplier: number = 1.8;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(36);
      expect(totalHeight).assertEqual(72);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0194 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0195
     * @tc.name      expandWrap0195
     * @tc.desc      行高 1.8 倍字号 24 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0195 begin');
      const fontSize: number = 24;
      const multiplier: number = 1.8;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(43);
      expect(totalHeight).assertEqual(86);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0195 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0196
     * @tc.name      expandWrap0196
     * @tc.desc      行高 1.8 倍字号 28 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0196 begin');
      const fontSize: number = 28;
      const multiplier: number = 1.8;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(50);
      expect(totalHeight).assertEqual(100);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0196 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0197
     * @tc.name      expandWrap0197
     * @tc.desc      行高 1.8 倍字号 32 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0197 begin');
      const fontSize: number = 32;
      const multiplier: number = 1.8;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(58);
      expect(totalHeight).assertEqual(116);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0197 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0198
     * @tc.name      expandWrap0198
     * @tc.desc      行高 1.8 倍字号 40 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0198 begin');
      const fontSize: number = 40;
      const multiplier: number = 1.8;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(72);
      expect(totalHeight).assertEqual(144);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0198 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0199
     * @tc.name      expandWrap0199
     * @tc.desc      行高 1.8 倍字号 48 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0199 begin');
      const fontSize: number = 48;
      const multiplier: number = 1.8;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(86);
      expect(totalHeight).assertEqual(172);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0199 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0200
     * @tc.name      expandWrap0200
     * @tc.desc      行高 1.8 倍字号 56 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0200 begin');
      const fontSize: number = 56;
      const multiplier: number = 1.8;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(101);
      expect(totalHeight).assertEqual(202);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0200 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0201
     * @tc.name      expandWrap0201
     * @tc.desc      行高 1.8 倍字号 10 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0201 begin');
      const fontSize: number = 10;
      const multiplier: number = 1.8;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(18);
      expect(totalHeight).assertEqual(54);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0201 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0202
     * @tc.name      expandWrap0202
     * @tc.desc      行高 1.8 倍字号 12 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0202 begin');
      const fontSize: number = 12;
      const multiplier: number = 1.8;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(22);
      expect(totalHeight).assertEqual(66);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0202 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0203
     * @tc.name      expandWrap0203
     * @tc.desc      行高 1.8 倍字号 16 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0203 begin');
      const fontSize: number = 16;
      const multiplier: number = 1.8;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(29);
      expect(totalHeight).assertEqual(87);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0203 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0204
     * @tc.name      expandWrap0204
     * @tc.desc      行高 1.8 倍字号 20 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0204 begin');
      const fontSize: number = 20;
      const multiplier: number = 1.8;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(36);
      expect(totalHeight).assertEqual(108);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0204 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0205
     * @tc.name      expandWrap0205
     * @tc.desc      行高 1.8 倍字号 24 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0205 begin');
      const fontSize: number = 24;
      const multiplier: number = 1.8;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(43);
      expect(totalHeight).assertEqual(129);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0205 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0206
     * @tc.name      expandWrap0206
     * @tc.desc      行高 1.8 倍字号 28 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0206 begin');
      const fontSize: number = 28;
      const multiplier: number = 1.8;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(50);
      expect(totalHeight).assertEqual(150);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0206 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0207
     * @tc.name      expandWrap0207
     * @tc.desc      行高 1.8 倍字号 32 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0207 begin');
      const fontSize: number = 32;
      const multiplier: number = 1.8;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(58);
      expect(totalHeight).assertEqual(174);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0207 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0208
     * @tc.name      expandWrap0208
     * @tc.desc      行高 1.8 倍字号 40 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0208 begin');
      const fontSize: number = 40;
      const multiplier: number = 1.8;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(72);
      expect(totalHeight).assertEqual(216);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0208 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0209
     * @tc.name      expandWrap0209
     * @tc.desc      行高 1.8 倍字号 48 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0209 begin');
      const fontSize: number = 48;
      const multiplier: number = 1.8;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(86);
      expect(totalHeight).assertEqual(258);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0209 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0210
     * @tc.name      expandWrap0210
     * @tc.desc      行高 1.8 倍字号 56 最多 3 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0210 begin');
      const fontSize: number = 56;
      const multiplier: number = 1.8;
      const maxLines: number = 3;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(101);
      expect(totalHeight).assertEqual(303);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0210 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0211
     * @tc.name      expandWrap0211
     * @tc.desc      行高 1.8 倍字号 10 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0211 begin');
      const fontSize: number = 10;
      const multiplier: number = 1.8;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(18);
      expect(totalHeight).assertEqual(72);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0211 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0212
     * @tc.name      expandWrap0212
     * @tc.desc      行高 1.8 倍字号 12 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0212 begin');
      const fontSize: number = 12;
      const multiplier: number = 1.8;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(22);
      expect(totalHeight).assertEqual(88);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0212 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0213
     * @tc.name      expandWrap0213
     * @tc.desc      行高 1.8 倍字号 16 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0213 begin');
      const fontSize: number = 16;
      const multiplier: number = 1.8;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(29);
      expect(totalHeight).assertEqual(116);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0213 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0214
     * @tc.name      expandWrap0214
     * @tc.desc      行高 1.8 倍字号 20 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0214 begin');
      const fontSize: number = 20;
      const multiplier: number = 1.8;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(36);
      expect(totalHeight).assertEqual(144);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0214 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0215
     * @tc.name      expandWrap0215
     * @tc.desc      行高 1.8 倍字号 24 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0215 begin');
      const fontSize: number = 24;
      const multiplier: number = 1.8;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(43);
      expect(totalHeight).assertEqual(172);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0215 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0216
     * @tc.name      expandWrap0216
     * @tc.desc      行高 1.8 倍字号 28 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0216 begin');
      const fontSize: number = 28;
      const multiplier: number = 1.8;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(50);
      expect(totalHeight).assertEqual(200);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0216 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0217
     * @tc.name      expandWrap0217
     * @tc.desc      行高 1.8 倍字号 32 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0217 begin');
      const fontSize: number = 32;
      const multiplier: number = 1.8;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(58);
      expect(totalHeight).assertEqual(232);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0217 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0218
     * @tc.name      expandWrap0218
     * @tc.desc      行高 1.8 倍字号 40 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0218 begin');
      const fontSize: number = 40;
      const multiplier: number = 1.8;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(72);
      expect(totalHeight).assertEqual(288);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0218 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0219
     * @tc.name      expandWrap0219
     * @tc.desc      行高 1.8 倍字号 48 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0219 begin');
      const fontSize: number = 48;
      const multiplier: number = 1.8;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(86);
      expect(totalHeight).assertEqual(344);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0219 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0220
     * @tc.name      expandWrap0220
     * @tc.desc      行高 1.8 倍字号 56 最多 4 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0220 begin');
      const fontSize: number = 56;
      const multiplier: number = 1.8;
      const maxLines: number = 4;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(101);
      expect(totalHeight).assertEqual(404);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0220 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0221
     * @tc.name      expandWrap0221
     * @tc.desc      行高 1.8 倍字号 10 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0221 begin');
      const fontSize: number = 10;
      const multiplier: number = 1.8;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(18);
      expect(totalHeight).assertEqual(90);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0221 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0222
     * @tc.name      expandWrap0222
     * @tc.desc      行高 1.8 倍字号 12 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0222 begin');
      const fontSize: number = 12;
      const multiplier: number = 1.8;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(22);
      expect(totalHeight).assertEqual(110);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0222 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0223
     * @tc.name      expandWrap0223
     * @tc.desc      行高 1.8 倍字号 16 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0223 begin');
      const fontSize: number = 16;
      const multiplier: number = 1.8;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(29);
      expect(totalHeight).assertEqual(145);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0223 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0224
     * @tc.name      expandWrap0224
     * @tc.desc      行高 1.8 倍字号 20 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0224 begin');
      const fontSize: number = 20;
      const multiplier: number = 1.8;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(36);
      expect(totalHeight).assertEqual(180);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0224 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0225
     * @tc.name      expandWrap0225
     * @tc.desc      行高 1.8 倍字号 24 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0225 begin');
      const fontSize: number = 24;
      const multiplier: number = 1.8;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(43);
      expect(totalHeight).assertEqual(215);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0225 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0226
     * @tc.name      expandWrap0226
     * @tc.desc      行高 1.8 倍字号 28 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0226 begin');
      const fontSize: number = 28;
      const multiplier: number = 1.8;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(50);
      expect(totalHeight).assertEqual(250);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0226 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0227
     * @tc.name      expandWrap0227
     * @tc.desc      行高 1.8 倍字号 32 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0227 begin');
      const fontSize: number = 32;
      const multiplier: number = 1.8;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(58);
      expect(totalHeight).assertEqual(290);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0227 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0228
     * @tc.name      expandWrap0228
     * @tc.desc      行高 1.8 倍字号 40 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0228 begin');
      const fontSize: number = 40;
      const multiplier: number = 1.8;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(72);
      expect(totalHeight).assertEqual(360);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0228 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0229
     * @tc.name      expandWrap0229
     * @tc.desc      行高 1.8 倍字号 48 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0229 begin');
      const fontSize: number = 48;
      const multiplier: number = 1.8;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(86);
      expect(totalHeight).assertEqual(430);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0229 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0230
     * @tc.name      expandWrap0230
     * @tc.desc      行高 1.8 倍字号 56 最多 5 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0230 begin');
      const fontSize: number = 56;
      const multiplier: number = 1.8;
      const maxLines: number = 5;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(101);
      expect(totalHeight).assertEqual(505);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0230 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0231
     * @tc.name      expandWrap0231
     * @tc.desc      行高 1.8 倍字号 10 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0231 begin');
      const fontSize: number = 10;
      const multiplier: number = 1.8;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(18);
      expect(totalHeight).assertEqual(108);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0231 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0232
     * @tc.name      expandWrap0232
     * @tc.desc      行高 1.8 倍字号 12 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0232 begin');
      const fontSize: number = 12;
      const multiplier: number = 1.8;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(22);
      expect(totalHeight).assertEqual(132);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0232 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0233
     * @tc.name      expandWrap0233
     * @tc.desc      行高 1.8 倍字号 16 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0233 begin');
      const fontSize: number = 16;
      const multiplier: number = 1.8;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(29);
      expect(totalHeight).assertEqual(174);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0233 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0234
     * @tc.name      expandWrap0234
     * @tc.desc      行高 1.8 倍字号 20 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0234 begin');
      const fontSize: number = 20;
      const multiplier: number = 1.8;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(36);
      expect(totalHeight).assertEqual(216);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0234 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0235
     * @tc.name      expandWrap0235
     * @tc.desc      行高 1.8 倍字号 24 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0235 begin');
      const fontSize: number = 24;
      const multiplier: number = 1.8;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(43);
      expect(totalHeight).assertEqual(258);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0235 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0236
     * @tc.name      expandWrap0236
     * @tc.desc      行高 1.8 倍字号 28 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0236 begin');
      const fontSize: number = 28;
      const multiplier: number = 1.8;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(50);
      expect(totalHeight).assertEqual(300);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0236 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0237
     * @tc.name      expandWrap0237
     * @tc.desc      行高 1.8 倍字号 32 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0237 begin');
      const fontSize: number = 32;
      const multiplier: number = 1.8;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(58);
      expect(totalHeight).assertEqual(348);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0237 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0238
     * @tc.name      expandWrap0238
     * @tc.desc      行高 1.8 倍字号 40 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0238 begin');
      const fontSize: number = 40;
      const multiplier: number = 1.8;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(72);
      expect(totalHeight).assertEqual(432);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0238 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0239
     * @tc.name      expandWrap0239
     * @tc.desc      行高 1.8 倍字号 48 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0239 begin');
      const fontSize: number = 48;
      const multiplier: number = 1.8;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(86);
      expect(totalHeight).assertEqual(516);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0239 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0240
     * @tc.name      expandWrap0240
     * @tc.desc      行高 1.8 倍字号 56 最多 6 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0240 begin');
      const fontSize: number = 56;
      const multiplier: number = 1.8;
      const maxLines: number = 6;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(101);
      expect(totalHeight).assertEqual(606);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0240 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0241
     * @tc.name      expandWrap0241
     * @tc.desc      行高 2 倍字号 10 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0241 begin');
      const fontSize: number = 10;
      const multiplier: number = 2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(20);
      expect(totalHeight).assertEqual(20);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0241 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0242
     * @tc.name      expandWrap0242
     * @tc.desc      行高 2 倍字号 12 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0242 begin');
      const fontSize: number = 12;
      const multiplier: number = 2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(24);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0242 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0243
     * @tc.name      expandWrap0243
     * @tc.desc      行高 2 倍字号 16 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0243 begin');
      const fontSize: number = 16;
      const multiplier: number = 2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(32);
      expect(totalHeight).assertEqual(32);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0243 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0244
     * @tc.name      expandWrap0244
     * @tc.desc      行高 2 倍字号 20 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0244 begin');
      const fontSize: number = 20;
      const multiplier: number = 2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(40);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0244 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0245
     * @tc.name      expandWrap0245
     * @tc.desc      行高 2 倍字号 24 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0245 begin');
      const fontSize: number = 24;
      const multiplier: number = 2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(48);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0245 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0246
     * @tc.name      expandWrap0246
     * @tc.desc      行高 2 倍字号 28 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0246 begin');
      const fontSize: number = 28;
      const multiplier: number = 2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(56);
      expect(totalHeight).assertEqual(56);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0246 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0247
     * @tc.name      expandWrap0247
     * @tc.desc      行高 2 倍字号 32 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0247 begin');
      const fontSize: number = 32;
      const multiplier: number = 2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(64);
      expect(totalHeight).assertEqual(64);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0247 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0248
     * @tc.name      expandWrap0248
     * @tc.desc      行高 2 倍字号 40 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0248 begin');
      const fontSize: number = 40;
      const multiplier: number = 2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(80);
      expect(totalHeight).assertEqual(80);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0248 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0249
     * @tc.name      expandWrap0249
     * @tc.desc      行高 2 倍字号 48 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0249 begin');
      const fontSize: number = 48;
      const multiplier: number = 2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(96);
      expect(totalHeight).assertEqual(96);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0249 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0250
     * @tc.name      expandWrap0250
     * @tc.desc      行高 2 倍字号 56 最多 1 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0250 begin');
      const fontSize: number = 56;
      const multiplier: number = 2;
      const maxLines: number = 1;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(112);
      expect(totalHeight).assertEqual(112);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0250 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0251
     * @tc.name      expandWrap0251
     * @tc.desc      行高 2 倍字号 10 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0251 begin');
      const fontSize: number = 10;
      const multiplier: number = 2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(20);
      expect(totalHeight).assertEqual(40);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0251 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0252
     * @tc.name      expandWrap0252
     * @tc.desc      行高 2 倍字号 12 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0252 begin');
      const fontSize: number = 12;
      const multiplier: number = 2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(24);
      expect(totalHeight).assertEqual(48);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0252 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0253
     * @tc.name      expandWrap0253
     * @tc.desc      行高 2 倍字号 16 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0253 begin');
      const fontSize: number = 16;
      const multiplier: number = 2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(32);
      expect(totalHeight).assertEqual(64);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0253 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0254
     * @tc.name      expandWrap0254
     * @tc.desc      行高 2 倍字号 20 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0254 begin');
      const fontSize: number = 20;
      const multiplier: number = 2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(40);
      expect(totalHeight).assertEqual(80);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0254 end');
    })

    /**
     * @tc.number    EXPAND_WRAP_0255
     * @tc.name      expandWrap0255
     * @tc.desc      行高 2 倍字号 24 最多 2 行的总高度推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandWrap0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0255 begin');
      const fontSize: number = 24;
      const multiplier: number = 2;
      const maxLines: number = 2;
      const lineHeight: number = Math.round(fontSize * multiplier);
      const totalHeight: number = lineHeight * maxLines;
      expect(lineHeight).assertEqual(48);
      expect(totalHeight).assertEqual(96);
      expect(lineHeight >= fontSize).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandWrap0255 end');
    })
  })
}
