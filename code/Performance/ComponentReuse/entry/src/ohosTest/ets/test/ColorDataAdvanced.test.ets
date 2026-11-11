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
const TAG: string = '[Sample_ComponentReuse_ColorDataAdvanced]';

export default function colorDataAdvancedTest() {
  describe('colorDataAdvancedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0129
     * @tc.name      testColorData0129
     * @tc.desc      Verify colorData behavior for matrix index 128.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0129 begin');
      const index: number = 128;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0129 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0130
     * @tc.name      testColorData0130
     * @tc.desc      Verify colorData behavior for matrix index 129.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0130 begin');
      const index: number = 129;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0130 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0131
     * @tc.name      testColorData0131
     * @tc.desc      Verify colorData behavior for matrix index 130.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0131 begin');
      const index: number = 130;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0131 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0132
     * @tc.name      testColorData0132
     * @tc.desc      Verify colorData behavior for matrix index 131.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0132 begin');
      const index: number = 131;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0132 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0133
     * @tc.name      testColorData0133
     * @tc.desc      Verify colorData behavior for matrix index 132.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0133 begin');
      const index: number = 132;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0133 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0134
     * @tc.name      testColorData0134
     * @tc.desc      Verify colorData behavior for matrix index 133.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0134 begin');
      const index: number = 133;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0134 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0135
     * @tc.name      testColorData0135
     * @tc.desc      Verify colorData behavior for matrix index 134.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0135 begin');
      const index: number = 134;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0135 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0136
     * @tc.name      testColorData0136
     * @tc.desc      Verify colorData behavior for matrix index 135.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0136 begin');
      const index: number = 135;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0136 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0137
     * @tc.name      testColorData0137
     * @tc.desc      Verify colorData behavior for matrix index 136.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0137 begin');
      const index: number = 136;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0137 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0138
     * @tc.name      testColorData0138
     * @tc.desc      Verify colorData behavior for matrix index 137.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0138 begin');
      const index: number = 137;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0138 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0139
     * @tc.name      testColorData0139
     * @tc.desc      Verify colorData behavior for matrix index 138.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0139 begin');
      const index: number = 138;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0139 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0140
     * @tc.name      testColorData0140
     * @tc.desc      Verify colorData behavior for matrix index 139.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0140 begin');
      const index: number = 139;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0140 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0141
     * @tc.name      testColorData0141
     * @tc.desc      Verify colorData behavior for matrix index 140.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0141 begin');
      const index: number = 140;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0141 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0142
     * @tc.name      testColorData0142
     * @tc.desc      Verify colorData behavior for matrix index 141.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0142 begin');
      const index: number = 141;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0142 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0143
     * @tc.name      testColorData0143
     * @tc.desc      Verify colorData behavior for matrix index 142.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0143 begin');
      const index: number = 142;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0143 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0144
     * @tc.name      testColorData0144
     * @tc.desc      Verify colorData behavior for matrix index 143.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0144 begin');
      const index: number = 143;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0144 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0145
     * @tc.name      testColorData0145
     * @tc.desc      Verify colorData behavior for matrix index 144.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0145 begin');
      const index: number = 144;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0145 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0146
     * @tc.name      testColorData0146
     * @tc.desc      Verify colorData behavior for matrix index 145.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0146 begin');
      const index: number = 145;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0146 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0147
     * @tc.name      testColorData0147
     * @tc.desc      Verify colorData behavior for matrix index 146.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0147 begin');
      const index: number = 146;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0147 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0148
     * @tc.name      testColorData0148
     * @tc.desc      Verify colorData behavior for matrix index 147.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0148 begin');
      const index: number = 147;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0148 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0149
     * @tc.name      testColorData0149
     * @tc.desc      Verify colorData behavior for matrix index 148.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0149 begin');
      const index: number = 148;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0149 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0150
     * @tc.name      testColorData0150
     * @tc.desc      Verify colorData behavior for matrix index 149.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0150 begin');
      const index: number = 149;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0150 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0151
     * @tc.name      testColorData0151
     * @tc.desc      Verify colorData behavior for matrix index 150.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0151 begin');
      const index: number = 150;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0151 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0152
     * @tc.name      testColorData0152
     * @tc.desc      Verify colorData behavior for matrix index 151.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0152 begin');
      const index: number = 151;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0152 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0153
     * @tc.name      testColorData0153
     * @tc.desc      Verify colorData behavior for matrix index 152.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0153 begin');
      const index: number = 152;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0153 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0154
     * @tc.name      testColorData0154
     * @tc.desc      Verify colorData behavior for matrix index 153.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0154 begin');
      const index: number = 153;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0154 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0155
     * @tc.name      testColorData0155
     * @tc.desc      Verify colorData behavior for matrix index 154.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0155 begin');
      const index: number = 154;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0155 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0156
     * @tc.name      testColorData0156
     * @tc.desc      Verify colorData behavior for matrix index 155.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0156 begin');
      const index: number = 155;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0156 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0157
     * @tc.name      testColorData0157
     * @tc.desc      Verify colorData behavior for matrix index 156.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0157 begin');
      const index: number = 156;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0157 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0158
     * @tc.name      testColorData0158
     * @tc.desc      Verify colorData behavior for matrix index 157.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0158 begin');
      const index: number = 157;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0158 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0159
     * @tc.name      testColorData0159
     * @tc.desc      Verify colorData behavior for matrix index 158.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0159 begin');
      const index: number = 158;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0159 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0160
     * @tc.name      testColorData0160
     * @tc.desc      Verify colorData behavior for matrix index 159.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0160 begin');
      const index: number = 159;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0160 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0161
     * @tc.name      testColorData0161
     * @tc.desc      Verify colorData behavior for matrix index 160.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0161 begin');
      const index: number = 160;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0161 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0162
     * @tc.name      testColorData0162
     * @tc.desc      Verify colorData behavior for matrix index 161.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0162 begin');
      const index: number = 161;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0162 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0163
     * @tc.name      testColorData0163
     * @tc.desc      Verify colorData behavior for matrix index 162.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0163 begin');
      const index: number = 162;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0163 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0164
     * @tc.name      testColorData0164
     * @tc.desc      Verify colorData behavior for matrix index 163.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0164 begin');
      const index: number = 163;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0164 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0165
     * @tc.name      testColorData0165
     * @tc.desc      Verify colorData behavior for matrix index 164.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0165 begin');
      const index: number = 164;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0165 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0166
     * @tc.name      testColorData0166
     * @tc.desc      Verify colorData behavior for matrix index 165.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0166 begin');
      const index: number = 165;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0166 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0167
     * @tc.name      testColorData0167
     * @tc.desc      Verify colorData behavior for matrix index 166.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0167 begin');
      const index: number = 166;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0167 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0168
     * @tc.name      testColorData0168
     * @tc.desc      Verify colorData behavior for matrix index 167.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0168 begin');
      const index: number = 167;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0168 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0169
     * @tc.name      testColorData0169
     * @tc.desc      Verify colorData behavior for matrix index 168.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0169 begin');
      const index: number = 168;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0169 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0170
     * @tc.name      testColorData0170
     * @tc.desc      Verify colorData behavior for matrix index 169.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0170 begin');
      const index: number = 169;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0170 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0171
     * @tc.name      testColorData0171
     * @tc.desc      Verify colorData behavior for matrix index 170.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0171 begin');
      const index: number = 170;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0171 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0172
     * @tc.name      testColorData0172
     * @tc.desc      Verify colorData behavior for matrix index 171.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0172 begin');
      const index: number = 171;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0172 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0173
     * @tc.name      testColorData0173
     * @tc.desc      Verify colorData behavior for matrix index 172.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0173 begin');
      const index: number = 172;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0173 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0174
     * @tc.name      testColorData0174
     * @tc.desc      Verify colorData behavior for matrix index 173.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0174 begin');
      const index: number = 173;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0174 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0175
     * @tc.name      testColorData0175
     * @tc.desc      Verify colorData behavior for matrix index 174.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0175 begin');
      const index: number = 174;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0175 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0176
     * @tc.name      testColorData0176
     * @tc.desc      Verify colorData behavior for matrix index 175.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0176 begin');
      const index: number = 175;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0176 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0177
     * @tc.name      testColorData0177
     * @tc.desc      Verify colorData behavior for matrix index 176.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0177 begin');
      const index: number = 176;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0177 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0178
     * @tc.name      testColorData0178
     * @tc.desc      Verify colorData behavior for matrix index 177.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0178 begin');
      const index: number = 177;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0178 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0179
     * @tc.name      testColorData0179
     * @tc.desc      Verify colorData behavior for matrix index 178.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0179 begin');
      const index: number = 178;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0179 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0180
     * @tc.name      testColorData0180
     * @tc.desc      Verify colorData behavior for matrix index 179.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0180 begin');
      const index: number = 179;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0180 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0181
     * @tc.name      testColorData0181
     * @tc.desc      Verify colorData behavior for matrix index 180.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0181 begin');
      const index: number = 180;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0181 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0182
     * @tc.name      testColorData0182
     * @tc.desc      Verify colorData behavior for matrix index 181.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0182 begin');
      const index: number = 181;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0182 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0183
     * @tc.name      testColorData0183
     * @tc.desc      Verify colorData behavior for matrix index 182.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0183 begin');
      const index: number = 182;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0183 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0184
     * @tc.name      testColorData0184
     * @tc.desc      Verify colorData behavior for matrix index 183.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0184 begin');
      const index: number = 183;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0184 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0185
     * @tc.name      testColorData0185
     * @tc.desc      Verify colorData behavior for matrix index 184.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0185 begin');
      const index: number = 184;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0185 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0186
     * @tc.name      testColorData0186
     * @tc.desc      Verify colorData behavior for matrix index 185.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0186 begin');
      const index: number = 185;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0186 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0187
     * @tc.name      testColorData0187
     * @tc.desc      Verify colorData behavior for matrix index 186.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0187 begin');
      const index: number = 186;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0187 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0188
     * @tc.name      testColorData0188
     * @tc.desc      Verify colorData behavior for matrix index 187.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0188 begin');
      const index: number = 187;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0188 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0189
     * @tc.name      testColorData0189
     * @tc.desc      Verify colorData behavior for matrix index 188.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0189 begin');
      const index: number = 188;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0189 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0190
     * @tc.name      testColorData0190
     * @tc.desc      Verify colorData behavior for matrix index 189.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0190 begin');
      const index: number = 189;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0190 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0191
     * @tc.name      testColorData0191
     * @tc.desc      Verify colorData behavior for matrix index 190.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0191 begin');
      const index: number = 190;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0191 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0192
     * @tc.name      testColorData0192
     * @tc.desc      Verify colorData behavior for matrix index 191.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0192 begin');
      const index: number = 191;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0192 end');
    })

  })
}
