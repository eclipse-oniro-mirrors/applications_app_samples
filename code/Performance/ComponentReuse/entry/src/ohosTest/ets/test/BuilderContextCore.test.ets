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
const TAG: string = '[Sample_ComponentReuse_BuilderContextCore]';

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

export default function builderContextCoreTest() {
  describe('builderContextCoreTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0001
     * @tc.name      testBuilderContext0001
     * @tc.desc      Verify builderContext behavior for matrix index 0.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0001 begin');
      const index: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0001 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0002
     * @tc.name      testBuilderContext0002
     * @tc.desc      Verify builderContext behavior for matrix index 1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0002 begin');
      const index: number = 1;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0002 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0003
     * @tc.name      testBuilderContext0003
     * @tc.desc      Verify builderContext behavior for matrix index 2.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0003 begin');
      const index: number = 2;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0003 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0004
     * @tc.name      testBuilderContext0004
     * @tc.desc      Verify builderContext behavior for matrix index 3.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0004 begin');
      const index: number = 3;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0004 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0005
     * @tc.name      testBuilderContext0005
     * @tc.desc      Verify builderContext behavior for matrix index 4.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0005 begin');
      const index: number = 4;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0005 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0006
     * @tc.name      testBuilderContext0006
     * @tc.desc      Verify builderContext behavior for matrix index 5.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0006 begin');
      const index: number = 5;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0006 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0007
     * @tc.name      testBuilderContext0007
     * @tc.desc      Verify builderContext behavior for matrix index 6.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0007 begin');
      const index: number = 6;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0007 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0008
     * @tc.name      testBuilderContext0008
     * @tc.desc      Verify builderContext behavior for matrix index 7.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0008 begin');
      const index: number = 7;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0008 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0009
     * @tc.name      testBuilderContext0009
     * @tc.desc      Verify builderContext behavior for matrix index 8.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0009 begin');
      const index: number = 8;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0009 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0010
     * @tc.name      testBuilderContext0010
     * @tc.desc      Verify builderContext behavior for matrix index 9.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0010 begin');
      const index: number = 9;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0010 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0011
     * @tc.name      testBuilderContext0011
     * @tc.desc      Verify builderContext behavior for matrix index 10.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0011 begin');
      const index: number = 10;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0011 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0012
     * @tc.name      testBuilderContext0012
     * @tc.desc      Verify builderContext behavior for matrix index 11.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0012 begin');
      const index: number = 11;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0012 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0013
     * @tc.name      testBuilderContext0013
     * @tc.desc      Verify builderContext behavior for matrix index 12.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0013 begin');
      const index: number = 12;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0013 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0014
     * @tc.name      testBuilderContext0014
     * @tc.desc      Verify builderContext behavior for matrix index 13.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0014 begin');
      const index: number = 13;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0014 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0015
     * @tc.name      testBuilderContext0015
     * @tc.desc      Verify builderContext behavior for matrix index 14.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0015 begin');
      const index: number = 14;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0015 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0016
     * @tc.name      testBuilderContext0016
     * @tc.desc      Verify builderContext behavior for matrix index 15.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0016 begin');
      const index: number = 15;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0016 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0017
     * @tc.name      testBuilderContext0017
     * @tc.desc      Verify builderContext behavior for matrix index 16.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0017 begin');
      const index: number = 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0017 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0018
     * @tc.name      testBuilderContext0018
     * @tc.desc      Verify builderContext behavior for matrix index 17.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0018 begin');
      const index: number = 17;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0018 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0019
     * @tc.name      testBuilderContext0019
     * @tc.desc      Verify builderContext behavior for matrix index 18.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0019 begin');
      const index: number = 18;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0019 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0020
     * @tc.name      testBuilderContext0020
     * @tc.desc      Verify builderContext behavior for matrix index 19.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0020 begin');
      const index: number = 19;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0020 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0021
     * @tc.name      testBuilderContext0021
     * @tc.desc      Verify builderContext behavior for matrix index 20.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0021 begin');
      const index: number = 20;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0021 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0022
     * @tc.name      testBuilderContext0022
     * @tc.desc      Verify builderContext behavior for matrix index 21.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0022 begin');
      const index: number = 21;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0022 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0023
     * @tc.name      testBuilderContext0023
     * @tc.desc      Verify builderContext behavior for matrix index 22.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0023 begin');
      const index: number = 22;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0023 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0024
     * @tc.name      testBuilderContext0024
     * @tc.desc      Verify builderContext behavior for matrix index 23.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0024 begin');
      const index: number = 23;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0024 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0025
     * @tc.name      testBuilderContext0025
     * @tc.desc      Verify builderContext behavior for matrix index 24.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0025 begin');
      const index: number = 24;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0025 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0026
     * @tc.name      testBuilderContext0026
     * @tc.desc      Verify builderContext behavior for matrix index 25.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0026 begin');
      const index: number = 25;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0026 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0027
     * @tc.name      testBuilderContext0027
     * @tc.desc      Verify builderContext behavior for matrix index 26.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0027 begin');
      const index: number = 26;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0027 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0028
     * @tc.name      testBuilderContext0028
     * @tc.desc      Verify builderContext behavior for matrix index 27.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0028 begin');
      const index: number = 27;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0028 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0029
     * @tc.name      testBuilderContext0029
     * @tc.desc      Verify builderContext behavior for matrix index 28.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0029 begin');
      const index: number = 28;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0029 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0030
     * @tc.name      testBuilderContext0030
     * @tc.desc      Verify builderContext behavior for matrix index 29.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0030 begin');
      const index: number = 29;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0030 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0031
     * @tc.name      testBuilderContext0031
     * @tc.desc      Verify builderContext behavior for matrix index 30.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0031 begin');
      const index: number = 30;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0031 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0032
     * @tc.name      testBuilderContext0032
     * @tc.desc      Verify builderContext behavior for matrix index 31.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0032 begin');
      const index: number = 31;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0032 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0033
     * @tc.name      testBuilderContext0033
     * @tc.desc      Verify builderContext behavior for matrix index 32.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0033 begin');
      const index: number = 32;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0033 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0034
     * @tc.name      testBuilderContext0034
     * @tc.desc      Verify builderContext behavior for matrix index 33.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0034 begin');
      const index: number = 33;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0034 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0035
     * @tc.name      testBuilderContext0035
     * @tc.desc      Verify builderContext behavior for matrix index 34.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0035 begin');
      const index: number = 34;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0035 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0036
     * @tc.name      testBuilderContext0036
     * @tc.desc      Verify builderContext behavior for matrix index 35.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0036 begin');
      const index: number = 35;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0036 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0037
     * @tc.name      testBuilderContext0037
     * @tc.desc      Verify builderContext behavior for matrix index 36.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0037 begin');
      const index: number = 36;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0037 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0038
     * @tc.name      testBuilderContext0038
     * @tc.desc      Verify builderContext behavior for matrix index 37.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0038 begin');
      const index: number = 37;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0038 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0039
     * @tc.name      testBuilderContext0039
     * @tc.desc      Verify builderContext behavior for matrix index 38.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0039 begin');
      const index: number = 38;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0039 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0040
     * @tc.name      testBuilderContext0040
     * @tc.desc      Verify builderContext behavior for matrix index 39.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0040 begin');
      const index: number = 39;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0040 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0041
     * @tc.name      testBuilderContext0041
     * @tc.desc      Verify builderContext behavior for matrix index 40.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0041 begin');
      const index: number = 40;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0041 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0042
     * @tc.name      testBuilderContext0042
     * @tc.desc      Verify builderContext behavior for matrix index 41.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0042 begin');
      const index: number = 41;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0042 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0043
     * @tc.name      testBuilderContext0043
     * @tc.desc      Verify builderContext behavior for matrix index 42.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0043 begin');
      const index: number = 42;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0043 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0044
     * @tc.name      testBuilderContext0044
     * @tc.desc      Verify builderContext behavior for matrix index 43.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0044 begin');
      const index: number = 43;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0044 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0045
     * @tc.name      testBuilderContext0045
     * @tc.desc      Verify builderContext behavior for matrix index 44.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0045 begin');
      const index: number = 44;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0045 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0046
     * @tc.name      testBuilderContext0046
     * @tc.desc      Verify builderContext behavior for matrix index 45.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0046 begin');
      const index: number = 45;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0046 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0047
     * @tc.name      testBuilderContext0047
     * @tc.desc      Verify builderContext behavior for matrix index 46.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0047 begin');
      const index: number = 46;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0047 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0048
     * @tc.name      testBuilderContext0048
     * @tc.desc      Verify builderContext behavior for matrix index 47.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0048 begin');
      const index: number = 47;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0048 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0049
     * @tc.name      testBuilderContext0049
     * @tc.desc      Verify builderContext behavior for matrix index 48.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0049 begin');
      const index: number = 48;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0049 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0050
     * @tc.name      testBuilderContext0050
     * @tc.desc      Verify builderContext behavior for matrix index 49.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0050 begin');
      const index: number = 49;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0050 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0051
     * @tc.name      testBuilderContext0051
     * @tc.desc      Verify builderContext behavior for matrix index 50.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0051 begin');
      const index: number = 50;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0051 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0052
     * @tc.name      testBuilderContext0052
     * @tc.desc      Verify builderContext behavior for matrix index 51.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0052 begin');
      const index: number = 51;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0052 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0053
     * @tc.name      testBuilderContext0053
     * @tc.desc      Verify builderContext behavior for matrix index 52.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0053 begin');
      const index: number = 52;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0053 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0054
     * @tc.name      testBuilderContext0054
     * @tc.desc      Verify builderContext behavior for matrix index 53.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0054 begin');
      const index: number = 53;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0054 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0055
     * @tc.name      testBuilderContext0055
     * @tc.desc      Verify builderContext behavior for matrix index 54.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0055 begin');
      const index: number = 54;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0055 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0056
     * @tc.name      testBuilderContext0056
     * @tc.desc      Verify builderContext behavior for matrix index 55.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0056 begin');
      const index: number = 55;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0056 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0057
     * @tc.name      testBuilderContext0057
     * @tc.desc      Verify builderContext behavior for matrix index 56.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0057 begin');
      const index: number = 56;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0057 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0058
     * @tc.name      testBuilderContext0058
     * @tc.desc      Verify builderContext behavior for matrix index 57.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0058 begin');
      const index: number = 57;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0058 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0059
     * @tc.name      testBuilderContext0059
     * @tc.desc      Verify builderContext behavior for matrix index 58.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0059 begin');
      const index: number = 58;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0059 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0060
     * @tc.name      testBuilderContext0060
     * @tc.desc      Verify builderContext behavior for matrix index 59.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0060 begin');
      const index: number = 59;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0060 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0061
     * @tc.name      testBuilderContext0061
     * @tc.desc      Verify builderContext behavior for matrix index 60.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0061 begin');
      const index: number = 60;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0061 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0062
     * @tc.name      testBuilderContext0062
     * @tc.desc      Verify builderContext behavior for matrix index 61.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0062 begin');
      const index: number = 61;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0062 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0063
     * @tc.name      testBuilderContext0063
     * @tc.desc      Verify builderContext behavior for matrix index 62.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0063 begin');
      const index: number = 62;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0063 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0064
     * @tc.name      testBuilderContext0064
     * @tc.desc      Verify builderContext behavior for matrix index 63.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0064 begin');
      const index: number = 63;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0064 end');
    })

  })
}
