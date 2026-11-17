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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from './shared/TestPace';
import { Constants } from '../../../main/ets/common/Constants';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentReuse_ConstantsData]';

const EXPECTED_DESTINATION_IDS: string[] = [
  Constants.NAV_DESTINATION_ITEM_0,
  Constants.NAV_DESTINATION_ITEM_0_1,
  Constants.NAV_DESTINATION_ITEM_1,
  Constants.NAV_DESTINATION_ITEM_1_1,
  Constants.NAV_DESTINATION_ITEM_1_2,
  Constants.NAV_DESTINATION_ITEM_1_3,
  Constants.NAV_DESTINATION_ITEM_2,
  Constants.NAV_DESTINATION_ITEM_2_1,
  Constants.NAV_DESTINATION_ITEM_3,
  Constants.NAV_DESTINATION_ITEM_3_1
];

export default function constantsDataTest() {
  describe('constantsDataTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0001
     * @tc.name testConstantsData0001
     * @tc.desc Verify ConstantsData behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0001 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 0 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0001 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0002
     * @tc.name testConstantsData0002
     * @tc.desc Verify ConstantsData behavior for matrix index 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0002 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 1 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0002 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0003
     * @tc.name testConstantsData0003
     * @tc.desc Verify ConstantsData behavior for matrix index 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0003 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 2 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0003 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0004
     * @tc.name testConstantsData0004
     * @tc.desc Verify ConstantsData behavior for matrix index 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0004 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 3 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0004 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0005
     * @tc.name testConstantsData0005
     * @tc.desc Verify ConstantsData behavior for matrix index 4
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0005 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 4 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0005 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0006
     * @tc.name testConstantsData0006
     * @tc.desc Verify ConstantsData behavior for matrix index 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0006 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 5 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0006 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0007
     * @tc.name testConstantsData0007
     * @tc.desc Verify ConstantsData behavior for matrix index 6
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0007 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 6 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0007 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0008
     * @tc.name testConstantsData0008
     * @tc.desc Verify ConstantsData behavior for matrix index 7
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0008 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 7 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0008 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0009
     * @tc.name testConstantsData0009
     * @tc.desc Verify ConstantsData behavior for matrix index 8
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0009 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 8 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0009 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0010
     * @tc.name testConstantsData0010
     * @tc.desc Verify ConstantsData behavior for matrix index 9
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0010 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 9 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0010 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0011
     * @tc.name testConstantsData0011
     * @tc.desc Verify ConstantsData behavior for matrix index 10
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0011 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 10 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0011 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0012
     * @tc.name testConstantsData0012
     * @tc.desc Verify ConstantsData behavior for matrix index 11
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0012 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 11 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0012 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0013
     * @tc.name testConstantsData0013
     * @tc.desc Verify ConstantsData behavior for matrix index 12
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0013 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 12 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0013 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0014
     * @tc.name testConstantsData0014
     * @tc.desc Verify ConstantsData behavior for matrix index 13
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0014 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 13 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0014 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0015
     * @tc.name testConstantsData0015
     * @tc.desc Verify ConstantsData behavior for matrix index 14
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0015 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 14 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0015 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0016
     * @tc.name testConstantsData0016
     * @tc.desc Verify ConstantsData behavior for matrix index 15
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0016 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 15 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0016 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0019
     * @tc.name testConstantsData0019
     * @tc.desc Verify ConstantsData behavior for matrix index 18
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0019 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 18 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0019 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0020
     * @tc.name testConstantsData0020
     * @tc.desc Verify ConstantsData behavior for matrix index 19
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0020 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 19 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0020 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0021
     * @tc.name testConstantsData0021
     * @tc.desc Verify ConstantsData behavior for matrix index 20
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0021 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 20 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0021 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0026
     * @tc.name testConstantsData0026
     * @tc.desc Verify ConstantsData behavior for matrix index 25
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0026 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 25 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0026 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0032
     * @tc.name testConstantsData0032
     * @tc.desc Verify ConstantsData behavior for matrix index 31
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0032 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 31 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0032 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0040
     * @tc.name testConstantsData0040
     * @tc.desc Verify ConstantsData behavior for matrix index 39
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0040 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 39 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0040 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0064
     * @tc.name testConstantsData0064
     * @tc.desc Verify ConstantsData behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0064 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 63 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0064 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0065
     * @tc.name testConstantsData0065
     * @tc.desc Verify ConstantsData behavior for matrix index 64
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0065 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 64 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0065 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0128
     * @tc.name testConstantsData0128
     * @tc.desc Verify ConstantsData behavior for matrix index 127
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0128 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 127 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0128 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0129
     * @tc.name testConstantsData0129
     * @tc.desc Verify ConstantsData behavior for matrix index 128
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0129 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 128 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0129 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0192
     * @tc.name testConstantsData0192
     * @tc.desc Verify ConstantsData behavior for matrix index 191
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0192 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 191 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0192 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0255
     * @tc.name testConstantsData0255
     * @tc.desc Verify ConstantsData behavior for matrix index 254
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0255 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 254 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0255 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_CONSTANTS_0256
     * @tc.name testConstantsData0256
     * @tc.desc Verify ConstantsData behavior for matrix index 255
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testConstantsData0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0256 begin`);
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = 255 % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testConstantsData0256 end`);
    });
  })
}
