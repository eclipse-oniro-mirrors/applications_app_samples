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

export default function expandEllipsisMatrix5Test(): void {
  describe('ExpandEllipsisMatrix5Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    EXPAND_ELLIPSIS_0325
     * @tc.name      expandEllipsis0325
     * @tc.desc      20 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0325 begin');
      const textLen: number = 20;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0325 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0326
     * @tc.name      expandEllipsis0326
     * @tc.desc      20 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0326 begin');
      const textLen: number = 20;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0326 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0327
     * @tc.name      expandEllipsis0327
     * @tc.desc      20 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0327 begin');
      const textLen: number = 20;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(224);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0327 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0328
     * @tc.name      expandEllipsis0328
     * @tc.desc      20 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0328 begin');
      const textLen: number = 20;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(256);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0328 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0329
     * @tc.name      expandEllipsis0329
     * @tc.desc      20 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0329 begin');
      const textLen: number = 20;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(320);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0329 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0330
     * @tc.name      expandEllipsis0330
     * @tc.desc      20 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0330 begin');
      const textLen: number = 20;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(384);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0330 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0331
     * @tc.name      expandEllipsis0331
     * @tc.desc      20 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0331 begin');
      const textLen: number = 20;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(20);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(200);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0331 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0332
     * @tc.name      expandEllipsis0332
     * @tc.desc      20 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0332 begin');
      const textLen: number = 20;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(20);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(240);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0332 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0333
     * @tc.name      expandEllipsis0333
     * @tc.desc      20 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0333 begin');
      const textLen: number = 20;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(20);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(280);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0333 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0334
     * @tc.name      expandEllipsis0334
     * @tc.desc      20 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0334 begin');
      const textLen: number = 20;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(20);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(320);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0334 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0335
     * @tc.name      expandEllipsis0335
     * @tc.desc      20 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0335 begin');
      const textLen: number = 20;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(20);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(400);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0335 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0336
     * @tc.name      expandEllipsis0336
     * @tc.desc      20 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0336 begin');
      const textLen: number = 20;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(20);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(480);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0336 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0337
     * @tc.name      expandEllipsis0337
     * @tc.desc      24 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0337 begin');
      const textLen: number = 24;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(20);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0337 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0338
     * @tc.name      expandEllipsis0338
     * @tc.desc      24 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0338 begin');
      const textLen: number = 24;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(24);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0338 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0339
     * @tc.name      expandEllipsis0339
     * @tc.desc      24 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0339 begin');
      const textLen: number = 24;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(28);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0339 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0340
     * @tc.name      expandEllipsis0340
     * @tc.desc      24 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0340 begin');
      const textLen: number = 24;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(32);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0340 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0341
     * @tc.name      expandEllipsis0341
     * @tc.desc      24 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0341 begin');
      const textLen: number = 24;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0341 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0342
     * @tc.name      expandEllipsis0342
     * @tc.desc      24 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0342 begin');
      const textLen: number = 24;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0342 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0343
     * @tc.name      expandEllipsis0343
     * @tc.desc      24 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0343 begin');
      const textLen: number = 24;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0343 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0344
     * @tc.name      expandEllipsis0344
     * @tc.desc      24 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0344 begin');
      const textLen: number = 24;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0344 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0345
     * @tc.name      expandEllipsis0345
     * @tc.desc      24 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0345 begin');
      const textLen: number = 24;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(56);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0345 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0346
     * @tc.name      expandEllipsis0346
     * @tc.desc      24 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0346 begin');
      const textLen: number = 24;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(64);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0346 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0347
     * @tc.name      expandEllipsis0347
     * @tc.desc      24 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0347 begin');
      const textLen: number = 24;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0347 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0348
     * @tc.name      expandEllipsis0348
     * @tc.desc      24 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0348 begin');
      const textLen: number = 24;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0348 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0349
     * @tc.name      expandEllipsis0349
     * @tc.desc      24 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0349 begin');
      const textLen: number = 24;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(60);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0349 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0350
     * @tc.name      expandEllipsis0350
     * @tc.desc      24 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0350 begin');
      const textLen: number = 24;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(72);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0350 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0351
     * @tc.name      expandEllipsis0351
     * @tc.desc      24 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0351 begin');
      const textLen: number = 24;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(84);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0351 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0352
     * @tc.name      expandEllipsis0352
     * @tc.desc      24 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0352 begin');
      const textLen: number = 24;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0352 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0353
     * @tc.name      expandEllipsis0353
     * @tc.desc      24 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0353 begin');
      const textLen: number = 24;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0353 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0354
     * @tc.name      expandEllipsis0354
     * @tc.desc      24 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0354 begin');
      const textLen: number = 24;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0354 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0355
     * @tc.name      expandEllipsis0355
     * @tc.desc      24 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0355 begin');
      const textLen: number = 24;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0355 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0356
     * @tc.name      expandEllipsis0356
     * @tc.desc      24 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0356 begin');
      const textLen: number = 24;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0356 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0357
     * @tc.name      expandEllipsis0357
     * @tc.desc      24 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0357 begin');
      const textLen: number = 24;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(112);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0357 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0358
     * @tc.name      expandEllipsis0358
     * @tc.desc      24 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0358 begin');
      const textLen: number = 24;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(128);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0358 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0359
     * @tc.name      expandEllipsis0359
     * @tc.desc      24 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0359 begin');
      const textLen: number = 24;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0359 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0360
     * @tc.name      expandEllipsis0360
     * @tc.desc      24 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0360 begin');
      const textLen: number = 24;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0360 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0361
     * @tc.name      expandEllipsis0361
     * @tc.desc      24 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0361 begin');
      const textLen: number = 24;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(100);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0361 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0362
     * @tc.name      expandEllipsis0362
     * @tc.desc      24 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0362 begin');
      const textLen: number = 24;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0362 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0363
     * @tc.name      expandEllipsis0363
     * @tc.desc      24 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0363 begin');
      const textLen: number = 24;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(140);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0363 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0364
     * @tc.name      expandEllipsis0364
     * @tc.desc      24 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0364 begin');
      const textLen: number = 24;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0364 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0365
     * @tc.name      expandEllipsis0365
     * @tc.desc      24 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0365 begin');
      const textLen: number = 24;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(200);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0365 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0366
     * @tc.name      expandEllipsis0366
     * @tc.desc      24 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0366 begin');
      const textLen: number = 24;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(10);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(240);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0366 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0367
     * @tc.name      expandEllipsis0367
     * @tc.desc      24 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0367 begin');
      const textLen: number = 24;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0367 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0368
     * @tc.name      expandEllipsis0368
     * @tc.desc      24 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0368 begin');
      const textLen: number = 24;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0368 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0369
     * @tc.name      expandEllipsis0369
     * @tc.desc      24 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0369 begin');
      const textLen: number = 24;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(168);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0369 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0370
     * @tc.name      expandEllipsis0370
     * @tc.desc      24 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0370 begin');
      const textLen: number = 24;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0370 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0371
     * @tc.name      expandEllipsis0371
     * @tc.desc      24 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0371 begin');
      const textLen: number = 24;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(240);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0371 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0372
     * @tc.name      expandEllipsis0372
     * @tc.desc      24 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0372 begin');
      const textLen: number = 24;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(12);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(288);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0372 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0373
     * @tc.name      expandEllipsis0373
     * @tc.desc      24 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0373 begin');
      const textLen: number = 24;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0373 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0374
     * @tc.name      expandEllipsis0374
     * @tc.desc      24 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0374 begin');
      const textLen: number = 24;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0374 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0375
     * @tc.name      expandEllipsis0375
     * @tc.desc      24 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0375 begin');
      const textLen: number = 24;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(224);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0375 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0376
     * @tc.name      expandEllipsis0376
     * @tc.desc      24 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0376 begin');
      const textLen: number = 24;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(256);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0376 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0377
     * @tc.name      expandEllipsis0377
     * @tc.desc      24 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0377 begin');
      const textLen: number = 24;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(320);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0377 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0378
     * @tc.name      expandEllipsis0378
     * @tc.desc      24 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0378 begin');
      const textLen: number = 24;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(16);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(384);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0378 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0379
     * @tc.name      expandEllipsis0379
     * @tc.desc      24 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0379 begin');
      const textLen: number = 24;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(20);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(200);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0379 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0380
     * @tc.name      expandEllipsis0380
     * @tc.desc      24 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0380 begin');
      const textLen: number = 24;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(20);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(240);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0380 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0381
     * @tc.name      expandEllipsis0381
     * @tc.desc      24 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0381 begin');
      const textLen: number = 24;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(20);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(280);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0381 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0382
     * @tc.name      expandEllipsis0382
     * @tc.desc      24 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0382 begin');
      const textLen: number = 24;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(20);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(320);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0382 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0383
     * @tc.name      expandEllipsis0383
     * @tc.desc      24 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0383 begin');
      const textLen: number = 24;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(20);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(400);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0383 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0384
     * @tc.name      expandEllipsis0384
     * @tc.desc      24 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0384 begin');
      const textLen: number = 24;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(20);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(480);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0384 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0385
     * @tc.name      expandEllipsis0385
     * @tc.desc      32 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0385 begin');
      const textLen: number = 32;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(20);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0385 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0386
     * @tc.name      expandEllipsis0386
     * @tc.desc      32 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0386 begin');
      const textLen: number = 32;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(24);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0386 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0387
     * @tc.name      expandEllipsis0387
     * @tc.desc      32 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0387 begin');
      const textLen: number = 32;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(28);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0387 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0388
     * @tc.name      expandEllipsis0388
     * @tc.desc      32 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0388 begin');
      const textLen: number = 32;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(32);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0388 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0389
     * @tc.name      expandEllipsis0389
     * @tc.desc      32 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0389 begin');
      const textLen: number = 32;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0389 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0390
     * @tc.name      expandEllipsis0390
     * @tc.desc      32 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0390 begin');
      const textLen: number = 32;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0390 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0391
     * @tc.name      expandEllipsis0391
     * @tc.desc      32 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0391 begin');
      const textLen: number = 32;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0391 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0392
     * @tc.name      expandEllipsis0392
     * @tc.desc      32 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0392 begin');
      const textLen: number = 32;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0392 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0393
     * @tc.name      expandEllipsis0393
     * @tc.desc      32 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0393 begin');
      const textLen: number = 32;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(56);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0393 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0394
     * @tc.name      expandEllipsis0394
     * @tc.desc      32 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0394 begin');
      const textLen: number = 32;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(64);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0394 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0395
     * @tc.name      expandEllipsis0395
     * @tc.desc      32 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0395 begin');
      const textLen: number = 32;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0395 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0396
     * @tc.name      expandEllipsis0396
     * @tc.desc      32 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0396 begin');
      const textLen: number = 32;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0396 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0397
     * @tc.name      expandEllipsis0397
     * @tc.desc      32 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0397 begin');
      const textLen: number = 32;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(60);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0397 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0398
     * @tc.name      expandEllipsis0398
     * @tc.desc      32 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0398 begin');
      const textLen: number = 32;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(72);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0398 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0399
     * @tc.name      expandEllipsis0399
     * @tc.desc      32 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0399 begin');
      const textLen: number = 32;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(84);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0399 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0400
     * @tc.name      expandEllipsis0400
     * @tc.desc      32 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0400 begin');
      const textLen: number = 32;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0400 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0401
     * @tc.name      expandEllipsis0401
     * @tc.desc      32 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0401 begin');
      const textLen: number = 32;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0401 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0402
     * @tc.name      expandEllipsis0402
     * @tc.desc      32 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0402 begin');
      const textLen: number = 32;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0402 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0403
     * @tc.name      expandEllipsis0403
     * @tc.desc      32 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0403 begin');
      const textLen: number = 32;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0403 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0404
     * @tc.name      expandEllipsis0404
     * @tc.desc      32 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0404 begin');
      const textLen: number = 32;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0404 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0405
     * @tc.name      expandEllipsis0405
     * @tc.desc      32 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0405 begin');
      const textLen: number = 32;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(112);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0405 end');
    })
  })
}
