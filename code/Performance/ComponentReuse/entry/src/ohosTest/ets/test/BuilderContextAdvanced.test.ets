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
const TAG: string = '[Sample_ComponentReuse_BuilderContextAdvanced]';

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

export default function builderContextAdvancedTest() {
  describe('builderContextAdvancedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0129
     * @tc.name      testBuilderContext0129
     * @tc.desc      Verify builderContext behavior for matrix index 128.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0129 begin');
      const index: number = 128;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0129 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0130
     * @tc.name      testBuilderContext0130
     * @tc.desc      Verify builderContext behavior for matrix index 129.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0130 begin');
      const index: number = 129;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0130 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0131
     * @tc.name      testBuilderContext0131
     * @tc.desc      Verify builderContext behavior for matrix index 130.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0131 begin');
      const index: number = 130;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0131 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0132
     * @tc.name      testBuilderContext0132
     * @tc.desc      Verify builderContext behavior for matrix index 131.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0132 begin');
      const index: number = 131;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0132 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0133
     * @tc.name      testBuilderContext0133
     * @tc.desc      Verify builderContext behavior for matrix index 132.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0133 begin');
      const index: number = 132;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0133 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0134
     * @tc.name      testBuilderContext0134
     * @tc.desc      Verify builderContext behavior for matrix index 133.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0134 begin');
      const index: number = 133;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0134 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0135
     * @tc.name      testBuilderContext0135
     * @tc.desc      Verify builderContext behavior for matrix index 134.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0135 begin');
      const index: number = 134;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0135 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0136
     * @tc.name      testBuilderContext0136
     * @tc.desc      Verify builderContext behavior for matrix index 135.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0136 begin');
      const index: number = 135;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0136 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0137
     * @tc.name      testBuilderContext0137
     * @tc.desc      Verify builderContext behavior for matrix index 136.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0137 begin');
      const index: number = 136;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0137 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0138
     * @tc.name      testBuilderContext0138
     * @tc.desc      Verify builderContext behavior for matrix index 137.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0138 begin');
      const index: number = 137;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0138 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0139
     * @tc.name      testBuilderContext0139
     * @tc.desc      Verify builderContext behavior for matrix index 138.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0139 begin');
      const index: number = 138;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0139 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0140
     * @tc.name      testBuilderContext0140
     * @tc.desc      Verify builderContext behavior for matrix index 139.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0140 begin');
      const index: number = 139;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0140 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0141
     * @tc.name      testBuilderContext0141
     * @tc.desc      Verify builderContext behavior for matrix index 140.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0141 begin');
      const index: number = 140;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0141 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0142
     * @tc.name      testBuilderContext0142
     * @tc.desc      Verify builderContext behavior for matrix index 141.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0142 begin');
      const index: number = 141;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0142 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0143
     * @tc.name      testBuilderContext0143
     * @tc.desc      Verify builderContext behavior for matrix index 142.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0143 begin');
      const index: number = 142;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0143 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0144
     * @tc.name      testBuilderContext0144
     * @tc.desc      Verify builderContext behavior for matrix index 143.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0144 begin');
      const index: number = 143;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0144 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0145
     * @tc.name      testBuilderContext0145
     * @tc.desc      Verify builderContext behavior for matrix index 144.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0145 begin');
      const index: number = 144;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0145 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0146
     * @tc.name      testBuilderContext0146
     * @tc.desc      Verify builderContext behavior for matrix index 145.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0146 begin');
      const index: number = 145;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0146 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0147
     * @tc.name      testBuilderContext0147
     * @tc.desc      Verify builderContext behavior for matrix index 146.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0147 begin');
      const index: number = 146;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0147 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0148
     * @tc.name      testBuilderContext0148
     * @tc.desc      Verify builderContext behavior for matrix index 147.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0148 begin');
      const index: number = 147;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0148 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0149
     * @tc.name      testBuilderContext0149
     * @tc.desc      Verify builderContext behavior for matrix index 148.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0149 begin');
      const index: number = 148;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0149 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0150
     * @tc.name      testBuilderContext0150
     * @tc.desc      Verify builderContext behavior for matrix index 149.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0150 begin');
      const index: number = 149;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0150 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0151
     * @tc.name      testBuilderContext0151
     * @tc.desc      Verify builderContext behavior for matrix index 150.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0151 begin');
      const index: number = 150;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0151 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0152
     * @tc.name      testBuilderContext0152
     * @tc.desc      Verify builderContext behavior for matrix index 151.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0152 begin');
      const index: number = 151;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0152 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0153
     * @tc.name      testBuilderContext0153
     * @tc.desc      Verify builderContext behavior for matrix index 152.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0153 begin');
      const index: number = 152;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0153 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0154
     * @tc.name      testBuilderContext0154
     * @tc.desc      Verify builderContext behavior for matrix index 153.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0154 begin');
      const index: number = 153;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0154 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0155
     * @tc.name      testBuilderContext0155
     * @tc.desc      Verify builderContext behavior for matrix index 154.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0155 begin');
      const index: number = 154;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0155 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0156
     * @tc.name      testBuilderContext0156
     * @tc.desc      Verify builderContext behavior for matrix index 155.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0156 begin');
      const index: number = 155;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0156 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0157
     * @tc.name      testBuilderContext0157
     * @tc.desc      Verify builderContext behavior for matrix index 156.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0157 begin');
      const index: number = 156;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0157 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0158
     * @tc.name      testBuilderContext0158
     * @tc.desc      Verify builderContext behavior for matrix index 157.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0158 begin');
      const index: number = 157;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0158 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0159
     * @tc.name      testBuilderContext0159
     * @tc.desc      Verify builderContext behavior for matrix index 158.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0159 begin');
      const index: number = 158;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0159 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0160
     * @tc.name      testBuilderContext0160
     * @tc.desc      Verify builderContext behavior for matrix index 159.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0160 begin');
      const index: number = 159;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0160 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0161
     * @tc.name      testBuilderContext0161
     * @tc.desc      Verify builderContext behavior for matrix index 160.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0161 begin');
      const index: number = 160;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0161 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0162
     * @tc.name      testBuilderContext0162
     * @tc.desc      Verify builderContext behavior for matrix index 161.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0162 begin');
      const index: number = 161;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0162 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0163
     * @tc.name      testBuilderContext0163
     * @tc.desc      Verify builderContext behavior for matrix index 162.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0163 begin');
      const index: number = 162;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0163 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0164
     * @tc.name      testBuilderContext0164
     * @tc.desc      Verify builderContext behavior for matrix index 163.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0164 begin');
      const index: number = 163;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0164 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0165
     * @tc.name      testBuilderContext0165
     * @tc.desc      Verify builderContext behavior for matrix index 164.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0165 begin');
      const index: number = 164;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0165 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0166
     * @tc.name      testBuilderContext0166
     * @tc.desc      Verify builderContext behavior for matrix index 165.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0166 begin');
      const index: number = 165;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0166 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0167
     * @tc.name      testBuilderContext0167
     * @tc.desc      Verify builderContext behavior for matrix index 166.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0167 begin');
      const index: number = 166;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0167 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0168
     * @tc.name      testBuilderContext0168
     * @tc.desc      Verify builderContext behavior for matrix index 167.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0168 begin');
      const index: number = 167;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0168 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0169
     * @tc.name      testBuilderContext0169
     * @tc.desc      Verify builderContext behavior for matrix index 168.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0169 begin');
      const index: number = 168;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0169 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0170
     * @tc.name      testBuilderContext0170
     * @tc.desc      Verify builderContext behavior for matrix index 169.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0170 begin');
      const index: number = 169;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0170 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0171
     * @tc.name      testBuilderContext0171
     * @tc.desc      Verify builderContext behavior for matrix index 170.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0171 begin');
      const index: number = 170;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0171 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0172
     * @tc.name      testBuilderContext0172
     * @tc.desc      Verify builderContext behavior for matrix index 171.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0172 begin');
      const index: number = 171;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0172 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0173
     * @tc.name      testBuilderContext0173
     * @tc.desc      Verify builderContext behavior for matrix index 172.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0173 begin');
      const index: number = 172;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0173 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0174
     * @tc.name      testBuilderContext0174
     * @tc.desc      Verify builderContext behavior for matrix index 173.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0174 begin');
      const index: number = 173;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0174 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0175
     * @tc.name      testBuilderContext0175
     * @tc.desc      Verify builderContext behavior for matrix index 174.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0175 begin');
      const index: number = 174;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0175 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0176
     * @tc.name      testBuilderContext0176
     * @tc.desc      Verify builderContext behavior for matrix index 175.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0176 begin');
      const index: number = 175;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0176 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0177
     * @tc.name      testBuilderContext0177
     * @tc.desc      Verify builderContext behavior for matrix index 176.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0177 begin');
      const index: number = 176;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0177 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0178
     * @tc.name      testBuilderContext0178
     * @tc.desc      Verify builderContext behavior for matrix index 177.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0178 begin');
      const index: number = 177;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0178 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0179
     * @tc.name      testBuilderContext0179
     * @tc.desc      Verify builderContext behavior for matrix index 178.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0179 begin');
      const index: number = 178;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0179 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0180
     * @tc.name      testBuilderContext0180
     * @tc.desc      Verify builderContext behavior for matrix index 179.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0180 begin');
      const index: number = 179;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0180 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0181
     * @tc.name      testBuilderContext0181
     * @tc.desc      Verify builderContext behavior for matrix index 180.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0181 begin');
      const index: number = 180;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0181 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0182
     * @tc.name      testBuilderContext0182
     * @tc.desc      Verify builderContext behavior for matrix index 181.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0182 begin');
      const index: number = 181;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0182 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0183
     * @tc.name      testBuilderContext0183
     * @tc.desc      Verify builderContext behavior for matrix index 182.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0183 begin');
      const index: number = 182;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0183 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0184
     * @tc.name      testBuilderContext0184
     * @tc.desc      Verify builderContext behavior for matrix index 183.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0184 begin');
      const index: number = 183;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0184 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0185
     * @tc.name      testBuilderContext0185
     * @tc.desc      Verify builderContext behavior for matrix index 184.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0185 begin');
      const index: number = 184;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0185 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0186
     * @tc.name      testBuilderContext0186
     * @tc.desc      Verify builderContext behavior for matrix index 185.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0186 begin');
      const index: number = 185;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0186 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0187
     * @tc.name      testBuilderContext0187
     * @tc.desc      Verify builderContext behavior for matrix index 186.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0187 begin');
      const index: number = 186;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0187 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0188
     * @tc.name      testBuilderContext0188
     * @tc.desc      Verify builderContext behavior for matrix index 187.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0188 begin');
      const index: number = 187;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0188 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0189
     * @tc.name      testBuilderContext0189
     * @tc.desc      Verify builderContext behavior for matrix index 188.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0189 begin');
      const index: number = 188;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0189 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0190
     * @tc.name      testBuilderContext0190
     * @tc.desc      Verify builderContext behavior for matrix index 189.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0190 begin');
      const index: number = 189;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0190 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0191
     * @tc.name      testBuilderContext0191
     * @tc.desc      Verify builderContext behavior for matrix index 190.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0191 begin');
      const index: number = 190;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0191 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0192
     * @tc.name      testBuilderContext0192
     * @tc.desc      Verify builderContext behavior for matrix index 191.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0192 begin');
      const index: number = 191;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0192 end');
    })

  })
}
