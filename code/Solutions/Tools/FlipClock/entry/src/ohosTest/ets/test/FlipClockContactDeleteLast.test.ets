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

export default function flipClockContactDeleteLastTest() {
  describe('FlipClockContactDeleteLastTest', () => {

    /**
     * @tc.name   testFlipClockContactDelLast0000
     * @tc.number SUB_FLIP_CLOCK_MORE5_CDLAST_0000
     * @tc.desc   Delete last contact from 2 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDelLast0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDelLast0000 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 2; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(source.totalCount() - 1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1);');
        expect(source.totalCount()).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1) === undefined).assertTrue();');
        expect(source.getData(1) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDelLast0000 end');
    })

    /**
     * @tc.name   testFlipClockContactDelLast0001
     * @tc.number SUB_FLIP_CLOCK_MORE5_CDLAST_0001
     * @tc.desc   Delete last contact from 3 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDelLast0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDelLast0001 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 3; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(source.totalCount() - 1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(2);');
        expect(source.totalCount()).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(2) === undefined).assertTrue();');
        expect(source.getData(2) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDelLast0001 end');
    })

    /**
     * @tc.name   testFlipClockContactDelLast0002
     * @tc.number SUB_FLIP_CLOCK_MORE5_CDLAST_0002
     * @tc.desc   Delete last contact from 4 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDelLast0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDelLast0002 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 4; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(source.totalCount() - 1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(3);');
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(3) === undefined).assertTrue();');
        expect(source.getData(3) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDelLast0002 end');
    })

    /**
     * @tc.name   testFlipClockContactDelLast0003
     * @tc.number SUB_FLIP_CLOCK_MORE5_CDLAST_0003
     * @tc.desc   Delete last contact from 5 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDelLast0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDelLast0003 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 5; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(source.totalCount() - 1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(4);');
        expect(source.totalCount()).assertEqual(4);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(4) === undefined).assertTrue();');
        expect(source.getData(4) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDelLast0003 end');
    })

    /**
     * @tc.name   testFlipClockContactDelLast0004
     * @tc.number SUB_FLIP_CLOCK_MORE5_CDLAST_0004
     * @tc.desc   Delete last contact from 6 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDelLast0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDelLast0004 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 6; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(source.totalCount() - 1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(5);');
        expect(source.totalCount()).assertEqual(5);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(5) === undefined).assertTrue();');
        expect(source.getData(5) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDelLast0004 end');
    })

    /**
     * @tc.name   testFlipClockContactDelLast0005
     * @tc.number SUB_FLIP_CLOCK_MORE5_CDLAST_0005
     * @tc.desc   Delete last contact from 7 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDelLast0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDelLast0005 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 7; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(source.totalCount() - 1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(6);');
        expect(source.totalCount()).assertEqual(6);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(6) === undefined).assertTrue();');
        expect(source.getData(6) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDelLast0005 end');
    })

    /**
     * @tc.name   testFlipClockContactDelLast0006
     * @tc.number SUB_FLIP_CLOCK_MORE5_CDLAST_0006
     * @tc.desc   Delete last contact from 8 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDelLast0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDelLast0006 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 8; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(source.totalCount() - 1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(7);');
        expect(source.totalCount()).assertEqual(7);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(7) === undefined).assertTrue();');
        expect(source.getData(7) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDelLast0006 end');
    })

    /**
     * @tc.name   testFlipClockContactDelLast0007
     * @tc.number SUB_FLIP_CLOCK_MORE5_CDLAST_0007
     * @tc.desc   Delete last contact from 9 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDelLast0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDelLast0007 begin');
      const source: ContactSource = new ContactSource([]);
        for (let index: number = 0; index < 9; index++) {
          source.pushData(new Contact('k' + index, 'v', index));
        }
      source.deleteData(source.totalCount() - 1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(8);');
        expect(source.totalCount()).assertEqual(8);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(8) === undefined).assertTrue();');
        expect(source.getData(8) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDelLast0007 end');
    })
  })
}
