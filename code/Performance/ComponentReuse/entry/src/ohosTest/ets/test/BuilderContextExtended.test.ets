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
import { GlobalBuilderContext } from '../../../main/ets/common/GlobalBuilderContext';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentReuse_BuilderContextExtended]';

const BUILDER_KEYS: string[] = [
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

class ProbeObject {
  public tag: string;

  constructor(tag: string) {
    this.tag = tag;
  }
}

export default function builderContextExtendedTest() {
  describe('builderContextExtendedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0065
     * @tc.name      testBuilderContext0065
     * @tc.desc      Verify builderContext behavior for matrix index 64.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0065 begin');
      const index: number = 64;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0065 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0066
     * @tc.name      testBuilderContext0066
     * @tc.desc      Verify builderContext behavior for matrix index 65.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0066 begin');
      const index: number = 65;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0066 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0067
     * @tc.name      testBuilderContext0067
     * @tc.desc      Verify builderContext behavior for matrix index 66.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0067 begin');
      const index: number = 66;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0067 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0068
     * @tc.name      testBuilderContext0068
     * @tc.desc      Verify builderContext behavior for matrix index 67.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0068 begin');
      const index: number = 67;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0068 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0069
     * @tc.name      testBuilderContext0069
     * @tc.desc      Verify builderContext behavior for matrix index 68.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0069 begin');
      const index: number = 68;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0069 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0070
     * @tc.name      testBuilderContext0070
     * @tc.desc      Verify builderContext behavior for matrix index 69.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0070 begin');
      const index: number = 69;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0070 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0071
     * @tc.name      testBuilderContext0071
     * @tc.desc      Verify builderContext behavior for matrix index 70.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0071 begin');
      const index: number = 70;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0071 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0072
     * @tc.name      testBuilderContext0072
     * @tc.desc      Verify builderContext behavior for matrix index 71.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0072 begin');
      const index: number = 71;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0072 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0073
     * @tc.name      testBuilderContext0073
     * @tc.desc      Verify builderContext behavior for matrix index 72.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0073 begin');
      const index: number = 72;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0073 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0074
     * @tc.name      testBuilderContext0074
     * @tc.desc      Verify builderContext behavior for matrix index 73.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0074 begin');
      const index: number = 73;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0074 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0075
     * @tc.name      testBuilderContext0075
     * @tc.desc      Verify builderContext behavior for matrix index 74.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0075 begin');
      const index: number = 74;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0075 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0076
     * @tc.name      testBuilderContext0076
     * @tc.desc      Verify builderContext behavior for matrix index 75.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0076 begin');
      const index: number = 75;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0076 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0077
     * @tc.name      testBuilderContext0077
     * @tc.desc      Verify builderContext behavior for matrix index 76.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0077 begin');
      const index: number = 76;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0077 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0078
     * @tc.name      testBuilderContext0078
     * @tc.desc      Verify builderContext behavior for matrix index 77.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0078 begin');
      const index: number = 77;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0078 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0079
     * @tc.name      testBuilderContext0079
     * @tc.desc      Verify builderContext behavior for matrix index 78.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0079 begin');
      const index: number = 78;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0079 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0080
     * @tc.name      testBuilderContext0080
     * @tc.desc      Verify builderContext behavior for matrix index 79.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0080 begin');
      const index: number = 79;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0080 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0081
     * @tc.name      testBuilderContext0081
     * @tc.desc      Verify builderContext behavior for matrix index 80.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0081 begin');
      const index: number = 80;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0081 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0082
     * @tc.name      testBuilderContext0082
     * @tc.desc      Verify builderContext behavior for matrix index 81.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0082 begin');
      const index: number = 81;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0082 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0083
     * @tc.name      testBuilderContext0083
     * @tc.desc      Verify builderContext behavior for matrix index 82.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0083 begin');
      const index: number = 82;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0083 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0084
     * @tc.name      testBuilderContext0084
     * @tc.desc      Verify builderContext behavior for matrix index 83.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0084 begin');
      const index: number = 83;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0084 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0085
     * @tc.name      testBuilderContext0085
     * @tc.desc      Verify builderContext behavior for matrix index 84.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0085 begin');
      const index: number = 84;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0085 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0086
     * @tc.name      testBuilderContext0086
     * @tc.desc      Verify builderContext behavior for matrix index 85.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0086 begin');
      const index: number = 85;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0086 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0087
     * @tc.name      testBuilderContext0087
     * @tc.desc      Verify builderContext behavior for matrix index 86.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0087 begin');
      const index: number = 86;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0087 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0088
     * @tc.name      testBuilderContext0088
     * @tc.desc      Verify builderContext behavior for matrix index 87.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0088 begin');
      const index: number = 87;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0088 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0089
     * @tc.name      testBuilderContext0089
     * @tc.desc      Verify builderContext behavior for matrix index 88.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0089 begin');
      const index: number = 88;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0089 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0090
     * @tc.name      testBuilderContext0090
     * @tc.desc      Verify builderContext behavior for matrix index 89.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0090 begin');
      const index: number = 89;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0090 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0091
     * @tc.name      testBuilderContext0091
     * @tc.desc      Verify builderContext behavior for matrix index 90.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0091 begin');
      const index: number = 90;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0091 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0092
     * @tc.name      testBuilderContext0092
     * @tc.desc      Verify builderContext behavior for matrix index 91.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0092 begin');
      const index: number = 91;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0092 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0093
     * @tc.name      testBuilderContext0093
     * @tc.desc      Verify builderContext behavior for matrix index 92.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0093 begin');
      const index: number = 92;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0093 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0094
     * @tc.name      testBuilderContext0094
     * @tc.desc      Verify builderContext behavior for matrix index 93.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0094 begin');
      const index: number = 93;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0094 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0095
     * @tc.name      testBuilderContext0095
     * @tc.desc      Verify builderContext behavior for matrix index 94.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0095 begin');
      const index: number = 94;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0095 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0096
     * @tc.name      testBuilderContext0096
     * @tc.desc      Verify builderContext behavior for matrix index 95.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0096 begin');
      const index: number = 95;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0096 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0097
     * @tc.name      testBuilderContext0097
     * @tc.desc      Verify builderContext behavior for matrix index 96.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0097 begin');
      const index: number = 96;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0097 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0098
     * @tc.name      testBuilderContext0098
     * @tc.desc      Verify builderContext behavior for matrix index 97.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0098 begin');
      const index: number = 97;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0098 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0099
     * @tc.name      testBuilderContext0099
     * @tc.desc      Verify builderContext behavior for matrix index 98.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0099 begin');
      const index: number = 98;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0099 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0100
     * @tc.name      testBuilderContext0100
     * @tc.desc      Verify builderContext behavior for matrix index 99.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0100 begin');
      const index: number = 99;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0100 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0101
     * @tc.name      testBuilderContext0101
     * @tc.desc      Verify builderContext behavior for matrix index 100.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0101 begin');
      const index: number = 100;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0101 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0102
     * @tc.name      testBuilderContext0102
     * @tc.desc      Verify builderContext behavior for matrix index 101.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0102 begin');
      const index: number = 101;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0102 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0103
     * @tc.name      testBuilderContext0103
     * @tc.desc      Verify builderContext behavior for matrix index 102.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0103 begin');
      const index: number = 102;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0103 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0104
     * @tc.name      testBuilderContext0104
     * @tc.desc      Verify builderContext behavior for matrix index 103.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0104 begin');
      const index: number = 103;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0104 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0105
     * @tc.name      testBuilderContext0105
     * @tc.desc      Verify builderContext behavior for matrix index 104.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0105 begin');
      const index: number = 104;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0105 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0106
     * @tc.name      testBuilderContext0106
     * @tc.desc      Verify builderContext behavior for matrix index 105.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0106 begin');
      const index: number = 105;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0106 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0107
     * @tc.name      testBuilderContext0107
     * @tc.desc      Verify builderContext behavior for matrix index 106.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0107 begin');
      const index: number = 106;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0107 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0108
     * @tc.name      testBuilderContext0108
     * @tc.desc      Verify builderContext behavior for matrix index 107.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0108 begin');
      const index: number = 107;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0108 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0109
     * @tc.name      testBuilderContext0109
     * @tc.desc      Verify builderContext behavior for matrix index 108.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0109 begin');
      const index: number = 108;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0109 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0110
     * @tc.name      testBuilderContext0110
     * @tc.desc      Verify builderContext behavior for matrix index 109.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0110 begin');
      const index: number = 109;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0110 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0111
     * @tc.name      testBuilderContext0111
     * @tc.desc      Verify builderContext behavior for matrix index 110.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0111 begin');
      const index: number = 110;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0111 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0112
     * @tc.name      testBuilderContext0112
     * @tc.desc      Verify builderContext behavior for matrix index 111.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0112 begin');
      const index: number = 111;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0112 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0113
     * @tc.name      testBuilderContext0113
     * @tc.desc      Verify builderContext behavior for matrix index 112.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0113 begin');
      const index: number = 112;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0113 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0114
     * @tc.name      testBuilderContext0114
     * @tc.desc      Verify builderContext behavior for matrix index 113.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0114 begin');
      const index: number = 113;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0114 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0115
     * @tc.name      testBuilderContext0115
     * @tc.desc      Verify builderContext behavior for matrix index 114.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0115 begin');
      const index: number = 114;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0115 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0116
     * @tc.name      testBuilderContext0116
     * @tc.desc      Verify builderContext behavior for matrix index 115.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0116 begin');
      const index: number = 115;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0116 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0117
     * @tc.name      testBuilderContext0117
     * @tc.desc      Verify builderContext behavior for matrix index 116.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0117 begin');
      const index: number = 116;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0117 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0118
     * @tc.name      testBuilderContext0118
     * @tc.desc      Verify builderContext behavior for matrix index 117.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0118 begin');
      const index: number = 117;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0118 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0119
     * @tc.name      testBuilderContext0119
     * @tc.desc      Verify builderContext behavior for matrix index 118.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0119 begin');
      const index: number = 118;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0119 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0120
     * @tc.name      testBuilderContext0120
     * @tc.desc      Verify builderContext behavior for matrix index 119.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0120 begin');
      const index: number = 119;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0120 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0121
     * @tc.name      testBuilderContext0121
     * @tc.desc      Verify builderContext behavior for matrix index 120.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0121 begin');
      const index: number = 120;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0121 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0122
     * @tc.name      testBuilderContext0122
     * @tc.desc      Verify builderContext behavior for matrix index 121.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0122 begin');
      const index: number = 121;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0122 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0123
     * @tc.name      testBuilderContext0123
     * @tc.desc      Verify builderContext behavior for matrix index 122.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0123 begin');
      const index: number = 122;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0123 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0124
     * @tc.name      testBuilderContext0124
     * @tc.desc      Verify builderContext behavior for matrix index 123.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0124 begin');
      const index: number = 123;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0124 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0125
     * @tc.name      testBuilderContext0125
     * @tc.desc      Verify builderContext behavior for matrix index 124.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0125 begin');
      const index: number = 124;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0125 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0126
     * @tc.name      testBuilderContext0126
     * @tc.desc      Verify builderContext behavior for matrix index 125.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0126 begin');
      const index: number = 125;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0126 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0127
     * @tc.name      testBuilderContext0127
     * @tc.desc      Verify builderContext behavior for matrix index 126.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0127 begin');
      const index: number = 126;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0127 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0128
     * @tc.name      testBuilderContext0128
     * @tc.desc      Verify builderContext behavior for matrix index 127.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0128 begin');
      const index: number = 127;
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[index % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(index * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + index;
      const probe: ProbeObject = new ProbeObject('probe_' + index);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + index);
      expect(context.getObject('probe_missing_' + index) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0128 end');
    })

  })
}
