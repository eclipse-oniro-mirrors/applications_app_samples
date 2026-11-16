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

export default function flipClockVolume2Contact24Test() {
  describe('FlipClockVolume2Contact24Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0001
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0001
     * @tc.desc   Verify source.totalCount() equals 1061.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1061; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1061));
      expect(source.totalCount()).assertEqual(1061);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1060).reminderId), String(1060));
      expect(source.getData(1060).reminderId).assertEqual(1060);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0002
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0002
     * @tc.desc   Verify source.totalCount() equals 1062.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1062; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1062));
      expect(source.totalCount()).assertEqual(1062);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1061).reminderId), String(1061));
      expect(source.getData(1061).reminderId).assertEqual(1061);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0003
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0003
     * @tc.desc   Verify source.totalCount() equals 1063.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1063; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1063));
      expect(source.totalCount()).assertEqual(1063);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1062).reminderId), String(1062));
      expect(source.getData(1062).reminderId).assertEqual(1062);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0004
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0004
     * @tc.desc   Verify source.totalCount() equals 1064.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1064; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1064));
      expect(source.totalCount()).assertEqual(1064);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1063).reminderId), String(1063));
      expect(source.getData(1063).reminderId).assertEqual(1063);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0005
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0005
     * @tc.desc   Verify source.totalCount() equals 1065.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1065; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1065));
      expect(source.totalCount()).assertEqual(1065);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1064).reminderId), String(1064));
      expect(source.getData(1064).reminderId).assertEqual(1064);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0006
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0006
     * @tc.desc   Verify source.totalCount() equals 1066.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1066; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1066));
      expect(source.totalCount()).assertEqual(1066);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1065).reminderId), String(1065));
      expect(source.getData(1065).reminderId).assertEqual(1065);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0007
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0007
     * @tc.desc   Verify source.totalCount() equals 1067.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1067; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1067));
      expect(source.totalCount()).assertEqual(1067);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1066).reminderId), String(1066));
      expect(source.getData(1066).reminderId).assertEqual(1066);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0008
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0008
     * @tc.desc   Verify source.totalCount() equals 1068.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1068; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1068));
      expect(source.totalCount()).assertEqual(1068);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1067).reminderId), String(1067));
      expect(source.getData(1067).reminderId).assertEqual(1067);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0009
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0009
     * @tc.desc   Verify source.totalCount() equals 1069.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1069; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1069));
      expect(source.totalCount()).assertEqual(1069);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1068).reminderId), String(1068));
      expect(source.getData(1068).reminderId).assertEqual(1068);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0010
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0010
     * @tc.desc   Verify source.totalCount() equals 1070.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1070; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1070));
      expect(source.totalCount()).assertEqual(1070);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1069).reminderId), String(1069));
      expect(source.getData(1069).reminderId).assertEqual(1069);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0011
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0011
     * @tc.desc   Verify source.totalCount() equals 1071.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1071; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1071));
      expect(source.totalCount()).assertEqual(1071);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1070).reminderId), String(1070));
      expect(source.getData(1070).reminderId).assertEqual(1070);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0012
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0012
     * @tc.desc   Verify source.totalCount() equals 1072.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1072; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1072));
      expect(source.totalCount()).assertEqual(1072);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1071).reminderId), String(1071));
      expect(source.getData(1071).reminderId).assertEqual(1071);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0013
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0013
     * @tc.desc   Verify source.totalCount() equals 1073.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1073; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1073));
      expect(source.totalCount()).assertEqual(1073);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1072).reminderId), String(1072));
      expect(source.getData(1072).reminderId).assertEqual(1072);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0014
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0014
     * @tc.desc   Verify source.totalCount() equals 1074.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1074; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1074));
      expect(source.totalCount()).assertEqual(1074);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1073).reminderId), String(1073));
      expect(source.getData(1073).reminderId).assertEqual(1073);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0015
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0015
     * @tc.desc   Verify source.totalCount() equals 1075.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1075; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1075));
      expect(source.totalCount()).assertEqual(1075);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1074).reminderId), String(1074));
      expect(source.getData(1074).reminderId).assertEqual(1074);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0016
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0016
     * @tc.desc   Verify source.totalCount() equals 1076.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1076; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1076));
      expect(source.totalCount()).assertEqual(1076);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1075).reminderId), String(1075));
      expect(source.getData(1075).reminderId).assertEqual(1075);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0017
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0017
     * @tc.desc   Verify source.totalCount() equals 1077.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1077; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1077));
      expect(source.totalCount()).assertEqual(1077);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1076).reminderId), String(1076));
      expect(source.getData(1076).reminderId).assertEqual(1076);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0018
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0018
     * @tc.desc   Verify source.totalCount() equals 1078.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1078; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1078));
      expect(source.totalCount()).assertEqual(1078);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1077).reminderId), String(1077));
      expect(source.getData(1077).reminderId).assertEqual(1077);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0019
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0019
     * @tc.desc   Verify source.totalCount() equals 1079.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1079; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1079));
      expect(source.totalCount()).assertEqual(1079);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1078).reminderId), String(1078));
      expect(source.getData(1078).reminderId).assertEqual(1078);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact24_0020
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0020
     * @tc.desc   Verify source.totalCount() equals 1080.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact24_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1080; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1080));
      expect(source.totalCount()).assertEqual(1080);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1079).reminderId), String(1079));
      expect(source.getData(1079).reminderId).assertEqual(1079);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact24_0020 end');
    })
  })
}
