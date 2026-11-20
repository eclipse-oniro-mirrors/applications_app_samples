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
import { ScanErrorCategory, ScanErrorInfo, ScanErrorMapper } from '../../../main/ets/scan/model/ScanErrorInfo';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanErrorMapReal02Test() {
  describe('ScanErrorMapAggregate', () => {
    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0001
     * @tc.name testErrorAggregate0001
     * @tc.desc countKnown ignores codes outside the documented table
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0001 begin');
      const codes: number[] = [201, 999, 401, 13100012];
      expect(ScanErrorMapper.countKnown(codes)).assertEqual(3);
      expect(ScanErrorMapper.isKnown(999)).assertFalse();
      expect(ScanErrorMapper.describe(999).known).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0001 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0002
     * @tc.name testErrorAggregate0002
     * @tc.desc countKnown returns zero for an empty list
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0002 begin');
      const codes: number[] = [];
      expect(ScanErrorMapper.countKnown(codes)).assertEqual(0);
      expect(ScanErrorMapper.countRetryable(codes)).assertEqual(0);
      expect(ScanErrorMapper.hasUserActionIn(codes)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0002 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0003
     * @tc.name testErrorAggregate0003
     * @tc.desc countKnown stays zero when every code is undocumented
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0003 begin');
      const codes: number[] = [0, -1, 99999999, 13100013];
      expect(ScanErrorMapper.countKnown(codes)).assertEqual(0);
      expect(ScanErrorMapper.countByCategory(codes, ScanErrorCategory.DEVICE)).assertEqual(0);
      expect(ScanErrorMapper.describe(13100013).category).assertEqual(ScanErrorCategory.UNKNOWN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0003 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0004
     * @tc.name testErrorAggregate0004
     * @tc.desc eight documented codes are retryable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0004 begin');
      expect(ScanErrorMapper.countRetryable(ScanErrorMapper.CODES)).assertEqual(8);
      expect(ScanErrorMapper.describe(13100012).retryable).assertTrue();
      expect(ScanErrorMapper.describe(13100010).retryable).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0004 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0005
     * @tc.name testErrorAggregate0005
     * @tc.desc countRetryable counts only retryable entries of the input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0005 begin');
      const codes: number[] = [202, 201, 13100005];
      expect(ScanErrorMapper.countRetryable(codes)).assertEqual(2);
      expect(ScanErrorMapper.countKnown(codes)).assertEqual(3);
      expect(ScanErrorMapper.isRetryable(201)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0005 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0006
     * @tc.name testErrorAggregate0006
     * @tc.desc countRetryable treats undocumented codes as not retryable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0006 begin');
      const codes: number[] = [7, 8, 13100099];
      expect(ScanErrorMapper.countRetryable(codes)).assertEqual(0);
      expect(ScanErrorMapper.isRetryable(13100099)).assertFalse();
      expect(ScanErrorMapper.getMessageKey(13100099)).assertEqual(ScanErrorMapper.UNKNOWN_MESSAGE_KEY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0006 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0007
     * @tc.name testErrorAggregate0007
     * @tc.desc device category holds seven codes in table order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0007 begin');
      const device: number[] = ScanErrorMapper.filterByCategory(ScanErrorMapper.CODES, ScanErrorCategory.DEVICE);
      expect(device.length).assertEqual(7);
      expect(device[0]).assertEqual(13100005);
      expect(device[6]).assertEqual(13100011);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0007 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0008
     * @tc.name testErrorAggregate0008
     * @tc.desc framework category holds six codes including the permission blockers
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0008 begin');
      const framework: number[] = ScanErrorMapper.filterByCategory(
        ScanErrorMapper.CODES, ScanErrorCategory.FRAMEWORK);
      expect(framework.length).assertEqual(6);
      expect(framework[0]).assertEqual(202);
      expect(framework[5]).assertEqual(13100012);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0008 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0009
     * @tc.name testErrorAggregate0009
     * @tc.desc permission category holds the single permission denial code
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0009 begin');
      const permission: number[] = ScanErrorMapper.filterByCategory(
        ScanErrorMapper.CODES, ScanErrorCategory.PERMISSION);
      expect(permission.length).assertEqual(1);
      expect(permission[0]).assertEqual(201);
      expect(ScanErrorMapper.getCategory(201)).assertEqual(ScanErrorCategory.PERMISSION);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0009 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0010
     * @tc.name testErrorAggregate0010
     * @tc.desc parameter category holds the single invalid argument code
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0010 begin');
      const parameter: number[] = ScanErrorMapper.filterByCategory(
        ScanErrorMapper.CODES, ScanErrorCategory.PARAMETER);
      expect(parameter.length).assertEqual(1);
      expect(parameter[0]).assertEqual(401);
      expect(ScanErrorMapper.isRetryable(401)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0010 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0011
     * @tc.name testErrorAggregate0011
     * @tc.desc unknown category stays empty for a documented-only list
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0011 begin');
      const unknown: number[] = ScanErrorMapper.filterByCategory(
        ScanErrorMapper.CODES, ScanErrorCategory.UNKNOWN);
      expect(unknown.length).assertEqual(0);
      expect(ScanErrorMapper.countByCategory(ScanErrorMapper.CODES, ScanErrorCategory.UNKNOWN)).assertEqual(0);
      expect(ScanErrorMapper.countKnown(ScanErrorMapper.CODES)).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0011 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0012
     * @tc.name testErrorAggregate0012
     * @tc.desc filterByCategory preserves the input order of matching codes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0012 begin');
      const codes: number[] = [13100009, 201, 13100007, 13100012];
      const device: number[] = ScanErrorMapper.filterByCategory(codes, ScanErrorCategory.DEVICE);
      expect(device.length).assertEqual(2);
      expect(device[0]).assertEqual(13100009);
      expect(device[1]).assertEqual(13100007);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0012 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0013
     * @tc.name testErrorAggregate0013
     * @tc.desc countByCategory agrees with the filtered list length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0013 begin');
      const codes: number[] = [201, 202, 401, 13100001, 13100012, 13100004];
      const framework: number[] = ScanErrorMapper.filterByCategory(codes, ScanErrorCategory.FRAMEWORK);
      expect(ScanErrorMapper.countByCategory(codes, ScanErrorCategory.FRAMEWORK)).assertEqual(4);
      expect(framework.length).assertEqual(4);
      expect(ScanErrorMapper.countByCategory(codes, ScanErrorCategory.PERMISSION)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0013 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0014
     * @tc.name testErrorAggregate0014
     * @tc.desc four category counters partition the documented table
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0014 begin');
      const permission: number = ScanErrorMapper.countByCategory(
        ScanErrorMapper.CODES, ScanErrorCategory.PERMISSION);
      const parameter: number = ScanErrorMapper.countByCategory(
        ScanErrorMapper.CODES, ScanErrorCategory.PARAMETER);
      const device: number = ScanErrorMapper.countByCategory(ScanErrorMapper.CODES, ScanErrorCategory.DEVICE);
      const framework: number = ScanErrorMapper.countByCategory(
        ScanErrorMapper.CODES, ScanErrorCategory.FRAMEWORK);
      expect(permission).assertEqual(1);
      expect(parameter).assertEqual(1);
      expect(device).assertEqual(7);
      expect(framework).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0014 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0015
     * @tc.name testErrorAggregate0015
     * @tc.desc category counters sum to the documented code count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0015 begin');
      const total: number = ScanErrorMapper.countByCategory(
        ScanErrorMapper.CODES, ScanErrorCategory.PERMISSION) +
        ScanErrorMapper.countByCategory(ScanErrorMapper.CODES, ScanErrorCategory.PARAMETER) +
        ScanErrorMapper.countByCategory(ScanErrorMapper.CODES, ScanErrorCategory.DEVICE) +
        ScanErrorMapper.countByCategory(ScanErrorMapper.CODES, ScanErrorCategory.FRAMEWORK);
      expect(total).assertEqual(ScanErrorMapper.CODES.length);
      expect(total).assertEqual(15);
      expect(ScanErrorMapper.countKnown(ScanErrorMapper.getKnownCodes())).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0015 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0016
     * @tc.name testErrorAggregate0016
     * @tc.desc getKnownCodes returns every documented code in table order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0016 begin');
      const codes: number[] = ScanErrorMapper.getKnownCodes();
      expect(codes.length).assertEqual(15);
      expect(codes[0]).assertEqual(201);
      expect(codes[14]).assertEqual(13100012);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0016 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0017
     * @tc.name testErrorAggregate0017
     * @tc.desc getKnownCodes hands out a copy that cannot alter the table
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0017 begin');
      const codes: number[] = ScanErrorMapper.getKnownCodes();
      codes.push(999);
      codes[0] = 0;
      expect(ScanErrorMapper.isKnown(999)).assertFalse();
      expect(ScanErrorMapper.isKnown(201)).assertTrue();
      expect(ScanErrorMapper.getKnownCodes().length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0017 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0018
     * @tc.name testErrorAggregate0018
     * @tc.desc every documented code is reported as known by describe
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0018 begin');
      const first: ScanErrorInfo = ScanErrorMapper.describe(201);
      const last: ScanErrorInfo = ScanErrorMapper.describe(13100012);
      expect(first.known).assertTrue();
      expect(last.known).assertTrue();
      expect(ScanErrorMapper.countKnown(ScanErrorMapper.CODES)).assertEqual(ScanErrorMapper.CODES.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0018 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0019
     * @tc.name testErrorAggregate0019
     * @tc.desc a permission denial demands user action
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0019 begin');
      const codes: number[] = [13100005, 201, 13100006];
      expect(ScanErrorMapper.hasUserActionIn(codes)).assertTrue();
      expect(ScanErrorMapper.requiresUserAction(201)).assertTrue();
      expect(ScanErrorMapper.isRetryable(201)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0019 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0020
     * @tc.name testErrorAggregate0020
     * @tc.desc transient faults alone do not require user action
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0020 begin');
      const codes: number[] = [13100005, 13100006, 13100001];
      expect(ScanErrorMapper.hasUserActionIn(codes)).assertFalse();
      expect(ScanErrorMapper.countRetryable(codes)).assertEqual(3);
      expect(ScanErrorMapper.requiresUserAction(13100006)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0020 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0021
     * @tc.name testErrorAggregate0021
     * @tc.desc undocumented codes never require user action
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0021 begin');
      const codes: number[] = [999, 13100013, 0];
      expect(ScanErrorMapper.hasUserActionIn(codes)).assertFalse();
      expect(ScanErrorMapper.requiresUserAction(999)).assertFalse();
      expect(ScanErrorMapper.describe(999).requiresUserAction).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0021 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0022
     * @tc.name testErrorAggregate0022
     * @tc.desc a stoppable device fault raises the user action flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0022 begin');
      const codes: number[] = [999, 13100008];
      expect(ScanErrorMapper.hasUserActionIn(codes)).assertTrue();
      expect(ScanErrorMapper.requiresUserAction(13100008)).assertTrue();
      expect(ScanErrorMapper.isRetryable(13100008)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0022 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0023
     * @tc.name testErrorAggregate0023
     * @tc.desc hasUserActionIn reports the number of flagged codes indirectly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0023 begin');
      const flagged: number[] = ScanErrorMapper.CODES.filter((code: number) => {
        return ScanErrorMapper.requiresUserAction(code);
      });
      expect(flagged.length).assertEqual(7);
      expect(ScanErrorMapper.hasUserActionIn(flagged)).assertTrue();
      expect(ScanErrorMapper.hasUserActionIn([401])).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0023 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0024
     * @tc.name testErrorAggregate0024
     * @tc.desc describe keeps the input code and marks it unknown
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0024 begin');
      const info: ScanErrorInfo = ScanErrorMapper.describe(-1);
      expect(info.code).assertEqual(-1);
      expect(info.category).assertEqual(ScanErrorCategory.UNKNOWN);
      expect(info.messageKey).assertEqual('scan_error_unknown');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0024 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0025
     * @tc.name testErrorAggregate0025
     * @tc.desc describe fills every dimension for the permission denial
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0025 begin');
      const info: ScanErrorInfo = ScanErrorMapper.describe(201);
      expect(info.category).assertEqual(ScanErrorCategory.PERMISSION);
      expect(info.messageKey).assertEqual('scan_error_no_permission');
      expect(info.retryable).assertFalse();
      expect(info.requiresUserAction).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0025 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0026
     * @tc.name testErrorAggregate0026
     * @tc.desc describe marks the memory shortage as retryable framework fault
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0026 begin');
      const info: ScanErrorInfo = ScanErrorMapper.describe(13100012);
      expect(info.category).assertEqual(ScanErrorCategory.FRAMEWORK);
      expect(info.retryable).assertTrue();
      expect(info.requiresUserAction).assertFalse();
      expect(info.messageKey).assertEqual('scan_error_no_memory');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0026 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0027
     * @tc.name testErrorAggregate0027
     * @tc.desc indexOf reports table positions and misses with minus one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0027 begin');
      expect(ScanErrorMapper.indexOf(201)).assertEqual(0);
      expect(ScanErrorMapper.indexOf(13100012)).assertEqual(14);
      expect(ScanErrorMapper.indexOf(13100013)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0027 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0028
     * @tc.name testErrorAggregate0028
     * @tc.desc invalid argument failures are parameter faults without recovery
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0028 begin');
      const info: ScanErrorInfo = ScanErrorMapper.describe(401);
      expect(info.category).assertEqual(ScanErrorCategory.PARAMETER);
      expect(info.retryable).assertFalse();
      expect(info.requiresUserAction).assertFalse();
      expect(info.messageKey).assertEqual('scan_error_invalid_parameter');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0028 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0029
     * @tc.name testErrorAggregate0029
     * @tc.desc framework permission failure is retryable and needs user action
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0029 begin');
      const info: ScanErrorInfo = ScanErrorMapper.describe(202);
      expect(info.category).assertEqual(ScanErrorCategory.FRAMEWORK);
      expect(info.retryable).assertTrue();
      expect(info.requiresUserAction).assertTrue();
      expect(info.messageKey).assertEqual('scan_error_not_system_application');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0029 end');
    });

    /**
     * @tc.number SUB_SCAN_ERRMAP_07_0030
     * @tc.name testErrorAggregate0030
     * @tc.desc retryable codes are a strict subset of the known codes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testErrorAggregate0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0030 begin');
      const retryable: number = ScanErrorMapper.countRetryable(ScanErrorMapper.CODES);
      const known: number = ScanErrorMapper.countKnown(ScanErrorMapper.CODES);
      expect(retryable).assertEqual(8);
      expect(known).assertEqual(15);
      expect(ScanErrorMapper.countRetryable([13100004, 401])).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorAggregate0030 end');
    });
  });
}
