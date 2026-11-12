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
const TAG: string = '[Sample_ComponentReuse_ColorData]';

export default function colorDataTest() {
  describe('colorDataTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0001
     * @tc.name testColorData0001
     * @tc.desc Verify ColorData behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0001 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (0 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 0 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0001 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0002
     * @tc.name testColorData0002
     * @tc.desc Verify ColorData behavior for matrix index 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0002 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (1 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 1 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0002 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0003
     * @tc.name testColorData0003
     * @tc.desc Verify ColorData behavior for matrix index 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0003 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (2 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 2 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0003 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0004
     * @tc.name testColorData0004
     * @tc.desc Verify ColorData behavior for matrix index 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0004 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (3 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 3 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0004 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0005
     * @tc.name testColorData0005
     * @tc.desc Verify ColorData behavior for matrix index 4
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0005 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (4 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 4 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0005 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0006
     * @tc.name testColorData0006
     * @tc.desc Verify ColorData behavior for matrix index 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0006 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (5 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 5 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0006 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0007
     * @tc.name testColorData0007
     * @tc.desc Verify ColorData behavior for matrix index 6
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0007 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (6 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 6 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0007 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0008
     * @tc.name testColorData0008
     * @tc.desc Verify ColorData behavior for matrix index 7
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0008 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (7 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 7 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0008 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0009
     * @tc.name testColorData0009
     * @tc.desc Verify ColorData behavior for matrix index 8
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0009 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (8 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 8 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0009 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0010
     * @tc.name testColorData0010
     * @tc.desc Verify ColorData behavior for matrix index 9
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0010 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (9 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 9 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0010 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0011
     * @tc.name testColorData0011
     * @tc.desc Verify ColorData behavior for matrix index 10
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0011 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (10 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 10 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0011 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0012
     * @tc.name testColorData0012
     * @tc.desc Verify ColorData behavior for matrix index 11
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0012 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (11 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 11 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0012 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0013
     * @tc.name testColorData0013
     * @tc.desc Verify ColorData behavior for matrix index 12
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0013 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (12 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 12 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0013 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0014
     * @tc.name testColorData0014
     * @tc.desc Verify ColorData behavior for matrix index 13
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0014 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (13 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 13 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0014 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0015
     * @tc.name testColorData0015
     * @tc.desc Verify ColorData behavior for matrix index 14
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0015 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (14 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 14 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0015 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0016
     * @tc.name testColorData0016
     * @tc.desc Verify ColorData behavior for matrix index 15
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0016 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (15 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 15 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0016 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0019
     * @tc.name testColorData0019
     * @tc.desc Verify ColorData behavior for matrix index 18
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0019 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (18 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 18 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0019 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0020
     * @tc.name testColorData0020
     * @tc.desc Verify ColorData behavior for matrix index 19
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0020 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (19 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 19 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0020 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0021
     * @tc.name testColorData0021
     * @tc.desc Verify ColorData behavior for matrix index 20
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0021 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (20 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 20 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0021 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0026
     * @tc.name testColorData0026
     * @tc.desc Verify ColorData behavior for matrix index 25
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0026 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (25 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 25 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0026 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0032
     * @tc.name testColorData0032
     * @tc.desc Verify ColorData behavior for matrix index 31
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0032 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (31 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 31 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0032 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0040
     * @tc.name testColorData0040
     * @tc.desc Verify ColorData behavior for matrix index 39
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0040 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (39 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 39 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0040 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0064
     * @tc.name testColorData0064
     * @tc.desc Verify ColorData behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0064 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (63 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 63 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0064 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0065
     * @tc.name testColorData0065
     * @tc.desc Verify ColorData behavior for matrix index 64
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0065 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (64 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 64 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0065 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0128
     * @tc.name testColorData0128
     * @tc.desc Verify ColorData behavior for matrix index 127
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0128 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (127 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 127 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0128 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0129
     * @tc.name testColorData0129
     * @tc.desc Verify ColorData behavior for matrix index 128
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0129 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (128 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 128 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0129 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0192
     * @tc.name testColorData0192
     * @tc.desc Verify ColorData behavior for matrix index 191
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0192 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (191 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 191 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0192 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0255
     * @tc.name testColorData0255
     * @tc.desc Verify ColorData behavior for matrix index 254
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0255 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (254 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 254 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0255 end`);
    });
    /**
     * @tc.number SUB_COMPONENT_REUSE_COLORDATA_0256
     * @tc.name testColorData0256
     * @tc.desc Verify ColorData behavior for matrix index 255
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorData0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0256 begin`);
      const data: ColorData = new ColorData();
      const pushCount: number = (255 % 20) + 1;
      for (let n: number = 0; n < pushCount; n++) {
        data.pushData(new ColorModel('color_id_' + n, 'color_text_' + n,
          n % 2 === 0 ? Color.Red : Color.Blue));
      }
      expect(data.totalCount()).assertEqual(pushCount);
      let target: number = 255 % pushCount;
      if (target === pushCount - 1) {
        target = 0;
      }
      const item: ColorModel = data.getData(target) as ColorModel;
      expect(item.id).assertEqual('color_id_' + target);
      expect(item.text).assertEqual('color_text_' + target);
      expect(item.color).assertEqual(target % 2 === 0 ? Color.Red : Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `testColorData0256 end`);
    });
  })
}
