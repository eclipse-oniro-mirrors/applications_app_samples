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
const TAG: string = '[Sample_ComponentReuse_ColorDataExtended]';

export default function colorDataExtendedTest() {
  describe('colorDataExtendedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0065
     * @tc.name      testColorData0065
     * @tc.desc      Verify colorData behavior for matrix index 64.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0065 begin');
      const index: number = 64;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0065 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0066
     * @tc.name      testColorData0066
     * @tc.desc      Verify colorData behavior for matrix index 65.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0066 begin');
      const index: number = 65;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0066 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0067
     * @tc.name      testColorData0067
     * @tc.desc      Verify colorData behavior for matrix index 66.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0067 begin');
      const index: number = 66;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0067 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0068
     * @tc.name      testColorData0068
     * @tc.desc      Verify colorData behavior for matrix index 67.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0068 begin');
      const index: number = 67;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0068 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0069
     * @tc.name      testColorData0069
     * @tc.desc      Verify colorData behavior for matrix index 68.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0069 begin');
      const index: number = 68;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0069 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0070
     * @tc.name      testColorData0070
     * @tc.desc      Verify colorData behavior for matrix index 69.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0070 begin');
      const index: number = 69;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0070 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0071
     * @tc.name      testColorData0071
     * @tc.desc      Verify colorData behavior for matrix index 70.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0071 begin');
      const index: number = 70;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0071 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0072
     * @tc.name      testColorData0072
     * @tc.desc      Verify colorData behavior for matrix index 71.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0072 begin');
      const index: number = 71;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0072 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0073
     * @tc.name      testColorData0073
     * @tc.desc      Verify colorData behavior for matrix index 72.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0073 begin');
      const index: number = 72;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0073 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0074
     * @tc.name      testColorData0074
     * @tc.desc      Verify colorData behavior for matrix index 73.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0074 begin');
      const index: number = 73;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0074 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0075
     * @tc.name      testColorData0075
     * @tc.desc      Verify colorData behavior for matrix index 74.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0075 begin');
      const index: number = 74;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0075 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0076
     * @tc.name      testColorData0076
     * @tc.desc      Verify colorData behavior for matrix index 75.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0076 begin');
      const index: number = 75;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0076 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0077
     * @tc.name      testColorData0077
     * @tc.desc      Verify colorData behavior for matrix index 76.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0077 begin');
      const index: number = 76;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0077 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0078
     * @tc.name      testColorData0078
     * @tc.desc      Verify colorData behavior for matrix index 77.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0078 begin');
      const index: number = 77;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0078 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0079
     * @tc.name      testColorData0079
     * @tc.desc      Verify colorData behavior for matrix index 78.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0079 begin');
      const index: number = 78;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0079 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0080
     * @tc.name      testColorData0080
     * @tc.desc      Verify colorData behavior for matrix index 79.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0080 begin');
      const index: number = 79;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0080 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0081
     * @tc.name      testColorData0081
     * @tc.desc      Verify colorData behavior for matrix index 80.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0081 begin');
      const index: number = 80;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0081 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0082
     * @tc.name      testColorData0082
     * @tc.desc      Verify colorData behavior for matrix index 81.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0082 begin');
      const index: number = 81;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0082 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0083
     * @tc.name      testColorData0083
     * @tc.desc      Verify colorData behavior for matrix index 82.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0083 begin');
      const index: number = 82;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0083 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0084
     * @tc.name      testColorData0084
     * @tc.desc      Verify colorData behavior for matrix index 83.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0084 begin');
      const index: number = 83;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0084 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0085
     * @tc.name      testColorData0085
     * @tc.desc      Verify colorData behavior for matrix index 84.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0085 begin');
      const index: number = 84;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0085 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0086
     * @tc.name      testColorData0086
     * @tc.desc      Verify colorData behavior for matrix index 85.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0086 begin');
      const index: number = 85;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0086 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0087
     * @tc.name      testColorData0087
     * @tc.desc      Verify colorData behavior for matrix index 86.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0087 begin');
      const index: number = 86;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0087 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0088
     * @tc.name      testColorData0088
     * @tc.desc      Verify colorData behavior for matrix index 87.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0088 begin');
      const index: number = 87;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0088 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0089
     * @tc.name      testColorData0089
     * @tc.desc      Verify colorData behavior for matrix index 88.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0089 begin');
      const index: number = 88;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0089 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0090
     * @tc.name      testColorData0090
     * @tc.desc      Verify colorData behavior for matrix index 89.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0090 begin');
      const index: number = 89;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0090 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0091
     * @tc.name      testColorData0091
     * @tc.desc      Verify colorData behavior for matrix index 90.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0091 begin');
      const index: number = 90;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0091 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0092
     * @tc.name      testColorData0092
     * @tc.desc      Verify colorData behavior for matrix index 91.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0092 begin');
      const index: number = 91;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0092 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0093
     * @tc.name      testColorData0093
     * @tc.desc      Verify colorData behavior for matrix index 92.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0093 begin');
      const index: number = 92;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0093 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0094
     * @tc.name      testColorData0094
     * @tc.desc      Verify colorData behavior for matrix index 93.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0094 begin');
      const index: number = 93;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0094 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0095
     * @tc.name      testColorData0095
     * @tc.desc      Verify colorData behavior for matrix index 94.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0095 begin');
      const index: number = 94;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0095 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0096
     * @tc.name      testColorData0096
     * @tc.desc      Verify colorData behavior for matrix index 95.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0096 begin');
      const index: number = 95;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0096 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0097
     * @tc.name      testColorData0097
     * @tc.desc      Verify colorData behavior for matrix index 96.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0097 begin');
      const index: number = 96;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0097 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0098
     * @tc.name      testColorData0098
     * @tc.desc      Verify colorData behavior for matrix index 97.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0098 begin');
      const index: number = 97;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0098 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0099
     * @tc.name      testColorData0099
     * @tc.desc      Verify colorData behavior for matrix index 98.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0099 begin');
      const index: number = 98;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0099 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0100
     * @tc.name      testColorData0100
     * @tc.desc      Verify colorData behavior for matrix index 99.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0100 begin');
      const index: number = 99;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0100 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0101
     * @tc.name      testColorData0101
     * @tc.desc      Verify colorData behavior for matrix index 100.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0101 begin');
      const index: number = 100;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0101 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0102
     * @tc.name      testColorData0102
     * @tc.desc      Verify colorData behavior for matrix index 101.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0102 begin');
      const index: number = 101;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0102 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0103
     * @tc.name      testColorData0103
     * @tc.desc      Verify colorData behavior for matrix index 102.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0103 begin');
      const index: number = 102;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0103 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0104
     * @tc.name      testColorData0104
     * @tc.desc      Verify colorData behavior for matrix index 103.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0104 begin');
      const index: number = 103;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0104 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0105
     * @tc.name      testColorData0105
     * @tc.desc      Verify colorData behavior for matrix index 104.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0105 begin');
      const index: number = 104;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0105 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0106
     * @tc.name      testColorData0106
     * @tc.desc      Verify colorData behavior for matrix index 105.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0106 begin');
      const index: number = 105;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0106 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0107
     * @tc.name      testColorData0107
     * @tc.desc      Verify colorData behavior for matrix index 106.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0107 begin');
      const index: number = 106;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0107 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0108
     * @tc.name      testColorData0108
     * @tc.desc      Verify colorData behavior for matrix index 107.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0108 begin');
      const index: number = 107;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0108 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0109
     * @tc.name      testColorData0109
     * @tc.desc      Verify colorData behavior for matrix index 108.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0109 begin');
      const index: number = 108;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0109 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0110
     * @tc.name      testColorData0110
     * @tc.desc      Verify colorData behavior for matrix index 109.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0110 begin');
      const index: number = 109;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0110 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0111
     * @tc.name      testColorData0111
     * @tc.desc      Verify colorData behavior for matrix index 110.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0111 begin');
      const index: number = 110;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0111 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0112
     * @tc.name      testColorData0112
     * @tc.desc      Verify colorData behavior for matrix index 111.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0112 begin');
      const index: number = 111;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0112 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0113
     * @tc.name      testColorData0113
     * @tc.desc      Verify colorData behavior for matrix index 112.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0113 begin');
      const index: number = 112;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0113 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0114
     * @tc.name      testColorData0114
     * @tc.desc      Verify colorData behavior for matrix index 113.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0114 begin');
      const index: number = 113;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0114 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0115
     * @tc.name      testColorData0115
     * @tc.desc      Verify colorData behavior for matrix index 114.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0115 begin');
      const index: number = 114;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0115 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0116
     * @tc.name      testColorData0116
     * @tc.desc      Verify colorData behavior for matrix index 115.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0116 begin');
      const index: number = 115;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0116 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0117
     * @tc.name      testColorData0117
     * @tc.desc      Verify colorData behavior for matrix index 116.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0117 begin');
      const index: number = 116;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0117 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0118
     * @tc.name      testColorData0118
     * @tc.desc      Verify colorData behavior for matrix index 117.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0118 begin');
      const index: number = 117;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0118 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0119
     * @tc.name      testColorData0119
     * @tc.desc      Verify colorData behavior for matrix index 118.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0119 begin');
      const index: number = 118;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0119 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0120
     * @tc.name      testColorData0120
     * @tc.desc      Verify colorData behavior for matrix index 119.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0120 begin');
      const index: number = 119;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0120 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0121
     * @tc.name      testColorData0121
     * @tc.desc      Verify colorData behavior for matrix index 120.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0121 begin');
      const index: number = 120;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0121 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0122
     * @tc.name      testColorData0122
     * @tc.desc      Verify colorData behavior for matrix index 121.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0122 begin');
      const index: number = 121;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0122 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0123
     * @tc.name      testColorData0123
     * @tc.desc      Verify colorData behavior for matrix index 122.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0123 begin');
      const index: number = 122;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0123 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0124
     * @tc.name      testColorData0124
     * @tc.desc      Verify colorData behavior for matrix index 123.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0124 begin');
      const index: number = 123;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0124 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0125
     * @tc.name      testColorData0125
     * @tc.desc      Verify colorData behavior for matrix index 124.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0125 begin');
      const index: number = 124;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0125 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0126
     * @tc.name      testColorData0126
     * @tc.desc      Verify colorData behavior for matrix index 125.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0126 begin');
      const index: number = 125;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0126 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0127
     * @tc.name      testColorData0127
     * @tc.desc      Verify colorData behavior for matrix index 126.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0127 begin');
      const index: number = 126;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0127 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0128
     * @tc.name      testColorData0128
     * @tc.desc      Verify colorData behavior for matrix index 127.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0128 begin');
      const index: number = 127;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0128 end');
    })

  })
}
