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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { formatDateTime } from '../../../main/ets/utils/FormatUtil';

/**
 * 日志时间戳网格：闰日、月末、世纪边界与几个普通日期，核对 年-月-日 时:分:秒 的拼装。
 * 日志面板靠它排序，格式退化成 ISO 串时页面不会报错，只会让人读不懂。
 */
export default function distributedStampGridTest() {
  describe('DistributedStampGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAMP_0001
     * @tc.name testStamp0001
     * @tc.desc Verify the log timestamp 2026-01-02 03:04:05 keeps the year month day order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStamp0001', 0, () => {
      const date: Date = new Date(2026, 0, 2, 3, 4, 5);
      expect(formatDateTime(date)).assertEqual('2026-01-02 03:04:05');
      expect(formatDateTime(date).length).assertEqual(19);
      expect(formatDateTime(date).indexOf('T')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAMP_0002
     * @tc.name testStamp0002
     * @tc.desc Verify the log timestamp 2026-12-31 23:59:59 keeps the year month day order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStamp0002', 0, () => {
      const date: Date = new Date(2026, 11, 31, 23, 59, 59);
      expect(formatDateTime(date)).assertEqual('2026-12-31 23:59:59');
      expect(formatDateTime(date).length).assertEqual(19);
      expect(formatDateTime(date).indexOf('T')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAMP_0003
     * @tc.name testStamp0003
     * @tc.desc Verify the log timestamp 2024-02-29 00:00:00 keeps the year month day order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStamp0003', 0, () => {
      const date: Date = new Date(2024, 1, 29, 0, 0, 0);
      expect(formatDateTime(date)).assertEqual('2024-02-29 00:00:00');
      expect(formatDateTime(date).length).assertEqual(19);
      expect(formatDateTime(date).indexOf('T')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAMP_0004
     * @tc.name testStamp0004
     * @tc.desc Verify the log timestamp 2000-01-01 12:30:30 keeps the year month day order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStamp0004', 0, () => {
      const date: Date = new Date(2000, 0, 1, 12, 30, 30);
      expect(formatDateTime(date)).assertEqual('2000-01-01 12:30:30');
      expect(formatDateTime(date).length).assertEqual(19);
      expect(formatDateTime(date).indexOf('T')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAMP_0005
     * @tc.name testStamp0005
     * @tc.desc Verify the log timestamp 1970-01-01 08:00:00 keeps the year month day order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStamp0005', 0, () => {
      const date: Date = new Date(1970, 0, 1, 8, 0, 0);
      expect(formatDateTime(date)).assertEqual('1970-01-01 08:00:00');
      expect(formatDateTime(date).length).assertEqual(19);
      expect(formatDateTime(date).indexOf('T')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAMP_0006
     * @tc.name testStamp0006
     * @tc.desc Verify the log timestamp 2100-07-15 09:08:07 keeps the year month day order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStamp0006', 0, () => {
      const date: Date = new Date(2100, 6, 15, 9, 8, 7);
      expect(formatDateTime(date)).assertEqual('2100-07-15 09:08:07');
      expect(formatDateTime(date).length).assertEqual(19);
      expect(formatDateTime(date).indexOf('T')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAMP_0007
     * @tc.name testStamp0007
     * @tc.desc Verify the log timestamp 2026-10-09 19:05:04 keeps the year month day order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStamp0007', 0, () => {
      const date: Date = new Date(2026, 9, 9, 19, 5, 4);
      expect(formatDateTime(date)).assertEqual('2026-10-09 19:05:04');
      expect(formatDateTime(date).length).assertEqual(19);
      expect(formatDateTime(date).indexOf('T')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_STAMP_0008
     * @tc.name testStamp0008
     * @tc.desc Verify the log timestamp 2026-03-01 06:06:06 keeps the year month day order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStamp0008', 0, () => {
      const date: Date = new Date(2026, 2, 1, 6, 6, 6);
      expect(formatDateTime(date)).assertEqual('2026-03-01 06:06:06');
      expect(formatDateTime(date).length).assertEqual(19);
      expect(formatDateTime(date).indexOf('T')).assertEqual(-1);
    });

  });
}
