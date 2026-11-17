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

export default function flipClockVolumeContact19Test() {
  describe('FlipClockVolumeContact19Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0001
     * @tc.desc   Verify source.totalCount() equals 361.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 361; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(361));
      expect(source.totalCount()).assertEqual(361);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(360).reminderId), String(360));
      expect(source.getData(360).reminderId).assertEqual(360);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0002
     * @tc.desc   Verify source.totalCount() equals 362.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 362; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(362));
      expect(source.totalCount()).assertEqual(362);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(361).reminderId), String(361));
      expect(source.getData(361).reminderId).assertEqual(361);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0003
     * @tc.desc   Verify source.totalCount() equals 363.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 363; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(363));
      expect(source.totalCount()).assertEqual(363);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(362).reminderId), String(362));
      expect(source.getData(362).reminderId).assertEqual(362);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0004
     * @tc.desc   Verify source.totalCount() equals 364.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 364; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(364));
      expect(source.totalCount()).assertEqual(364);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(363).reminderId), String(363));
      expect(source.getData(363).reminderId).assertEqual(363);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0005
     * @tc.desc   Verify source.totalCount() equals 365.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 365; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(365));
      expect(source.totalCount()).assertEqual(365);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(364).reminderId), String(364));
      expect(source.getData(364).reminderId).assertEqual(364);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0006
     * @tc.desc   Verify source.totalCount() equals 366.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 366; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(366));
      expect(source.totalCount()).assertEqual(366);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(365).reminderId), String(365));
      expect(source.getData(365).reminderId).assertEqual(365);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0007
     * @tc.desc   Verify source.totalCount() equals 367.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 367; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(367));
      expect(source.totalCount()).assertEqual(367);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(366).reminderId), String(366));
      expect(source.getData(366).reminderId).assertEqual(366);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0008
     * @tc.desc   Verify source.totalCount() equals 368.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 368; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(368));
      expect(source.totalCount()).assertEqual(368);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(367).reminderId), String(367));
      expect(source.getData(367).reminderId).assertEqual(367);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0009
     * @tc.desc   Verify source.totalCount() equals 369.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 369; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(369));
      expect(source.totalCount()).assertEqual(369);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(368).reminderId), String(368));
      expect(source.getData(368).reminderId).assertEqual(368);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0010
     * @tc.desc   Verify source.totalCount() equals 370.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 370; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(370));
      expect(source.totalCount()).assertEqual(370);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(369).reminderId), String(369));
      expect(source.getData(369).reminderId).assertEqual(369);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0011
     * @tc.desc   Verify source.totalCount() equals 371.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 371; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(371));
      expect(source.totalCount()).assertEqual(371);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(370).reminderId), String(370));
      expect(source.getData(370).reminderId).assertEqual(370);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0012
     * @tc.desc   Verify source.totalCount() equals 372.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 372; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(372));
      expect(source.totalCount()).assertEqual(372);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(371).reminderId), String(371));
      expect(source.getData(371).reminderId).assertEqual(371);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0013
     * @tc.desc   Verify source.totalCount() equals 373.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 373; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(373));
      expect(source.totalCount()).assertEqual(373);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(372).reminderId), String(372));
      expect(source.getData(372).reminderId).assertEqual(372);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0014
     * @tc.desc   Verify source.totalCount() equals 374.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 374; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(374));
      expect(source.totalCount()).assertEqual(374);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(373).reminderId), String(373));
      expect(source.getData(373).reminderId).assertEqual(373);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0015
     * @tc.desc   Verify source.totalCount() equals 375.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 375; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(375));
      expect(source.totalCount()).assertEqual(375);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(374).reminderId), String(374));
      expect(source.getData(374).reminderId).assertEqual(374);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0016
     * @tc.desc   Verify source.totalCount() equals 376.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 376; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(376));
      expect(source.totalCount()).assertEqual(376);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(375).reminderId), String(375));
      expect(source.getData(375).reminderId).assertEqual(375);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0017
     * @tc.desc   Verify source.totalCount() equals 377.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 377; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(377));
      expect(source.totalCount()).assertEqual(377);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(376).reminderId), String(376));
      expect(source.getData(376).reminderId).assertEqual(376);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0018
     * @tc.desc   Verify source.totalCount() equals 378.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 378; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(378));
      expect(source.totalCount()).assertEqual(378);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(377).reminderId), String(377));
      expect(source.getData(377).reminderId).assertEqual(377);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0019
     * @tc.desc   Verify source.totalCount() equals 379.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 379; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(379));
      expect(source.totalCount()).assertEqual(379);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(378).reminderId), String(378));
      expect(source.getData(378).reminderId).assertEqual(378);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact19_0020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0020
     * @tc.desc   Verify source.totalCount() equals 380.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact19_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 380; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(380));
      expect(source.totalCount()).assertEqual(380);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(379).reminderId), String(379));
      expect(source.getData(379).reminderId).assertEqual(379);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact19_0020 end');
    })
  })
}
