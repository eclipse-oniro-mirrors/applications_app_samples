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
const TAG: string = '[Sample_ComponentReuse_PerfMatrix]';

export default function performanceMatrixTest() {
  describe('performanceMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_PERF_PUSH_0100
     * @tc.name testPerfPush0050
     * @tc.desc Verify pushing 50 items keeps exact count within budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPerfPush0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfPush0050 begin');
      const data: ColorData = new ColorData();
      const start: number = Date.now();
      for (let i: number = 0; i < 50; i++) {
        data.pushData(new ColorModel('perf_' + i, 'text_' + i, i % 2 === 0 ? Color.Red : Color.Blue));
      }
      const cost: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `push 50 cost=${cost}ms`);
      expect(data.totalCount()).assertEqual(50);
      expect(cost < 2000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfPush0050 end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_PERF_READ_0100
     * @tc.name testPerfRead0050
     * @tc.desc Verify reading 49 items of a 50-item source within budget with matching ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPerfRead0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfRead0050 begin');
      const data: ColorData = new ColorData();
      for (let i: number = 0; i < 50; i++) {
        data.pushData(new ColorModel('read_' + i, 'text_' + i, Color.Green));
      }
      const start: number = Date.now();
      let matched: number = 0;
      for (let i: number = 0; i < 49; i++) {
        const item: ColorModel = data.getData(i) as ColorModel;
        if (item !== undefined && item.id === 'read_' + i) {
          matched++;
        }
      }
      const cost: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `read 50 cost=${cost}ms`);
      expect(matched).assertEqual(49);
      expect(cost < 2000).assertTrue();
      expect(data.totalCount()).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfRead0050 end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_PERF_PUSH_0200
     * @tc.name testPerfPush0200
     * @tc.desc Verify pushing 200 items keeps exact count within budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPerfPush0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfPush0200 begin');
      const data: ColorData = new ColorData();
      const start: number = Date.now();
      for (let i: number = 0; i < 200; i++) {
        data.pushData(new ColorModel('perf_' + i, 'text_' + i, i % 2 === 0 ? Color.Red : Color.Blue));
      }
      const cost: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `push 200 cost=${cost}ms`);
      expect(data.totalCount()).assertEqual(200);
      expect(cost < 3000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfPush0200 end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_PERF_READ_0200
     * @tc.name testPerfRead0200
     * @tc.desc Verify reading 199 items of a 200-item source within budget with matching ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPerfRead0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfRead0200 begin');
      const data: ColorData = new ColorData();
      for (let i: number = 0; i < 200; i++) {
        data.pushData(new ColorModel('read_' + i, 'text_' + i, Color.Green));
      }
      const start: number = Date.now();
      let matched: number = 0;
      for (let i: number = 0; i < 199; i++) {
        const item: ColorModel = data.getData(i) as ColorModel;
        if (item !== undefined && item.id === 'read_' + i) {
          matched++;
        }
      }
      const cost: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `read 200 cost=${cost}ms`);
      expect(matched).assertEqual(199);
      expect(cost < 3000).assertTrue();
      expect(data.totalCount()).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfRead0200 end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_PERF_PUSH_1000
     * @tc.name testPerfPush1000
     * @tc.desc Verify pushing 1000 items keeps exact count within budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPerfPush1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfPush1000 begin');
      const data: ColorData = new ColorData();
      const start: number = Date.now();
      for (let i: number = 0; i < 1000; i++) {
        data.pushData(new ColorModel('perf_' + i, 'text_' + i, i % 2 === 0 ? Color.Red : Color.Blue));
      }
      const cost: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `push 1000 cost=${cost}ms`);
      expect(data.totalCount()).assertEqual(1000);
      expect(cost < 8000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfPush1000 end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_PERF_READ_1000
     * @tc.name testPerfRead1000
     * @tc.desc Verify reading 999 items of a 1000-item source within budget with matching ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPerfRead1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfRead1000 begin');
      const data: ColorData = new ColorData();
      for (let i: number = 0; i < 1000; i++) {
        data.pushData(new ColorModel('read_' + i, 'text_' + i, Color.Green));
      }
      const start: number = Date.now();
      let matched: number = 0;
      for (let i: number = 0; i < 999; i++) {
        const item: ColorModel = data.getData(i) as ColorModel;
        if (item !== undefined && item.id === 'read_' + i) {
          matched++;
        }
      }
      const cost: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `read 1000 cost=${cost}ms`);
      expect(matched).assertEqual(999);
      expect(cost < 8000).assertTrue();
      expect(data.totalCount()).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfRead1000 end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_PERF_PUSH_3000
     * @tc.name testPerfPush3000
     * @tc.desc Verify pushing 3000 items keeps exact count within budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPerfPush3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfPush3000 begin');
      const data: ColorData = new ColorData();
      const start: number = Date.now();
      for (let i: number = 0; i < 3000; i++) {
        data.pushData(new ColorModel('perf_' + i, 'text_' + i, i % 2 === 0 ? Color.Red : Color.Blue));
      }
      const cost: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `push 3000 cost=${cost}ms`);
      expect(data.totalCount()).assertEqual(3000);
      expect(cost < 20000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfPush3000 end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_PERF_READ_3000
     * @tc.name testPerfRead3000
     * @tc.desc Verify reading 2999 items of a 3000-item source within budget with matching ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPerfRead3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfRead3000 begin');
      const data: ColorData = new ColorData();
      for (let i: number = 0; i < 3000; i++) {
        data.pushData(new ColorModel('read_' + i, 'text_' + i, Color.Green));
      }
      const start: number = Date.now();
      let matched: number = 0;
      for (let i: number = 0; i < 2999; i++) {
        const item: ColorModel = data.getData(i) as ColorModel;
        if (item !== undefined && item.id === 'read_' + i) {
          matched++;
        }
      }
      const cost: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `read 3000 cost=${cost}ms`);
      expect(matched).assertEqual(2999);
      expect(cost < 20000).assertTrue();
      expect(data.totalCount()).assertEqual(3000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfRead3000 end');
    });
  })
}
