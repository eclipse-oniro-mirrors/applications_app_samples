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

export default function flipClockContactSourceReplaceTest() {
  describe('FlipClockContactSourceReplaceTest', () => {

    /**
     * @tc.name   testFlipClockContactreplace0000
     * @tc.number SUB_FLIP_CLOCK_CONTACT_REPLACE_0000
     * @tc.desc   Replace ContactSource content with 0 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactreplace0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactreplace0000 begin');
      const source: ContactSource = new ContactSource([]);
      const next: Contact[] = [];
      for (let index: number = 0; index < 0; index++) {
        next.push(new Contact('key' + index, 'value', index));
        }
      source.replaceData(next);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(0));
      expect(source.totalCount()).assertEqual(0);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
        expect(source.getData(0).key).assertEqual('key0');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactreplace0000 end');
    })

    /**
     * @tc.name   testFlipClockContactreplace0001
     * @tc.number SUB_FLIP_CLOCK_CONTACT_REPLACE_0001
     * @tc.desc   Replace ContactSource content with 1 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactreplace0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactreplace0001 begin');
      const source: ContactSource = new ContactSource([]);
      const next: Contact[] = [];
      for (let index: number = 0; index < 1; index++) {
        next.push(new Contact('key' + index, 'value', index));
        }
      source.replaceData(next);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
        expect(source.getData(0).key).assertEqual('key0');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactreplace0001 end');
    })

    /**
     * @tc.name   testFlipClockContactreplace0002
     * @tc.number SUB_FLIP_CLOCK_CONTACT_REPLACE_0002
     * @tc.desc   Replace ContactSource content with 2 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactreplace0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactreplace0002 begin');
      const source: ContactSource = new ContactSource([]);
      const next: Contact[] = [];
      for (let index: number = 0; index < 2; index++) {
        next.push(new Contact('key' + index, 'value', index));
        }
      source.replaceData(next);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
      expect(source.totalCount()).assertEqual(2);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
        expect(source.getData(0).key).assertEqual('key0');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactreplace0002 end');
    })

    /**
     * @tc.name   testFlipClockContactreplace0003
     * @tc.number SUB_FLIP_CLOCK_CONTACT_REPLACE_0003
     * @tc.desc   Replace ContactSource content with 3 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactreplace0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactreplace0003 begin');
      const source: ContactSource = new ContactSource([]);
      const next: Contact[] = [];
      for (let index: number = 0; index < 3; index++) {
        next.push(new Contact('key' + index, 'value', index));
        }
      source.replaceData(next);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
      expect(source.totalCount()).assertEqual(3);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
        expect(source.getData(0).key).assertEqual('key0');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactreplace0003 end');
    })

    /**
     * @tc.name   testFlipClockContactreplace0004
     * @tc.number SUB_FLIP_CLOCK_CONTACT_REPLACE_0004
     * @tc.desc   Replace ContactSource content with 4 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactreplace0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactreplace0004 begin');
      const source: ContactSource = new ContactSource([]);
      const next: Contact[] = [];
      for (let index: number = 0; index < 4; index++) {
        next.push(new Contact('key' + index, 'value', index));
        }
      source.replaceData(next);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(4));
      expect(source.totalCount()).assertEqual(4);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
        expect(source.getData(0).key).assertEqual('key0');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactreplace0004 end');
    })

    /**
     * @tc.name   testFlipClockContactreplace0005
     * @tc.number SUB_FLIP_CLOCK_CONTACT_REPLACE_0005
     * @tc.desc   Replace ContactSource content with 5 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactreplace0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactreplace0005 begin');
      const source: ContactSource = new ContactSource([]);
      const next: Contact[] = [];
      for (let index: number = 0; index < 5; index++) {
        next.push(new Contact('key' + index, 'value', index));
        }
      source.replaceData(next);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(5));
      expect(source.totalCount()).assertEqual(5);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
        expect(source.getData(0).key).assertEqual('key0');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactreplace0005 end');
    })

    /**
     * @tc.name   testFlipClockContactreplace0006
     * @tc.number SUB_FLIP_CLOCK_CONTACT_REPLACE_0006
     * @tc.desc   Replace ContactSource content with 6 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactreplace0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactreplace0006 begin');
      const source: ContactSource = new ContactSource([]);
      const next: Contact[] = [];
      for (let index: number = 0; index < 6; index++) {
        next.push(new Contact('key' + index, 'value', index));
        }
      source.replaceData(next);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(6));
      expect(source.totalCount()).assertEqual(6);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
        expect(source.getData(0).key).assertEqual('key0');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactreplace0006 end');
    })

    /**
     * @tc.name   testFlipClockContactreplace0007
     * @tc.number SUB_FLIP_CLOCK_CONTACT_REPLACE_0007
     * @tc.desc   Replace ContactSource content with 7 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactreplace0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactreplace0007 begin');
      const source: ContactSource = new ContactSource([]);
      const next: Contact[] = [];
      for (let index: number = 0; index < 7; index++) {
        next.push(new Contact('key' + index, 'value', index));
        }
      source.replaceData(next);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(7));
      expect(source.totalCount()).assertEqual(7);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
        expect(source.getData(0).key).assertEqual('key0');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactreplace0007 end');
    })
  })
}
