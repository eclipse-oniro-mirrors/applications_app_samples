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
const TAG: string = '[Sample_ComponentReuse_BuilderContext]';

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

export default function builderContextTest() {
  describe('builderContextTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0001
     * @tc.name testBuilderContext0001
     * @tc.desc Verify BuilderContext behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0001 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[0 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(0 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 0;
      const probe: ProbeObject = new ProbeObject('probe_' + 0);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 0);
      expect(context.getObject('probe_missing_' + 0) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0001 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0002
     * @tc.name testBuilderContext0002
     * @tc.desc Verify BuilderContext behavior for matrix index 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0002 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[1 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(1 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 1;
      const probe: ProbeObject = new ProbeObject('probe_' + 1);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 1);
      expect(context.getObject('probe_missing_' + 1) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0002 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0003
     * @tc.name testBuilderContext0003
     * @tc.desc Verify BuilderContext behavior for matrix index 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0003 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[2 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(2 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 2;
      const probe: ProbeObject = new ProbeObject('probe_' + 2);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 2);
      expect(context.getObject('probe_missing_' + 2) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0003 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0004
     * @tc.name testBuilderContext0004
     * @tc.desc Verify BuilderContext behavior for matrix index 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0004 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[3 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(3 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 3;
      const probe: ProbeObject = new ProbeObject('probe_' + 3);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 3);
      expect(context.getObject('probe_missing_' + 3) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0004 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0005
     * @tc.name testBuilderContext0005
     * @tc.desc Verify BuilderContext behavior for matrix index 4
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0005 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[4 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(4 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 4;
      const probe: ProbeObject = new ProbeObject('probe_' + 4);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 4);
      expect(context.getObject('probe_missing_' + 4) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0005 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0006
     * @tc.name testBuilderContext0006
     * @tc.desc Verify BuilderContext behavior for matrix index 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0006 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[5 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(5 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 5;
      const probe: ProbeObject = new ProbeObject('probe_' + 5);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 5);
      expect(context.getObject('probe_missing_' + 5) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0006 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0007
     * @tc.name testBuilderContext0007
     * @tc.desc Verify BuilderContext behavior for matrix index 6
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0007 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[6 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(6 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 6;
      const probe: ProbeObject = new ProbeObject('probe_' + 6);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 6);
      expect(context.getObject('probe_missing_' + 6) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0007 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0008
     * @tc.name testBuilderContext0008
     * @tc.desc Verify BuilderContext behavior for matrix index 7
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0008 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[7 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(7 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 7;
      const probe: ProbeObject = new ProbeObject('probe_' + 7);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 7);
      expect(context.getObject('probe_missing_' + 7) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0008 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0009
     * @tc.name testBuilderContext0009
     * @tc.desc Verify BuilderContext behavior for matrix index 8
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0009 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[8 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(8 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 8;
      const probe: ProbeObject = new ProbeObject('probe_' + 8);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 8);
      expect(context.getObject('probe_missing_' + 8) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0009 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0010
     * @tc.name testBuilderContext0010
     * @tc.desc Verify BuilderContext behavior for matrix index 9
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0010 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[9 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(9 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 9;
      const probe: ProbeObject = new ProbeObject('probe_' + 9);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 9);
      expect(context.getObject('probe_missing_' + 9) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0010 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0011
     * @tc.name testBuilderContext0011
     * @tc.desc Verify BuilderContext behavior for matrix index 10
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0011 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[10 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(10 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 10;
      const probe: ProbeObject = new ProbeObject('probe_' + 10);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 10);
      expect(context.getObject('probe_missing_' + 10) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0011 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0012
     * @tc.name testBuilderContext0012
     * @tc.desc Verify BuilderContext behavior for matrix index 11
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0012 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[11 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(11 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 11;
      const probe: ProbeObject = new ProbeObject('probe_' + 11);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 11);
      expect(context.getObject('probe_missing_' + 11) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0012 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0013
     * @tc.name testBuilderContext0013
     * @tc.desc Verify BuilderContext behavior for matrix index 12
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0013 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[12 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(12 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 12;
      const probe: ProbeObject = new ProbeObject('probe_' + 12);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 12);
      expect(context.getObject('probe_missing_' + 12) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0013 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0014
     * @tc.name testBuilderContext0014
     * @tc.desc Verify BuilderContext behavior for matrix index 13
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0014 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[13 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(13 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 13;
      const probe: ProbeObject = new ProbeObject('probe_' + 13);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 13);
      expect(context.getObject('probe_missing_' + 13) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0014 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0015
     * @tc.name testBuilderContext0015
     * @tc.desc Verify BuilderContext behavior for matrix index 14
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0015 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[14 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(14 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 14;
      const probe: ProbeObject = new ProbeObject('probe_' + 14);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 14);
      expect(context.getObject('probe_missing_' + 14) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0015 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0016
     * @tc.name testBuilderContext0016
     * @tc.desc Verify BuilderContext behavior for matrix index 15
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0016 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[15 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(15 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 15;
      const probe: ProbeObject = new ProbeObject('probe_' + 15);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 15);
      expect(context.getObject('probe_missing_' + 15) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0016 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0019
     * @tc.name testBuilderContext0019
     * @tc.desc Verify BuilderContext behavior for matrix index 18
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0019 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[18 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(18 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 18;
      const probe: ProbeObject = new ProbeObject('probe_' + 18);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 18);
      expect(context.getObject('probe_missing_' + 18) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0019 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0020
     * @tc.name testBuilderContext0020
     * @tc.desc Verify BuilderContext behavior for matrix index 19
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0020 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[19 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(19 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 19;
      const probe: ProbeObject = new ProbeObject('probe_' + 19);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 19);
      expect(context.getObject('probe_missing_' + 19) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0020 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0021
     * @tc.name testBuilderContext0021
     * @tc.desc Verify BuilderContext behavior for matrix index 20
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0021 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[20 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(20 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 20;
      const probe: ProbeObject = new ProbeObject('probe_' + 20);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 20);
      expect(context.getObject('probe_missing_' + 20) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0021 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0026
     * @tc.name testBuilderContext0026
     * @tc.desc Verify BuilderContext behavior for matrix index 25
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0026 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[25 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(25 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 25;
      const probe: ProbeObject = new ProbeObject('probe_' + 25);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 25);
      expect(context.getObject('probe_missing_' + 25) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0026 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0032
     * @tc.name testBuilderContext0032
     * @tc.desc Verify BuilderContext behavior for matrix index 31
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0032 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[31 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(31 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 31;
      const probe: ProbeObject = new ProbeObject('probe_' + 31);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 31);
      expect(context.getObject('probe_missing_' + 31) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0032 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0040
     * @tc.name testBuilderContext0040
     * @tc.desc Verify BuilderContext behavior for matrix index 39
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0040 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[39 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(39 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 39;
      const probe: ProbeObject = new ProbeObject('probe_' + 39);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 39);
      expect(context.getObject('probe_missing_' + 39) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0040 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0064
     * @tc.name testBuilderContext0064
     * @tc.desc Verify BuilderContext behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0064 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[63 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(63 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 63;
      const probe: ProbeObject = new ProbeObject('probe_' + 63);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 63);
      expect(context.getObject('probe_missing_' + 63) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0064 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0065
     * @tc.name testBuilderContext0065
     * @tc.desc Verify BuilderContext behavior for matrix index 64
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0065 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[64 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(64 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 64;
      const probe: ProbeObject = new ProbeObject('probe_' + 64);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 64);
      expect(context.getObject('probe_missing_' + 64) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0065 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0128
     * @tc.name testBuilderContext0128
     * @tc.desc Verify BuilderContext behavior for matrix index 127
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0128 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[127 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(127 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 127;
      const probe: ProbeObject = new ProbeObject('probe_' + 127);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 127);
      expect(context.getObject('probe_missing_' + 127) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0128 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0129
     * @tc.name testBuilderContext0129
     * @tc.desc Verify BuilderContext behavior for matrix index 128
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0129 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[128 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(128 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 128;
      const probe: ProbeObject = new ProbeObject('probe_' + 128);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 128);
      expect(context.getObject('probe_missing_' + 128) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0129 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0192
     * @tc.name testBuilderContext0192
     * @tc.desc Verify BuilderContext behavior for matrix index 191
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0192 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[191 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(191 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 191;
      const probe: ProbeObject = new ProbeObject('probe_' + 191);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 191);
      expect(context.getObject('probe_missing_' + 191) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0192 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0255
     * @tc.name testBuilderContext0255
     * @tc.desc Verify BuilderContext behavior for matrix index 254
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0255 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[254 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(254 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 254;
      const probe: ProbeObject = new ProbeObject('probe_' + 254);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 254);
      expect(context.getObject('probe_missing_' + 254) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0255 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_BUILDER_0256
     * @tc.name testBuilderContext0256
     * @tc.desc Verify BuilderContext behavior for matrix index 255
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBuilderContext0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0256 begin`);
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = BUILDER_KEYS[255 % BUILDER_KEYS.length];
      const keyB: string = BUILDER_KEYS[(255 * 7 + 3) % BUILDER_KEYS.length];
      expect(context.getObject(keyA) !== undefined).assertTrue();
      expect(context.getObject(keyB) !== undefined).assertTrue();
      const probeKey: string = 'probe_builder_' + 255;
      const probe: ProbeObject = new ProbeObject('probe_' + 255);
      context.setObject(probeKey, probe);
      const loaded: ProbeObject = context.getObject(probeKey) as ProbeObject;
      expect(loaded.tag).assertEqual('probe_' + 255);
      expect(context.getObject('probe_missing_' + 255) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testBuilderContext0256 end`);
    });
  })
}
