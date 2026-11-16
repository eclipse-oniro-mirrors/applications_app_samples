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

export default function flipClockContactDeleteBothTest() {
  describe('FlipClockContactDeleteBothTest', () => {

    /**
     * @tc.name   ohos.samples.flipclock_ContactDeleteBoth_0001
     * @tc.number SUB_FLIP_CLOCK_MORE3_CDELB_0000
     * @tc.desc   Delete both ends from 2 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactDeleteBoth_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactDeleteBoth_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 2; index++) {
        source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(0);
        source.deleteData(source.totalCount() - 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(0));
      expect(source.totalCount()).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactDeleteBoth_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactDeleteBoth_0002
     * @tc.number SUB_FLIP_CLOCK_MORE3_CDELB_0001
     * @tc.desc   Delete both ends from 3 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactDeleteBoth_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactDeleteBoth_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 3; index++) {
        source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(0);
        source.deleteData(source.totalCount() - 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactDeleteBoth_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactDeleteBoth_0003
     * @tc.number SUB_FLIP_CLOCK_MORE3_CDELB_0002
     * @tc.desc   Delete both ends from 4 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactDeleteBoth_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactDeleteBoth_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 4; index++) {
        source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(0);
        source.deleteData(source.totalCount() - 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
      expect(source.totalCount()).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactDeleteBoth_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactDeleteBoth_0004
     * @tc.number SUB_FLIP_CLOCK_MORE3_CDELB_0003
     * @tc.desc   Delete both ends from 5 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactDeleteBoth_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactDeleteBoth_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 5; index++) {
        source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(0);
        source.deleteData(source.totalCount() - 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
      expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactDeleteBoth_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactDeleteBoth_0005
     * @tc.number SUB_FLIP_CLOCK_MORE3_CDELB_0004
     * @tc.desc   Delete both ends from 6 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactDeleteBoth_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactDeleteBoth_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 6; index++) {
        source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(0);
        source.deleteData(source.totalCount() - 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(4));
      expect(source.totalCount()).assertEqual(4);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactDeleteBoth_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactDeleteBoth_0006
     * @tc.number SUB_FLIP_CLOCK_MORE3_CDELB_0005
     * @tc.desc   Delete both ends from 7 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactDeleteBoth_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactDeleteBoth_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 7; index++) {
        source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(0);
        source.deleteData(source.totalCount() - 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(5));
      expect(source.totalCount()).assertEqual(5);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactDeleteBoth_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactDeleteBoth_0007
     * @tc.number SUB_FLIP_CLOCK_MORE3_CDELB_0006
     * @tc.desc   Delete both ends from 8 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactDeleteBoth_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactDeleteBoth_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 8; index++) {
        source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(0);
        source.deleteData(source.totalCount() - 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(6));
      expect(source.totalCount()).assertEqual(6);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactDeleteBoth_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactDeleteBoth_0008
     * @tc.number SUB_FLIP_CLOCK_MORE3_CDELB_0007
     * @tc.desc   Delete both ends from 9 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactDeleteBoth_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactDeleteBoth_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 9; index++) {
        source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(0);
        source.deleteData(source.totalCount() - 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(7));
      expect(source.totalCount()).assertEqual(7);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactDeleteBoth_0008 end');
    })
  })
}
