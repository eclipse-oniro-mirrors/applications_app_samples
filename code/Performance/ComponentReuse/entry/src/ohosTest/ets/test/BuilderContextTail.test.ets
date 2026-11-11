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
const TAG: string = '[Sample_ComponentReuse_BuilderContextTail]';

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

export default function builderContextTailTest() {
  describe('builderContextTailTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0193
     * @tc.name      testBuilderContext0193
     * @tc.desc      Verify builderContext behavior for matrix index 192.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0193 begin');
      const index: number = 192;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0193 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0194
     * @tc.name      testBuilderContext0194
     * @tc.desc      Verify builderContext behavior for matrix index 193.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0194 begin');
      const index: number = 193;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0194 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0195
     * @tc.name      testBuilderContext0195
     * @tc.desc      Verify builderContext behavior for matrix index 194.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0195 begin');
      const index: number = 194;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0195 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0196
     * @tc.name      testBuilderContext0196
     * @tc.desc      Verify builderContext behavior for matrix index 195.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0196 begin');
      const index: number = 195;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0196 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0197
     * @tc.name      testBuilderContext0197
     * @tc.desc      Verify builderContext behavior for matrix index 196.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0197 begin');
      const index: number = 196;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0197 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0198
     * @tc.name      testBuilderContext0198
     * @tc.desc      Verify builderContext behavior for matrix index 197.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0198 begin');
      const index: number = 197;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0198 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0199
     * @tc.name      testBuilderContext0199
     * @tc.desc      Verify builderContext behavior for matrix index 198.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0199 begin');
      const index: number = 198;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0199 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0200
     * @tc.name      testBuilderContext0200
     * @tc.desc      Verify builderContext behavior for matrix index 199.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0200 begin');
      const index: number = 199;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0200 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0201
     * @tc.name      testBuilderContext0201
     * @tc.desc      Verify builderContext behavior for matrix index 200.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0201 begin');
      const index: number = 200;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0201 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0202
     * @tc.name      testBuilderContext0202
     * @tc.desc      Verify builderContext behavior for matrix index 201.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0202 begin');
      const index: number = 201;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0202 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0203
     * @tc.name      testBuilderContext0203
     * @tc.desc      Verify builderContext behavior for matrix index 202.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0203 begin');
      const index: number = 202;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0203 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0204
     * @tc.name      testBuilderContext0204
     * @tc.desc      Verify builderContext behavior for matrix index 203.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0204 begin');
      const index: number = 203;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0204 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0205
     * @tc.name      testBuilderContext0205
     * @tc.desc      Verify builderContext behavior for matrix index 204.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0205 begin');
      const index: number = 204;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0205 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0206
     * @tc.name      testBuilderContext0206
     * @tc.desc      Verify builderContext behavior for matrix index 205.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0206 begin');
      const index: number = 205;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0206 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0207
     * @tc.name      testBuilderContext0207
     * @tc.desc      Verify builderContext behavior for matrix index 206.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0207 begin');
      const index: number = 206;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0207 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0208
     * @tc.name      testBuilderContext0208
     * @tc.desc      Verify builderContext behavior for matrix index 207.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0208 begin');
      const index: number = 207;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0208 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0209
     * @tc.name      testBuilderContext0209
     * @tc.desc      Verify builderContext behavior for matrix index 208.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0209 begin');
      const index: number = 208;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0209 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0210
     * @tc.name      testBuilderContext0210
     * @tc.desc      Verify builderContext behavior for matrix index 209.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0210 begin');
      const index: number = 209;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0210 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0211
     * @tc.name      testBuilderContext0211
     * @tc.desc      Verify builderContext behavior for matrix index 210.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0211 begin');
      const index: number = 210;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0211 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0212
     * @tc.name      testBuilderContext0212
     * @tc.desc      Verify builderContext behavior for matrix index 211.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0212 begin');
      const index: number = 211;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0212 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0213
     * @tc.name      testBuilderContext0213
     * @tc.desc      Verify builderContext behavior for matrix index 212.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0213 begin');
      const index: number = 212;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0213 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0214
     * @tc.name      testBuilderContext0214
     * @tc.desc      Verify builderContext behavior for matrix index 213.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0214 begin');
      const index: number = 213;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0214 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0215
     * @tc.name      testBuilderContext0215
     * @tc.desc      Verify builderContext behavior for matrix index 214.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0215 begin');
      const index: number = 214;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0215 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0216
     * @tc.name      testBuilderContext0216
     * @tc.desc      Verify builderContext behavior for matrix index 215.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0216 begin');
      const index: number = 215;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0216 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0217
     * @tc.name      testBuilderContext0217
     * @tc.desc      Verify builderContext behavior for matrix index 216.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0217 begin');
      const index: number = 216;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0217 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0218
     * @tc.name      testBuilderContext0218
     * @tc.desc      Verify builderContext behavior for matrix index 217.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0218 begin');
      const index: number = 217;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0218 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0219
     * @tc.name      testBuilderContext0219
     * @tc.desc      Verify builderContext behavior for matrix index 218.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0219 begin');
      const index: number = 218;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0219 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0220
     * @tc.name      testBuilderContext0220
     * @tc.desc      Verify builderContext behavior for matrix index 219.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0220 begin');
      const index: number = 219;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0220 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0221
     * @tc.name      testBuilderContext0221
     * @tc.desc      Verify builderContext behavior for matrix index 220.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0221 begin');
      const index: number = 220;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0221 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0222
     * @tc.name      testBuilderContext0222
     * @tc.desc      Verify builderContext behavior for matrix index 221.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0222 begin');
      const index: number = 221;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0222 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0223
     * @tc.name      testBuilderContext0223
     * @tc.desc      Verify builderContext behavior for matrix index 222.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0223 begin');
      const index: number = 222;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0223 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0224
     * @tc.name      testBuilderContext0224
     * @tc.desc      Verify builderContext behavior for matrix index 223.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0224 begin');
      const index: number = 223;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0224 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0225
     * @tc.name      testBuilderContext0225
     * @tc.desc      Verify builderContext behavior for matrix index 224.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0225 begin');
      const index: number = 224;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0225 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0226
     * @tc.name      testBuilderContext0226
     * @tc.desc      Verify builderContext behavior for matrix index 225.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0226 begin');
      const index: number = 225;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0226 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0227
     * @tc.name      testBuilderContext0227
     * @tc.desc      Verify builderContext behavior for matrix index 226.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0227 begin');
      const index: number = 226;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0227 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0228
     * @tc.name      testBuilderContext0228
     * @tc.desc      Verify builderContext behavior for matrix index 227.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0228 begin');
      const index: number = 227;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0228 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0229
     * @tc.name      testBuilderContext0229
     * @tc.desc      Verify builderContext behavior for matrix index 228.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0229 begin');
      const index: number = 228;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0229 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0230
     * @tc.name      testBuilderContext0230
     * @tc.desc      Verify builderContext behavior for matrix index 229.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0230 begin');
      const index: number = 229;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0230 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0231
     * @tc.name      testBuilderContext0231
     * @tc.desc      Verify builderContext behavior for matrix index 230.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0231 begin');
      const index: number = 230;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0231 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0232
     * @tc.name      testBuilderContext0232
     * @tc.desc      Verify builderContext behavior for matrix index 231.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0232 begin');
      const index: number = 231;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0232 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0233
     * @tc.name      testBuilderContext0233
     * @tc.desc      Verify builderContext behavior for matrix index 232.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0233 begin');
      const index: number = 232;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0233 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0234
     * @tc.name      testBuilderContext0234
     * @tc.desc      Verify builderContext behavior for matrix index 233.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0234 begin');
      const index: number = 233;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0234 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0235
     * @tc.name      testBuilderContext0235
     * @tc.desc      Verify builderContext behavior for matrix index 234.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0235 begin');
      const index: number = 234;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0235 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0236
     * @tc.name      testBuilderContext0236
     * @tc.desc      Verify builderContext behavior for matrix index 235.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0236 begin');
      const index: number = 235;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0236 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0237
     * @tc.name      testBuilderContext0237
     * @tc.desc      Verify builderContext behavior for matrix index 236.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0237 begin');
      const index: number = 236;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0237 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0238
     * @tc.name      testBuilderContext0238
     * @tc.desc      Verify builderContext behavior for matrix index 237.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0238 begin');
      const index: number = 237;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0238 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0239
     * @tc.name      testBuilderContext0239
     * @tc.desc      Verify builderContext behavior for matrix index 238.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0239 begin');
      const index: number = 238;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0239 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0240
     * @tc.name      testBuilderContext0240
     * @tc.desc      Verify builderContext behavior for matrix index 239.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0240 begin');
      const index: number = 239;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0240 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0241
     * @tc.name      testBuilderContext0241
     * @tc.desc      Verify builderContext behavior for matrix index 240.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0241 begin');
      const index: number = 240;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0241 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0242
     * @tc.name      testBuilderContext0242
     * @tc.desc      Verify builderContext behavior for matrix index 241.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0242 begin');
      const index: number = 241;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0242 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0243
     * @tc.name      testBuilderContext0243
     * @tc.desc      Verify builderContext behavior for matrix index 242.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0243 begin');
      const index: number = 242;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0243 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0244
     * @tc.name      testBuilderContext0244
     * @tc.desc      Verify builderContext behavior for matrix index 243.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0244 begin');
      const index: number = 243;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0244 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0245
     * @tc.name      testBuilderContext0245
     * @tc.desc      Verify builderContext behavior for matrix index 244.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0245 begin');
      const index: number = 244;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0245 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0246
     * @tc.name      testBuilderContext0246
     * @tc.desc      Verify builderContext behavior for matrix index 245.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0246 begin');
      const index: number = 245;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0246 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0247
     * @tc.name      testBuilderContext0247
     * @tc.desc      Verify builderContext behavior for matrix index 246.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0247 begin');
      const index: number = 246;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0247 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0248
     * @tc.name      testBuilderContext0248
     * @tc.desc      Verify builderContext behavior for matrix index 247.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0248 begin');
      const index: number = 247;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0248 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0249
     * @tc.name      testBuilderContext0249
     * @tc.desc      Verify builderContext behavior for matrix index 248.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0249 begin');
      const index: number = 248;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0249 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0250
     * @tc.name      testBuilderContext0250
     * @tc.desc      Verify builderContext behavior for matrix index 249.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0250 begin');
      const index: number = 249;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0250 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0251
     * @tc.name      testBuilderContext0251
     * @tc.desc      Verify builderContext behavior for matrix index 250.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0251 begin');
      const index: number = 250;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0251 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0252
     * @tc.name      testBuilderContext0252
     * @tc.desc      Verify builderContext behavior for matrix index 251.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0252 begin');
      const index: number = 251;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0252 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0253
     * @tc.name      testBuilderContext0253
     * @tc.desc      Verify builderContext behavior for matrix index 252.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0253 begin');
      const index: number = 252;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0253 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0254
     * @tc.name      testBuilderContext0254
     * @tc.desc      Verify builderContext behavior for matrix index 253.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0254 begin');
      const index: number = 253;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0254 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0255
     * @tc.name      testBuilderContext0255
     * @tc.desc      Verify builderContext behavior for matrix index 254.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0255 begin');
      const index: number = 254;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0255 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_BUILDER_0256
     * @tc.name      testBuilderContext0256
     * @tc.desc      Verify builderContext behavior for matrix index 255.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBuilderContext0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0256 begin');
      const index: number = 255;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuilderContext0256 end');
    })

  })
}
