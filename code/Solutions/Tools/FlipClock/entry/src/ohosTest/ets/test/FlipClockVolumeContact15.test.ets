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

export default function flipClockVolumeContact15Test() {
  describe('FlipClockVolumeContact15Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0001
     * @tc.desc   Verify source.totalCount() equals 281.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 281; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(281));
      expect(source.totalCount()).assertEqual(281);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(280).reminderId), String(280));
      expect(source.getData(280).reminderId).assertEqual(280);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0002
     * @tc.desc   Verify source.totalCount() equals 282.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 282; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(282));
      expect(source.totalCount()).assertEqual(282);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(281).reminderId), String(281));
      expect(source.getData(281).reminderId).assertEqual(281);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0003
     * @tc.desc   Verify source.totalCount() equals 283.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 283; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(283));
      expect(source.totalCount()).assertEqual(283);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(282).reminderId), String(282));
      expect(source.getData(282).reminderId).assertEqual(282);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0004
     * @tc.desc   Verify source.totalCount() equals 284.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 284; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(284));
      expect(source.totalCount()).assertEqual(284);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(283).reminderId), String(283));
      expect(source.getData(283).reminderId).assertEqual(283);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0005
     * @tc.desc   Verify source.totalCount() equals 285.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 285; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(285));
      expect(source.totalCount()).assertEqual(285);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(284).reminderId), String(284));
      expect(source.getData(284).reminderId).assertEqual(284);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0006
     * @tc.desc   Verify source.totalCount() equals 286.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 286; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(286));
      expect(source.totalCount()).assertEqual(286);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(285).reminderId), String(285));
      expect(source.getData(285).reminderId).assertEqual(285);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0007
     * @tc.desc   Verify source.totalCount() equals 287.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 287; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(287));
      expect(source.totalCount()).assertEqual(287);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(286).reminderId), String(286));
      expect(source.getData(286).reminderId).assertEqual(286);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0008
     * @tc.desc   Verify source.totalCount() equals 288.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 288; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(288));
      expect(source.totalCount()).assertEqual(288);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(287).reminderId), String(287));
      expect(source.getData(287).reminderId).assertEqual(287);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0009
     * @tc.desc   Verify source.totalCount() equals 289.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 289; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(289));
      expect(source.totalCount()).assertEqual(289);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(288).reminderId), String(288));
      expect(source.getData(288).reminderId).assertEqual(288);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0010
     * @tc.desc   Verify source.totalCount() equals 290.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 290; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(290));
      expect(source.totalCount()).assertEqual(290);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(289).reminderId), String(289));
      expect(source.getData(289).reminderId).assertEqual(289);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0011
     * @tc.desc   Verify source.totalCount() equals 291.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 291; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(291));
      expect(source.totalCount()).assertEqual(291);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(290).reminderId), String(290));
      expect(source.getData(290).reminderId).assertEqual(290);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0012
     * @tc.desc   Verify source.totalCount() equals 292.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 292; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(292));
      expect(source.totalCount()).assertEqual(292);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(291).reminderId), String(291));
      expect(source.getData(291).reminderId).assertEqual(291);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0013
     * @tc.desc   Verify source.totalCount() equals 293.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 293; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(293));
      expect(source.totalCount()).assertEqual(293);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(292).reminderId), String(292));
      expect(source.getData(292).reminderId).assertEqual(292);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0014
     * @tc.desc   Verify source.totalCount() equals 294.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 294; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(294));
      expect(source.totalCount()).assertEqual(294);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(293).reminderId), String(293));
      expect(source.getData(293).reminderId).assertEqual(293);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0015
     * @tc.desc   Verify source.totalCount() equals 295.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 295; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(295));
      expect(source.totalCount()).assertEqual(295);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(294).reminderId), String(294));
      expect(source.getData(294).reminderId).assertEqual(294);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0016
     * @tc.desc   Verify source.totalCount() equals 296.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 296; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(296));
      expect(source.totalCount()).assertEqual(296);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(295).reminderId), String(295));
      expect(source.getData(295).reminderId).assertEqual(295);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0017
     * @tc.desc   Verify source.totalCount() equals 297.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 297; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(297));
      expect(source.totalCount()).assertEqual(297);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(296).reminderId), String(296));
      expect(source.getData(296).reminderId).assertEqual(296);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0018
     * @tc.desc   Verify source.totalCount() equals 298.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 298; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(298));
      expect(source.totalCount()).assertEqual(298);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(297).reminderId), String(297));
      expect(source.getData(297).reminderId).assertEqual(297);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0019
     * @tc.desc   Verify source.totalCount() equals 299.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 299; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(299));
      expect(source.totalCount()).assertEqual(299);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(298).reminderId), String(298));
      expect(source.getData(298).reminderId).assertEqual(298);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact15_0020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0020
     * @tc.desc   Verify source.totalCount() equals 300.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact15_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 300; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(300));
      expect(source.totalCount()).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(299).reminderId), String(299));
      expect(source.getData(299).reminderId).assertEqual(299);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact15_0020 end');
    })
  })
}
