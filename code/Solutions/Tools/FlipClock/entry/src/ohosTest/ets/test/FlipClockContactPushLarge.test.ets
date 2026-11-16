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

export default function flipClockContactPushLargeTest() {
  describe('FlipClockContactPushLargeTest', () => {

    /**
     * @tc.name   testFlipClockContactPushLarge0000
     * @tc.number SUB_FLIP_CLOCK_MORE6_CPUSH_0000
     * @tc.desc   Push 10 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPushLarge0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPushLarge0000 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 10; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(10));
      expect(source.totalCount()).assertEqual(10);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(9).reminderId), String(9));
        expect(source.getData(9).reminderId).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPushLarge0000 end');
    })

    /**
     * @tc.name   testFlipClockContactPushLarge0001
     * @tc.number SUB_FLIP_CLOCK_MORE6_CPUSH_0001
     * @tc.desc   Push 11 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPushLarge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPushLarge0001 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 11; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(11));
      expect(source.totalCount()).assertEqual(11);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(10).reminderId), String(10));
        expect(source.getData(10).reminderId).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPushLarge0001 end');
    })

    /**
     * @tc.name   testFlipClockContactPushLarge0002
     * @tc.number SUB_FLIP_CLOCK_MORE6_CPUSH_0002
     * @tc.desc   Push 12 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPushLarge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPushLarge0002 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 12; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(12));
      expect(source.totalCount()).assertEqual(12);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(11).reminderId), String(11));
        expect(source.getData(11).reminderId).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPushLarge0002 end');
    })

    /**
     * @tc.name   testFlipClockContactPushLarge0003
     * @tc.number SUB_FLIP_CLOCK_MORE6_CPUSH_0003
     * @tc.desc   Push 13 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPushLarge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPushLarge0003 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 13; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(13));
      expect(source.totalCount()).assertEqual(13);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(12).reminderId), String(12));
        expect(source.getData(12).reminderId).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPushLarge0003 end');
    })

    /**
     * @tc.name   testFlipClockContactPushLarge0004
     * @tc.number SUB_FLIP_CLOCK_MORE6_CPUSH_0004
     * @tc.desc   Push 14 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPushLarge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPushLarge0004 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 14; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(14));
      expect(source.totalCount()).assertEqual(14);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(13).reminderId), String(13));
        expect(source.getData(13).reminderId).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPushLarge0004 end');
    })

    /**
     * @tc.name   testFlipClockContactPushLarge0005
     * @tc.number SUB_FLIP_CLOCK_MORE6_CPUSH_0005
     * @tc.desc   Push 15 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPushLarge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPushLarge0005 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 15; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(15));
      expect(source.totalCount()).assertEqual(15);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(14).reminderId), String(14));
        expect(source.getData(14).reminderId).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPushLarge0005 end');
    })

    /**
     * @tc.name   testFlipClockContactPushLarge0006
     * @tc.number SUB_FLIP_CLOCK_MORE6_CPUSH_0006
     * @tc.desc   Push 16 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPushLarge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPushLarge0006 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 16; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(16));
      expect(source.totalCount()).assertEqual(16);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(15).reminderId), String(15));
        expect(source.getData(15).reminderId).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPushLarge0006 end');
    })

    /**
     * @tc.name   testFlipClockContactPushLarge0007
     * @tc.number SUB_FLIP_CLOCK_MORE6_CPUSH_0007
     * @tc.desc   Push 17 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPushLarge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPushLarge0007 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 17; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(17));
      expect(source.totalCount()).assertEqual(17);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(16).reminderId), String(16));
        expect(source.getData(16).reminderId).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPushLarge0007 end');
    })
  })
}
