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
// -> GetValue returns resource with matching id basis=main-frozen cases=25
// Volume cases are driven by a frozen data table; the first rows are hand-tuned Anchor boundary cases.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[MultiColumns_BPR2]';

function makeRes(id: number): Resource {
  return {
    id: id,
    type: 10001,
    bundleName: 'com.samples.multicolumns',
    moduleName: 'entry',
    params: [] as Array<string | number>
  };
}

export default function bpResVol02Test() {
  describe('MultiColumnsBpResVol02', () => {

    /**
     * @tc.name   testBpResVol0376
     * @tc.number SUB_MC_BPG_0376
     * @tc.desc   Anchor: BreakpointType<Resource> id-based selection at extreme ids (0/1/2)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0376 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0376 end');
    });

    /**
     * @tc.name   testBpResVol0377
     * @tc.number SUB_MC_BPG_0377
     * @tc.desc   Anchor: BreakpointType<Resource> id-based selection at extreme ids (0/1/9007199254740990)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0377 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0377 end');
    });

    /**
     * @tc.name   testBpResVol0378
     * @tc.number SUB_MC_BPG_0378
     * @tc.desc   BreakpointType<Resource> triple ids (1378,2378,3378) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0378 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1378), makeRes(2378), makeRes(3378));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1378));
      expect(r0).assertEqual(1378);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2378));
      expect(r1).assertEqual(2378);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3378));
      expect(r2).assertEqual(3378);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0378 end');
    });

    /**
     * @tc.name   testBpResVol0379
     * @tc.number SUB_MC_BPG_0379
     * @tc.desc   BreakpointType<Resource> triple ids (1379,2379,3379) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0379 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1379), makeRes(2379), makeRes(3379));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1379));
      expect(r0).assertEqual(1379);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2379));
      expect(r1).assertEqual(2379);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3379));
      expect(r2).assertEqual(3379);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0379 end');
    });

    /**
     * @tc.name   testBpResVol0380
     * @tc.number SUB_MC_BPG_0380
     * @tc.desc   BreakpointType<Resource> triple ids (1380,2380,3380) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0380 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1380), makeRes(2380), makeRes(3380));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1380));
      expect(r0).assertEqual(1380);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2380));
      expect(r1).assertEqual(2380);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3380));
      expect(r2).assertEqual(3380);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0380 end');
    });

    /**
     * @tc.name   testBpResVol0381
     * @tc.number SUB_MC_BPG_0381
     * @tc.desc   BreakpointType<Resource> triple ids (1381,2381,3381) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0381 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1381), makeRes(2381), makeRes(3381));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1381));
      expect(r0).assertEqual(1381);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2381));
      expect(r1).assertEqual(2381);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3381));
      expect(r2).assertEqual(3381);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0381 end');
    });

    /**
     * @tc.name   testBpResVol0382
     * @tc.number SUB_MC_BPG_0382
     * @tc.desc   BreakpointType<Resource> triple ids (1382,2382,3382) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0382 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1382), makeRes(2382), makeRes(3382));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1382));
      expect(r0).assertEqual(1382);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2382));
      expect(r1).assertEqual(2382);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3382));
      expect(r2).assertEqual(3382);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0382 end');
    });

    /**
     * @tc.name   testBpResVol0383
     * @tc.number SUB_MC_BPG_0383
     * @tc.desc   BreakpointType<Resource> triple ids (1383,2383,3383) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0383 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1383), makeRes(2383), makeRes(3383));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1383));
      expect(r0).assertEqual(1383);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2383));
      expect(r1).assertEqual(2383);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3383));
      expect(r2).assertEqual(3383);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0383 end');
    });

    /**
     * @tc.name   testBpResVol0384
     * @tc.number SUB_MC_BPG_0384
     * @tc.desc   BreakpointType<Resource> triple ids (1384,2384,3384) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0384 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1384), makeRes(2384), makeRes(3384));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1384));
      expect(r0).assertEqual(1384);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2384));
      expect(r1).assertEqual(2384);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3384));
      expect(r2).assertEqual(3384);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0384 end');
    });

    /**
     * @tc.name   testBpResVol0385
     * @tc.number SUB_MC_BPG_0385
     * @tc.desc   BreakpointType<Resource> triple ids (1385,2385,3385) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0385 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1385), makeRes(2385), makeRes(3385));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1385));
      expect(r0).assertEqual(1385);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2385));
      expect(r1).assertEqual(2385);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3385));
      expect(r2).assertEqual(3385);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0385 end');
    });

    /**
     * @tc.name   testBpResVol0386
     * @tc.number SUB_MC_BPG_0386
     * @tc.desc   BreakpointType<Resource> triple ids (1386,2386,3386) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0386 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1386), makeRes(2386), makeRes(3386));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1386));
      expect(r0).assertEqual(1386);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2386));
      expect(r1).assertEqual(2386);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3386));
      expect(r2).assertEqual(3386);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0386 end');
    });

    /**
     * @tc.name   testBpResVol0387
     * @tc.number SUB_MC_BPG_0387
     * @tc.desc   BreakpointType<Resource> triple ids (1387,2387,3387) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0387 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1387), makeRes(2387), makeRes(3387));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1387));
      expect(r0).assertEqual(1387);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2387));
      expect(r1).assertEqual(2387);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3387));
      expect(r2).assertEqual(3387);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0387 end');
    });

    /**
     * @tc.name   testBpResVol0388
     * @tc.number SUB_MC_BPG_0388
     * @tc.desc   BreakpointType<Resource> triple ids (1388,2388,3388) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0388 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1388), makeRes(2388), makeRes(3388));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1388));
      expect(r0).assertEqual(1388);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2388));
      expect(r1).assertEqual(2388);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3388));
      expect(r2).assertEqual(3388);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0388 end');
    });

    /**
     * @tc.name   testBpResVol0389
     * @tc.number SUB_MC_BPG_0389
     * @tc.desc   BreakpointType<Resource> triple ids (1389,2389,3389) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0389 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1389), makeRes(2389), makeRes(3389));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1389));
      expect(r0).assertEqual(1389);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2389));
      expect(r1).assertEqual(2389);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3389));
      expect(r2).assertEqual(3389);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0389 end');
    });

    /**
     * @tc.name   testBpResVol0390
     * @tc.number SUB_MC_BPG_0390
     * @tc.desc   BreakpointType<Resource> triple ids (1390,2390,3390) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0390 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1390), makeRes(2390), makeRes(3390));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1390));
      expect(r0).assertEqual(1390);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2390));
      expect(r1).assertEqual(2390);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3390));
      expect(r2).assertEqual(3390);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0390 end');
    });

    /**
     * @tc.name   testBpResVol0391
     * @tc.number SUB_MC_BPG_0391
     * @tc.desc   BreakpointType<Resource> triple ids (1391,2391,3391) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0391 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1391), makeRes(2391), makeRes(3391));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1391));
      expect(r0).assertEqual(1391);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2391));
      expect(r1).assertEqual(2391);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3391));
      expect(r2).assertEqual(3391);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0391 end');
    });

    /**
     * @tc.name   testBpResVol0392
     * @tc.number SUB_MC_BPG_0392
     * @tc.desc   BreakpointType<Resource> triple ids (1392,2392,3392) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0392 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1392), makeRes(2392), makeRes(3392));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1392));
      expect(r0).assertEqual(1392);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2392));
      expect(r1).assertEqual(2392);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3392));
      expect(r2).assertEqual(3392);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0392 end');
    });

    /**
     * @tc.name   testBpResVol0393
     * @tc.number SUB_MC_BPG_0393
     * @tc.desc   BreakpointType<Resource> triple ids (1393,2393,3393) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0393 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1393), makeRes(2393), makeRes(3393));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1393));
      expect(r0).assertEqual(1393);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2393));
      expect(r1).assertEqual(2393);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3393));
      expect(r2).assertEqual(3393);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0393 end');
    });

    /**
     * @tc.name   testBpResVol0394
     * @tc.number SUB_MC_BPG_0394
     * @tc.desc   BreakpointType<Resource> triple ids (1394,2394,3394) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0394 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1394), makeRes(2394), makeRes(3394));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1394));
      expect(r0).assertEqual(1394);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2394));
      expect(r1).assertEqual(2394);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3394));
      expect(r2).assertEqual(3394);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0394 end');
    });

    /**
     * @tc.name   testBpResVol0395
     * @tc.number SUB_MC_BPG_0395
     * @tc.desc   BreakpointType<Resource> triple ids (1395,2395,3395) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0395 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1395), makeRes(2395), makeRes(3395));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1395));
      expect(r0).assertEqual(1395);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2395));
      expect(r1).assertEqual(2395);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3395));
      expect(r2).assertEqual(3395);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0395 end');
    });

    /**
     * @tc.name   testBpResVol0396
     * @tc.number SUB_MC_BPG_0396
     * @tc.desc   BreakpointType<Resource> triple ids (1396,2396,3396) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0396 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1396), makeRes(2396), makeRes(3396));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1396));
      expect(r0).assertEqual(1396);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2396));
      expect(r1).assertEqual(2396);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3396));
      expect(r2).assertEqual(3396);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0396 end');
    });

    /**
     * @tc.name   testBpResVol0397
     * @tc.number SUB_MC_BPG_0397
     * @tc.desc   BreakpointType<Resource> triple ids (1397,2397,3397) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0397 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1397), makeRes(2397), makeRes(3397));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1397));
      expect(r0).assertEqual(1397);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2397));
      expect(r1).assertEqual(2397);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3397));
      expect(r2).assertEqual(3397);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0397 end');
    });

    /**
     * @tc.name   testBpResVol0398
     * @tc.number SUB_MC_BPG_0398
     * @tc.desc   BreakpointType<Resource> triple ids (1398,2398,3398) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0398 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1398), makeRes(2398), makeRes(3398));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1398));
      expect(r0).assertEqual(1398);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2398));
      expect(r1).assertEqual(2398);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3398));
      expect(r2).assertEqual(3398);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0398 end');
    });

    /**
     * @tc.name   testBpResVol0399
     * @tc.number SUB_MC_BPG_0399
     * @tc.desc   BreakpointType<Resource> triple ids (1399,2399,3399) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0399 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1399), makeRes(2399), makeRes(3399));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1399));
      expect(r0).assertEqual(1399);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2399));
      expect(r1).assertEqual(2399);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3399));
      expect(r2).assertEqual(3399);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0399 end');
    });

    /**
     * @tc.name   testBpResVol0400
     * @tc.number SUB_MC_BPG_0400
     * @tc.desc   BreakpointType<Resource> triple ids (1400,2400,3400) resolve sm/md/lg by id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpResVol0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0400 begin');
      const sut: BreakpointType<Resource> = new BreakpointType<Resource>(makeRes(1400), makeRes(2400), makeRes(3400));
      const r0: number = (sut.GetValue('sm') as Resource).id;
      const r1: number = (sut.GetValue('md') as Resource).id;
      const r2: number = (sut.GetValue('lg') as Resource).id;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r0), String(1400));
      expect(r0).assertEqual(1400);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2400));
      expect(r1).assertEqual(2400);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3400));
      expect(r2).assertEqual(3400);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpResVol0400 end');
    });

  });
}
