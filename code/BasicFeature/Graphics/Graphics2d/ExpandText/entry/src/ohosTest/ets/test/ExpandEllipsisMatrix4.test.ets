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

export default function expandEllipsisMatrix4Test(): void {
  describe('ExpandEllipsisMatrix4Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    EXPAND_ELLIPSIS_0244
     * @tc.name      expandEllipsis0244
     * @tc.desc      16 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0244 begin');
      const textLen: number = 16;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(32);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0244 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0245
     * @tc.name      expandEllipsis0245
     * @tc.desc      16 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0245 begin');
      const textLen: number = 16;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0245 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0246
     * @tc.name      expandEllipsis0246
     * @tc.desc      16 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0246 begin');
      const textLen: number = 16;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0246 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0247
     * @tc.name      expandEllipsis0247
     * @tc.desc      16 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0247 begin');
      const textLen: number = 16;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0247 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0248
     * @tc.name      expandEllipsis0248
     * @tc.desc      16 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0248 begin');
      const textLen: number = 16;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0248 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0249
     * @tc.name      expandEllipsis0249
     * @tc.desc      16 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0249 begin');
      const textLen: number = 16;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(56);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0249 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0250
     * @tc.name      expandEllipsis0250
     * @tc.desc      16 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0250 begin');
      const textLen: number = 16;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(64);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0250 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0251
     * @tc.name      expandEllipsis0251
     * @tc.desc      16 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0251 begin');
      const textLen: number = 16;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0251 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0252
     * @tc.name      expandEllipsis0252
     * @tc.desc      16 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0252 begin');
      const textLen: number = 16;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0252 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0253
     * @tc.name      expandEllipsis0253
     * @tc.desc      16 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0253 begin');
      const textLen: number = 16;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(60);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0253 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0254
     * @tc.name      expandEllipsis0254
     * @tc.desc      16 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0254 begin');
      const textLen: number = 16;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(72);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0254 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0255
     * @tc.name      expandEllipsis0255
     * @tc.desc      16 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0255 begin');
      const textLen: number = 16;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(84);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0255 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0256
     * @tc.name      expandEllipsis0256
     * @tc.desc      16 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0256 begin');
      const textLen: number = 16;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0256 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0257
     * @tc.name      expandEllipsis0257
     * @tc.desc      16 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0257 begin');
      const textLen: number = 16;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0257 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0258
     * @tc.name      expandEllipsis0258
     * @tc.desc      16 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0258 begin');
      const textLen: number = 16;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0258 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0259
     * @tc.name      expandEllipsis0259
     * @tc.desc      16 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0259 begin');
      const textLen: number = 16;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0259 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0260
     * @tc.name      expandEllipsis0260
     * @tc.desc      16 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0260 begin');
      const textLen: number = 16;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0260 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0261
     * @tc.name      expandEllipsis0261
     * @tc.desc      16 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0261 begin');
      const textLen: number = 16;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(112);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0261 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0262
     * @tc.name      expandEllipsis0262
     * @tc.desc      16 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0262 begin');
      const textLen: number = 16;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(128);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0262 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0263
     * @tc.name      expandEllipsis0263
     * @tc.desc      16 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0263 begin');
      const textLen: number = 16;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0263 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0264
     * @tc.name      expandEllipsis0264
     * @tc.desc      16 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0264 begin');
      const textLen: number = 16;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0264 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0265
     * @tc.name      expandEllipsis0265
     * @tc.desc      16 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0265 begin');
      const textLen: number = 16;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(100);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0265 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0266
     * @tc.name      expandEllipsis0266
     * @tc.desc      16 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0266 begin');
      const textLen: number = 16;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0266 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0267
     * @tc.name      expandEllipsis0267
     * @tc.desc      16 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0267 begin');
      const textLen: number = 16;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(140);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0267 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0268
     * @tc.name      expandEllipsis0268
     * @tc.desc      16 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0268 begin');
      const textLen: number = 16;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0268 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0269
     * @tc.name      expandEllipsis0269
     * @tc.desc      16 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0269 begin');
      const textLen: number = 16;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(200);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0269 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0270
     * @tc.name      expandEllipsis0270
     * @tc.desc      16 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0270 begin');
      const textLen: number = 16;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(240);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0270 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0271
     * @tc.name      expandEllipsis0271
     * @tc.desc      16 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0271 begin');
      const textLen: number = 16;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0271 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0272
     * @tc.name      expandEllipsis0272
     * @tc.desc      16 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0272 begin');
      const textLen: number = 16;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0272 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0273
     * @tc.name      expandEllipsis0273
     * @tc.desc      16 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0273 begin');
      const textLen: number = 16;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(168);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0273 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0274
     * @tc.name      expandEllipsis0274
     * @tc.desc      16 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0274 begin');
      const textLen: number = 16;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0274 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0275
     * @tc.name      expandEllipsis0275
     * @tc.desc      16 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0275 begin');
      const textLen: number = 16;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(240);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0275 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0276
     * @tc.name      expandEllipsis0276
     * @tc.desc      16 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0276 begin');
      const textLen: number = 16;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(288);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0276 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0277
     * @tc.name      expandEllipsis0277
     * @tc.desc      16 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0277 begin');
      const textLen: number = 16;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0277 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0278
     * @tc.name      expandEllipsis0278
     * @tc.desc      16 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0278 begin');
      const textLen: number = 16;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0278 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0279
     * @tc.name      expandEllipsis0279
     * @tc.desc      16 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0279 begin');
      const textLen: number = 16;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(224);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0279 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0280
     * @tc.name      expandEllipsis0280
     * @tc.desc      16 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0280 begin');
      const textLen: number = 16;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(256);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0280 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0281
     * @tc.name      expandEllipsis0281
     * @tc.desc      16 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0281 begin');
      const textLen: number = 16;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(320);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0281 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0282
     * @tc.name      expandEllipsis0282
     * @tc.desc      16 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0282 begin');
      const textLen: number = 16;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(384);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0282 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0283
     * @tc.name      expandEllipsis0283
     * @tc.desc      16 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0283 begin');
      const textLen: number = 16;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0283 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0284
     * @tc.name      expandEllipsis0284
     * @tc.desc      16 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0284 begin');
      const textLen: number = 16;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0284 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0285
     * @tc.name      expandEllipsis0285
     * @tc.desc      16 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0285 begin');
      const textLen: number = 16;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(224);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0285 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0286
     * @tc.name      expandEllipsis0286
     * @tc.desc      16 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0286 begin');
      const textLen: number = 16;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(256);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0286 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0287
     * @tc.name      expandEllipsis0287
     * @tc.desc      16 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0287 begin');
      const textLen: number = 16;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(320);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0287 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0288
     * @tc.name      expandEllipsis0288
     * @tc.desc      16 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0288 begin');
      const textLen: number = 16;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(384);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0288 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0289
     * @tc.name      expandEllipsis0289
     * @tc.desc      20 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0289 begin');
      const textLen: number = 20;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(20);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0289 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0290
     * @tc.name      expandEllipsis0290
     * @tc.desc      20 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0290 begin');
      const textLen: number = 20;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(24);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0290 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0291
     * @tc.name      expandEllipsis0291
     * @tc.desc      20 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0291 begin');
      const textLen: number = 20;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(28);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0291 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0292
     * @tc.name      expandEllipsis0292
     * @tc.desc      20 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0292 begin');
      const textLen: number = 20;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(32);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0292 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0293
     * @tc.name      expandEllipsis0293
     * @tc.desc      20 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0293 begin');
      const textLen: number = 20;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0293 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0294
     * @tc.name      expandEllipsis0294
     * @tc.desc      20 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0294 begin');
      const textLen: number = 20;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0294 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0295
     * @tc.name      expandEllipsis0295
     * @tc.desc      20 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0295 begin');
      const textLen: number = 20;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0295 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0296
     * @tc.name      expandEllipsis0296
     * @tc.desc      20 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0296 begin');
      const textLen: number = 20;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0296 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0297
     * @tc.name      expandEllipsis0297
     * @tc.desc      20 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0297 begin');
      const textLen: number = 20;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(56);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0297 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0298
     * @tc.name      expandEllipsis0298
     * @tc.desc      20 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0298 begin');
      const textLen: number = 20;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(64);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0298 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0299
     * @tc.name      expandEllipsis0299
     * @tc.desc      20 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0299 begin');
      const textLen: number = 20;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0299 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0300
     * @tc.name      expandEllipsis0300
     * @tc.desc      20 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0300 begin');
      const textLen: number = 20;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0300 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0301
     * @tc.name      expandEllipsis0301
     * @tc.desc      20 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0301 begin');
      const textLen: number = 20;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(60);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0301 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0302
     * @tc.name      expandEllipsis0302
     * @tc.desc      20 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0302 begin');
      const textLen: number = 20;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(72);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0302 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0303
     * @tc.name      expandEllipsis0303
     * @tc.desc      20 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0303 begin');
      const textLen: number = 20;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(84);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0303 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0304
     * @tc.name      expandEllipsis0304
     * @tc.desc      20 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0304 begin');
      const textLen: number = 20;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0304 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0305
     * @tc.name      expandEllipsis0305
     * @tc.desc      20 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0305 begin');
      const textLen: number = 20;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0305 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0306
     * @tc.name      expandEllipsis0306
     * @tc.desc      20 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0306 begin');
      const textLen: number = 20;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0306 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0307
     * @tc.name      expandEllipsis0307
     * @tc.desc      20 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0307 begin');
      const textLen: number = 20;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0307 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0308
     * @tc.name      expandEllipsis0308
     * @tc.desc      20 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0308 begin');
      const textLen: number = 20;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0308 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0309
     * @tc.name      expandEllipsis0309
     * @tc.desc      20 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0309 begin');
      const textLen: number = 20;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(112);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0309 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0310
     * @tc.name      expandEllipsis0310
     * @tc.desc      20 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0310 begin');
      const textLen: number = 20;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(128);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0310 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0311
     * @tc.name      expandEllipsis0311
     * @tc.desc      20 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0311 begin');
      const textLen: number = 20;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0311 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0312
     * @tc.name      expandEllipsis0312
     * @tc.desc      20 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0312 begin');
      const textLen: number = 20;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0312 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0313
     * @tc.name      expandEllipsis0313
     * @tc.desc      20 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0313 begin');
      const textLen: number = 20;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(100);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0313 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0314
     * @tc.name      expandEllipsis0314
     * @tc.desc      20 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0314 begin');
      const textLen: number = 20;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0314 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0315
     * @tc.name      expandEllipsis0315
     * @tc.desc      20 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0315 begin');
      const textLen: number = 20;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(140);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0315 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0316
     * @tc.name      expandEllipsis0316
     * @tc.desc      20 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0316 begin');
      const textLen: number = 20;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0316 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0317
     * @tc.name      expandEllipsis0317
     * @tc.desc      20 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0317 begin');
      const textLen: number = 20;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(200);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0317 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0318
     * @tc.name      expandEllipsis0318
     * @tc.desc      20 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0318 begin');
      const textLen: number = 20;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(240);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0318 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0319
     * @tc.name      expandEllipsis0319
     * @tc.desc      20 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0319 begin');
      const textLen: number = 20;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0319 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0320
     * @tc.name      expandEllipsis0320
     * @tc.desc      20 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0320 begin');
      const textLen: number = 20;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0320 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0321
     * @tc.name      expandEllipsis0321
     * @tc.desc      20 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0321 begin');
      const textLen: number = 20;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(168);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0321 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0322
     * @tc.name      expandEllipsis0322
     * @tc.desc      20 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0322 begin');
      const textLen: number = 20;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0322 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0323
     * @tc.name      expandEllipsis0323
     * @tc.desc      20 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0323 begin');
      const textLen: number = 20;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(240);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0323 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0324
     * @tc.name      expandEllipsis0324
     * @tc.desc      20 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0324 begin');
      const textLen: number = 20;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(288);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0324 end');
    })
  })
}
