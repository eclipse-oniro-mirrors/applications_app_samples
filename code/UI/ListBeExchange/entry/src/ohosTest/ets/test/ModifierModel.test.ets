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
import { ListItemModifier } from 'listexchange/src/main/ets/model/AttributeModifier';

const DOMAIN: number = 0xF814;
const TAG: string = 'ModifierModelTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function modifierModelTest(): void {
  describe('ModifierModelTest', () => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MODIFIER_0201
     * @tc.name      testModifier0201
     * @tc.desc      Verify a new modifier starts with neutral scale and offsets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testModifier0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testModifier0201 begin');
      const modifier: ListItemModifier = new ListItemModifier();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.scale=${modifier.scale}, expected=1`);
      expect(modifier.scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.offsetX=${modifier.offsetX}, expected=0`);
      expect(modifier.offsetX).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.offsetY=${modifier.offsetY}, expected=0`);
      expect(modifier.offsetY).assertEqual(0);
      log('testModifier0201 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MODIFIER_0202
     * @tc.name      testModifier0202
     * @tc.desc      Verify a new modifier starts fully opaque without shadow or deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testModifier0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testModifier0202 begin');
      const modifier: ListItemModifier = new ListItemModifier();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.opacity=${modifier.opacity}, expected=1`);
      expect(modifier.opacity).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse modifier.hasShadow=${modifier.hasShadow}`);
      expect(modifier.hasShadow).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse modifier.isDeleted=${modifier.isDeleted}`);
      expect(modifier.isDeleted).assertFalse();
      log('testModifier0202 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MODIFIER_0203
     * @tc.name      testModifier0203
     * @tc.desc      Verify scale accepts successive press and release values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testModifier0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testModifier0203 begin');
      const modifier: ListItemModifier = new ListItemModifier();
      modifier.scale = 1.04;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.scale=${modifier.scale}, expected=1.04`);
      expect(modifier.scale).assertEqual(1.04);
      modifier.scale = 0.96;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.scale=${modifier.scale}, expected=0.96`);
      expect(modifier.scale).assertEqual(0.96);
      modifier.scale = 1;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.scale=${modifier.scale}, expected=1`);
      expect(modifier.scale).assertEqual(1);
      log('testModifier0203 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MODIFIER_0204
     * @tc.name      testModifier0204
     * @tc.desc      Verify vertical offset stores both positive and negative drags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testModifier0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testModifier0204 begin');
      const modifier: ListItemModifier = new ListItemModifier();
      modifier.offsetY = 25;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.offsetY=${modifier.offsetY}, expected=25`);
      expect(modifier.offsetY).assertEqual(25);
      modifier.offsetY = -25;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.offsetY=${modifier.offsetY}, expected=-25`);
      expect(modifier.offsetY).assertEqual(-25);
      modifier.offsetY = 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.offsetY=${modifier.offsetY}, expected=0`);
      expect(modifier.offsetY).assertEqual(0);
      log('testModifier0204 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MODIFIER_0205
     * @tc.name      testModifier0205
     * @tc.desc      Verify delete animation values for horizontal offset and opacity.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testModifier0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testModifier0205 begin');
      const modifier: ListItemModifier = new ListItemModifier();
      modifier.offsetX = 150;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.offsetX=${modifier.offsetX}, expected=150`);
      expect(modifier.offsetX).assertEqual(150);
      modifier.opacity = 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.opacity=${modifier.opacity}, expected=0`);
      expect(modifier.opacity).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.offsetY=${modifier.offsetY}, expected=0`);
      expect(modifier.offsetY).assertEqual(0);
      log('testModifier0205 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MODIFIER_0206
     * @tc.name      testModifier0206
     * @tc.desc      Verify two modifier instances keep their state fully independent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testModifier0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testModifier0206 begin');
      const first: ListItemModifier = new ListItemModifier();
      const second: ListItemModifier = new ListItemModifier();
      first.scale = 0.5;
      second.offsetY = 7;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.scale=${second.scale}, expected=1`);
      expect(second.scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.offsetY=${first.offsetY}, expected=0`);
      expect(first.offsetY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse first === second=${first === second}`);
      expect(first === second).assertFalse();
      log('testModifier0206 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MODIFIER_0207
     * @tc.name      testModifier0207
     * @tc.desc      Verify getInstance always returns the same shared instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testModifier0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testModifier0207 begin');
      const first: ListItemModifier = ListItemModifier.getInstance();
      const second: ListItemModifier = ListItemModifier.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first === second=${first === second}`);
      expect(first === second).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.scale=${first.scale}, expected=1`);
      expect(first.scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.opacity=${first.opacity}, expected=1`);
      expect(first.opacity).assertEqual(1);
      log('testModifier0207 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MODIFIER_0208
     * @tc.name      testModifier0208
     * @tc.desc      Verify shared instance state changes are visible through getInstance and can be restored.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testModifier0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testModifier0208 begin');
      const shared: ListItemModifier = ListItemModifier.getInstance();
      shared.scale = 0.4;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ListItemModifier.getInstance().scale}, expected=0.4`);
      expect(ListItemModifier.getInstance().scale).assertEqual(0.4);
      shared.scale = 1;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ListItemModifier.getInstance().scale}, expected=1`);
      expect(ListItemModifier.getInstance().scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${ListItemModifier.getInstance() === shared}`);
      expect(ListItemModifier.getInstance() === shared).assertTrue();
      log('testModifier0208 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MODIFIER_0209
     * @tc.name      testModifier0209
     * @tc.desc      Verify a newly created modifier does not share state with the singleton.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testModifier0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testModifier0209 begin');
      const fresh: ListItemModifier = new ListItemModifier();
      const shared: ListItemModifier = ListItemModifier.getInstance();
      fresh.scale = 0.3;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual shared.scale=${shared.scale}, expected=1`);
      expect(shared.scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fresh.scale=${fresh.scale}, expected=0.3`);
      expect(fresh.scale).assertEqual(0.3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse fresh === shared=${fresh === shared}`);
      expect(fresh === shared).assertFalse();
      log('testModifier0209 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MODIFIER_0210
     * @tc.name      testModifier0210
     * @tc.desc      Verify resetting all drag state fields restores the neutral appearance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testModifier0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testModifier0210 begin');
      const modifier: ListItemModifier = new ListItemModifier();
      modifier.scale = 0.2;
      modifier.opacity = 0;
      modifier.hasShadow = true;
      modifier.offsetY = 60;
      modifier.hasShadow = false;
      modifier.scale = 1;
      modifier.opacity = 1;
      modifier.offsetY = 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.scale=${modifier.scale}, expected=1`);
      expect(modifier.scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.opacity=${modifier.opacity}, expected=1`);
      expect(modifier.opacity).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse modifier.hasShadow=${modifier.hasShadow}`);
      expect(modifier.hasShadow).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.offsetY=${modifier.offsetY}, expected=0`);
      expect(modifier.offsetY).assertEqual(0);
      log('testModifier0210 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MODIFIER_0211
     * @tc.name      testModifier0211
     * @tc.desc      Verify offset fields keep very large and very small values precisely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testModifier0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testModifier0211 begin');
      const modifier: ListItemModifier = new ListItemModifier();
      modifier.offsetY = 100000;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.offsetY=${modifier.offsetY}, expected=100000`);
      expect(modifier.offsetY).assertEqual(100000);
      modifier.offsetY = 0.001;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.offsetY=${modifier.offsetY}, expected=0.001`);
      expect(modifier.offsetY).assertEqual(0.001);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger modifier.offsetY=${modifier.offsetY}, expected=0`);
      expect(modifier.offsetY).assertLarger(0);
      log('testModifier0211 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_MODIFIER_0212
     * @tc.name      testModifier0212
     * @tc.desc      Verify opacity transitions through hidden, shown and intermediate values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testModifier0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testModifier0212 begin');
      const modifier: ListItemModifier = new ListItemModifier();
      modifier.opacity = 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.opacity=${modifier.opacity}, expected=0`);
      expect(modifier.opacity).assertEqual(0);
      modifier.opacity = 1;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.opacity=${modifier.opacity}, expected=1`);
      expect(modifier.opacity).assertEqual(1);
      modifier.opacity = 0.5;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifier.opacity=${modifier.opacity}, expected=0.5`);
      expect(modifier.opacity).assertEqual(0.5);
      log('testModifier0212 end');
    })
  })
}
