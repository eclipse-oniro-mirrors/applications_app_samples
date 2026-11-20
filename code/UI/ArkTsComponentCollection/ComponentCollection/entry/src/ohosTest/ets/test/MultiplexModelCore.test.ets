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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { MultiplexModel } from '../../../main/ets/pages/animations/TransitionAnimations/multiplexSample/MultiplexModel';

const DOMAIN: number = 0xF814;
const TAG: string = 'MultiplexModelTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

const FAKE_IMAGE: Resource = { id: 16777216, type: 20000, params: ['app.media.icon'],
  bundleName: 'ohos.samples.componentcollection', moduleName: 'entry' };

export default function multiplexModelCoreTest(): void {
  describe('MultiplexModelCoreTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEXMODEL_0201
     * @tc.name      testMultiplexModel0201
     * @tc.desc      Verify getId returns the id passed to the constructor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMultiplexModel0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMultiplexModel0201 begin');
      const model: MultiplexModel = new MultiplexModel('task_one', FAKE_IMAGE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.getId()=${model.getId()}, expected='task_one'`);
      expect(model.getId()).assertEqual('task_one');
      log('testMultiplexModel0201 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEXMODEL_0202
     * @tc.name      testMultiplexModel0202
     * @tc.desc      Verify getImg returns the same resource instance passed in.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMultiplexModel0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMultiplexModel0202 begin');
      const model: MultiplexModel = new MultiplexModel('task_two', FAKE_IMAGE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.getImg().id=${model.getImg().id}`);
      expect(model.getImg().id).assertEqual(FAKE_IMAGE.id);
      log('testMultiplexModel0202 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEXMODEL_0203
     * @tc.name      testMultiplexModel0203
     * @tc.desc      Verify getId returns a string type value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMultiplexModel0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMultiplexModel0203 begin');
      const model: MultiplexModel = new MultiplexModel('task_three', FAKE_IMAGE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.getId()=${typeof model.getId()}`);
      expect(typeof model.getId()).assertEqual('string');
      log('testMultiplexModel0203 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEXMODEL_0204
     * @tc.name      testMultiplexModel0204
     * @tc.desc      Verify getImg returns an object type value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMultiplexModel0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMultiplexModel0204 begin');
      const model: MultiplexModel = new MultiplexModel('task_four', FAKE_IMAGE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.getImg()=${typeof model.getImg()}`);
      expect(typeof model.getImg()).assertEqual('object');
      log('testMultiplexModel0204 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEXMODEL_0205
     * @tc.name      testMultiplexModel0205
     * @tc.desc      Verify getId keeps an id containing special characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMultiplexModel0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMultiplexModel0205 begin');
      const model: MultiplexModel = new MultiplexModel('task_five-01_x', FAKE_IMAGE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.getId()=${model.getId()}, expected='task_five-01_x'`);
      expect(model.getId()).assertEqual('task_five-01_x');
      log('testMultiplexModel0205 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEXMODEL_0206
     * @tc.name      testMultiplexModel0206
     * @tc.desc      Verify getId keeps an empty string id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMultiplexModel0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMultiplexModel0206 begin');
      const model: MultiplexModel = new MultiplexModel('', FAKE_IMAGE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.getId()=${model.getId()}, expected=''`);
      expect(model.getId()).assertEqual('');
      log('testMultiplexModel0206 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEXMODEL_0207
     * @tc.name      testMultiplexModel0207
     * @tc.desc      Verify two models with different ids stay independent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMultiplexModel0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMultiplexModel0207 begin');
      const first: MultiplexModel = new MultiplexModel('first', FAKE_IMAGE);
      const second: MultiplexModel = new MultiplexModel('second', FAKE_IMAGE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.getId()=${first.getId()}, expected='first'`);
      expect(first.getId()).assertEqual('first');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.getId()=${second.getId()}, expected='second'`);
      expect(second.getId()).assertEqual('second');
      log('testMultiplexModel0207 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEXMODEL_0208
     * @tc.name      testMultiplexModel0208
     * @tc.desc      Verify repeated getId calls return stable values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMultiplexModel0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMultiplexModel0208 begin');
      const model: MultiplexModel = new MultiplexModel('stable', FAKE_IMAGE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.getId()=${model.getId()}, expected=model.getId()`);
      expect(model.getId()).assertEqual(model.getId());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.getId()=${model.getId()}, expected='stable'`);
      expect(model.getId()).assertEqual('stable');
      log('testMultiplexModel0208 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEXMODEL_0209
     * @tc.name      testMultiplexModel0209
     * @tc.desc      Verify repeated getImg calls return the same resource id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMultiplexModel0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMultiplexModel0209 begin');
      const model: MultiplexModel = new MultiplexModel('repeat', FAKE_IMAGE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.getImg().id=${model.getImg().id}`);
      expect(model.getImg().id).assertEqual(model.getImg().id);
      log('testMultiplexModel0209 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEXMODEL_0210
     * @tc.name      testMultiplexModel0210
     * @tc.desc      Verify a long id string is preserved without truncation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMultiplexModel0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMultiplexModel0210 begin');
      const longId: string = 'multiplex_item_for_transition_animation_sample_scene_0001';
      const model: MultiplexModel = new MultiplexModel(longId, FAKE_IMAGE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.getId()=${model.getId()}, expected=longId`);
      expect(model.getId()).assertEqual(longId);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.getId().length=${model.getId().length}`);
      expect(model.getId().length).assertEqual(longId.length);
      log('testMultiplexModel0210 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEXMODEL_0211
     * @tc.name      testMultiplexModel0211
     * @tc.desc      Verify a different resource id is returned unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMultiplexModel0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMultiplexModel0211 begin');
      const other: Resource = { id: 16777217, type: 20000, params: ['app.media.banner'],
        bundleName: 'ohos.samples.componentcollection', moduleName: 'entry' };
      const model: MultiplexModel = new MultiplexModel('other_image', other);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.getImg().id=${model.getImg().id}, expected=16777217`);
      expect(model.getImg().id).assertEqual(16777217);
      log('testMultiplexModel0211 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEXMODEL_0212
     * @tc.name      testMultiplexModel0212
     * @tc.desc      Verify getModel instance exposes getter methods of function type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMultiplexModel0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMultiplexModel0212 begin');
      const model: MultiplexModel = new MultiplexModel('methods', FAKE_IMAGE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.getId=${typeof model.getId}`);
      expect(typeof model.getId).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.getImg=${typeof model.getImg}`);
      expect(typeof model.getImg).assertEqual('function');
      log('testMultiplexModel0212 end');
    })
  })
}
