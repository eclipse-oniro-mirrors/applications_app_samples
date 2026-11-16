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

export default function flipClockContactDeleteLargeTest() {
  describe('FlipClockContactDeleteLargeTest', () => {

    /**
     * @tc.name   testFlipClockContactDeleteLarge0000
     * @tc.number SUB_FLIP_CLOCK_MORE6_CDEL_0000
     * @tc.desc   Delete first from 10 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteLarge0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteLarge0000 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 10; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(9);');
        expect(source.totalCount()).assertEqual(9);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteLarge0000 end');
    })

    /**
     * @tc.name   testFlipClockContactDeleteLarge0001
     * @tc.number SUB_FLIP_CLOCK_MORE6_CDEL_0001
     * @tc.desc   Delete first from 11 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteLarge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteLarge0001 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 11; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(10);');
        expect(source.totalCount()).assertEqual(10);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteLarge0001 end');
    })

    /**
     * @tc.name   testFlipClockContactDeleteLarge0002
     * @tc.number SUB_FLIP_CLOCK_MORE6_CDEL_0002
     * @tc.desc   Delete first from 12 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteLarge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteLarge0002 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 12; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(11);');
        expect(source.totalCount()).assertEqual(11);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteLarge0002 end');
    })

    /**
     * @tc.name   testFlipClockContactDeleteLarge0003
     * @tc.number SUB_FLIP_CLOCK_MORE6_CDEL_0003
     * @tc.desc   Delete first from 13 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteLarge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteLarge0003 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 13; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(12);');
        expect(source.totalCount()).assertEqual(12);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteLarge0003 end');
    })

    /**
     * @tc.name   testFlipClockContactDeleteLarge0004
     * @tc.number SUB_FLIP_CLOCK_MORE6_CDEL_0004
     * @tc.desc   Delete first from 14 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteLarge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteLarge0004 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 14; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(13);');
        expect(source.totalCount()).assertEqual(13);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteLarge0004 end');
    })

    /**
     * @tc.name   testFlipClockContactDeleteLarge0005
     * @tc.number SUB_FLIP_CLOCK_MORE6_CDEL_0005
     * @tc.desc   Delete first from 15 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteLarge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteLarge0005 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 15; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(14);');
        expect(source.totalCount()).assertEqual(14);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteLarge0005 end');
    })

    /**
     * @tc.name   testFlipClockContactDeleteLarge0006
     * @tc.number SUB_FLIP_CLOCK_MORE6_CDEL_0006
     * @tc.desc   Delete first from 16 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteLarge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteLarge0006 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 16; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(15);');
        expect(source.totalCount()).assertEqual(15);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteLarge0006 end');
    })

    /**
     * @tc.name   testFlipClockContactDeleteLarge0007
     * @tc.number SUB_FLIP_CLOCK_MORE6_CDEL_0007
     * @tc.desc   Delete first from 17 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteLarge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteLarge0007 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 17; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(16);');
        expect(source.totalCount()).assertEqual(16);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteLarge0007 end');
    })
  })
}
