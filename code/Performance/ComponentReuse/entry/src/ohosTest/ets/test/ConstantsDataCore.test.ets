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
const TAG: string = '[Sample_ComponentReuse_ConstantsDataCore]';

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

export default function constantsDataCoreTest() {
  describe('constantsDataCoreTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0001
     * @tc.name      testConstantsData0001
     * @tc.desc      Verify constantsData behavior for matrix index 0.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0001 begin');
      const index: number = 0;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0001 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0002
     * @tc.name      testConstantsData0002
     * @tc.desc      Verify constantsData behavior for matrix index 1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0002 begin');
      const index: number = 1;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0002 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0003
     * @tc.name      testConstantsData0003
     * @tc.desc      Verify constantsData behavior for matrix index 2.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0003 begin');
      const index: number = 2;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0003 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0004
     * @tc.name      testConstantsData0004
     * @tc.desc      Verify constantsData behavior for matrix index 3.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0004 begin');
      const index: number = 3;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0004 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0005
     * @tc.name      testConstantsData0005
     * @tc.desc      Verify constantsData behavior for matrix index 4.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0005 begin');
      const index: number = 4;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0005 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0006
     * @tc.name      testConstantsData0006
     * @tc.desc      Verify constantsData behavior for matrix index 5.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0006 begin');
      const index: number = 5;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0006 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0007
     * @tc.name      testConstantsData0007
     * @tc.desc      Verify constantsData behavior for matrix index 6.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0007 begin');
      const index: number = 6;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0007 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0008
     * @tc.name      testConstantsData0008
     * @tc.desc      Verify constantsData behavior for matrix index 7.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0008 begin');
      const index: number = 7;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0008 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0009
     * @tc.name      testConstantsData0009
     * @tc.desc      Verify constantsData behavior for matrix index 8.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0009 begin');
      const index: number = 8;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0009 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0010
     * @tc.name      testConstantsData0010
     * @tc.desc      Verify constantsData behavior for matrix index 9.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0010 begin');
      const index: number = 9;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0010 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0011
     * @tc.name      testConstantsData0011
     * @tc.desc      Verify constantsData behavior for matrix index 10.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0011 begin');
      const index: number = 10;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0011 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0012
     * @tc.name      testConstantsData0012
     * @tc.desc      Verify constantsData behavior for matrix index 11.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0012 begin');
      const index: number = 11;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0012 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0013
     * @tc.name      testConstantsData0013
     * @tc.desc      Verify constantsData behavior for matrix index 12.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0013 begin');
      const index: number = 12;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0013 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0014
     * @tc.name      testConstantsData0014
     * @tc.desc      Verify constantsData behavior for matrix index 13.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0014 begin');
      const index: number = 13;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0014 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0015
     * @tc.name      testConstantsData0015
     * @tc.desc      Verify constantsData behavior for matrix index 14.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0015 begin');
      const index: number = 14;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0015 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0016
     * @tc.name      testConstantsData0016
     * @tc.desc      Verify constantsData behavior for matrix index 15.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0016 begin');
      const index: number = 15;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0016 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0017
     * @tc.name      testConstantsData0017
     * @tc.desc      Verify constantsData behavior for matrix index 16.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0017 begin');
      const index: number = 16;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0017 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0018
     * @tc.name      testConstantsData0018
     * @tc.desc      Verify constantsData behavior for matrix index 17.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0018 begin');
      const index: number = 17;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0018 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0019
     * @tc.name      testConstantsData0019
     * @tc.desc      Verify constantsData behavior for matrix index 18.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0019 begin');
      const index: number = 18;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0019 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0020
     * @tc.name      testConstantsData0020
     * @tc.desc      Verify constantsData behavior for matrix index 19.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0020 begin');
      const index: number = 19;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0020 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0021
     * @tc.name      testConstantsData0021
     * @tc.desc      Verify constantsData behavior for matrix index 20.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0021 begin');
      const index: number = 20;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0021 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0022
     * @tc.name      testConstantsData0022
     * @tc.desc      Verify constantsData behavior for matrix index 21.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0022 begin');
      const index: number = 21;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0022 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0023
     * @tc.name      testConstantsData0023
     * @tc.desc      Verify constantsData behavior for matrix index 22.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0023 begin');
      const index: number = 22;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0023 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0024
     * @tc.name      testConstantsData0024
     * @tc.desc      Verify constantsData behavior for matrix index 23.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0024 begin');
      const index: number = 23;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0024 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0025
     * @tc.name      testConstantsData0025
     * @tc.desc      Verify constantsData behavior for matrix index 24.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0025 begin');
      const index: number = 24;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0025 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0026
     * @tc.name      testConstantsData0026
     * @tc.desc      Verify constantsData behavior for matrix index 25.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0026 begin');
      const index: number = 25;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0026 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0027
     * @tc.name      testConstantsData0027
     * @tc.desc      Verify constantsData behavior for matrix index 26.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0027 begin');
      const index: number = 26;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0027 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0028
     * @tc.name      testConstantsData0028
     * @tc.desc      Verify constantsData behavior for matrix index 27.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0028 begin');
      const index: number = 27;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0028 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0029
     * @tc.name      testConstantsData0029
     * @tc.desc      Verify constantsData behavior for matrix index 28.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0029 begin');
      const index: number = 28;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0029 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0030
     * @tc.name      testConstantsData0030
     * @tc.desc      Verify constantsData behavior for matrix index 29.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0030 begin');
      const index: number = 29;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0030 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0031
     * @tc.name      testConstantsData0031
     * @tc.desc      Verify constantsData behavior for matrix index 30.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0031 begin');
      const index: number = 30;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0031 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0032
     * @tc.name      testConstantsData0032
     * @tc.desc      Verify constantsData behavior for matrix index 31.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0032 begin');
      const index: number = 31;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0032 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0033
     * @tc.name      testConstantsData0033
     * @tc.desc      Verify constantsData behavior for matrix index 32.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0033 begin');
      const index: number = 32;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0033 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0034
     * @tc.name      testConstantsData0034
     * @tc.desc      Verify constantsData behavior for matrix index 33.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0034 begin');
      const index: number = 33;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0034 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0035
     * @tc.name      testConstantsData0035
     * @tc.desc      Verify constantsData behavior for matrix index 34.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0035 begin');
      const index: number = 34;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0035 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0036
     * @tc.name      testConstantsData0036
     * @tc.desc      Verify constantsData behavior for matrix index 35.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0036 begin');
      const index: number = 35;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0036 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0037
     * @tc.name      testConstantsData0037
     * @tc.desc      Verify constantsData behavior for matrix index 36.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0037 begin');
      const index: number = 36;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0037 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0038
     * @tc.name      testConstantsData0038
     * @tc.desc      Verify constantsData behavior for matrix index 37.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0038 begin');
      const index: number = 37;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0038 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0039
     * @tc.name      testConstantsData0039
     * @tc.desc      Verify constantsData behavior for matrix index 38.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0039 begin');
      const index: number = 38;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0039 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0040
     * @tc.name      testConstantsData0040
     * @tc.desc      Verify constantsData behavior for matrix index 39.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0040 begin');
      const index: number = 39;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0040 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0041
     * @tc.name      testConstantsData0041
     * @tc.desc      Verify constantsData behavior for matrix index 40.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0041 begin');
      const index: number = 40;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0041 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0042
     * @tc.name      testConstantsData0042
     * @tc.desc      Verify constantsData behavior for matrix index 41.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0042 begin');
      const index: number = 41;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0042 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0043
     * @tc.name      testConstantsData0043
     * @tc.desc      Verify constantsData behavior for matrix index 42.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0043 begin');
      const index: number = 42;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0043 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0044
     * @tc.name      testConstantsData0044
     * @tc.desc      Verify constantsData behavior for matrix index 43.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0044 begin');
      const index: number = 43;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0044 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0045
     * @tc.name      testConstantsData0045
     * @tc.desc      Verify constantsData behavior for matrix index 44.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0045 begin');
      const index: number = 44;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0045 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0046
     * @tc.name      testConstantsData0046
     * @tc.desc      Verify constantsData behavior for matrix index 45.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0046 begin');
      const index: number = 45;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0046 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0047
     * @tc.name      testConstantsData0047
     * @tc.desc      Verify constantsData behavior for matrix index 46.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0047 begin');
      const index: number = 46;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0047 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0048
     * @tc.name      testConstantsData0048
     * @tc.desc      Verify constantsData behavior for matrix index 47.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0048 begin');
      const index: number = 47;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0048 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0049
     * @tc.name      testConstantsData0049
     * @tc.desc      Verify constantsData behavior for matrix index 48.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0049 begin');
      const index: number = 48;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0049 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0050
     * @tc.name      testConstantsData0050
     * @tc.desc      Verify constantsData behavior for matrix index 49.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0050 begin');
      const index: number = 49;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0050 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0051
     * @tc.name      testConstantsData0051
     * @tc.desc      Verify constantsData behavior for matrix index 50.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0051 begin');
      const index: number = 50;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0051 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0052
     * @tc.name      testConstantsData0052
     * @tc.desc      Verify constantsData behavior for matrix index 51.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0052 begin');
      const index: number = 51;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0052 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0053
     * @tc.name      testConstantsData0053
     * @tc.desc      Verify constantsData behavior for matrix index 52.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0053 begin');
      const index: number = 52;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0053 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0054
     * @tc.name      testConstantsData0054
     * @tc.desc      Verify constantsData behavior for matrix index 53.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0054 begin');
      const index: number = 53;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0054 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0055
     * @tc.name      testConstantsData0055
     * @tc.desc      Verify constantsData behavior for matrix index 54.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0055 begin');
      const index: number = 54;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0055 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0056
     * @tc.name      testConstantsData0056
     * @tc.desc      Verify constantsData behavior for matrix index 55.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0056 begin');
      const index: number = 55;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0056 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0057
     * @tc.name      testConstantsData0057
     * @tc.desc      Verify constantsData behavior for matrix index 56.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0057 begin');
      const index: number = 56;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0057 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0058
     * @tc.name      testConstantsData0058
     * @tc.desc      Verify constantsData behavior for matrix index 57.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0058 begin');
      const index: number = 57;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0058 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0059
     * @tc.name      testConstantsData0059
     * @tc.desc      Verify constantsData behavior for matrix index 58.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0059 begin');
      const index: number = 58;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0059 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0060
     * @tc.name      testConstantsData0060
     * @tc.desc      Verify constantsData behavior for matrix index 59.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0060 begin');
      const index: number = 59;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0060 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0061
     * @tc.name      testConstantsData0061
     * @tc.desc      Verify constantsData behavior for matrix index 60.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0061 begin');
      const index: number = 60;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0061 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0062
     * @tc.name      testConstantsData0062
     * @tc.desc      Verify constantsData behavior for matrix index 61.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0062 begin');
      const index: number = 61;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0062 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0063
     * @tc.name      testConstantsData0063
     * @tc.desc      Verify constantsData behavior for matrix index 62.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0063 begin');
      const index: number = 62;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0063 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0064
     * @tc.name      testConstantsData0064
     * @tc.desc      Verify constantsData behavior for matrix index 63.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0064 begin');
      const index: number = 63;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0064 end');
    })

  })
}
