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

export default function flipClockVolume2Contact20Test() {
  describe('FlipClockVolume2Contact20Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0001
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0001
     * @tc.desc   Verify source.totalCount() equals 981.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 981; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(981));
      expect(source.totalCount()).assertEqual(981);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(980).reminderId), String(980));
      expect(source.getData(980).reminderId).assertEqual(980);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0002
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0002
     * @tc.desc   Verify source.totalCount() equals 982.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 982; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(982));
      expect(source.totalCount()).assertEqual(982);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(981).reminderId), String(981));
      expect(source.getData(981).reminderId).assertEqual(981);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0003
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0003
     * @tc.desc   Verify source.totalCount() equals 983.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 983; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(983));
      expect(source.totalCount()).assertEqual(983);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(982).reminderId), String(982));
      expect(source.getData(982).reminderId).assertEqual(982);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0004
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0004
     * @tc.desc   Verify source.totalCount() equals 984.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 984; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(984));
      expect(source.totalCount()).assertEqual(984);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(983).reminderId), String(983));
      expect(source.getData(983).reminderId).assertEqual(983);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0005
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0005
     * @tc.desc   Verify source.totalCount() equals 985.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 985; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(985));
      expect(source.totalCount()).assertEqual(985);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(984).reminderId), String(984));
      expect(source.getData(984).reminderId).assertEqual(984);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0006
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0006
     * @tc.desc   Verify source.totalCount() equals 986.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 986; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(986));
      expect(source.totalCount()).assertEqual(986);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(985).reminderId), String(985));
      expect(source.getData(985).reminderId).assertEqual(985);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0007
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0007
     * @tc.desc   Verify source.totalCount() equals 987.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 987; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(987));
      expect(source.totalCount()).assertEqual(987);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(986).reminderId), String(986));
      expect(source.getData(986).reminderId).assertEqual(986);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0008
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0008
     * @tc.desc   Verify source.totalCount() equals 988.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 988; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(988));
      expect(source.totalCount()).assertEqual(988);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(987).reminderId), String(987));
      expect(source.getData(987).reminderId).assertEqual(987);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0009
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0009
     * @tc.desc   Verify source.totalCount() equals 989.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 989; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(989));
      expect(source.totalCount()).assertEqual(989);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(988).reminderId), String(988));
      expect(source.getData(988).reminderId).assertEqual(988);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0010
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0010
     * @tc.desc   Verify source.totalCount() equals 990.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 990; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(990));
      expect(source.totalCount()).assertEqual(990);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(989).reminderId), String(989));
      expect(source.getData(989).reminderId).assertEqual(989);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0011
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0011
     * @tc.desc   Verify source.totalCount() equals 991.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 991; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(991));
      expect(source.totalCount()).assertEqual(991);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(990).reminderId), String(990));
      expect(source.getData(990).reminderId).assertEqual(990);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0012
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0012
     * @tc.desc   Verify source.totalCount() equals 992.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 992; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(992));
      expect(source.totalCount()).assertEqual(992);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(991).reminderId), String(991));
      expect(source.getData(991).reminderId).assertEqual(991);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0013
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0013
     * @tc.desc   Verify source.totalCount() equals 993.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 993; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(993));
      expect(source.totalCount()).assertEqual(993);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(992).reminderId), String(992));
      expect(source.getData(992).reminderId).assertEqual(992);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0014
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0014
     * @tc.desc   Verify source.totalCount() equals 994.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 994; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(994));
      expect(source.totalCount()).assertEqual(994);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(993).reminderId), String(993));
      expect(source.getData(993).reminderId).assertEqual(993);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0015
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0015
     * @tc.desc   Verify source.totalCount() equals 995.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 995; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(995));
      expect(source.totalCount()).assertEqual(995);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(994).reminderId), String(994));
      expect(source.getData(994).reminderId).assertEqual(994);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0016
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0016
     * @tc.desc   Verify source.totalCount() equals 996.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 996; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(996));
      expect(source.totalCount()).assertEqual(996);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(995).reminderId), String(995));
      expect(source.getData(995).reminderId).assertEqual(995);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0017
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0017
     * @tc.desc   Verify source.totalCount() equals 997.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 997; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(997));
      expect(source.totalCount()).assertEqual(997);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(996).reminderId), String(996));
      expect(source.getData(996).reminderId).assertEqual(996);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0018
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0018
     * @tc.desc   Verify source.totalCount() equals 998.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 998; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(998));
      expect(source.totalCount()).assertEqual(998);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(997).reminderId), String(997));
      expect(source.getData(997).reminderId).assertEqual(997);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0019
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0019
     * @tc.desc   Verify source.totalCount() equals 999.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 999; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(999));
      expect(source.totalCount()).assertEqual(999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(998).reminderId), String(998));
      expect(source.getData(998).reminderId).assertEqual(998);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact20_0020
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0020
     * @tc.desc   Verify source.totalCount() equals 1000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact20_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1000; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1000));
      expect(source.totalCount()).assertEqual(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(999).reminderId), String(999));
      expect(source.getData(999).reminderId).assertEqual(999);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact20_0020 end');
    })
  })
}
