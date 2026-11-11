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
import { ColorModel } from '../../../main/ets/model/BasicDataSource';
import { ColorData } from '../../../main/ets/model/ColorData';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentReuse_ColorDataTail]';

export default function colorDataTailTest() {
  describe('colorDataTailTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0193
     * @tc.name      testColorData0193
     * @tc.desc      Verify colorData behavior for matrix index 192.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0193 begin');
      const index: number = 192;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0193 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0194
     * @tc.name      testColorData0194
     * @tc.desc      Verify colorData behavior for matrix index 193.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0194 begin');
      const index: number = 193;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0194 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0195
     * @tc.name      testColorData0195
     * @tc.desc      Verify colorData behavior for matrix index 194.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0195 begin');
      const index: number = 194;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0195 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0196
     * @tc.name      testColorData0196
     * @tc.desc      Verify colorData behavior for matrix index 195.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0196 begin');
      const index: number = 195;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0196 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0197
     * @tc.name      testColorData0197
     * @tc.desc      Verify colorData behavior for matrix index 196.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0197 begin');
      const index: number = 196;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0197 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0198
     * @tc.name      testColorData0198
     * @tc.desc      Verify colorData behavior for matrix index 197.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0198 begin');
      const index: number = 197;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0198 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0199
     * @tc.name      testColorData0199
     * @tc.desc      Verify colorData behavior for matrix index 198.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0199 begin');
      const index: number = 198;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0199 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0200
     * @tc.name      testColorData0200
     * @tc.desc      Verify colorData behavior for matrix index 199.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0200 begin');
      const index: number = 199;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0200 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0201
     * @tc.name      testColorData0201
     * @tc.desc      Verify colorData behavior for matrix index 200.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0201 begin');
      const index: number = 200;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0201 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0202
     * @tc.name      testColorData0202
     * @tc.desc      Verify colorData behavior for matrix index 201.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0202 begin');
      const index: number = 201;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0202 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0203
     * @tc.name      testColorData0203
     * @tc.desc      Verify colorData behavior for matrix index 202.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0203 begin');
      const index: number = 202;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0203 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0204
     * @tc.name      testColorData0204
     * @tc.desc      Verify colorData behavior for matrix index 203.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0204 begin');
      const index: number = 203;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0204 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0205
     * @tc.name      testColorData0205
     * @tc.desc      Verify colorData behavior for matrix index 204.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0205 begin');
      const index: number = 204;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0205 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0206
     * @tc.name      testColorData0206
     * @tc.desc      Verify colorData behavior for matrix index 205.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0206 begin');
      const index: number = 205;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0206 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0207
     * @tc.name      testColorData0207
     * @tc.desc      Verify colorData behavior for matrix index 206.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0207 begin');
      const index: number = 206;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0207 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0208
     * @tc.name      testColorData0208
     * @tc.desc      Verify colorData behavior for matrix index 207.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0208 begin');
      const index: number = 207;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0208 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0209
     * @tc.name      testColorData0209
     * @tc.desc      Verify colorData behavior for matrix index 208.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0209 begin');
      const index: number = 208;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0209 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0210
     * @tc.name      testColorData0210
     * @tc.desc      Verify colorData behavior for matrix index 209.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0210 begin');
      const index: number = 209;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0210 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0211
     * @tc.name      testColorData0211
     * @tc.desc      Verify colorData behavior for matrix index 210.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0211 begin');
      const index: number = 210;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0211 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0212
     * @tc.name      testColorData0212
     * @tc.desc      Verify colorData behavior for matrix index 211.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0212 begin');
      const index: number = 211;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0212 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0213
     * @tc.name      testColorData0213
     * @tc.desc      Verify colorData behavior for matrix index 212.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0213 begin');
      const index: number = 212;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0213 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0214
     * @tc.name      testColorData0214
     * @tc.desc      Verify colorData behavior for matrix index 213.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0214 begin');
      const index: number = 213;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0214 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0215
     * @tc.name      testColorData0215
     * @tc.desc      Verify colorData behavior for matrix index 214.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0215 begin');
      const index: number = 214;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0215 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0216
     * @tc.name      testColorData0216
     * @tc.desc      Verify colorData behavior for matrix index 215.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0216 begin');
      const index: number = 215;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0216 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0217
     * @tc.name      testColorData0217
     * @tc.desc      Verify colorData behavior for matrix index 216.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0217 begin');
      const index: number = 216;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0217 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0218
     * @tc.name      testColorData0218
     * @tc.desc      Verify colorData behavior for matrix index 217.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0218 begin');
      const index: number = 217;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0218 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0219
     * @tc.name      testColorData0219
     * @tc.desc      Verify colorData behavior for matrix index 218.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0219 begin');
      const index: number = 218;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0219 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0220
     * @tc.name      testColorData0220
     * @tc.desc      Verify colorData behavior for matrix index 219.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0220 begin');
      const index: number = 219;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0220 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0221
     * @tc.name      testColorData0221
     * @tc.desc      Verify colorData behavior for matrix index 220.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0221 begin');
      const index: number = 220;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0221 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0222
     * @tc.name      testColorData0222
     * @tc.desc      Verify colorData behavior for matrix index 221.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0222 begin');
      const index: number = 221;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0222 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0223
     * @tc.name      testColorData0223
     * @tc.desc      Verify colorData behavior for matrix index 222.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0223 begin');
      const index: number = 222;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0223 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0224
     * @tc.name      testColorData0224
     * @tc.desc      Verify colorData behavior for matrix index 223.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0224 begin');
      const index: number = 223;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0224 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0225
     * @tc.name      testColorData0225
     * @tc.desc      Verify colorData behavior for matrix index 224.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0225 begin');
      const index: number = 224;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0225 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0226
     * @tc.name      testColorData0226
     * @tc.desc      Verify colorData behavior for matrix index 225.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0226 begin');
      const index: number = 225;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0226 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0227
     * @tc.name      testColorData0227
     * @tc.desc      Verify colorData behavior for matrix index 226.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0227 begin');
      const index: number = 226;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0227 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0228
     * @tc.name      testColorData0228
     * @tc.desc      Verify colorData behavior for matrix index 227.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0228 begin');
      const index: number = 227;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0228 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0229
     * @tc.name      testColorData0229
     * @tc.desc      Verify colorData behavior for matrix index 228.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0229 begin');
      const index: number = 228;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0229 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0230
     * @tc.name      testColorData0230
     * @tc.desc      Verify colorData behavior for matrix index 229.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0230 begin');
      const index: number = 229;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0230 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0231
     * @tc.name      testColorData0231
     * @tc.desc      Verify colorData behavior for matrix index 230.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0231 begin');
      const index: number = 230;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0231 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0232
     * @tc.name      testColorData0232
     * @tc.desc      Verify colorData behavior for matrix index 231.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0232 begin');
      const index: number = 231;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0232 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0233
     * @tc.name      testColorData0233
     * @tc.desc      Verify colorData behavior for matrix index 232.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0233 begin');
      const index: number = 232;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0233 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0234
     * @tc.name      testColorData0234
     * @tc.desc      Verify colorData behavior for matrix index 233.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0234 begin');
      const index: number = 233;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0234 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0235
     * @tc.name      testColorData0235
     * @tc.desc      Verify colorData behavior for matrix index 234.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0235 begin');
      const index: number = 234;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0235 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0236
     * @tc.name      testColorData0236
     * @tc.desc      Verify colorData behavior for matrix index 235.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0236 begin');
      const index: number = 235;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0236 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0237
     * @tc.name      testColorData0237
     * @tc.desc      Verify colorData behavior for matrix index 236.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0237 begin');
      const index: number = 236;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0237 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0238
     * @tc.name      testColorData0238
     * @tc.desc      Verify colorData behavior for matrix index 237.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0238 begin');
      const index: number = 237;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0238 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0239
     * @tc.name      testColorData0239
     * @tc.desc      Verify colorData behavior for matrix index 238.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0239 begin');
      const index: number = 238;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0239 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0240
     * @tc.name      testColorData0240
     * @tc.desc      Verify colorData behavior for matrix index 239.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0240 begin');
      const index: number = 239;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0240 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0241
     * @tc.name      testColorData0241
     * @tc.desc      Verify colorData behavior for matrix index 240.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0241 begin');
      const index: number = 240;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0241 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0242
     * @tc.name      testColorData0242
     * @tc.desc      Verify colorData behavior for matrix index 241.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0242 begin');
      const index: number = 241;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0242 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0243
     * @tc.name      testColorData0243
     * @tc.desc      Verify colorData behavior for matrix index 242.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0243 begin');
      const index: number = 242;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0243 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0244
     * @tc.name      testColorData0244
     * @tc.desc      Verify colorData behavior for matrix index 243.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0244 begin');
      const index: number = 243;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0244 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0245
     * @tc.name      testColorData0245
     * @tc.desc      Verify colorData behavior for matrix index 244.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0245 begin');
      const index: number = 244;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0245 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0246
     * @tc.name      testColorData0246
     * @tc.desc      Verify colorData behavior for matrix index 245.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0246 begin');
      const index: number = 245;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0246 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0247
     * @tc.name      testColorData0247
     * @tc.desc      Verify colorData behavior for matrix index 246.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0247 begin');
      const index: number = 246;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0247 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0248
     * @tc.name      testColorData0248
     * @tc.desc      Verify colorData behavior for matrix index 247.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0248 begin');
      const index: number = 247;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0248 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0249
     * @tc.name      testColorData0249
     * @tc.desc      Verify colorData behavior for matrix index 248.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0249 begin');
      const index: number = 248;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0249 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0250
     * @tc.name      testColorData0250
     * @tc.desc      Verify colorData behavior for matrix index 249.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0250 begin');
      const index: number = 249;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0250 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0251
     * @tc.name      testColorData0251
     * @tc.desc      Verify colorData behavior for matrix index 250.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0251 begin');
      const index: number = 250;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0251 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0252
     * @tc.name      testColorData0252
     * @tc.desc      Verify colorData behavior for matrix index 251.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0252 begin');
      const index: number = 251;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0252 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0253
     * @tc.name      testColorData0253
     * @tc.desc      Verify colorData behavior for matrix index 252.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0253 begin');
      const index: number = 252;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0253 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0254
     * @tc.name      testColorData0254
     * @tc.desc      Verify colorData behavior for matrix index 253.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0254 begin');
      const index: number = 253;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0254 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0255
     * @tc.name      testColorData0255
     * @tc.desc      Verify colorData behavior for matrix index 254.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0255 begin');
      const index: number = 254;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0255 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0256
     * @tc.name      testColorData0256
     * @tc.desc      Verify colorData behavior for matrix index 255.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0256 begin');
      const index: number = 255;
      const data: ColorData = new ColorData();
      const pushCount: number = (index % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = index % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0256 end');
    })

  })
}
