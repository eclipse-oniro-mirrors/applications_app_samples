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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ContactSource, Contact } from '../../../main/ets/common/DataSource';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function flipClockVolumeContactRange01Test() {
  describe('FlipClockVolumeContactRange01Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContactRange01_0001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_RANGE_01_0001
     * @tc.desc   Verify ContactSource count and boundary entries for 1 to 200 items.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContactRange01_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContactRange01_0001 begin');
      for (let count: number = 1; count <= 200; count++) {
        const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < count; index++) {
          source.pushData(new Contact('key' + index, 'value', index));
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(count));
        expect(source.totalCount()).assertEqual(count);
        expect(source.getData(0).key).assertEqual('key0');
        expect(source.getData(count - 1).reminderId).assertEqual(count - 1);
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContactRange01_0001 end');
    })
  })
}
