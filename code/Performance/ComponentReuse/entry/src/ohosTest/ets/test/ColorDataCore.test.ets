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
const TAG: string = '[Sample_ComponentReuse_ColorDataCore]';

export default function colorDataCoreTest() {
  describe('colorDataCoreTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0001
     * @tc.name      testColorData0001
     * @tc.desc      Verify colorData behavior for matrix index 0.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0001 begin');
      const index: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0001 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0002
     * @tc.name      testColorData0002
     * @tc.desc      Verify colorData behavior for matrix index 1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0002 begin');
      const index: number = 1;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0002 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0003
     * @tc.name      testColorData0003
     * @tc.desc      Verify colorData behavior for matrix index 2.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0003 begin');
      const index: number = 2;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0003 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0004
     * @tc.name      testColorData0004
     * @tc.desc      Verify colorData behavior for matrix index 3.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0004 begin');
      const index: number = 3;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0004 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0005
     * @tc.name      testColorData0005
     * @tc.desc      Verify colorData behavior for matrix index 4.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0005 begin');
      const index: number = 4;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0005 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0006
     * @tc.name      testColorData0006
     * @tc.desc      Verify colorData behavior for matrix index 5.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0006 begin');
      const index: number = 5;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0006 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0007
     * @tc.name      testColorData0007
     * @tc.desc      Verify colorData behavior for matrix index 6.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0007 begin');
      const index: number = 6;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0007 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0008
     * @tc.name      testColorData0008
     * @tc.desc      Verify colorData behavior for matrix index 7.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0008 begin');
      const index: number = 7;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0008 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0009
     * @tc.name      testColorData0009
     * @tc.desc      Verify colorData behavior for matrix index 8.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0009 begin');
      const index: number = 8;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0009 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0010
     * @tc.name      testColorData0010
     * @tc.desc      Verify colorData behavior for matrix index 9.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0010 begin');
      const index: number = 9;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0010 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0011
     * @tc.name      testColorData0011
     * @tc.desc      Verify colorData behavior for matrix index 10.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0011 begin');
      const index: number = 10;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0011 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0012
     * @tc.name      testColorData0012
     * @tc.desc      Verify colorData behavior for matrix index 11.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0012 begin');
      const index: number = 11;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0012 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0013
     * @tc.name      testColorData0013
     * @tc.desc      Verify colorData behavior for matrix index 12.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0013 begin');
      const index: number = 12;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0013 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0014
     * @tc.name      testColorData0014
     * @tc.desc      Verify colorData behavior for matrix index 13.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0014 begin');
      const index: number = 13;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0014 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0015
     * @tc.name      testColorData0015
     * @tc.desc      Verify colorData behavior for matrix index 14.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0015 begin');
      const index: number = 14;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0015 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0016
     * @tc.name      testColorData0016
     * @tc.desc      Verify colorData behavior for matrix index 15.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0016 begin');
      const index: number = 15;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0016 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0017
     * @tc.name      testColorData0017
     * @tc.desc      Verify colorData behavior for matrix index 16.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0017 begin');
      const index: number = 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0017 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0018
     * @tc.name      testColorData0018
     * @tc.desc      Verify colorData behavior for matrix index 17.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0018 begin');
      const index: number = 17;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0018 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0019
     * @tc.name      testColorData0019
     * @tc.desc      Verify colorData behavior for matrix index 18.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0019 begin');
      const index: number = 18;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0019 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0020
     * @tc.name      testColorData0020
     * @tc.desc      Verify colorData behavior for matrix index 19.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0020 begin');
      const index: number = 19;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0020 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0021
     * @tc.name      testColorData0021
     * @tc.desc      Verify colorData behavior for matrix index 20.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0021 begin');
      const index: number = 20;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0021 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0022
     * @tc.name      testColorData0022
     * @tc.desc      Verify colorData behavior for matrix index 21.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0022 begin');
      const index: number = 21;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0022 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0023
     * @tc.name      testColorData0023
     * @tc.desc      Verify colorData behavior for matrix index 22.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0023 begin');
      const index: number = 22;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0023 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0024
     * @tc.name      testColorData0024
     * @tc.desc      Verify colorData behavior for matrix index 23.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0024 begin');
      const index: number = 23;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0024 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0025
     * @tc.name      testColorData0025
     * @tc.desc      Verify colorData behavior for matrix index 24.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0025 begin');
      const index: number = 24;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0025 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0026
     * @tc.name      testColorData0026
     * @tc.desc      Verify colorData behavior for matrix index 25.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0026 begin');
      const index: number = 25;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0026 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0027
     * @tc.name      testColorData0027
     * @tc.desc      Verify colorData behavior for matrix index 26.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0027 begin');
      const index: number = 26;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0027 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0028
     * @tc.name      testColorData0028
     * @tc.desc      Verify colorData behavior for matrix index 27.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0028 begin');
      const index: number = 27;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0028 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0029
     * @tc.name      testColorData0029
     * @tc.desc      Verify colorData behavior for matrix index 28.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0029 begin');
      const index: number = 28;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0029 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0030
     * @tc.name      testColorData0030
     * @tc.desc      Verify colorData behavior for matrix index 29.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0030 begin');
      const index: number = 29;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0030 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0031
     * @tc.name      testColorData0031
     * @tc.desc      Verify colorData behavior for matrix index 30.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0031 begin');
      const index: number = 30;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0031 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0032
     * @tc.name      testColorData0032
     * @tc.desc      Verify colorData behavior for matrix index 31.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0032 begin');
      const index: number = 31;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0032 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0033
     * @tc.name      testColorData0033
     * @tc.desc      Verify colorData behavior for matrix index 32.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0033 begin');
      const index: number = 32;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0033 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0034
     * @tc.name      testColorData0034
     * @tc.desc      Verify colorData behavior for matrix index 33.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0034 begin');
      const index: number = 33;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0034 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0035
     * @tc.name      testColorData0035
     * @tc.desc      Verify colorData behavior for matrix index 34.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0035 begin');
      const index: number = 34;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0035 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0036
     * @tc.name      testColorData0036
     * @tc.desc      Verify colorData behavior for matrix index 35.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0036 begin');
      const index: number = 35;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0036 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0037
     * @tc.name      testColorData0037
     * @tc.desc      Verify colorData behavior for matrix index 36.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0037 begin');
      const index: number = 36;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0037 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0038
     * @tc.name      testColorData0038
     * @tc.desc      Verify colorData behavior for matrix index 37.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0038 begin');
      const index: number = 37;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0038 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0039
     * @tc.name      testColorData0039
     * @tc.desc      Verify colorData behavior for matrix index 38.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0039 begin');
      const index: number = 38;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0039 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0040
     * @tc.name      testColorData0040
     * @tc.desc      Verify colorData behavior for matrix index 39.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0040 begin');
      const index: number = 39;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0040 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0041
     * @tc.name      testColorData0041
     * @tc.desc      Verify colorData behavior for matrix index 40.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0041 begin');
      const index: number = 40;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0041 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0042
     * @tc.name      testColorData0042
     * @tc.desc      Verify colorData behavior for matrix index 41.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0042 begin');
      const index: number = 41;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0042 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0043
     * @tc.name      testColorData0043
     * @tc.desc      Verify colorData behavior for matrix index 42.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0043 begin');
      const index: number = 42;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0043 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0044
     * @tc.name      testColorData0044
     * @tc.desc      Verify colorData behavior for matrix index 43.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0044 begin');
      const index: number = 43;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0044 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0045
     * @tc.name      testColorData0045
     * @tc.desc      Verify colorData behavior for matrix index 44.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0045 begin');
      const index: number = 44;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0045 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0046
     * @tc.name      testColorData0046
     * @tc.desc      Verify colorData behavior for matrix index 45.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0046 begin');
      const index: number = 45;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0046 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0047
     * @tc.name      testColorData0047
     * @tc.desc      Verify colorData behavior for matrix index 46.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0047 begin');
      const index: number = 46;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0047 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0048
     * @tc.name      testColorData0048
     * @tc.desc      Verify colorData behavior for matrix index 47.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0048 begin');
      const index: number = 47;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0048 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0049
     * @tc.name      testColorData0049
     * @tc.desc      Verify colorData behavior for matrix index 48.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0049 begin');
      const index: number = 48;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0049 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0050
     * @tc.name      testColorData0050
     * @tc.desc      Verify colorData behavior for matrix index 49.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0050 begin');
      const index: number = 49;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0050 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0051
     * @tc.name      testColorData0051
     * @tc.desc      Verify colorData behavior for matrix index 50.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0051 begin');
      const index: number = 50;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0051 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0052
     * @tc.name      testColorData0052
     * @tc.desc      Verify colorData behavior for matrix index 51.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0052 begin');
      const index: number = 51;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0052 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0053
     * @tc.name      testColorData0053
     * @tc.desc      Verify colorData behavior for matrix index 52.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0053 begin');
      const index: number = 52;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0053 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0054
     * @tc.name      testColorData0054
     * @tc.desc      Verify colorData behavior for matrix index 53.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0054 begin');
      const index: number = 53;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0054 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0055
     * @tc.name      testColorData0055
     * @tc.desc      Verify colorData behavior for matrix index 54.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0055 begin');
      const index: number = 54;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0055 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0056
     * @tc.name      testColorData0056
     * @tc.desc      Verify colorData behavior for matrix index 55.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0056 begin');
      const index: number = 55;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0056 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0057
     * @tc.name      testColorData0057
     * @tc.desc      Verify colorData behavior for matrix index 56.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0057 begin');
      const index: number = 56;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0057 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0058
     * @tc.name      testColorData0058
     * @tc.desc      Verify colorData behavior for matrix index 57.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0058 begin');
      const index: number = 57;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0058 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0059
     * @tc.name      testColorData0059
     * @tc.desc      Verify colorData behavior for matrix index 58.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0059 begin');
      const index: number = 58;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0059 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0060
     * @tc.name      testColorData0060
     * @tc.desc      Verify colorData behavior for matrix index 59.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0060 begin');
      const index: number = 59;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0060 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0061
     * @tc.name      testColorData0061
     * @tc.desc      Verify colorData behavior for matrix index 60.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0061 begin');
      const index: number = 60;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0061 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0062
     * @tc.name      testColorData0062
     * @tc.desc      Verify colorData behavior for matrix index 61.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0062 begin');
      const index: number = 61;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0062 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0063
     * @tc.name      testColorData0063
     * @tc.desc      Verify colorData behavior for matrix index 62.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0063 begin');
      const index: number = 62;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0063 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_COLORDATA_0064
     * @tc.name      testColorData0064
     * @tc.desc      Verify colorData behavior for matrix index 63.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testColorData0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0064 begin');
      const index: number = 63;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorData0064 end');
    })

  })
}
