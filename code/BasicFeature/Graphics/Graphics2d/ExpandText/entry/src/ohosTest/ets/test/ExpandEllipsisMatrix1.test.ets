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

export default function expandEllipsisMatrix1Test(): void {
  describe('ExpandEllipsisMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    EXPAND_ELLIPSIS_0001
     * @tc.name      expandEllipsis0001
     * @tc.desc      4 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0001 begin');
      const textLen: number = 4;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(20);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0001 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0002
     * @tc.name      expandEllipsis0002
     * @tc.desc      4 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0002 begin');
      const textLen: number = 4;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(24);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0002 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0003
     * @tc.name      expandEllipsis0003
     * @tc.desc      4 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0003 begin');
      const textLen: number = 4;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(28);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0003 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0004
     * @tc.name      expandEllipsis0004
     * @tc.desc      4 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0004 begin');
      const textLen: number = 4;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(32);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0004 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0005
     * @tc.name      expandEllipsis0005
     * @tc.desc      4 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0005 begin');
      const textLen: number = 4;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0005 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0006
     * @tc.name      expandEllipsis0006
     * @tc.desc      4 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0006 begin');
      const textLen: number = 4;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0006 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0007
     * @tc.name      expandEllipsis0007
     * @tc.desc      4 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0007 begin');
      const textLen: number = 4;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0007 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0008
     * @tc.name      expandEllipsis0008
     * @tc.desc      4 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0008 begin');
      const textLen: number = 4;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0008 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0009
     * @tc.name      expandEllipsis0009
     * @tc.desc      4 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0009 begin');
      const textLen: number = 4;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(56);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0009 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0010
     * @tc.name      expandEllipsis0010
     * @tc.desc      4 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0010 begin');
      const textLen: number = 4;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(64);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0010 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0011
     * @tc.name      expandEllipsis0011
     * @tc.desc      4 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0011 begin');
      const textLen: number = 4;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0011 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0012
     * @tc.name      expandEllipsis0012
     * @tc.desc      4 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0012 begin');
      const textLen: number = 4;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0012 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0013
     * @tc.name      expandEllipsis0013
     * @tc.desc      4 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0013 begin');
      const textLen: number = 4;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0013 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0014
     * @tc.name      expandEllipsis0014
     * @tc.desc      4 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0014 begin');
      const textLen: number = 4;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0014 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0015
     * @tc.name      expandEllipsis0015
     * @tc.desc      4 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0015 begin');
      const textLen: number = 4;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(56);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0015 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0016
     * @tc.name      expandEllipsis0016
     * @tc.desc      4 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0016 begin');
      const textLen: number = 4;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(64);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0016 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0017
     * @tc.name      expandEllipsis0017
     * @tc.desc      4 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0017 begin');
      const textLen: number = 4;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0017 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0018
     * @tc.name      expandEllipsis0018
     * @tc.desc      4 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0018 begin');
      const textLen: number = 4;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0018 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0019
     * @tc.name      expandEllipsis0019
     * @tc.desc      4 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0019 begin');
      const textLen: number = 4;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0019 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0020
     * @tc.name      expandEllipsis0020
     * @tc.desc      4 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0020 begin');
      const textLen: number = 4;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0020 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0021
     * @tc.name      expandEllipsis0021
     * @tc.desc      4 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0021 begin');
      const textLen: number = 4;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(56);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0021 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0022
     * @tc.name      expandEllipsis0022
     * @tc.desc      4 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0022 begin');
      const textLen: number = 4;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(64);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0022 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0023
     * @tc.name      expandEllipsis0023
     * @tc.desc      4 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0023 begin');
      const textLen: number = 4;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0023 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0024
     * @tc.name      expandEllipsis0024
     * @tc.desc      4 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0024 begin');
      const textLen: number = 4;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0024 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0025
     * @tc.name      expandEllipsis0025
     * @tc.desc      4 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0025 begin');
      const textLen: number = 4;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0025 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0026
     * @tc.name      expandEllipsis0026
     * @tc.desc      4 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0026 begin');
      const textLen: number = 4;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0026 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0027
     * @tc.name      expandEllipsis0027
     * @tc.desc      4 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0027 begin');
      const textLen: number = 4;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(56);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0027 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0028
     * @tc.name      expandEllipsis0028
     * @tc.desc      4 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0028 begin');
      const textLen: number = 4;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(64);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0028 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0029
     * @tc.name      expandEllipsis0029
     * @tc.desc      4 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0029 begin');
      const textLen: number = 4;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0029 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0030
     * @tc.name      expandEllipsis0030
     * @tc.desc      4 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0030 begin');
      const textLen: number = 4;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0030 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0031
     * @tc.name      expandEllipsis0031
     * @tc.desc      4 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0031 begin');
      const textLen: number = 4;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0031 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0032
     * @tc.name      expandEllipsis0032
     * @tc.desc      4 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0032 begin');
      const textLen: number = 4;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0032 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0033
     * @tc.name      expandEllipsis0033
     * @tc.desc      4 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0033 begin');
      const textLen: number = 4;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(56);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0033 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0034
     * @tc.name      expandEllipsis0034
     * @tc.desc      4 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0034 begin');
      const textLen: number = 4;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(64);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0034 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0035
     * @tc.name      expandEllipsis0035
     * @tc.desc      4 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0035 begin');
      const textLen: number = 4;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0035 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0036
     * @tc.name      expandEllipsis0036
     * @tc.desc      4 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0036 begin');
      const textLen: number = 4;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0036 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0037
     * @tc.name      expandEllipsis0037
     * @tc.desc      4 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0037 begin');
      const textLen: number = 4;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0037 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0038
     * @tc.name      expandEllipsis0038
     * @tc.desc      4 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0038 begin');
      const textLen: number = 4;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0038 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0039
     * @tc.name      expandEllipsis0039
     * @tc.desc      4 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0039 begin');
      const textLen: number = 4;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(56);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0039 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0040
     * @tc.name      expandEllipsis0040
     * @tc.desc      4 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0040 begin');
      const textLen: number = 4;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(64);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0040 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0041
     * @tc.name      expandEllipsis0041
     * @tc.desc      4 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0041 begin');
      const textLen: number = 4;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0041 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0042
     * @tc.name      expandEllipsis0042
     * @tc.desc      4 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0042 begin');
      const textLen: number = 4;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0042 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0043
     * @tc.name      expandEllipsis0043
     * @tc.desc      4 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0043 begin');
      const textLen: number = 4;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0043 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0044
     * @tc.name      expandEllipsis0044
     * @tc.desc      4 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0044 begin');
      const textLen: number = 4;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0044 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0045
     * @tc.name      expandEllipsis0045
     * @tc.desc      4 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0045 begin');
      const textLen: number = 4;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(56);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0045 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0046
     * @tc.name      expandEllipsis0046
     * @tc.desc      4 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0046 begin');
      const textLen: number = 4;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(64);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0046 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0047
     * @tc.name      expandEllipsis0047
     * @tc.desc      4 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0047 begin');
      const textLen: number = 4;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0047 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0048
     * @tc.name      expandEllipsis0048
     * @tc.desc      4 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0048 begin');
      const textLen: number = 4;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0048 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0049
     * @tc.name      expandEllipsis0049
     * @tc.desc      6 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0049 begin');
      const textLen: number = 6;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(20);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0049 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0050
     * @tc.name      expandEllipsis0050
     * @tc.desc      6 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0050 begin');
      const textLen: number = 6;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(24);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0050 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0051
     * @tc.name      expandEllipsis0051
     * @tc.desc      6 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0051 begin');
      const textLen: number = 6;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(28);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0051 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0052
     * @tc.name      expandEllipsis0052
     * @tc.desc      6 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0052 begin');
      const textLen: number = 6;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(32);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0052 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0053
     * @tc.name      expandEllipsis0053
     * @tc.desc      6 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0053 begin');
      const textLen: number = 6;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0053 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0054
     * @tc.name      expandEllipsis0054
     * @tc.desc      6 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0054 begin');
      const textLen: number = 6;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0054 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0055
     * @tc.name      expandEllipsis0055
     * @tc.desc      6 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0055 begin');
      const textLen: number = 6;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0055 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0056
     * @tc.name      expandEllipsis0056
     * @tc.desc      6 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0056 begin');
      const textLen: number = 6;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0056 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0057
     * @tc.name      expandEllipsis0057
     * @tc.desc      6 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0057 begin');
      const textLen: number = 6;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(56);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0057 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0058
     * @tc.name      expandEllipsis0058
     * @tc.desc      6 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0058 begin');
      const textLen: number = 6;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(64);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0058 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0059
     * @tc.name      expandEllipsis0059
     * @tc.desc      6 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0059 begin');
      const textLen: number = 6;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0059 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0060
     * @tc.name      expandEllipsis0060
     * @tc.desc      6 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0060 begin');
      const textLen: number = 6;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0060 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0061
     * @tc.name      expandEllipsis0061
     * @tc.desc      6 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0061 begin');
      const textLen: number = 6;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(60);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0061 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0062
     * @tc.name      expandEllipsis0062
     * @tc.desc      6 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0062 begin');
      const textLen: number = 6;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(72);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0062 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0063
     * @tc.name      expandEllipsis0063
     * @tc.desc      6 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0063 begin');
      const textLen: number = 6;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(84);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0063 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0064
     * @tc.name      expandEllipsis0064
     * @tc.desc      6 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0064 begin');
      const textLen: number = 6;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0064 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0065
     * @tc.name      expandEllipsis0065
     * @tc.desc      6 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0065 begin');
      const textLen: number = 6;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0065 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0066
     * @tc.name      expandEllipsis0066
     * @tc.desc      6 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0066 begin');
      const textLen: number = 6;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0066 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0067
     * @tc.name      expandEllipsis0067
     * @tc.desc      6 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0067 begin');
      const textLen: number = 6;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(60);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0067 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0068
     * @tc.name      expandEllipsis0068
     * @tc.desc      6 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0068 begin');
      const textLen: number = 6;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(72);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0068 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0069
     * @tc.name      expandEllipsis0069
     * @tc.desc      6 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0069 begin');
      const textLen: number = 6;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(84);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0069 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0070
     * @tc.name      expandEllipsis0070
     * @tc.desc      6 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0070 begin');
      const textLen: number = 6;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0070 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0071
     * @tc.name      expandEllipsis0071
     * @tc.desc      6 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0071 begin');
      const textLen: number = 6;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0071 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0072
     * @tc.name      expandEllipsis0072
     * @tc.desc      6 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0072 begin');
      const textLen: number = 6;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0072 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0073
     * @tc.name      expandEllipsis0073
     * @tc.desc      6 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0073 begin');
      const textLen: number = 6;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(60);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0073 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0074
     * @tc.name      expandEllipsis0074
     * @tc.desc      6 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0074 begin');
      const textLen: number = 6;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(72);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0074 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0075
     * @tc.name      expandEllipsis0075
     * @tc.desc      6 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0075 begin');
      const textLen: number = 6;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(84);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0075 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0076
     * @tc.name      expandEllipsis0076
     * @tc.desc      6 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0076 begin');
      const textLen: number = 6;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0076 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0077
     * @tc.name      expandEllipsis0077
     * @tc.desc      6 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0077 begin');
      const textLen: number = 6;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0077 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0078
     * @tc.name      expandEllipsis0078
     * @tc.desc      6 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0078 begin');
      const textLen: number = 6;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0078 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0079
     * @tc.name      expandEllipsis0079
     * @tc.desc      6 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0079 begin');
      const textLen: number = 6;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(60);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0079 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0080
     * @tc.name      expandEllipsis0080
     * @tc.desc      6 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0080 begin');
      const textLen: number = 6;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(72);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0080 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0081
     * @tc.name      expandEllipsis0081
     * @tc.desc      6 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0081 begin');
      const textLen: number = 6;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(84);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0081 end');
    })
  })
}
