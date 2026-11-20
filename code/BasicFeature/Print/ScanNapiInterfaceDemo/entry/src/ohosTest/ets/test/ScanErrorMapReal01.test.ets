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
import { ScanErrorMapper, ScanErrorCategory, ScanErrorInfo } from '../../../main/ets/scan/model/ScanErrorInfo';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ScanNapiInterfaceDemo]';
const TABLE_SIZE: number = 15;

export default function scanErrorMapReal01Test() {
  describe('ScanErrorMapReal01', () => {
    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0001
     * @tc.name testErrorMapReal0001
     * @tc.desc five rule tables keep the same length as the documented code list
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testErrorMapReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0001 begin');
      expect(ScanErrorMapper.CODES.length).assertEqual(TABLE_SIZE);
      expect(ScanErrorMapper.CATEGORIES.length).assertEqual(TABLE_SIZE);
      expect(ScanErrorMapper.RETRYABLE.length).assertEqual(TABLE_SIZE);
      expect(ScanErrorMapper.USER_ACTION.length).assertEqual(TABLE_SIZE);
      expect(ScanErrorMapper.MESSAGE_KEYS.length).assertEqual(TABLE_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0001 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0002
     * @tc.name testErrorMapReal0002
     * @tc.desc every documented code resolves to a non-unknown category
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testErrorMapReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0002 begin');
      const codes: number[] = ScanErrorMapper.getKnownCodes();
      let unknownCount: number = 0;
      for (let index = 0; index < codes.length; index++) {
        if (ScanErrorMapper.getCategory(codes[index]) === ScanErrorCategory.UNKNOWN) {
          unknownCount++;
        }
      }
      expect(unknownCount).assertEqual(0);
      expect(codes.length).assertEqual(TABLE_SIZE);
      expect(ScanErrorMapper.isKnown(codes[0])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0002 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0003
     * @tc.name testErrorMapReal0003
     * @tc.desc message keys are unique inside the table and the last key belongs to no_memory
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testErrorMapReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0003 begin');
      const keys: string[] = ScanErrorMapper.MESSAGE_KEYS;
      let duplicateCount: number = 0;
      for (let index = 0; index < keys.length; index++) {
        if (keys.indexOf(keys[index]) !== index) {
          duplicateCount++;
        }
      }
      expect(duplicateCount).assertEqual(0);
      expect(keys[TABLE_SIZE - 1]).assertEqual('scan_error_no_memory');
      expect(ScanErrorMapper.getMessageKey(13100012)).assertEqual('scan_error_no_memory');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0003 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0004
     * @tc.name testErrorMapReal0004
     * @tc.desc boundary: the last documented code keeps retryable and no user action
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorMapReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0004 begin');
      expect(ScanErrorMapper.getCategory(13100012)).assertEqual(ScanErrorCategory.FRAMEWORK);
      expect(ScanErrorMapper.isRetryable(13100012)).assertTrue();
      expect(ScanErrorMapper.requiresUserAction(13100012)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0004 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0005
     * @tc.name testErrorMapReal0005
     * @tc.desc boundary: the code right after the last documented one is unknown
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorMapReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0005 begin');
      expect(ScanErrorMapper.isKnown(13100013)).assertFalse();
      expect(ScanErrorMapper.getCategory(13100013)).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.getMessageKey(13100013)).assertEqual(ScanErrorMapper.UNKNOWN_MESSAGE_KEY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0005 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0006
     * @tc.name testErrorMapReal0006
     * @tc.desc boundary: 201 is both the smallest documented code and the only permission code
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorMapReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0006 begin');
      expect(ScanErrorMapper.getCategory(201)).assertEqual(ScanErrorCategory.PERMISSION);
      expect(ScanErrorMapper.countByCategory(ScanErrorMapper.getKnownCodes(),
        ScanErrorCategory.PERMISSION)).assertEqual(1);
      expect(ScanErrorMapper.requiresUserAction(201)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0006 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0007
     * @tc.name testErrorMapReal0007
     * @tc.desc illegal: negative and zero codes are rejected without throwing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorMapReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0007 begin');
      expect(ScanErrorMapper.getCategory(-1)).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.getCategory(0)).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.isRetryable(-1)).assertFalse();
      expect(ScanErrorMapper.requiresUserAction(-1)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0007 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0008
     * @tc.name testErrorMapReal0008
     * @tc.desc illegal: an undocumented four-digit code has no message key of its own
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testErrorMapReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0008 begin');
      expect(ScanErrorMapper.getMessageKey(401)).assertEqual('scan_error_invalid_parameter');
      expect(ScanErrorMapper.getMessageKey(402)).assertEqual('scan_error_unknown');
      expect(ScanErrorMapper.getCategory(401)).assertEqual(ScanErrorCategory.PARAMETER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0008 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0009
     * @tc.name testErrorMapReal0009
     * @tc.desc extreme: the largest safe integer is treated as an unknown code
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testErrorMapReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0009 begin');
      expect(ScanErrorMapper.isKnown(Number.MAX_SAFE_INTEGER)).assertFalse();
      expect(ScanErrorMapper.getCategory(Number.MAX_SAFE_INTEGER)).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(ScanErrorMapper.describe(Number.MAX_SAFE_INTEGER).known).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0009 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0010
     * @tc.name testErrorMapReal0010
     * @tc.desc extreme: the smallest safe integer is treated as an unknown code
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testErrorMapReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0010 begin');
      const smallest: number = Number.MIN_SAFE_INTEGER;
      expect(ScanErrorMapper.isKnown(smallest)).assertFalse();
      expect(ScanErrorMapper.isRetryable(smallest)).assertFalse();
      expect(ScanErrorMapper.getMessageKey(smallest)).assertEqual('scan_error_unknown');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0010 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0011
     * @tc.name testErrorMapReal0011
     * @tc.desc combination: mixed known and unknown codes are counted separately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testErrorMapReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0011 begin');
      const mixed: number[] = [201, 999, 401, 13100013, 13100001];
      expect(ScanErrorMapper.countKnown(mixed)).assertEqual(3);
      expect(ScanErrorMapper.countRetryable(mixed)).assertEqual(1);
      expect(ScanErrorMapper.hasUserActionIn(mixed)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0011 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0012
     * @tc.name testErrorMapReal0012
     * @tc.desc combination: category buckets add up to the documented table size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testErrorMapReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0012 begin');
      const codes: number[] = ScanErrorMapper.getKnownCodes();
      const device: number = ScanErrorMapper.countByCategory(codes, ScanErrorCategory.DEVICE);
      const framework: number = ScanErrorMapper.countByCategory(codes, ScanErrorCategory.FRAMEWORK);
      const total: number = device + framework +
        ScanErrorMapper.countByCategory(codes, ScanErrorCategory.PERMISSION) +
        ScanErrorMapper.countByCategory(codes, ScanErrorCategory.PARAMETER);
      expect(device).assertEqual(7);
      expect(framework).assertEqual(6);
      expect(total).assertEqual(TABLE_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0012 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0013
     * @tc.name testErrorMapReal0013
     * @tc.desc combination: retryable count over the whole table matches the frozen rule
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testErrorMapReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0013 begin');
      const codes: number[] = ScanErrorMapper.getKnownCodes();
      expect(ScanErrorMapper.countRetryable(codes)).assertEqual(8);
      expect(ScanErrorMapper.countKnown(codes)).assertEqual(TABLE_SIZE);
      expect(ScanErrorMapper.hasUserActionIn(codes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0013 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0014
     * @tc.name testErrorMapReal0014
     * @tc.desc state: describe is idempotent and agrees with the single-dimension getters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testErrorMapReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0014 begin');
      const first: ScanErrorInfo = ScanErrorMapper.describe(13100006);
      const second: ScanErrorInfo = ScanErrorMapper.describe(13100006);
      expect(first.category).assertEqual(second.category);
      expect(first.category).assertEqual(ScanErrorMapper.getCategory(13100006));
      expect(first.requiresUserAction).assertEqual(ScanErrorMapper.requiresUserAction(13100006));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0014 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0015
     * @tc.name testErrorMapReal0015
     * @tc.desc state: an unknown code describes itself with default flags and the unknown key
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testErrorMapReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0015 begin');
      const info: ScanErrorInfo = ScanErrorMapper.describe(777777);
      expect(info.known).assertFalse();
      expect(info.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(info.messageKey).assertEqual('scan_error_unknown');
      expect(info.retryable).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0015 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0016
     * @tc.name testErrorMapReal0016
     * @tc.desc combination: only the agent-settable faults require a user action
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testErrorMapReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0016 begin');
      expect(ScanErrorMapper.requiresUserAction(13100008)).assertTrue();
      expect(ScanErrorMapper.requiresUserAction(13100009)).assertTrue();
      expect(ScanErrorMapper.requiresUserAction(13100010)).assertTrue();
      expect(ScanErrorMapper.requiresUserAction(13100001)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0016 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0017
     * @tc.name testErrorMapReal0017
     * @tc.desc illegal: empty input lists produce zero counts and no user action
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testErrorMapReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0017 begin');
      const empty: number[] = [];
      expect(ScanErrorMapper.countKnown(empty)).assertEqual(0);
      expect(ScanErrorMapper.countRetryable(empty)).assertEqual(0);
      expect(ScanErrorMapper.hasUserActionIn(empty)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0017 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0018
     * @tc.name testErrorMapReal0018
     * @tc.desc state: the exported code list is a copy, so caller mutations never leak back
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testErrorMapReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0018 begin');
      const copy: number[] = ScanErrorMapper.getKnownCodes();
      copy.push(123456);
      expect(copy.length).assertEqual(TABLE_SIZE + 1);
      expect(ScanErrorMapper.CODES.length).assertEqual(TABLE_SIZE);
      expect(ScanErrorMapper.isKnown(123456)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0018 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0019
     * @tc.name testErrorMapReal0019
     * @tc.desc combination: filtering by an absent category returns an empty list
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testErrorMapReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0019 begin');
      const filtered: number[] = ScanErrorMapper.filterByCategory([201, 401], ScanErrorCategory.DEVICE);
      expect(filtered.length).assertEqual(0);
      expect(ScanErrorMapper.filterByCategory([201, 401], ScanErrorCategory.PERMISSION).length)
        .assertEqual(1);
      expect(ScanErrorMapper.countByCategory([201, 401], ScanErrorCategory.PARAMETER)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0019 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_06_0020
     * @tc.name testErrorMapReal0020
     * @tc.desc state: after a table scan the mapper still answers unknown paths consistently
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testErrorMapReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0020 begin');
      const codes: number[] = ScanErrorMapper.getKnownCodes();
      for (let index = 0; index < codes.length; index++) {
        expect(ScanErrorMapper.isKnown(codes[index])).assertTrue();
      }
      expect(ScanErrorMapper.isKnown(13100000)).assertFalse();
      expect(ScanErrorMapper.describe(13100000).known).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMapReal0020 end');
    });
  });
}
