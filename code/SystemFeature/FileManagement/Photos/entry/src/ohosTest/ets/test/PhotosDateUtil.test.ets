/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { DateUtil } from '../../../main/ets/utils/DateUtil';

const TAG = '[Sample_PhotosDateUtilTest]';
const DOMAIN = 0xF811;

export default function PhotosDateUtilTest(): void {
  describe('PhotosDateUtilTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DATE_0100
     * @tc.name      testPhotosDateUtilDuration0001
     * @tc.desc      Formats normal durations into minute and hour display text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateUtilDuration0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateUtilDuration0001 begin');
      expect(DateUtil.getFormattedDuration(61000)).assertEqual('01:01');
      expect(DateUtil.getFormattedDuration(3600000)).assertEqual('1:00:00');
      expect(DateUtil.getFormattedDuration(3661000)).assertEqual('1:01:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateUtilDuration0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DATE_0200
     * @tc.name      testPhotosDateUtilDurationBoundary0002
     * @tc.desc      Covers zero, negative, sub-second, and minute-boundary durations.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateUtilDurationBoundary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateUtilDurationBoundary0002 begin');
      expect(DateUtil.getFormattedDuration(0)).assertEqual('00:00');
      expect(DateUtil.getFormattedDuration(-1)).assertEqual('00:00');
      expect(DateUtil.getFormattedDuration(1)).assertEqual('00:01');
      expect(DateUtil.getFormattedDuration(999)).assertEqual('00:01');
      expect(DateUtil.getFormattedDuration(59999)).assertEqual('00:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateUtilDurationBoundary0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DATE_0300
     * @tc.name      testPhotosDateFormat0003
     * @tc.desc      Formats fixed date components and preserves timestamp when no pattern is supplied.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormat0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormat0003 begin');
      const date: Date = new Date(2024, 0, 2, 3, 4, 5);
      expect(DateUtil.format(date, 'MM/dd HH:mm:ss')).assertEqual('01/02 03:04:05');
      expect(DateUtil.format(date)).assertEqual(date.valueOf().toString());
      expect(DateUtil.format(date, '')).assertEqual(date.valueOf().toString());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormat0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DATE_0400
     * @tc.name      testPhotosDateUtilSameDay0004
     * @tc.desc      Compares timestamps within the same day and across adjacent days.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateUtilSameDay0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateUtilSameDay0004 begin');
      const morning: number = new Date(2024, 0, 2, 0, 0, 0).getTime();
      const night: number = new Date(2024, 0, 2, 23, 59, 59).getTime();
      const nextDay: number = new Date(2024, 0, 3, 0, 0, 0).getTime();
      expect(DateUtil.isTheSameDay(morning, morning)).assertTrue();
      expect(DateUtil.isTheSameDay(morning, night)).assertTrue();
      expect(DateUtil.isTheSameDay(morning, nextDay)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateUtilSameDay0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DATE_0500
     * @tc.name      testPhotosDateUtilSameYear0005
     * @tc.desc      Compares timestamps at the start and end of a year and across years.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateUtilSameYear0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateUtilSameYear0005 begin');
      const firstDay: number = new Date(2024, 0, 1, 0, 0, 0).getTime();
      const lastDay: number = new Date(2024, 11, 31, 23, 59, 59).getTime();
      const nextYear: number = new Date(2025, 0, 1, 0, 0, 0).getTime();
      expect(DateUtil.isTheSameYear(firstDay, firstDay)).assertTrue();
      expect(DateUtil.isTheSameYear(firstDay, lastDay)).assertTrue();
      expect(DateUtil.isTheSameYear(lastDay, nextYear)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateUtilSameYear0005 end');
    })
  })
}
