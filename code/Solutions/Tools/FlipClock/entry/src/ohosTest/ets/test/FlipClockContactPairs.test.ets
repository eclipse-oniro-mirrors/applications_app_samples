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

export default function flipClockContactPairsTest() {
  describe('FlipClockContactPairsTest', () => {

    /**
     * @tc.name   testFlipClockContactPairs0000
     * @tc.number SUB_FLIP_CLOCK_MORE3_CPAIR_0000
     * @tc.desc   Push paired contacts 1 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPairs0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPairs0000 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1; index++) {
        source.pushData(new Contact('k' + index, 'v', index));
        source.pushData(new Contact('k' + index + 'b', 'v', index + 100));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(2);');
      expect(source.totalCount()).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'k0\');');
        expect(source.getData(0).key).assertEqual('k0');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(100);');
        expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPairs0000 end');
    })

    /**
     * @tc.name   testFlipClockContactPairs0001
     * @tc.number SUB_FLIP_CLOCK_MORE3_CPAIR_0001
     * @tc.desc   Push paired contacts 2 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPairs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPairs0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 2; index++) {
        source.pushData(new Contact('k' + index, 'v', index));
        source.pushData(new Contact('k' + index + 'b', 'v', index + 100));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(4);');
      expect(source.totalCount()).assertEqual(4);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'k0\');');
        expect(source.getData(0).key).assertEqual('k0');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(101);');
        expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPairs0001 end');
    })

    /**
     * @tc.name   testFlipClockContactPairs0002
     * @tc.number SUB_FLIP_CLOCK_MORE3_CPAIR_0002
     * @tc.desc   Push paired contacts 3 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPairs0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPairs0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 3; index++) {
        source.pushData(new Contact('k' + index, 'v', index));
        source.pushData(new Contact('k' + index + 'b', 'v', index + 100));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(6);');
      expect(source.totalCount()).assertEqual(6);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'k0\');');
        expect(source.getData(0).key).assertEqual('k0');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(102);');
        expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(102);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPairs0002 end');
    })

    /**
     * @tc.name   testFlipClockContactPairs0003
     * @tc.number SUB_FLIP_CLOCK_MORE3_CPAIR_0003
     * @tc.desc   Push paired contacts 4 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPairs0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPairs0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 4; index++) {
        source.pushData(new Contact('k' + index, 'v', index));
        source.pushData(new Contact('k' + index + 'b', 'v', index + 100));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(8);');
      expect(source.totalCount()).assertEqual(8);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'k0\');');
        expect(source.getData(0).key).assertEqual('k0');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(103);');
        expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(103);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPairs0003 end');
    })

    /**
     * @tc.name   testFlipClockContactPairs0004
     * @tc.number SUB_FLIP_CLOCK_MORE3_CPAIR_0004
     * @tc.desc   Push paired contacts 5 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPairs0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPairs0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 5; index++) {
        source.pushData(new Contact('k' + index, 'v', index));
        source.pushData(new Contact('k' + index + 'b', 'v', index + 100));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(10);');
      expect(source.totalCount()).assertEqual(10);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'k0\');');
        expect(source.getData(0).key).assertEqual('k0');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(104);');
        expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPairs0004 end');
    })

    /**
     * @tc.name   testFlipClockContactPairs0005
     * @tc.number SUB_FLIP_CLOCK_MORE3_CPAIR_0005
     * @tc.desc   Push paired contacts 6 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPairs0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPairs0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 6; index++) {
        source.pushData(new Contact('k' + index, 'v', index));
        source.pushData(new Contact('k' + index + 'b', 'v', index + 100));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(12);');
      expect(source.totalCount()).assertEqual(12);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'k0\');');
        expect(source.getData(0).key).assertEqual('k0');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(105);');
        expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPairs0005 end');
    })

    /**
     * @tc.name   testFlipClockContactPairs0006
     * @tc.number SUB_FLIP_CLOCK_MORE3_CPAIR_0006
     * @tc.desc   Push paired contacts 7 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPairs0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPairs0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 7; index++) {
        source.pushData(new Contact('k' + index, 'v', index));
        source.pushData(new Contact('k' + index + 'b', 'v', index + 100));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(14);');
      expect(source.totalCount()).assertEqual(14);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'k0\');');
        expect(source.getData(0).key).assertEqual('k0');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(106);');
        expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(106);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPairs0006 end');
    })

    /**
     * @tc.name   testFlipClockContactPairs0007
     * @tc.number SUB_FLIP_CLOCK_MORE3_CPAIR_0007
     * @tc.desc   Push paired contacts 8 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPairs0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPairs0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 8; index++) {
        source.pushData(new Contact('k' + index, 'v', index));
        source.pushData(new Contact('k' + index + 'b', 'v', index + 100));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(16);');
      expect(source.totalCount()).assertEqual(16);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'k0\');');
        expect(source.getData(0).key).assertEqual('k0');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(107);');
        expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(107);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactPairs0007 end');
    })
  })
}
