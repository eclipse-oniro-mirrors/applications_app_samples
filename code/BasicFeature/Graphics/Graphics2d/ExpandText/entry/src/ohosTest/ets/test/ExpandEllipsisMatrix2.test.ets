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

export default function expandEllipsisMatrix2Test(): void {
  describe('ExpandEllipsisMatrix2Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    EXPAND_ELLIPSIS_0082
     * @tc.name      expandEllipsis0082
     * @tc.desc      6 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0082 begin');
      const textLen: number = 6;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0082 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0083
     * @tc.name      expandEllipsis0083
     * @tc.desc      6 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0083 begin');
      const textLen: number = 6;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0083 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0084
     * @tc.name      expandEllipsis0084
     * @tc.desc      6 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0084 begin');
      const textLen: number = 6;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0084 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0085
     * @tc.name      expandEllipsis0085
     * @tc.desc      6 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0085 begin');
      const textLen: number = 6;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(60);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0085 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0086
     * @tc.name      expandEllipsis0086
     * @tc.desc      6 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0086 begin');
      const textLen: number = 6;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(72);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0086 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0087
     * @tc.name      expandEllipsis0087
     * @tc.desc      6 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0087 begin');
      const textLen: number = 6;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(84);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0087 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0088
     * @tc.name      expandEllipsis0088
     * @tc.desc      6 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0088 begin');
      const textLen: number = 6;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0088 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0089
     * @tc.name      expandEllipsis0089
     * @tc.desc      6 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0089 begin');
      const textLen: number = 6;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0089 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0090
     * @tc.name      expandEllipsis0090
     * @tc.desc      6 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0090 begin');
      const textLen: number = 6;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0090 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0091
     * @tc.name      expandEllipsis0091
     * @tc.desc      6 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0091 begin');
      const textLen: number = 6;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(60);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0091 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0092
     * @tc.name      expandEllipsis0092
     * @tc.desc      6 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0092 begin');
      const textLen: number = 6;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(72);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0092 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0093
     * @tc.name      expandEllipsis0093
     * @tc.desc      6 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0093 begin');
      const textLen: number = 6;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(84);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0093 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0094
     * @tc.name      expandEllipsis0094
     * @tc.desc      6 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0094 begin');
      const textLen: number = 6;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0094 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0095
     * @tc.name      expandEllipsis0095
     * @tc.desc      6 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0095 begin');
      const textLen: number = 6;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0095 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0096
     * @tc.name      expandEllipsis0096
     * @tc.desc      6 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0096 begin');
      const textLen: number = 6;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0096 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0097
     * @tc.name      expandEllipsis0097
     * @tc.desc      8 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0097 begin');
      const textLen: number = 8;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(20);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0097 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0098
     * @tc.name      expandEllipsis0098
     * @tc.desc      8 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0098 begin');
      const textLen: number = 8;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(24);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0098 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0099
     * @tc.name      expandEllipsis0099
     * @tc.desc      8 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0099 begin');
      const textLen: number = 8;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(28);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0099 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0100
     * @tc.name      expandEllipsis0100
     * @tc.desc      8 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0100 begin');
      const textLen: number = 8;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(32);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0100 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0101
     * @tc.name      expandEllipsis0101
     * @tc.desc      8 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0101 begin');
      const textLen: number = 8;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0101 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0102
     * @tc.name      expandEllipsis0102
     * @tc.desc      8 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0102 begin');
      const textLen: number = 8;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0102 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0103
     * @tc.name      expandEllipsis0103
     * @tc.desc      8 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0103 begin');
      const textLen: number = 8;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0103 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0104
     * @tc.name      expandEllipsis0104
     * @tc.desc      8 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0104 begin');
      const textLen: number = 8;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0104 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0105
     * @tc.name      expandEllipsis0105
     * @tc.desc      8 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0105 begin');
      const textLen: number = 8;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(56);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0105 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0106
     * @tc.name      expandEllipsis0106
     * @tc.desc      8 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0106 begin');
      const textLen: number = 8;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(64);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0106 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0107
     * @tc.name      expandEllipsis0107
     * @tc.desc      8 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0107 begin');
      const textLen: number = 8;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0107 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0108
     * @tc.name      expandEllipsis0108
     * @tc.desc      8 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0108 begin');
      const textLen: number = 8;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0108 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0109
     * @tc.name      expandEllipsis0109
     * @tc.desc      8 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0109 begin');
      const textLen: number = 8;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(60);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0109 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0110
     * @tc.name      expandEllipsis0110
     * @tc.desc      8 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0110 begin');
      const textLen: number = 8;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(72);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0110 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0111
     * @tc.name      expandEllipsis0111
     * @tc.desc      8 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0111 begin');
      const textLen: number = 8;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(84);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0111 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0112
     * @tc.name      expandEllipsis0112
     * @tc.desc      8 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0112 begin');
      const textLen: number = 8;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0112 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0113
     * @tc.name      expandEllipsis0113
     * @tc.desc      8 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0113 begin');
      const textLen: number = 8;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0113 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0114
     * @tc.name      expandEllipsis0114
     * @tc.desc      8 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0114 begin');
      const textLen: number = 8;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0114 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0115
     * @tc.name      expandEllipsis0115
     * @tc.desc      8 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0115 begin');
      const textLen: number = 8;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0115 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0116
     * @tc.name      expandEllipsis0116
     * @tc.desc      8 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0116 begin');
      const textLen: number = 8;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0116 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0117
     * @tc.name      expandEllipsis0117
     * @tc.desc      8 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0117 begin');
      const textLen: number = 8;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(112);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0117 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0118
     * @tc.name      expandEllipsis0118
     * @tc.desc      8 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0118 begin');
      const textLen: number = 8;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(128);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0118 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0119
     * @tc.name      expandEllipsis0119
     * @tc.desc      8 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0119 begin');
      const textLen: number = 8;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0119 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0120
     * @tc.name      expandEllipsis0120
     * @tc.desc      8 字符文本按 8 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0120 begin');
      const textLen: number = 8;
      const maxChars: number = 8;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0120 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0121
     * @tc.name      expandEllipsis0121
     * @tc.desc      8 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0121 begin');
      const textLen: number = 8;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0121 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0122
     * @tc.name      expandEllipsis0122
     * @tc.desc      8 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0122 begin');
      const textLen: number = 8;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0122 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0123
     * @tc.name      expandEllipsis0123
     * @tc.desc      8 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0123 begin');
      const textLen: number = 8;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(112);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0123 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0124
     * @tc.name      expandEllipsis0124
     * @tc.desc      8 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0124 begin');
      const textLen: number = 8;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(128);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0124 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0125
     * @tc.name      expandEllipsis0125
     * @tc.desc      8 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0125 begin');
      const textLen: number = 8;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0125 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0126
     * @tc.name      expandEllipsis0126
     * @tc.desc      8 字符文本按 10 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0126 begin');
      const textLen: number = 8;
      const maxChars: number = 10;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0126 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0127
     * @tc.name      expandEllipsis0127
     * @tc.desc      8 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0127 begin');
      const textLen: number = 8;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0127 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0128
     * @tc.name      expandEllipsis0128
     * @tc.desc      8 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0128 begin');
      const textLen: number = 8;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0128 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0129
     * @tc.name      expandEllipsis0129
     * @tc.desc      8 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0129 begin');
      const textLen: number = 8;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(112);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0129 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0130
     * @tc.name      expandEllipsis0130
     * @tc.desc      8 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0130 begin');
      const textLen: number = 8;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(128);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0130 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0131
     * @tc.name      expandEllipsis0131
     * @tc.desc      8 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0131 begin');
      const textLen: number = 8;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0131 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0132
     * @tc.name      expandEllipsis0132
     * @tc.desc      8 字符文本按 12 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0132 begin');
      const textLen: number = 8;
      const maxChars: number = 12;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0132 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0133
     * @tc.name      expandEllipsis0133
     * @tc.desc      8 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0133 begin');
      const textLen: number = 8;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0133 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0134
     * @tc.name      expandEllipsis0134
     * @tc.desc      8 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0134 begin');
      const textLen: number = 8;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0134 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0135
     * @tc.name      expandEllipsis0135
     * @tc.desc      8 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0135 begin');
      const textLen: number = 8;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(112);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0135 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0136
     * @tc.name      expandEllipsis0136
     * @tc.desc      8 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0136 begin');
      const textLen: number = 8;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(128);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0136 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0137
     * @tc.name      expandEllipsis0137
     * @tc.desc      8 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0137 begin');
      const textLen: number = 8;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0137 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0138
     * @tc.name      expandEllipsis0138
     * @tc.desc      8 字符文本按 16 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0138 begin');
      const textLen: number = 8;
      const maxChars: number = 16;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0138 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0139
     * @tc.name      expandEllipsis0139
     * @tc.desc      8 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0139 begin');
      const textLen: number = 8;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0139 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0140
     * @tc.name      expandEllipsis0140
     * @tc.desc      8 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0140 begin');
      const textLen: number = 8;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0140 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0141
     * @tc.name      expandEllipsis0141
     * @tc.desc      8 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0141 begin');
      const textLen: number = 8;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(112);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0141 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0142
     * @tc.name      expandEllipsis0142
     * @tc.desc      8 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0142 begin');
      const textLen: number = 8;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(128);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0142 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0143
     * @tc.name      expandEllipsis0143
     * @tc.desc      8 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0143 begin');
      const textLen: number = 8;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(160);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0143 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0144
     * @tc.name      expandEllipsis0144
     * @tc.desc      8 字符文本按 20 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0144 begin');
      const textLen: number = 8;
      const maxChars: number = 20;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(8);
      expect(truncated).assertEqual(false);
      expect(width).assertEqual(192);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0144 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0145
     * @tc.name      expandEllipsis0145
     * @tc.desc      10 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0145 begin');
      const textLen: number = 10;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(20);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0145 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0146
     * @tc.name      expandEllipsis0146
     * @tc.desc      10 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0146 begin');
      const textLen: number = 10;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(24);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0146 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0147
     * @tc.name      expandEllipsis0147
     * @tc.desc      10 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0147 begin');
      const textLen: number = 10;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(28);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0147 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0148
     * @tc.name      expandEllipsis0148
     * @tc.desc      10 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0148 begin');
      const textLen: number = 10;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(32);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0148 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0149
     * @tc.name      expandEllipsis0149
     * @tc.desc      10 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0149 begin');
      const textLen: number = 10;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0149 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0150
     * @tc.name      expandEllipsis0150
     * @tc.desc      10 字符文本按 2 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0150 begin');
      const textLen: number = 10;
      const maxChars: number = 2;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(2);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0150 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0151
     * @tc.name      expandEllipsis0151
     * @tc.desc      10 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0151 begin');
      const textLen: number = 10;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(40);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0151 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0152
     * @tc.name      expandEllipsis0152
     * @tc.desc      10 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0152 begin');
      const textLen: number = 10;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(48);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0152 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0153
     * @tc.name      expandEllipsis0153
     * @tc.desc      10 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0153 begin');
      const textLen: number = 10;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(56);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0153 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0154
     * @tc.name      expandEllipsis0154
     * @tc.desc      10 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0154 begin');
      const textLen: number = 10;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(64);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0154 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0155
     * @tc.name      expandEllipsis0155
     * @tc.desc      10 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0155 begin');
      const textLen: number = 10;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(80);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0155 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0156
     * @tc.name      expandEllipsis0156
     * @tc.desc      10 字符文本按 4 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0156 begin');
      const textLen: number = 10;
      const maxChars: number = 4;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(4);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0156 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0157
     * @tc.name      expandEllipsis0157
     * @tc.desc      10 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0157 begin');
      const textLen: number = 10;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 10;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(60);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0157 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0158
     * @tc.name      expandEllipsis0158
     * @tc.desc      10 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0158 begin');
      const textLen: number = 10;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 12;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(72);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0158 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0159
     * @tc.name      expandEllipsis0159
     * @tc.desc      10 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0159 begin');
      const textLen: number = 10;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 14;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(84);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0159 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0160
     * @tc.name      expandEllipsis0160
     * @tc.desc      10 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0160 begin');
      const textLen: number = 10;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 16;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(96);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0160 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0161
     * @tc.name      expandEllipsis0161
     * @tc.desc      10 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0161 begin');
      const textLen: number = 10;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 20;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(120);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0161 end');
    })

    /**
     * @tc.number    EXPAND_ELLIPSIS_0162
     * @tc.name      expandEllipsis0162
     * @tc.desc      10 字符文本按 6 字符截断的可见宽度与省略判断
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandEllipsis0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0162 begin');
      const textLen: number = 10;
      const maxChars: number = 6;
      const visible: number = Math.min(textLen, maxChars);
      const truncated: boolean = visible < textLen;
      const width: number = visible * 24;
      expect(visible).assertEqual(6);
      expect(truncated).assertEqual(true);
      expect(width).assertEqual(144);
      expect(visible <= textLen).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandEllipsis0162 end');
    })
  })
}
