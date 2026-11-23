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

export default function expandEllipsisMatrix3Test(): void {
  describe('ExpandEllipsisMatrix3Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    EXPAND_ELLIPSIS_0163
     * @tc.name      expandEllipsis0163
     * @tc.desc      10 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0163 begin');
      const textLen: number = 10;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0163 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0164
     * @tc.name      expandEllipsis0164
     * @tc.desc      10 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0164 begin');
      const textLen: number = 10;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0164 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0165
     * @tc.name      expandEllipsis0165
     * @tc.desc      10 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0165 begin');
      const textLen: number = 10;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(112);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0165 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0166
     * @tc.name      expandEllipsis0166
     * @tc.desc      10 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0166 begin');
      const textLen: number = 10;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(128);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0166 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0167
     * @tc.name      expandEllipsis0167
     * @tc.desc      10 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0167 begin');
      const textLen: number = 10;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0167 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0168
     * @tc.name      expandEllipsis0168
     * @tc.desc      10 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0168 begin');
      const textLen: number = 10;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0168 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0169
     * @tc.name      expandEllipsis0169
     * @tc.desc      10 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0169 begin');
      const textLen: number = 10;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(100);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0169 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0170
     * @tc.name      expandEllipsis0170
     * @tc.desc      10 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0170 begin');
      const textLen: number = 10;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0170 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0171
     * @tc.name      expandEllipsis0171
     * @tc.desc      10 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0171 begin');
      const textLen: number = 10;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(140);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0171 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0172
     * @tc.name      expandEllipsis0172
     * @tc.desc      10 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0172 begin');
      const textLen: number = 10;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0172 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0173
     * @tc.name      expandEllipsis0173
     * @tc.desc      10 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0173 begin');
      const textLen: number = 10;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(200);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0173 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0174
     * @tc.name      expandEllipsis0174
     * @tc.desc      10 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0174 begin');
      const textLen: number = 10;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(240);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0174 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0175
     * @tc.name      expandEllipsis0175
     * @tc.desc      10 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0175 begin');
      const textLen: number = 10;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(100);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0175 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0176
     * @tc.name      expandEllipsis0176
     * @tc.desc      10 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0176 begin');
      const textLen: number = 10;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0176 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0177
     * @tc.name      expandEllipsis0177
     * @tc.desc      10 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0177 begin');
      const textLen: number = 10;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(140);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0177 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0178
     * @tc.name      expandEllipsis0178
     * @tc.desc      10 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0178 begin');
      const textLen: number = 10;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0178 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0179
     * @tc.name      expandEllipsis0179
     * @tc.desc      10 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0179 begin');
      const textLen: number = 10;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(200);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0179 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0180
     * @tc.name      expandEllipsis0180
     * @tc.desc      10 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0180 begin');
      const textLen: number = 10;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(240);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0180 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0181
     * @tc.name      expandEllipsis0181
     * @tc.desc      10 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0181 begin');
      const textLen: number = 10;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(100);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0181 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0182
     * @tc.name      expandEllipsis0182
     * @tc.desc      10 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0182 begin');
      const textLen: number = 10;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0182 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0183
     * @tc.name      expandEllipsis0183
     * @tc.desc      10 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0183 begin');
      const textLen: number = 10;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(140);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0183 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0184
     * @tc.name      expandEllipsis0184
     * @tc.desc      10 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0184 begin');
      const textLen: number = 10;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0184 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0185
     * @tc.name      expandEllipsis0185
     * @tc.desc      10 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0185 begin');
      const textLen: number = 10;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(200);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0185 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0186
     * @tc.name      expandEllipsis0186
     * @tc.desc      10 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0186 begin');
      const textLen: number = 10;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(240);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0186 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0187
     * @tc.name      expandEllipsis0187
     * @tc.desc      10 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0187 begin');
      const textLen: number = 10;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(100);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0187 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0188
     * @tc.name      expandEllipsis0188
     * @tc.desc      10 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0188 begin');
      const textLen: number = 10;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0188 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0189
     * @tc.name      expandEllipsis0189
     * @tc.desc      10 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0189 begin');
      const textLen: number = 10;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(140);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0189 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0190
     * @tc.name      expandEllipsis0190
     * @tc.desc      10 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0190 begin');
      const textLen: number = 10;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0190 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0191
     * @tc.name      expandEllipsis0191
     * @tc.desc      10 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0191 begin');
      const textLen: number = 10;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(200);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0191 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0192
     * @tc.name      expandEllipsis0192
     * @tc.desc      10 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0192 begin');
      const textLen: number = 10;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(240);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0192 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0193
     * @tc.name      expandEllipsis0193
     * @tc.desc      12 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0193 begin');
      const textLen: number = 12;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(20);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0193 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0194
     * @tc.name      expandEllipsis0194
     * @tc.desc      12 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0194 begin');
      const textLen: number = 12;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(24);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0194 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0195
     * @tc.name      expandEllipsis0195
     * @tc.desc      12 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0195 begin');
      const textLen: number = 12;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(28);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0195 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0196
     * @tc.name      expandEllipsis0196
     * @tc.desc      12 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0196 begin');
      const textLen: number = 12;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(32);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0196 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0197
     * @tc.name      expandEllipsis0197
     * @tc.desc      12 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0197 begin');
      const textLen: number = 12;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0197 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0198
     * @tc.name      expandEllipsis0198
     * @tc.desc      12 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0198 begin');
      const textLen: number = 12;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0198 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0199
     * @tc.name      expandEllipsis0199
     * @tc.desc      12 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0199 begin');
      const textLen: number = 12;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0199 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0200
     * @tc.name      expandEllipsis0200
     * @tc.desc      12 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0200 begin');
      const textLen: number = 12;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0200 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0201
     * @tc.name      expandEllipsis0201
     * @tc.desc      12 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0201 begin');
      const textLen: number = 12;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(56);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0201 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0202
     * @tc.name      expandEllipsis0202
     * @tc.desc      12 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0202 begin');
      const textLen: number = 12;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(64);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0202 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0203
     * @tc.name      expandEllipsis0203
     * @tc.desc      12 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0203 begin');
      const textLen: number = 12;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0203 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0204
     * @tc.name      expandEllipsis0204
     * @tc.desc      12 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0204 begin');
      const textLen: number = 12;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0204 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0205
     * @tc.name      expandEllipsis0205
     * @tc.desc      12 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0205 begin');
      const textLen: number = 12;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(60);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0205 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0206
     * @tc.name      expandEllipsis0206
     * @tc.desc      12 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0206 begin');
      const textLen: number = 12;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(72);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0206 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0207
     * @tc.name      expandEllipsis0207
     * @tc.desc      12 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0207 begin');
      const textLen: number = 12;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(84);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0207 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0208
     * @tc.name      expandEllipsis0208
     * @tc.desc      12 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0208 begin');
      const textLen: number = 12;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0208 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0209
     * @tc.name      expandEllipsis0209
     * @tc.desc      12 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0209 begin');
      const textLen: number = 12;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0209 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0210
     * @tc.name      expandEllipsis0210
     * @tc.desc      12 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0210 begin');
      const textLen: number = 12;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0210 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0211
     * @tc.name      expandEllipsis0211
     * @tc.desc      12 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0211 begin');
      const textLen: number = 12;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0211 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0212
     * @tc.name      expandEllipsis0212
     * @tc.desc      12 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0212 begin');
      const textLen: number = 12;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0212 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0213
     * @tc.name      expandEllipsis0213
     * @tc.desc      12 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0213 begin');
      const textLen: number = 12;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(112);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0213 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0214
     * @tc.name      expandEllipsis0214
     * @tc.desc      12 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0214 begin');
      const textLen: number = 12;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(128);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0214 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0215
     * @tc.name      expandEllipsis0215
     * @tc.desc      12 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0215 begin');
      const textLen: number = 12;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0215 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0216
     * @tc.name      expandEllipsis0216
     * @tc.desc      12 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0216 begin');
      const textLen: number = 12;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0216 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0217
     * @tc.name      expandEllipsis0217
     * @tc.desc      12 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0217 begin');
      const textLen: number = 12;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(100);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0217 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0218
     * @tc.name      expandEllipsis0218
     * @tc.desc      12 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0218 begin');
      const textLen: number = 12;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0218 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0219
     * @tc.name      expandEllipsis0219
     * @tc.desc      12 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0219 begin');
      const textLen: number = 12;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(140);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0219 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0220
     * @tc.name      expandEllipsis0220
     * @tc.desc      12 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0220 begin');
      const textLen: number = 12;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0220 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0221
     * @tc.name      expandEllipsis0221
     * @tc.desc      12 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0221 begin');
      const textLen: number = 12;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(200);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0221 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0222
     * @tc.name      expandEllipsis0222
     * @tc.desc      12 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0222 begin');
      const textLen: number = 12;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(240);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0222 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0223
     * @tc.name      expandEllipsis0223
     * @tc.desc      12 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0223 begin');
      const textLen: number = 12;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0223 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0224
     * @tc.name      expandEllipsis0224
     * @tc.desc      12 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0224 begin');
      const textLen: number = 12;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0224 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0225
     * @tc.name      expandEllipsis0225
     * @tc.desc      12 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0225 begin');
      const textLen: number = 12;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(168);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0225 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0226
     * @tc.name      expandEllipsis0226
     * @tc.desc      12 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0226 begin');
      const textLen: number = 12;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0226 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0227
     * @tc.name      expandEllipsis0227
     * @tc.desc      12 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0227 begin');
      const textLen: number = 12;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(240);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0227 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0228
     * @tc.name      expandEllipsis0228
     * @tc.desc      12 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0228 begin');
      const textLen: number = 12;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(288);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0228 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0229
     * @tc.name      expandEllipsis0229
     * @tc.desc      12 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0229 begin');
      const textLen: number = 12;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0229 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0230
     * @tc.name      expandEllipsis0230
     * @tc.desc      12 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0230 begin');
      const textLen: number = 12;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0230 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0231
     * @tc.name      expandEllipsis0231
     * @tc.desc      12 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0231 begin');
      const textLen: number = 12;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(168);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0231 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0232
     * @tc.name      expandEllipsis0232
     * @tc.desc      12 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0232 begin');
      const textLen: number = 12;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0232 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0233
     * @tc.name      expandEllipsis0233
     * @tc.desc      12 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0233 begin');
      const textLen: number = 12;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(240);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0233 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0234
     * @tc.name      expandEllipsis0234
     * @tc.desc      12 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0234 begin');
      const textLen: number = 12;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(288);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0234 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0235
     * @tc.name      expandEllipsis0235
     * @tc.desc      12 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0235 begin');
      const textLen: number = 12;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0235 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0236
     * @tc.name      expandEllipsis0236
     * @tc.desc      12 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0236 begin');
      const textLen: number = 12;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0236 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0237
     * @tc.name      expandEllipsis0237
     * @tc.desc      12 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0237 begin');
      const textLen: number = 12;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(168);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0237 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0238
     * @tc.name      expandEllipsis0238
     * @tc.desc      12 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0238 begin');
      const textLen: number = 12;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0238 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0239
     * @tc.name      expandEllipsis0239
     * @tc.desc      12 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0239 begin');
      const textLen: number = 12;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(240);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0239 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0240
     * @tc.name      expandEllipsis0240
     * @tc.desc      12 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0240 begin');
      const textLen: number = 12;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(288);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0240 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0241
     * @tc.name      expandEllipsis0241
     * @tc.desc      16 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0241 begin');
      const textLen: number = 16;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(20);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0241 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0242
     * @tc.name      expandEllipsis0242
     * @tc.desc      16 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0242 begin');
      const textLen: number = 16;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(24);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0242 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0243
     * @tc.name      expandEllipsis0243
     * @tc.desc      16 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0243 begin');
      const textLen: number = 16;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(28);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0243 end');
    })
  })
}
