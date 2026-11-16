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

export default function flipClockContactMixedTest() {
  describe('FlipClockContactMixedTest', () => {

    /**
     * @tc.name   testFlipClockContactMixed0000
     * @tc.number SUB_FLIP_CLOCK_MORE2_CMIX_0000
     * @tc.desc   Verify ContactSource mixed operation 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMixed0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMixed0000 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1; index++) {
        source.pushData(new Contact('key' + index, 'v', index));
        }
      source.deleteData(0);
        source.pushData(new Contact('tail', 'v', 100));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1);');
      expect(source.totalCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).key).assertEqual(\'tail\');');
      expect(source.getData(source.totalCount() - 1).key).assertEqual('tail');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMixed0000 end');
    })

    /**
     * @tc.name   testFlipClockContactMixed0001
     * @tc.number SUB_FLIP_CLOCK_MORE2_CMIX_0001
     * @tc.desc   Verify ContactSource mixed operation 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMixed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMixed0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 2; index++) {
        source.pushData(new Contact('key' + index, 'v', index));
        }
      source.deleteData(0);
        source.pushData(new Contact('tail', 'v', 100));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(2);');
      expect(source.totalCount()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).key).assertEqual(\'tail\');');
      expect(source.getData(source.totalCount() - 1).key).assertEqual('tail');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMixed0001 end');
    })

    /**
     * @tc.name   testFlipClockContactMixed0002
     * @tc.number SUB_FLIP_CLOCK_MORE2_CMIX_0002
     * @tc.desc   Verify ContactSource mixed operation 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMixed0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMixed0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 3; index++) {
        source.pushData(new Contact('key' + index, 'v', index));
        }
      source.deleteData(0);
        source.pushData(new Contact('tail', 'v', 100));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(3);');
      expect(source.totalCount()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).key).assertEqual(\'tail\');');
      expect(source.getData(source.totalCount() - 1).key).assertEqual('tail');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMixed0002 end');
    })

    /**
     * @tc.name   testFlipClockContactMixed0003
     * @tc.number SUB_FLIP_CLOCK_MORE2_CMIX_0003
     * @tc.desc   Verify ContactSource mixed operation 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMixed0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMixed0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 4; index++) {
        source.pushData(new Contact('key' + index, 'v', index));
        }
      source.deleteData(0);
        source.pushData(new Contact('tail', 'v', 100));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(4);');
      expect(source.totalCount()).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).key).assertEqual(\'tail\');');
      expect(source.getData(source.totalCount() - 1).key).assertEqual('tail');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMixed0003 end');
    })

    /**
     * @tc.name   testFlipClockContactMixed0004
     * @tc.number SUB_FLIP_CLOCK_MORE2_CMIX_0004
     * @tc.desc   Verify ContactSource mixed operation 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMixed0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMixed0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 5; index++) {
        source.pushData(new Contact('key' + index, 'v', index));
        }
      source.deleteData(0);
        source.pushData(new Contact('tail', 'v', 100));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(5);');
      expect(source.totalCount()).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).key).assertEqual(\'tail\');');
      expect(source.getData(source.totalCount() - 1).key).assertEqual('tail');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMixed0004 end');
    })

    /**
     * @tc.name   testFlipClockContactMixed0005
     * @tc.number SUB_FLIP_CLOCK_MORE2_CMIX_0005
     * @tc.desc   Verify ContactSource mixed operation 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMixed0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMixed0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 6; index++) {
        source.pushData(new Contact('key' + index, 'v', index));
        }
      source.deleteData(0);
        source.pushData(new Contact('tail', 'v', 100));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(6);');
      expect(source.totalCount()).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).key).assertEqual(\'tail\');');
      expect(source.getData(source.totalCount() - 1).key).assertEqual('tail');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMixed0005 end');
    })

    /**
     * @tc.name   testFlipClockContactMixed0006
     * @tc.number SUB_FLIP_CLOCK_MORE2_CMIX_0006
     * @tc.desc   Verify ContactSource mixed operation 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMixed0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMixed0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 7; index++) {
        source.pushData(new Contact('key' + index, 'v', index));
        }
      source.deleteData(0);
        source.pushData(new Contact('tail', 'v', 100));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(7);');
      expect(source.totalCount()).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).key).assertEqual(\'tail\');');
      expect(source.getData(source.totalCount() - 1).key).assertEqual('tail');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMixed0006 end');
    })

    /**
     * @tc.name   testFlipClockContactMixed0007
     * @tc.number SUB_FLIP_CLOCK_MORE2_CMIX_0007
     * @tc.desc   Verify ContactSource mixed operation 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMixed0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMixed0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 8; index++) {
        source.pushData(new Contact('key' + index, 'v', index));
        }
      source.deleteData(0);
        source.pushData(new Contact('tail', 'v', 100));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(8);');
      expect(source.totalCount()).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).key).assertEqual(\'tail\');');
      expect(source.getData(source.totalCount() - 1).key).assertEqual('tail');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMixed0007 end');
    })
  })
}
