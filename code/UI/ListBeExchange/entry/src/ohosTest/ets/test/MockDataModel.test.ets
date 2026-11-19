/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ListInfo } from 'listexchange/src/main/ets/model/ListInfo';
import { MEMO_DATA } from 'listexchange/src/main/ets/model/MockData';

const DOMAIN: number = 0xF814;
const TAG: string = 'MockDataModelTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function mockDataModelTest(): void {
  describe('MockDataModelTest', () => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MOCKDATA_0401
     * @tc.name      testMockData0401
     * @tc.desc      Verify the mock list ships exactly four deduction entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0401 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual MEMO_DATA.length=${MEMO_DATA.length}, expected=4`);
      expect(MEMO_DATA.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse MEMO_DATA[0] === undefined=${MEMO_DATA[0] === undefined}`);
      expect(MEMO_DATA[0] === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse MEMO_DATA[3] === undefined=${MEMO_DATA[3] === undefined}`);
      expect(MEMO_DATA[3] === undefined).assertFalse();
      log('testMockData0401 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MOCKDATA_0402
     * @tc.name      testMockData0402
     * @tc.desc      Verify the first entry is the balance account row.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0402 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual MEMO_DATA[0].name=${MEMO_DATA[0].name}, expected='账户余额'`);
      expect(MEMO_DATA[0].name).assertEqual('账户余额');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof MEMO_DATA[0].name=${typeof MEMO_DATA[0].name}`);
      expect(typeof MEMO_DATA[0].name).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${(MEMO_DATA[0].name as string).length}, expected=0`);
      expect((MEMO_DATA[0].name as string).length).assertLarger(0);
      log('testMockData0402 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MOCKDATA_0403
     * @tc.name      testMockData0403
     * @tc.desc      Verify the second entry is the savings card ending 1234.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0403 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual MEMO_DATA[1].name=${MEMO_DATA[1].name}`);
      expect(MEMO_DATA[1].name).assertEqual('xx银行储蓄卡（1234）');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof MEMO_DATA[1].name=${typeof MEMO_DATA[1].name}`);
      expect(typeof MEMO_DATA[1].name).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain MEMO_DATA[1].name=${MEMO_DATA[1].name}, expected='1234'`);
      expect(MEMO_DATA[1].name).assertContain('1234');
      log('testMockData0403 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MOCKDATA_0404
     * @tc.name      testMockData0404
     * @tc.desc      Verify the third entry is the savings card ending 1238.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0404 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual MEMO_DATA[2].name=${MEMO_DATA[2].name}`);
      expect(MEMO_DATA[2].name).assertEqual('xx银行储蓄卡（1238）');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof MEMO_DATA[2].name=${typeof MEMO_DATA[2].name}`);
      expect(typeof MEMO_DATA[2].name).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain MEMO_DATA[2].name=${MEMO_DATA[2].name}, expected='1238'`);
      expect(MEMO_DATA[2].name).assertContain('1238');
      log('testMockData0404 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MOCKDATA_0405
     * @tc.name      testMockData0405
     * @tc.desc      Verify the fourth entry is the savings card ending 1236.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0405 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual MEMO_DATA[3].name=${MEMO_DATA[3].name}`);
      expect(MEMO_DATA[3].name).assertEqual('xx银行储蓄卡（1236）');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof MEMO_DATA[3].name=${typeof MEMO_DATA[3].name}`);
      expect(typeof MEMO_DATA[3].name).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain MEMO_DATA[3].name=${MEMO_DATA[3].name}, expected='1236'`);
      expect(MEMO_DATA[3].name).assertContain('1236');
      log('testMockData0405 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MOCKDATA_0406
     * @tc.name      testMockData0406
     * @tc.desc      Verify every mock entry is a real ListInfo instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0406 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${MEMO_DATA[0] instanceof ListInfo}`);
      expect(MEMO_DATA[0] instanceof ListInfo).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${MEMO_DATA[1] instanceof ListInfo}`);
      expect(MEMO_DATA[1] instanceof ListInfo).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${MEMO_DATA[2] instanceof ListInfo}`);
      expect(MEMO_DATA[2] instanceof ListInfo).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${MEMO_DATA[3] instanceof ListInfo}`);
      expect(MEMO_DATA[3] instanceof ListInfo).assertTrue();
      log('testMockData0406 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MOCKDATA_0407
     * @tc.name      testMockData0407
     * @tc.desc      Verify every entry name is a non-empty displayable string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0407 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${(MEMO_DATA[0].name as string).length}, expected=0`);
      expect((MEMO_DATA[0].name as string).length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${(MEMO_DATA[1].name as string).length}, expected=0`);
      expect((MEMO_DATA[1].name as string).length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${(MEMO_DATA[2].name as string).length}, expected=0`);
      expect((MEMO_DATA[2].name as string).length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${(MEMO_DATA[3].name as string).length}, expected=0`);
      expect((MEMO_DATA[3].name as string).length).assertLarger(0);
      log('testMockData0407 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MOCKDATA_0408
     * @tc.name      testMockData0408
     * @tc.desc      Verify every entry icon carries a resource object reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0408 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof MEMO_DATA[0].icon=${typeof MEMO_DATA[0].icon}`);
      expect(typeof MEMO_DATA[0].icon).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof MEMO_DATA[1].icon=${typeof MEMO_DATA[1].icon}`);
      expect(typeof MEMO_DATA[1].icon).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof MEMO_DATA[2].icon=${typeof MEMO_DATA[2].icon}`);
      expect(typeof MEMO_DATA[2].icon).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof MEMO_DATA[3].icon=${typeof MEMO_DATA[3].icon}`);
      expect(typeof MEMO_DATA[3].icon).assertEqual('object');
      log('testMockData0408 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MOCKDATA_0409
     * @tc.name      testMockData0409
     * @tc.desc      Verify all four entry names are mutually distinct labels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMockData0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMockData0409 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${MEMO_DATA[0].name === MEMO_DATA[1].name}`);
      expect(MEMO_DATA[0].name === MEMO_DATA[1].name).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${MEMO_DATA[0].name === MEMO_DATA[2].name}`);
      expect(MEMO_DATA[0].name === MEMO_DATA[2].name).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${MEMO_DATA[1].name === MEMO_DATA[3].name}`);
      expect(MEMO_DATA[1].name === MEMO_DATA[3].name).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${MEMO_DATA[2].name === MEMO_DATA[3].name}`);
      expect(MEMO_DATA[2].name === MEMO_DATA[3].name).assertFalse();
      log('testMockData0409 end');
    })
  })
}
