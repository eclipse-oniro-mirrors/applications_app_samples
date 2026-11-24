/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

// @volume rule=BreakpointType<Resource> frozen ids
// -> GetValue returns resource with matching id basis=main-frozen cases=75
// Volume cases are driven by a frozen data table; the first rows are hand-tuned Anchor boundary cases.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[MultiColumns_BPR1]';

function makeRes(id: number): Resource {
  return {
    id: id,
    type: 10001,
    bundleName: 'com.samples.multicolumns',
    moduleName: 'entry',
    params: [] as Array<string | number>
  };
}

export default function bpResVol01Test() {
  describe('MultiColumnsBpResVol01', () => {

    /**
     * @tc.name   testBpResVol0301
     * @tc.number SUB_MC_BPG_0301
     * @tc.desc   Anchor: BreakpointType<Resource> id-based selection at extreme ids (0/1/2)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0301 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(0), makeRes(1), makeRes(2));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(0));
      expect(r0).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1));
      expect(r1).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(2));
      expect(r2).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0301 end');
    });

    /**
     * @tc.name   testBpResVol0302
     * @tc.number SUB_MC_BPG_0302
     * @tc.desc   Anchor: BreakpointType<Resource> id-based selection at extreme ids (0/1/9007199254740990)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0302 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(
        makeRes(0),
        makeRes(1),
        makeRes(9007199254740990));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(0));
      expect(r0).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(1));
      expect(r1).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(9007199254740990));
      expect(r2).assertEqual(9007199254740990);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0302 end');
    });

    /**
     * @tc.name   testBpResVol0303
     * @tc.number SUB_MC_BPG_0303
     * @tc.desc   BreakpointType<Resource> triple ids (1303,2303,3303) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0303 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1303), makeRes(2303), makeRes(3303));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1303));
      expect(r0).assertEqual(1303);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2303));
      expect(r1).assertEqual(2303);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3303));
      expect(r2).assertEqual(3303);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0303 end');
    });

    /**
     * @tc.name   testBpResVol0304
     * @tc.number SUB_MC_BPG_0304
     * @tc.desc   BreakpointType<Resource> triple ids (1304,2304,3304) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0304 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1304), makeRes(2304), makeRes(3304));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1304));
      expect(r0).assertEqual(1304);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2304));
      expect(r1).assertEqual(2304);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3304));
      expect(r2).assertEqual(3304);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0304 end');
    });

    /**
     * @tc.name   testBpResVol0305
     * @tc.number SUB_MC_BPG_0305
     * @tc.desc   BreakpointType<Resource> triple ids (1305,2305,3305) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0305 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1305), makeRes(2305), makeRes(3305));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1305));
      expect(r0).assertEqual(1305);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2305));
      expect(r1).assertEqual(2305);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3305));
      expect(r2).assertEqual(3305);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0305 end');
    });

    /**
     * @tc.name   testBpResVol0306
     * @tc.number SUB_MC_BPG_0306
     * @tc.desc   BreakpointType<Resource> triple ids (1306,2306,3306) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0306 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1306), makeRes(2306), makeRes(3306));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1306));
      expect(r0).assertEqual(1306);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2306));
      expect(r1).assertEqual(2306);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3306));
      expect(r2).assertEqual(3306);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0306 end');
    });

    /**
     * @tc.name   testBpResVol0307
     * @tc.number SUB_MC_BPG_0307
     * @tc.desc   BreakpointType<Resource> triple ids (1307,2307,3307) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0307 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1307), makeRes(2307), makeRes(3307));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1307));
      expect(r0).assertEqual(1307);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2307));
      expect(r1).assertEqual(2307);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3307));
      expect(r2).assertEqual(3307);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0307 end');
    });

    /**
     * @tc.name   testBpResVol0308
     * @tc.number SUB_MC_BPG_0308
     * @tc.desc   BreakpointType<Resource> triple ids (1308,2308,3308) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0308 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1308), makeRes(2308), makeRes(3308));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1308));
      expect(r0).assertEqual(1308);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2308));
      expect(r1).assertEqual(2308);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3308));
      expect(r2).assertEqual(3308);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0308 end');
    });

    /**
     * @tc.name   testBpResVol0309
     * @tc.number SUB_MC_BPG_0309
     * @tc.desc   BreakpointType<Resource> triple ids (1309,2309,3309) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0309 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1309), makeRes(2309), makeRes(3309));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1309));
      expect(r0).assertEqual(1309);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2309));
      expect(r1).assertEqual(2309);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3309));
      expect(r2).assertEqual(3309);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0309 end');
    });

    /**
     * @tc.name   testBpResVol0310
     * @tc.number SUB_MC_BPG_0310
     * @tc.desc   BreakpointType<Resource> triple ids (1310,2310,3310) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0310 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1310), makeRes(2310), makeRes(3310));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1310));
      expect(r0).assertEqual(1310);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2310));
      expect(r1).assertEqual(2310);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3310));
      expect(r2).assertEqual(3310);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0310 end');
    });

    /**
     * @tc.name   testBpResVol0311
     * @tc.number SUB_MC_BPG_0311
     * @tc.desc   BreakpointType<Resource> triple ids (1311,2311,3311) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0311 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1311), makeRes(2311), makeRes(3311));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1311));
      expect(r0).assertEqual(1311);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2311));
      expect(r1).assertEqual(2311);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3311));
      expect(r2).assertEqual(3311);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0311 end');
    });

    /**
     * @tc.name   testBpResVol0312
     * @tc.number SUB_MC_BPG_0312
     * @tc.desc   BreakpointType<Resource> triple ids (1312,2312,3312) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0312 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1312), makeRes(2312), makeRes(3312));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1312));
      expect(r0).assertEqual(1312);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2312));
      expect(r1).assertEqual(2312);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3312));
      expect(r2).assertEqual(3312);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0312 end');
    });

    /**
     * @tc.name   testBpResVol0313
     * @tc.number SUB_MC_BPG_0313
     * @tc.desc   BreakpointType<Resource> triple ids (1313,2313,3313) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0313 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1313), makeRes(2313), makeRes(3313));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1313));
      expect(r0).assertEqual(1313);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2313));
      expect(r1).assertEqual(2313);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3313));
      expect(r2).assertEqual(3313);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0313 end');
    });

    /**
     * @tc.name   testBpResVol0314
     * @tc.number SUB_MC_BPG_0314
     * @tc.desc   BreakpointType<Resource> triple ids (1314,2314,3314) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0314 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1314), makeRes(2314), makeRes(3314));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1314));
      expect(r0).assertEqual(1314);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2314));
      expect(r1).assertEqual(2314);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3314));
      expect(r2).assertEqual(3314);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0314 end');
    });

    /**
     * @tc.name   testBpResVol0315
     * @tc.number SUB_MC_BPG_0315
     * @tc.desc   BreakpointType<Resource> triple ids (1315,2315,3315) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0315 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1315), makeRes(2315), makeRes(3315));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1315));
      expect(r0).assertEqual(1315);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2315));
      expect(r1).assertEqual(2315);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3315));
      expect(r2).assertEqual(3315);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0315 end');
    });

    /**
     * @tc.name   testBpResVol0316
     * @tc.number SUB_MC_BPG_0316
     * @tc.desc   BreakpointType<Resource> triple ids (1316,2316,3316) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0316 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1316), makeRes(2316), makeRes(3316));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1316));
      expect(r0).assertEqual(1316);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2316));
      expect(r1).assertEqual(2316);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3316));
      expect(r2).assertEqual(3316);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0316 end');
    });

    /**
     * @tc.name   testBpResVol0317
     * @tc.number SUB_MC_BPG_0317
     * @tc.desc   BreakpointType<Resource> triple ids (1317,2317,3317) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0317 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1317), makeRes(2317), makeRes(3317));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1317));
      expect(r0).assertEqual(1317);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2317));
      expect(r1).assertEqual(2317);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3317));
      expect(r2).assertEqual(3317);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0317 end');
    });

    /**
     * @tc.name   testBpResVol0318
     * @tc.number SUB_MC_BPG_0318
     * @tc.desc   BreakpointType<Resource> triple ids (1318,2318,3318) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0318 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1318), makeRes(2318), makeRes(3318));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1318));
      expect(r0).assertEqual(1318);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2318));
      expect(r1).assertEqual(2318);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3318));
      expect(r2).assertEqual(3318);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0318 end');
    });

    /**
     * @tc.name   testBpResVol0319
     * @tc.number SUB_MC_BPG_0319
     * @tc.desc   BreakpointType<Resource> triple ids (1319,2319,3319) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0319 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1319), makeRes(2319), makeRes(3319));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1319));
      expect(r0).assertEqual(1319);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2319));
      expect(r1).assertEqual(2319);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3319));
      expect(r2).assertEqual(3319);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0319 end');
    });

    /**
     * @tc.name   testBpResVol0320
     * @tc.number SUB_MC_BPG_0320
     * @tc.desc   BreakpointType<Resource> triple ids (1320,2320,3320) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0320 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1320), makeRes(2320), makeRes(3320));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1320));
      expect(r0).assertEqual(1320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2320));
      expect(r1).assertEqual(2320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3320));
      expect(r2).assertEqual(3320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0320 end');
    });

    /**
     * @tc.name   testBpResVol0321
     * @tc.number SUB_MC_BPG_0321
     * @tc.desc   BreakpointType<Resource> triple ids (1321,2321,3321) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0321 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1321), makeRes(2321), makeRes(3321));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1321));
      expect(r0).assertEqual(1321);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2321));
      expect(r1).assertEqual(2321);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3321));
      expect(r2).assertEqual(3321);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0321 end');
    });

    /**
     * @tc.name   testBpResVol0322
     * @tc.number SUB_MC_BPG_0322
     * @tc.desc   BreakpointType<Resource> triple ids (1322,2322,3322) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0322 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1322), makeRes(2322), makeRes(3322));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1322));
      expect(r0).assertEqual(1322);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2322));
      expect(r1).assertEqual(2322);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3322));
      expect(r2).assertEqual(3322);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0322 end');
    });

    /**
     * @tc.name   testBpResVol0323
     * @tc.number SUB_MC_BPG_0323
     * @tc.desc   BreakpointType<Resource> triple ids (1323,2323,3323) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0323 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1323), makeRes(2323), makeRes(3323));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1323));
      expect(r0).assertEqual(1323);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2323));
      expect(r1).assertEqual(2323);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3323));
      expect(r2).assertEqual(3323);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0323 end');
    });

    /**
     * @tc.name   testBpResVol0324
     * @tc.number SUB_MC_BPG_0324
     * @tc.desc   BreakpointType<Resource> triple ids (1324,2324,3324) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0324 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1324), makeRes(2324), makeRes(3324));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1324));
      expect(r0).assertEqual(1324);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2324));
      expect(r1).assertEqual(2324);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3324));
      expect(r2).assertEqual(3324);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0324 end');
    });

    /**
     * @tc.name   testBpResVol0325
     * @tc.number SUB_MC_BPG_0325
     * @tc.desc   BreakpointType<Resource> triple ids (1325,2325,3325) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0325 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1325), makeRes(2325), makeRes(3325));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1325));
      expect(r0).assertEqual(1325);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2325));
      expect(r1).assertEqual(2325);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3325));
      expect(r2).assertEqual(3325);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0325 end');
    });

    /**
     * @tc.name   testBpResVol0326
     * @tc.number SUB_MC_BPG_0326
     * @tc.desc   BreakpointType<Resource> triple ids (1326,2326,3326) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0326 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1326), makeRes(2326), makeRes(3326));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1326));
      expect(r0).assertEqual(1326);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2326));
      expect(r1).assertEqual(2326);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3326));
      expect(r2).assertEqual(3326);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0326 end');
    });

    /**
     * @tc.name   testBpResVol0327
     * @tc.number SUB_MC_BPG_0327
     * @tc.desc   BreakpointType<Resource> triple ids (1327,2327,3327) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0327 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1327), makeRes(2327), makeRes(3327));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1327));
      expect(r0).assertEqual(1327);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2327));
      expect(r1).assertEqual(2327);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3327));
      expect(r2).assertEqual(3327);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0327 end');
    });

    /**
     * @tc.name   testBpResVol0328
     * @tc.number SUB_MC_BPG_0328
     * @tc.desc   BreakpointType<Resource> triple ids (1328,2328,3328) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0328 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1328), makeRes(2328), makeRes(3328));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1328));
      expect(r0).assertEqual(1328);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2328));
      expect(r1).assertEqual(2328);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3328));
      expect(r2).assertEqual(3328);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0328 end');
    });

    /**
     * @tc.name   testBpResVol0329
     * @tc.number SUB_MC_BPG_0329
     * @tc.desc   BreakpointType<Resource> triple ids (1329,2329,3329) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0329 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1329), makeRes(2329), makeRes(3329));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1329));
      expect(r0).assertEqual(1329);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2329));
      expect(r1).assertEqual(2329);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3329));
      expect(r2).assertEqual(3329);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0329 end');
    });

    /**
     * @tc.name   testBpResVol0330
     * @tc.number SUB_MC_BPG_0330
     * @tc.desc   BreakpointType<Resource> triple ids (1330,2330,3330) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0330 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1330), makeRes(2330), makeRes(3330));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1330));
      expect(r0).assertEqual(1330);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2330));
      expect(r1).assertEqual(2330);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3330));
      expect(r2).assertEqual(3330);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0330 end');
    });

    /**
     * @tc.name   testBpResVol0331
     * @tc.number SUB_MC_BPG_0331
     * @tc.desc   BreakpointType<Resource> triple ids (1331,2331,3331) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0331 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1331), makeRes(2331), makeRes(3331));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1331));
      expect(r0).assertEqual(1331);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2331));
      expect(r1).assertEqual(2331);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3331));
      expect(r2).assertEqual(3331);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0331 end');
    });

    /**
     * @tc.name   testBpResVol0332
     * @tc.number SUB_MC_BPG_0332
     * @tc.desc   BreakpointType<Resource> triple ids (1332,2332,3332) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0332 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1332), makeRes(2332), makeRes(3332));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1332));
      expect(r0).assertEqual(1332);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2332));
      expect(r1).assertEqual(2332);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3332));
      expect(r2).assertEqual(3332);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0332 end');
    });

    /**
     * @tc.name   testBpResVol0333
     * @tc.number SUB_MC_BPG_0333
     * @tc.desc   BreakpointType<Resource> triple ids (1333,2333,3333) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0333 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1333), makeRes(2333), makeRes(3333));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1333));
      expect(r0).assertEqual(1333);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2333));
      expect(r1).assertEqual(2333);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3333));
      expect(r2).assertEqual(3333);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0333 end');
    });

    /**
     * @tc.name   testBpResVol0334
     * @tc.number SUB_MC_BPG_0334
     * @tc.desc   BreakpointType<Resource> triple ids (1334,2334,3334) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0334 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1334), makeRes(2334), makeRes(3334));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1334));
      expect(r0).assertEqual(1334);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2334));
      expect(r1).assertEqual(2334);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3334));
      expect(r2).assertEqual(3334);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0334 end');
    });

    /**
     * @tc.name   testBpResVol0335
     * @tc.number SUB_MC_BPG_0335
     * @tc.desc   BreakpointType<Resource> triple ids (1335,2335,3335) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0335 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1335), makeRes(2335), makeRes(3335));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1335));
      expect(r0).assertEqual(1335);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2335));
      expect(r1).assertEqual(2335);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3335));
      expect(r2).assertEqual(3335);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0335 end');
    });

    /**
     * @tc.name   testBpResVol0336
     * @tc.number SUB_MC_BPG_0336
     * @tc.desc   BreakpointType<Resource> triple ids (1336,2336,3336) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0336 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1336), makeRes(2336), makeRes(3336));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1336));
      expect(r0).assertEqual(1336);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2336));
      expect(r1).assertEqual(2336);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3336));
      expect(r2).assertEqual(3336);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0336 end');
    });

    /**
     * @tc.name   testBpResVol0337
     * @tc.number SUB_MC_BPG_0337
     * @tc.desc   BreakpointType<Resource> triple ids (1337,2337,3337) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0337 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1337), makeRes(2337), makeRes(3337));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1337));
      expect(r0).assertEqual(1337);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2337));
      expect(r1).assertEqual(2337);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3337));
      expect(r2).assertEqual(3337);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0337 end');
    });

    /**
     * @tc.name   testBpResVol0338
     * @tc.number SUB_MC_BPG_0338
     * @tc.desc   BreakpointType<Resource> triple ids (1338,2338,3338) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0338 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1338), makeRes(2338), makeRes(3338));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1338));
      expect(r0).assertEqual(1338);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2338));
      expect(r1).assertEqual(2338);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3338));
      expect(r2).assertEqual(3338);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0338 end');
    });

    /**
     * @tc.name   testBpResVol0339
     * @tc.number SUB_MC_BPG_0339
     * @tc.desc   BreakpointType<Resource> triple ids (1339,2339,3339) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0339 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1339), makeRes(2339), makeRes(3339));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1339));
      expect(r0).assertEqual(1339);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2339));
      expect(r1).assertEqual(2339);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3339));
      expect(r2).assertEqual(3339);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0339 end');
    });

    /**
     * @tc.name   testBpResVol0340
     * @tc.number SUB_MC_BPG_0340
     * @tc.desc   BreakpointType<Resource> triple ids (1340,2340,3340) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0340 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1340), makeRes(2340), makeRes(3340));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1340));
      expect(r0).assertEqual(1340);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2340));
      expect(r1).assertEqual(2340);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3340));
      expect(r2).assertEqual(3340);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0340 end');
    });

    /**
     * @tc.name   testBpResVol0341
     * @tc.number SUB_MC_BPG_0341
     * @tc.desc   BreakpointType<Resource> triple ids (1341,2341,3341) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0341 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1341), makeRes(2341), makeRes(3341));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1341));
      expect(r0).assertEqual(1341);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2341));
      expect(r1).assertEqual(2341);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3341));
      expect(r2).assertEqual(3341);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0341 end');
    });

    /**
     * @tc.name   testBpResVol0342
     * @tc.number SUB_MC_BPG_0342
     * @tc.desc   BreakpointType<Resource> triple ids (1342,2342,3342) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0342 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1342), makeRes(2342), makeRes(3342));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1342));
      expect(r0).assertEqual(1342);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2342));
      expect(r1).assertEqual(2342);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3342));
      expect(r2).assertEqual(3342);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0342 end');
    });

    /**
     * @tc.name   testBpResVol0343
     * @tc.number SUB_MC_BPG_0343
     * @tc.desc   BreakpointType<Resource> triple ids (1343,2343,3343) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0343 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1343), makeRes(2343), makeRes(3343));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1343));
      expect(r0).assertEqual(1343);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2343));
      expect(r1).assertEqual(2343);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3343));
      expect(r2).assertEqual(3343);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0343 end');
    });

    /**
     * @tc.name   testBpResVol0344
     * @tc.number SUB_MC_BPG_0344
     * @tc.desc   BreakpointType<Resource> triple ids (1344,2344,3344) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0344 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1344), makeRes(2344), makeRes(3344));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1344));
      expect(r0).assertEqual(1344);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2344));
      expect(r1).assertEqual(2344);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3344));
      expect(r2).assertEqual(3344);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0344 end');
    });

    /**
     * @tc.name   testBpResVol0345
     * @tc.number SUB_MC_BPG_0345
     * @tc.desc   BreakpointType<Resource> triple ids (1345,2345,3345) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0345 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1345), makeRes(2345), makeRes(3345));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1345));
      expect(r0).assertEqual(1345);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2345));
      expect(r1).assertEqual(2345);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3345));
      expect(r2).assertEqual(3345);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0345 end');
    });

    /**
     * @tc.name   testBpResVol0346
     * @tc.number SUB_MC_BPG_0346
     * @tc.desc   BreakpointType<Resource> triple ids (1346,2346,3346) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0346 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1346), makeRes(2346), makeRes(3346));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1346));
      expect(r0).assertEqual(1346);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2346));
      expect(r1).assertEqual(2346);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3346));
      expect(r2).assertEqual(3346);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0346 end');
    });

    /**
     * @tc.name   testBpResVol0347
     * @tc.number SUB_MC_BPG_0347
     * @tc.desc   BreakpointType<Resource> triple ids (1347,2347,3347) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0347 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1347), makeRes(2347), makeRes(3347));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1347));
      expect(r0).assertEqual(1347);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2347));
      expect(r1).assertEqual(2347);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3347));
      expect(r2).assertEqual(3347);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0347 end');
    });

    /**
     * @tc.name   testBpResVol0348
     * @tc.number SUB_MC_BPG_0348
     * @tc.desc   BreakpointType<Resource> triple ids (1348,2348,3348) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0348 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1348), makeRes(2348), makeRes(3348));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1348));
      expect(r0).assertEqual(1348);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2348));
      expect(r1).assertEqual(2348);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3348));
      expect(r2).assertEqual(3348);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0348 end');
    });

    /**
     * @tc.name   testBpResVol0349
     * @tc.number SUB_MC_BPG_0349
     * @tc.desc   BreakpointType<Resource> triple ids (1349,2349,3349) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0349 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1349), makeRes(2349), makeRes(3349));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1349));
      expect(r0).assertEqual(1349);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2349));
      expect(r1).assertEqual(2349);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3349));
      expect(r2).assertEqual(3349);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0349 end');
    });

    /**
     * @tc.name   testBpResVol0350
     * @tc.number SUB_MC_BPG_0350
     * @tc.desc   BreakpointType<Resource> triple ids (1350,2350,3350) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0350 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1350), makeRes(2350), makeRes(3350));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1350));
      expect(r0).assertEqual(1350);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2350));
      expect(r1).assertEqual(2350);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3350));
      expect(r2).assertEqual(3350);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0350 end');
    });

    /**
     * @tc.name   testBpResVol0351
     * @tc.number SUB_MC_BPG_0351
     * @tc.desc   BreakpointType<Resource> triple ids (1351,2351,3351) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0351 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1351), makeRes(2351), makeRes(3351));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1351));
      expect(r0).assertEqual(1351);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2351));
      expect(r1).assertEqual(2351);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3351));
      expect(r2).assertEqual(3351);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0351 end');
    });

    /**
     * @tc.name   testBpResVol0352
     * @tc.number SUB_MC_BPG_0352
     * @tc.desc   BreakpointType<Resource> triple ids (1352,2352,3352) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0352 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1352), makeRes(2352), makeRes(3352));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1352));
      expect(r0).assertEqual(1352);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2352));
      expect(r1).assertEqual(2352);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3352));
      expect(r2).assertEqual(3352);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0352 end');
    });

    /**
     * @tc.name   testBpResVol0353
     * @tc.number SUB_MC_BPG_0353
     * @tc.desc   BreakpointType<Resource> triple ids (1353,2353,3353) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0353 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1353), makeRes(2353), makeRes(3353));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1353));
      expect(r0).assertEqual(1353);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2353));
      expect(r1).assertEqual(2353);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3353));
      expect(r2).assertEqual(3353);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0353 end');
    });

    /**
     * @tc.name   testBpResVol0354
     * @tc.number SUB_MC_BPG_0354
     * @tc.desc   BreakpointType<Resource> triple ids (1354,2354,3354) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0354 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1354), makeRes(2354), makeRes(3354));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1354));
      expect(r0).assertEqual(1354);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2354));
      expect(r1).assertEqual(2354);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3354));
      expect(r2).assertEqual(3354);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0354 end');
    });

    /**
     * @tc.name   testBpResVol0355
     * @tc.number SUB_MC_BPG_0355
     * @tc.desc   BreakpointType<Resource> triple ids (1355,2355,3355) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0355 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1355), makeRes(2355), makeRes(3355));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1355));
      expect(r0).assertEqual(1355);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2355));
      expect(r1).assertEqual(2355);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3355));
      expect(r2).assertEqual(3355);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0355 end');
    });

    /**
     * @tc.name   testBpResVol0356
     * @tc.number SUB_MC_BPG_0356
     * @tc.desc   BreakpointType<Resource> triple ids (1356,2356,3356) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0356 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1356), makeRes(2356), makeRes(3356));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1356));
      expect(r0).assertEqual(1356);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2356));
      expect(r1).assertEqual(2356);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3356));
      expect(r2).assertEqual(3356);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0356 end');
    });

    /**
     * @tc.name   testBpResVol0357
     * @tc.number SUB_MC_BPG_0357
     * @tc.desc   BreakpointType<Resource> triple ids (1357,2357,3357) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0357 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1357), makeRes(2357), makeRes(3357));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1357));
      expect(r0).assertEqual(1357);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2357));
      expect(r1).assertEqual(2357);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3357));
      expect(r2).assertEqual(3357);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0357 end');
    });

    /**
     * @tc.name   testBpResVol0358
     * @tc.number SUB_MC_BPG_0358
     * @tc.desc   BreakpointType<Resource> triple ids (1358,2358,3358) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0358 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1358), makeRes(2358), makeRes(3358));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1358));
      expect(r0).assertEqual(1358);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2358));
      expect(r1).assertEqual(2358);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3358));
      expect(r2).assertEqual(3358);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0358 end');
    });

    /**
     * @tc.name   testBpResVol0359
     * @tc.number SUB_MC_BPG_0359
     * @tc.desc   BreakpointType<Resource> triple ids (1359,2359,3359) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0359 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1359), makeRes(2359), makeRes(3359));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1359));
      expect(r0).assertEqual(1359);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2359));
      expect(r1).assertEqual(2359);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3359));
      expect(r2).assertEqual(3359);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0359 end');
    });

    /**
     * @tc.name   testBpResVol0360
     * @tc.number SUB_MC_BPG_0360
     * @tc.desc   BreakpointType<Resource> triple ids (1360,2360,3360) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0360 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1360), makeRes(2360), makeRes(3360));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1360));
      expect(r0).assertEqual(1360);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2360));
      expect(r1).assertEqual(2360);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3360));
      expect(r2).assertEqual(3360);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0360 end');
    });

    /**
     * @tc.name   testBpResVol0361
     * @tc.number SUB_MC_BPG_0361
     * @tc.desc   BreakpointType<Resource> triple ids (1361,2361,3361) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0361 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1361), makeRes(2361), makeRes(3361));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1361));
      expect(r0).assertEqual(1361);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2361));
      expect(r1).assertEqual(2361);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3361));
      expect(r2).assertEqual(3361);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0361 end');
    });

    /**
     * @tc.name   testBpResVol0362
     * @tc.number SUB_MC_BPG_0362
     * @tc.desc   BreakpointType<Resource> triple ids (1362,2362,3362) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0362 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1362), makeRes(2362), makeRes(3362));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1362));
      expect(r0).assertEqual(1362);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2362));
      expect(r1).assertEqual(2362);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3362));
      expect(r2).assertEqual(3362);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0362 end');
    });

    /**
     * @tc.name   testBpResVol0363
     * @tc.number SUB_MC_BPG_0363
     * @tc.desc   BreakpointType<Resource> triple ids (1363,2363,3363) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0363 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1363), makeRes(2363), makeRes(3363));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1363));
      expect(r0).assertEqual(1363);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2363));
      expect(r1).assertEqual(2363);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3363));
      expect(r2).assertEqual(3363);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0363 end');
    });

    /**
     * @tc.name   testBpResVol0364
     * @tc.number SUB_MC_BPG_0364
     * @tc.desc   BreakpointType<Resource> triple ids (1364,2364,3364) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0364 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1364), makeRes(2364), makeRes(3364));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1364));
      expect(r0).assertEqual(1364);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2364));
      expect(r1).assertEqual(2364);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3364));
      expect(r2).assertEqual(3364);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0364 end');
    });

    /**
     * @tc.name   testBpResVol0365
     * @tc.number SUB_MC_BPG_0365
     * @tc.desc   BreakpointType<Resource> triple ids (1365,2365,3365) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0365 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1365), makeRes(2365), makeRes(3365));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1365));
      expect(r0).assertEqual(1365);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2365));
      expect(r1).assertEqual(2365);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3365));
      expect(r2).assertEqual(3365);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0365 end');
    });

    /**
     * @tc.name   testBpResVol0366
     * @tc.number SUB_MC_BPG_0366
     * @tc.desc   BreakpointType<Resource> triple ids (1366,2366,3366) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0366 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1366), makeRes(2366), makeRes(3366));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1366));
      expect(r0).assertEqual(1366);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2366));
      expect(r1).assertEqual(2366);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3366));
      expect(r2).assertEqual(3366);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0366 end');
    });

    /**
     * @tc.name   testBpResVol0367
     * @tc.number SUB_MC_BPG_0367
     * @tc.desc   BreakpointType<Resource> triple ids (1367,2367,3367) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0367 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1367), makeRes(2367), makeRes(3367));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1367));
      expect(r0).assertEqual(1367);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2367));
      expect(r1).assertEqual(2367);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3367));
      expect(r2).assertEqual(3367);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0367 end');
    });

    /**
     * @tc.name   testBpResVol0368
     * @tc.number SUB_MC_BPG_0368
     * @tc.desc   BreakpointType<Resource> triple ids (1368,2368,3368) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0368 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1368), makeRes(2368), makeRes(3368));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1368));
      expect(r0).assertEqual(1368);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2368));
      expect(r1).assertEqual(2368);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3368));
      expect(r2).assertEqual(3368);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0368 end');
    });

    /**
     * @tc.name   testBpResVol0369
     * @tc.number SUB_MC_BPG_0369
     * @tc.desc   BreakpointType<Resource> triple ids (1369,2369,3369) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0369 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1369), makeRes(2369), makeRes(3369));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1369));
      expect(r0).assertEqual(1369);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2369));
      expect(r1).assertEqual(2369);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3369));
      expect(r2).assertEqual(3369);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0369 end');
    });

    /**
     * @tc.name   testBpResVol0370
     * @tc.number SUB_MC_BPG_0370
     * @tc.desc   BreakpointType<Resource> triple ids (1370,2370,3370) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0370 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1370), makeRes(2370), makeRes(3370));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1370));
      expect(r0).assertEqual(1370);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2370));
      expect(r1).assertEqual(2370);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3370));
      expect(r2).assertEqual(3370);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0370 end');
    });

    /**
     * @tc.name   testBpResVol0371
     * @tc.number SUB_MC_BPG_0371
     * @tc.desc   BreakpointType<Resource> triple ids (1371,2371,3371) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0371 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1371), makeRes(2371), makeRes(3371));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1371));
      expect(r0).assertEqual(1371);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2371));
      expect(r1).assertEqual(2371);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3371));
      expect(r2).assertEqual(3371);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0371 end');
    });

    /**
     * @tc.name   testBpResVol0372
     * @tc.number SUB_MC_BPG_0372
     * @tc.desc   BreakpointType<Resource> triple ids (1372,2372,3372) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0372 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1372), makeRes(2372), makeRes(3372));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1372));
      expect(r0).assertEqual(1372);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2372));
      expect(r1).assertEqual(2372);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3372));
      expect(r2).assertEqual(3372);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0372 end');
    });

    /**
     * @tc.name   testBpResVol0373
     * @tc.number SUB_MC_BPG_0373
     * @tc.desc   BreakpointType<Resource> triple ids (1373,2373,3373) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0373 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1373), makeRes(2373), makeRes(3373));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1373));
      expect(r0).assertEqual(1373);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2373));
      expect(r1).assertEqual(2373);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3373));
      expect(r2).assertEqual(3373);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0373 end');
    });

    /**
     * @tc.name   testBpResVol0374
     * @tc.number SUB_MC_BPG_0374
     * @tc.desc   BreakpointType<Resource> triple ids (1374,2374,3374) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0374 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1374), makeRes(2374), makeRes(3374));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1374));
      expect(r0).assertEqual(1374);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2374));
      expect(r1).assertEqual(2374);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3374));
      expect(r2).assertEqual(3374);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0374 end');
    });

    /**
     * @tc.name   testBpResVol0375
     * @tc.number SUB_MC_BPG_0375
     * @tc.desc   BreakpointType<Resource> triple ids (1375,2375,3375) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0375 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1375), makeRes(2375), makeRes(3375));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1375));
      expect(r0).assertEqual(1375);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2375));
      expect(r1).assertEqual(2375);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3375));
      expect(r2).assertEqual(3375);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0375 end');
    });

  });
}
