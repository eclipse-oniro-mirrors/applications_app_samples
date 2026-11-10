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
import HiLog from '@ohos.hilog';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { DateUtil } from '../../../main/ets/utils/DateUtil';

const TAG = '[Sample_PhotosDateRangeExtTest]';
const DOMAIN = 0xF811;

export default function PhotosDateRangeExtTest(): void {
  describe('PhotosDateRangeExtTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0001
     * @tc.name      testPhotosDateSameDayExt0001
     * @tc.desc      Compares extended same-day sample 1. case 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0001 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 1, 0, 0, 0).getTime(), new Date(2024, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0002
