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

import hilog from '@ohos.hilog';
import { describe, it, expect } from '@ohos/hypium';
import model from '../Shared/AdaptiveModel';

const DOMAIN = 0xF811;
const TAG = '[Sample_jsAdaptiveCapabilities]';
const YIELD_MS = 10;

function yieldThread() {
  return new Promise(function (resolve) {
    setTimeout(function () {
      resolve();
    }, YIELD_MS);
  });
}

function PathSafetyPart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2381
     * @tc.name    JsPath001
     * @tc.desc    Path mode 1 valid false segments 3 seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath001', 0, async function () {
      await yieldThread();
      const path = 'a1//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a1/b')).assertEqual(true);
      expect(model.isSafePath('a1/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2382
     * @tc.name    JsPath002
     * @tc.desc    Path mode 2 valid false segments 3 seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath002', 0, async function () {
      await yieldThread();
      const path = 'a2/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a2/b')).assertEqual(true);
      expect(model.isSafePath('a2/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath002 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2383
     * @tc.name    JsPath003
     * @tc.desc    Path mode 3 valid false segments 2 seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath003', 0, async function () {
      await yieldThread();
      const path = 'a3/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a3/b')).assertEqual(true);
      expect(model.isSafePath('a3/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath003 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2384
     * @tc.name    JsPath004
     * @tc.desc    Path mode 4 valid false segments 0 seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath004', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a4/b')).assertEqual(true);
      expect(model.isSafePath('a4/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath004 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2385
     * @tc.name    JsPath005
     * @tc.desc    Path mode 5 valid false segments 1 seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath005', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a5/b')).assertEqual(true);
      expect(model.isSafePath('a5/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath005 done');
    });
}

function PathSafetyPart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2386
     * @tc.name    JsPath006
     * @tc.desc    Path mode 0 valid true segments 3 seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath006', 0, async function () {
      await yieldThread();
      const path = 'a6/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a6/b')).assertEqual(true);
      expect(model.isSafePath('a6/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath006 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2387
     * @tc.name    JsPath007
     * @tc.desc    Path mode 1 valid false segments 3 seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath007', 0, async function () {
      await yieldThread();
      const path = 'a7//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a7/b')).assertEqual(true);
      expect(model.isSafePath('a7/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath007 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2388
     * @tc.name    JsPath008
     * @tc.desc    Path mode 2 valid false segments 3 seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath008', 0, async function () {
      await yieldThread();
      const path = 'a8/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a8/b')).assertEqual(true);
      expect(model.isSafePath('a8/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath008 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2389
     * @tc.name    JsPath009
     * @tc.desc    Path mode 3 valid false segments 2 seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath009', 0, async function () {
      await yieldThread();
      const path = 'a9/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a9/b')).assertEqual(true);
      expect(model.isSafePath('a9/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath009 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2390
     * @tc.name    JsPath010
     * @tc.desc    Path mode 4 valid false segments 0 seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath010', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a10/b')).assertEqual(true);
      expect(model.isSafePath('a10/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath010 done');
    });
}

function PathSafetyPart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2391
     * @tc.name    JsPath011
     * @tc.desc    Path mode 5 valid false segments 1 seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath011', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a11/b')).assertEqual(true);
      expect(model.isSafePath('a11/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath011 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2392
     * @tc.name    JsPath012
     * @tc.desc    Path mode 0 valid true segments 3 seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath012', 0, async function () {
      await yieldThread();
      const path = 'a12/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a12/b')).assertEqual(true);
      expect(model.isSafePath('a12/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath012 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2393
     * @tc.name    JsPath013
     * @tc.desc    Path mode 1 valid false segments 3 seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath013', 0, async function () {
      await yieldThread();
      const path = 'a13//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a13/b')).assertEqual(true);
      expect(model.isSafePath('a13/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2394
     * @tc.name    JsPath014
     * @tc.desc    Path mode 2 valid false segments 3 seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath014', 0, async function () {
      await yieldThread();
      const path = 'a14/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a14/b')).assertEqual(true);
      expect(model.isSafePath('a14/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath014 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2395
     * @tc.name    JsPath015
     * @tc.desc    Path mode 3 valid false segments 2 seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath015', 0, async function () {
      await yieldThread();
      const path = 'a15/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a15/b')).assertEqual(true);
      expect(model.isSafePath('a15/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath015 done');
    });
}

function PathSafetyPart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2396
     * @tc.name    JsPath016
     * @tc.desc    Path mode 4 valid false segments 0 seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath016', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a16/b')).assertEqual(true);
      expect(model.isSafePath('a16/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath016 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2397
     * @tc.name    JsPath017
     * @tc.desc    Path mode 5 valid false segments 1 seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath017', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a17/b')).assertEqual(true);
      expect(model.isSafePath('a17/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2398
     * @tc.name    JsPath018
     * @tc.desc    Path mode 0 valid true segments 3 seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath018', 0, async function () {
      await yieldThread();
      const path = 'a18/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a18/b')).assertEqual(true);
      expect(model.isSafePath('a18/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath018 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2399
     * @tc.name    JsPath019
     * @tc.desc    Path mode 1 valid false segments 3 seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath019', 0, async function () {
      await yieldThread();
      const path = 'a19//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a19/b')).assertEqual(true);
      expect(model.isSafePath('a19/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath019 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2400
     * @tc.name    JsPath020
     * @tc.desc    Path mode 2 valid false segments 3 seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath020', 0, async function () {
      await yieldThread();
      const path = 'a20/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a20/b')).assertEqual(true);
      expect(model.isSafePath('a20/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath020 done');
    });
}

function PathSafetyPart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2401
     * @tc.name    JsPath021
     * @tc.desc    Path mode 3 valid false segments 2 seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath021', 0, async function () {
      await yieldThread();
      const path = 'a21/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a21/b')).assertEqual(true);
      expect(model.isSafePath('a21/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath021 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2402
     * @tc.name    JsPath022
     * @tc.desc    Path mode 4 valid false segments 0 seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath022', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a22/b')).assertEqual(true);
      expect(model.isSafePath('a22/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath022 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2403
     * @tc.name    JsPath023
     * @tc.desc    Path mode 5 valid false segments 1 seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath023', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a23/b')).assertEqual(true);
      expect(model.isSafePath('a23/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath023 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2404
     * @tc.name    JsPath024
     * @tc.desc    Path mode 0 valid true segments 3 seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath024', 0, async function () {
      await yieldThread();
      const path = 'a24/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a24/b')).assertEqual(true);
      expect(model.isSafePath('a24/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath024 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2405
     * @tc.name    JsPath025
     * @tc.desc    Path mode 1 valid false segments 3 seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath025', 0, async function () {
      await yieldThread();
      const path = 'a25//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a25/b')).assertEqual(true);
      expect(model.isSafePath('a25/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath025 done');
    });
}

function PathSafetyPart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2406
     * @tc.name    JsPath026
     * @tc.desc    Path mode 2 valid false segments 3 seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath026', 0, async function () {
      await yieldThread();
      const path = 'a26/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a26/b')).assertEqual(true);
      expect(model.isSafePath('a26/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath026 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2407
     * @tc.name    JsPath027
     * @tc.desc    Path mode 3 valid false segments 2 seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath027', 0, async function () {
      await yieldThread();
      const path = 'a27/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a27/b')).assertEqual(true);
      expect(model.isSafePath('a27/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath027 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2408
     * @tc.name    JsPath028
     * @tc.desc    Path mode 4 valid false segments 0 seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath028', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a28/b')).assertEqual(true);
      expect(model.isSafePath('a28/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath028 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2409
     * @tc.name    JsPath029
     * @tc.desc    Path mode 5 valid false segments 1 seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath029', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a29/b')).assertEqual(true);
      expect(model.isSafePath('a29/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2410
     * @tc.name    JsPath030
     * @tc.desc    Path mode 0 valid true segments 3 seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath030', 0, async function () {
      await yieldThread();
      const path = 'a30/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a30/b')).assertEqual(true);
      expect(model.isSafePath('a30/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath030 done');
    });
}

function PathSafetyPart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2411
     * @tc.name    JsPath031
     * @tc.desc    Path mode 1 valid false segments 3 seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath031', 0, async function () {
      await yieldThread();
      const path = 'a31//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a31/b')).assertEqual(true);
      expect(model.isSafePath('a31/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2412
     * @tc.name    JsPath032
     * @tc.desc    Path mode 2 valid false segments 3 seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath032', 0, async function () {
      await yieldThread();
      const path = 'a32/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a32/b')).assertEqual(true);
      expect(model.isSafePath('a32/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath032 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2413
     * @tc.name    JsPath033
     * @tc.desc    Path mode 3 valid false segments 2 seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath033', 0, async function () {
      await yieldThread();
      const path = 'a33/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a33/b')).assertEqual(true);
      expect(model.isSafePath('a33/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath033 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2414
     * @tc.name    JsPath034
     * @tc.desc    Path mode 4 valid false segments 0 seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath034', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a34/b')).assertEqual(true);
      expect(model.isSafePath('a34/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath034 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2415
     * @tc.name    JsPath035
     * @tc.desc    Path mode 5 valid false segments 1 seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath035', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a35/b')).assertEqual(true);
      expect(model.isSafePath('a35/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath035 done');
    });
}

function PathSafetyPart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2416
     * @tc.name    JsPath036
     * @tc.desc    Path mode 0 valid true segments 3 seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath036', 0, async function () {
      await yieldThread();
      const path = 'a36/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a36/b')).assertEqual(true);
      expect(model.isSafePath('a36/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath036 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2417
     * @tc.name    JsPath037
     * @tc.desc    Path mode 1 valid false segments 3 seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath037', 0, async function () {
      await yieldThread();
      const path = 'a37//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a37/b')).assertEqual(true);
      expect(model.isSafePath('a37/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath037 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2418
     * @tc.name    JsPath038
     * @tc.desc    Path mode 2 valid false segments 3 seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath038', 0, async function () {
      await yieldThread();
      const path = 'a38/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a38/b')).assertEqual(true);
      expect(model.isSafePath('a38/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath038 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2419
     * @tc.name    JsPath039
     * @tc.desc    Path mode 3 valid false segments 2 seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath039', 0, async function () {
      await yieldThread();
      const path = 'a39/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a39/b')).assertEqual(true);
      expect(model.isSafePath('a39/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath039 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2420
     * @tc.name    JsPath040
     * @tc.desc    Path mode 4 valid false segments 0 seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath040', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a40/b')).assertEqual(true);
      expect(model.isSafePath('a40/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath040 done');
    });
}

function PathSafetyPart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2421
     * @tc.name    JsPath041
     * @tc.desc    Path mode 5 valid false segments 1 seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath041', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a41/b')).assertEqual(true);
      expect(model.isSafePath('a41/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2422
     * @tc.name    JsPath042
     * @tc.desc    Path mode 0 valid true segments 3 seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath042', 0, async function () {
      await yieldThread();
      const path = 'a42/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a42/b')).assertEqual(true);
      expect(model.isSafePath('a42/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath042 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2423
     * @tc.name    JsPath043
     * @tc.desc    Path mode 1 valid false segments 3 seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath043', 0, async function () {
      await yieldThread();
      const path = 'a43//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a43/b')).assertEqual(true);
      expect(model.isSafePath('a43/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2424
     * @tc.name    JsPath044
     * @tc.desc    Path mode 2 valid false segments 3 seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath044', 0, async function () {
      await yieldThread();
      const path = 'a44/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a44/b')).assertEqual(true);
      expect(model.isSafePath('a44/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath044 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2425
     * @tc.name    JsPath045
     * @tc.desc    Path mode 3 valid false segments 2 seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath045', 0, async function () {
      await yieldThread();
      const path = 'a45/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a45/b')).assertEqual(true);
      expect(model.isSafePath('a45/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath045 done');
    });
}

function PathSafetyPart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2426
     * @tc.name    JsPath046
     * @tc.desc    Path mode 4 valid false segments 0 seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath046', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a46/b')).assertEqual(true);
      expect(model.isSafePath('a46/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath046 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2427
     * @tc.name    JsPath047
     * @tc.desc    Path mode 5 valid false segments 1 seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath047', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a47/b')).assertEqual(true);
      expect(model.isSafePath('a47/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath047 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2428
     * @tc.name    JsPath048
     * @tc.desc    Path mode 0 valid true segments 3 seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath048', 0, async function () {
      await yieldThread();
      const path = 'a48/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a48/b')).assertEqual(true);
      expect(model.isSafePath('a48/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath048 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2429
     * @tc.name    JsPath049
     * @tc.desc    Path mode 1 valid false segments 3 seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath049', 0, async function () {
      await yieldThread();
      const path = 'a49//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a49/b')).assertEqual(true);
      expect(model.isSafePath('a49/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath049 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2430
     * @tc.name    JsPath050
     * @tc.desc    Path mode 2 valid false segments 3 seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath050', 0, async function () {
      await yieldThread();
      const path = 'a50/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a50/b')).assertEqual(true);
      expect(model.isSafePath('a50/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath050 done');
    });
}

function PathSafetyPart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2431
     * @tc.name    JsPath051
     * @tc.desc    Path mode 3 valid false segments 2 seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath051', 0, async function () {
      await yieldThread();
      const path = 'a51/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a51/b')).assertEqual(true);
      expect(model.isSafePath('a51/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath051 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2432
     * @tc.name    JsPath052
     * @tc.desc    Path mode 4 valid false segments 0 seed 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath052', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a52/b')).assertEqual(true);
      expect(model.isSafePath('a52/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath052 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2433
     * @tc.name    JsPath053
     * @tc.desc    Path mode 5 valid false segments 1 seed 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath053', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a53/b')).assertEqual(true);
      expect(model.isSafePath('a53/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath053 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2434
     * @tc.name    JsPath054
     * @tc.desc    Path mode 0 valid true segments 3 seed 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath054', 0, async function () {
      await yieldThread();
      const path = 'a54/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a54/b')).assertEqual(true);
      expect(model.isSafePath('a54/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath054 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2435
     * @tc.name    JsPath055
     * @tc.desc    Path mode 1 valid false segments 3 seed 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath055', 0, async function () {
      await yieldThread();
      const path = 'a55//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a55/b')).assertEqual(true);
      expect(model.isSafePath('a55/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath055 done');
    });
}

function PathSafetyPart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2436
     * @tc.name    JsPath056
     * @tc.desc    Path mode 2 valid false segments 3 seed 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath056', 0, async function () {
      await yieldThread();
      const path = 'a56/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a56/b')).assertEqual(true);
      expect(model.isSafePath('a56/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath056 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2437
     * @tc.name    JsPath057
     * @tc.desc    Path mode 3 valid false segments 2 seed 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath057', 0, async function () {
      await yieldThread();
      const path = 'a57/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a57/b')).assertEqual(true);
      expect(model.isSafePath('a57/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath057 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2438
     * @tc.name    JsPath058
     * @tc.desc    Path mode 4 valid false segments 0 seed 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath058', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a58/b')).assertEqual(true);
      expect(model.isSafePath('a58/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath058 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2439
     * @tc.name    JsPath059
     * @tc.desc    Path mode 5 valid false segments 1 seed 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath059', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a59/b')).assertEqual(true);
      expect(model.isSafePath('a59/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath059 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2440
     * @tc.name    JsPath060
     * @tc.desc    Path mode 0 valid true segments 3 seed 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath060', 0, async function () {
      await yieldThread();
      const path = 'a60/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a60/b')).assertEqual(true);
      expect(model.isSafePath('a60/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath060 done');
    });
}

function PathSafetyPart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2441
     * @tc.name    JsPath061
     * @tc.desc    Path mode 1 valid false segments 3 seed 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath061', 0, async function () {
      await yieldThread();
      const path = 'a61//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a61/b')).assertEqual(true);
      expect(model.isSafePath('a61/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath061 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2442
     * @tc.name    JsPath062
     * @tc.desc    Path mode 2 valid false segments 3 seed 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath062', 0, async function () {
      await yieldThread();
      const path = 'a62/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a62/b')).assertEqual(true);
      expect(model.isSafePath('a62/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath062 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2443
     * @tc.name    JsPath063
     * @tc.desc    Path mode 3 valid false segments 2 seed 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath063', 0, async function () {
      await yieldThread();
      const path = 'a63/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a63/b')).assertEqual(true);
      expect(model.isSafePath('a63/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath063 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2444
     * @tc.name    JsPath064
     * @tc.desc    Path mode 4 valid false segments 0 seed 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath064', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a64/b')).assertEqual(true);
      expect(model.isSafePath('a64/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath064 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2445
     * @tc.name    JsPath065
     * @tc.desc    Path mode 5 valid false segments 1 seed 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath065', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a65/b')).assertEqual(true);
      expect(model.isSafePath('a65/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath065 done');
    });
}

function PathSafetyPart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2446
     * @tc.name    JsPath066
     * @tc.desc    Path mode 0 valid true segments 3 seed 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath066', 0, async function () {
      await yieldThread();
      const path = 'a66/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a66/b')).assertEqual(true);
      expect(model.isSafePath('a66/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath066 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2447
     * @tc.name    JsPath067
     * @tc.desc    Path mode 1 valid false segments 3 seed 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath067', 0, async function () {
      await yieldThread();
      const path = 'a67//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a67/b')).assertEqual(true);
      expect(model.isSafePath('a67/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath067 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2448
     * @tc.name    JsPath068
     * @tc.desc    Path mode 2 valid false segments 3 seed 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath068', 0, async function () {
      await yieldThread();
      const path = 'a68/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a68/b')).assertEqual(true);
      expect(model.isSafePath('a68/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath068 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2449
     * @tc.name    JsPath069
     * @tc.desc    Path mode 3 valid false segments 2 seed 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath069', 0, async function () {
      await yieldThread();
      const path = 'a69/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a69/b')).assertEqual(true);
      expect(model.isSafePath('a69/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath069 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2450
     * @tc.name    JsPath070
     * @tc.desc    Path mode 4 valid false segments 0 seed 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath070', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a70/b')).assertEqual(true);
      expect(model.isSafePath('a70/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath070 done');
    });
}

function PathSafetyPart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2451
     * @tc.name    JsPath071
     * @tc.desc    Path mode 5 valid false segments 1 seed 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath071', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a71/b')).assertEqual(true);
      expect(model.isSafePath('a71/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath071 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2452
     * @tc.name    JsPath072
     * @tc.desc    Path mode 0 valid true segments 3 seed 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath072', 0, async function () {
      await yieldThread();
      const path = 'a72/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a72/b')).assertEqual(true);
      expect(model.isSafePath('a72/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath072 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2453
     * @tc.name    JsPath073
     * @tc.desc    Path mode 1 valid false segments 3 seed 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath073', 0, async function () {
      await yieldThread();
      const path = 'a73//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a73/b')).assertEqual(true);
      expect(model.isSafePath('a73/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath073 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2454
     * @tc.name    JsPath074
     * @tc.desc    Path mode 2 valid false segments 3 seed 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath074', 0, async function () {
      await yieldThread();
      const path = 'a74/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a74/b')).assertEqual(true);
      expect(model.isSafePath('a74/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath074 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2455
     * @tc.name    JsPath075
     * @tc.desc    Path mode 3 valid false segments 2 seed 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath075', 0, async function () {
      await yieldThread();
      const path = 'a75/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a75/b')).assertEqual(true);
      expect(model.isSafePath('a75/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath075 done');
    });
}

function PathSafetyPart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2456
     * @tc.name    JsPath076
     * @tc.desc    Path mode 4 valid false segments 0 seed 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath076', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a76/b')).assertEqual(true);
      expect(model.isSafePath('a76/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath076 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2457
     * @tc.name    JsPath077
     * @tc.desc    Path mode 5 valid false segments 1 seed 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath077', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a77/b')).assertEqual(true);
      expect(model.isSafePath('a77/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath077 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2458
     * @tc.name    JsPath078
     * @tc.desc    Path mode 0 valid true segments 3 seed 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath078', 0, async function () {
      await yieldThread();
      const path = 'a78/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a78/b')).assertEqual(true);
      expect(model.isSafePath('a78/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath078 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2459
     * @tc.name    JsPath079
     * @tc.desc    Path mode 1 valid false segments 3 seed 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath079', 0, async function () {
      await yieldThread();
      const path = 'a79//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a79/b')).assertEqual(true);
      expect(model.isSafePath('a79/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath079 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2460
     * @tc.name    JsPath080
     * @tc.desc    Path mode 2 valid false segments 3 seed 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath080', 0, async function () {
      await yieldThread();
      const path = 'a80/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a80/b')).assertEqual(true);
      expect(model.isSafePath('a80/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath080 done');
    });
}

function PathSafetyPart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2461
     * @tc.name    JsPath081
     * @tc.desc    Path mode 3 valid false segments 2 seed 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath081', 0, async function () {
      await yieldThread();
      const path = 'a81/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a81/b')).assertEqual(true);
      expect(model.isSafePath('a81/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath081 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2462
     * @tc.name    JsPath082
     * @tc.desc    Path mode 4 valid false segments 0 seed 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath082', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a82/b')).assertEqual(true);
      expect(model.isSafePath('a82/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath082 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2463
     * @tc.name    JsPath083
     * @tc.desc    Path mode 5 valid false segments 1 seed 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath083', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a83/b')).assertEqual(true);
      expect(model.isSafePath('a83/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath083 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2464
     * @tc.name    JsPath084
     * @tc.desc    Path mode 0 valid true segments 3 seed 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath084', 0, async function () {
      await yieldThread();
      const path = 'a84/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a84/b')).assertEqual(true);
      expect(model.isSafePath('a84/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath084 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2465
     * @tc.name    JsPath085
     * @tc.desc    Path mode 1 valid false segments 3 seed 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath085', 0, async function () {
      await yieldThread();
      const path = 'a85//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a85/b')).assertEqual(true);
      expect(model.isSafePath('a85/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath085 done');
    });
}

function PathSafetyPart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2466
     * @tc.name    JsPath086
     * @tc.desc    Path mode 2 valid false segments 3 seed 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath086', 0, async function () {
      await yieldThread();
      const path = 'a86/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a86/b')).assertEqual(true);
      expect(model.isSafePath('a86/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath086 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2467
     * @tc.name    JsPath087
     * @tc.desc    Path mode 3 valid false segments 2 seed 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath087', 0, async function () {
      await yieldThread();
      const path = 'a87/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a87/b')).assertEqual(true);
      expect(model.isSafePath('a87/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath087 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2468
     * @tc.name    JsPath088
     * @tc.desc    Path mode 4 valid false segments 0 seed 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath088', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a88/b')).assertEqual(true);
      expect(model.isSafePath('a88/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath088 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2469
     * @tc.name    JsPath089
     * @tc.desc    Path mode 5 valid false segments 1 seed 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath089', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a89/b')).assertEqual(true);
      expect(model.isSafePath('a89/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath089 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2470
     * @tc.name    JsPath090
     * @tc.desc    Path mode 0 valid true segments 3 seed 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath090', 0, async function () {
      await yieldThread();
      const path = 'a90/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a90/b')).assertEqual(true);
      expect(model.isSafePath('a90/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath090 done');
    });
}

function PathSafetyPart019() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2471
     * @tc.name    JsPath091
     * @tc.desc    Path mode 1 valid false segments 3 seed 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath091', 0, async function () {
      await yieldThread();
      const path = 'a91//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a91/b')).assertEqual(true);
      expect(model.isSafePath('a91/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath091 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2472
     * @tc.name    JsPath092
     * @tc.desc    Path mode 2 valid false segments 3 seed 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath092', 0, async function () {
      await yieldThread();
      const path = 'a92/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a92/b')).assertEqual(true);
      expect(model.isSafePath('a92/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath092 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2473
     * @tc.name    JsPath093
     * @tc.desc    Path mode 3 valid false segments 2 seed 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath093', 0, async function () {
      await yieldThread();
      const path = 'a93/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a93/b')).assertEqual(true);
      expect(model.isSafePath('a93/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath093 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2474
     * @tc.name    JsPath094
     * @tc.desc    Path mode 4 valid false segments 0 seed 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath094', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a94/b')).assertEqual(true);
      expect(model.isSafePath('a94/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath094 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2475
     * @tc.name    JsPath095
     * @tc.desc    Path mode 5 valid false segments 1 seed 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath095', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a95/b')).assertEqual(true);
      expect(model.isSafePath('a95/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath095 done');
    });
}

function PathSafetyPart020() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2476
     * @tc.name    JsPath096
     * @tc.desc    Path mode 0 valid true segments 3 seed 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath096', 0, async function () {
      await yieldThread();
      const path = 'a96/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a96/b')).assertEqual(true);
      expect(model.isSafePath('a96/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath096 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2477
     * @tc.name    JsPath097
     * @tc.desc    Path mode 1 valid false segments 3 seed 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath097', 0, async function () {
      await yieldThread();
      const path = 'a97//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a97/b')).assertEqual(true);
      expect(model.isSafePath('a97/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath097 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2478
     * @tc.name    JsPath098
     * @tc.desc    Path mode 2 valid false segments 3 seed 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath098', 0, async function () {
      await yieldThread();
      const path = 'a98/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a98/b')).assertEqual(true);
      expect(model.isSafePath('a98/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath098 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2479
     * @tc.name    JsPath099
     * @tc.desc    Path mode 3 valid false segments 2 seed 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath099', 0, async function () {
      await yieldThread();
      const path = 'a99/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a99/b')).assertEqual(true);
      expect(model.isSafePath('a99/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath099 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2480
     * @tc.name    JsPath100
     * @tc.desc    Path mode 4 valid false segments 0 seed 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath100', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a100/b')).assertEqual(true);
      expect(model.isSafePath('a100/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath100 done');
    });
}

function PathSafetyPart021() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2481
     * @tc.name    JsPath101
     * @tc.desc    Path mode 5 valid false segments 1 seed 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath101', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a101/b')).assertEqual(true);
      expect(model.isSafePath('a101/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath101 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2482
     * @tc.name    JsPath102
     * @tc.desc    Path mode 0 valid true segments 3 seed 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath102', 0, async function () {
      await yieldThread();
      const path = 'a102/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a102/b')).assertEqual(true);
      expect(model.isSafePath('a102/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath102 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2483
     * @tc.name    JsPath103
     * @tc.desc    Path mode 1 valid false segments 3 seed 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath103', 0, async function () {
      await yieldThread();
      const path = 'a103//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a103/b')).assertEqual(true);
      expect(model.isSafePath('a103/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath103 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2484
     * @tc.name    JsPath104
     * @tc.desc    Path mode 2 valid false segments 3 seed 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath104', 0, async function () {
      await yieldThread();
      const path = 'a104/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a104/b')).assertEqual(true);
      expect(model.isSafePath('a104/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath104 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2485
     * @tc.name    JsPath105
     * @tc.desc    Path mode 3 valid false segments 2 seed 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath105', 0, async function () {
      await yieldThread();
      const path = 'a105/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a105/b')).assertEqual(true);
      expect(model.isSafePath('a105/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath105 done');
    });
}

function PathSafetyPart022() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2486
     * @tc.name    JsPath106
     * @tc.desc    Path mode 4 valid false segments 0 seed 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath106', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a106/b')).assertEqual(true);
      expect(model.isSafePath('a106/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath106 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2487
     * @tc.name    JsPath107
     * @tc.desc    Path mode 5 valid false segments 1 seed 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath107', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a107/b')).assertEqual(true);
      expect(model.isSafePath('a107/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath107 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2488
     * @tc.name    JsPath108
     * @tc.desc    Path mode 0 valid true segments 3 seed 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath108', 0, async function () {
      await yieldThread();
      const path = 'a108/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a108/b')).assertEqual(true);
      expect(model.isSafePath('a108/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath108 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2489
     * @tc.name    JsPath109
     * @tc.desc    Path mode 1 valid false segments 3 seed 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath109', 0, async function () {
      await yieldThread();
      const path = 'a109//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a109/b')).assertEqual(true);
      expect(model.isSafePath('a109/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath109 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2490
     * @tc.name    JsPath110
     * @tc.desc    Path mode 2 valid false segments 3 seed 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath110', 0, async function () {
      await yieldThread();
      const path = 'a110/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a110/b')).assertEqual(true);
      expect(model.isSafePath('a110/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath110 done');
    });
}

function PathSafetyPart023() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2491
     * @tc.name    JsPath111
     * @tc.desc    Path mode 3 valid false segments 2 seed 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath111', 0, async function () {
      await yieldThread();
      const path = 'a111/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a111/b')).assertEqual(true);
      expect(model.isSafePath('a111/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath111 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2492
     * @tc.name    JsPath112
     * @tc.desc    Path mode 4 valid false segments 0 seed 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath112', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a112/b')).assertEqual(true);
      expect(model.isSafePath('a112/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath112 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2493
     * @tc.name    JsPath113
     * @tc.desc    Path mode 5 valid false segments 1 seed 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath113', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a113/b')).assertEqual(true);
      expect(model.isSafePath('a113/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath113 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2494
     * @tc.name    JsPath114
     * @tc.desc    Path mode 0 valid true segments 3 seed 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath114', 0, async function () {
      await yieldThread();
      const path = 'a114/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a114/b')).assertEqual(true);
      expect(model.isSafePath('a114/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath114 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2495
     * @tc.name    JsPath115
     * @tc.desc    Path mode 1 valid false segments 3 seed 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath115', 0, async function () {
      await yieldThread();
      const path = 'a115//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a115/b')).assertEqual(true);
      expect(model.isSafePath('a115/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath115 done');
    });
}

function PathSafetyPart024() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2496
     * @tc.name    JsPath116
     * @tc.desc    Path mode 2 valid false segments 3 seed 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath116', 0, async function () {
      await yieldThread();
      const path = 'a116/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a116/b')).assertEqual(true);
      expect(model.isSafePath('a116/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath116 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2497
     * @tc.name    JsPath117
     * @tc.desc    Path mode 3 valid false segments 2 seed 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath117', 0, async function () {
      await yieldThread();
      const path = 'a117/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a117/b')).assertEqual(true);
      expect(model.isSafePath('a117/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath117 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2498
     * @tc.name    JsPath118
     * @tc.desc    Path mode 4 valid false segments 0 seed 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath118', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a118/b')).assertEqual(true);
      expect(model.isSafePath('a118/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath118 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2499
     * @tc.name    JsPath119
     * @tc.desc    Path mode 5 valid false segments 1 seed 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath119', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a119/b')).assertEqual(true);
      expect(model.isSafePath('a119/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath119 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2500
     * @tc.name    JsPath120
     * @tc.desc    Path mode 0 valid true segments 3 seed 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath120', 0, async function () {
      await yieldThread();
      const path = 'a120/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a120/b')).assertEqual(true);
      expect(model.isSafePath('a120/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath120 done');
    });
}

function PathSafetyPart025() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2501
     * @tc.name    JsPath121
     * @tc.desc    Path mode 1 valid false segments 3 seed 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath121', 0, async function () {
      await yieldThread();
      const path = 'a121//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a121/b')).assertEqual(true);
      expect(model.isSafePath('a121/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath121 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2502
     * @tc.name    JsPath122
     * @tc.desc    Path mode 2 valid false segments 3 seed 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath122', 0, async function () {
      await yieldThread();
      const path = 'a122/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a122/b')).assertEqual(true);
      expect(model.isSafePath('a122/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath122 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2503
     * @tc.name    JsPath123
     * @tc.desc    Path mode 3 valid false segments 2 seed 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath123', 0, async function () {
      await yieldThread();
      const path = 'a123/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a123/b')).assertEqual(true);
      expect(model.isSafePath('a123/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath123 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2504
     * @tc.name    JsPath124
     * @tc.desc    Path mode 4 valid false segments 0 seed 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath124', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a124/b')).assertEqual(true);
      expect(model.isSafePath('a124/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath124 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2505
     * @tc.name    JsPath125
     * @tc.desc    Path mode 5 valid false segments 1 seed 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath125', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a125/b')).assertEqual(true);
      expect(model.isSafePath('a125/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath125 done');
    });
}

function PathSafetyPart026() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2506
     * @tc.name    JsPath126
     * @tc.desc    Path mode 0 valid true segments 3 seed 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath126', 0, async function () {
      await yieldThread();
      const path = 'a126/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a126/b')).assertEqual(true);
      expect(model.isSafePath('a126/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath126 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2507
     * @tc.name    JsPath127
     * @tc.desc    Path mode 1 valid false segments 3 seed 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath127', 0, async function () {
      await yieldThread();
      const path = 'a127//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a127/b')).assertEqual(true);
      expect(model.isSafePath('a127/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath127 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2508
     * @tc.name    JsPath128
     * @tc.desc    Path mode 2 valid false segments 3 seed 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath128', 0, async function () {
      await yieldThread();
      const path = 'a128/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a128/b')).assertEqual(true);
      expect(model.isSafePath('a128/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath128 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2509
     * @tc.name    JsPath129
     * @tc.desc    Path mode 3 valid false segments 2 seed 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath129', 0, async function () {
      await yieldThread();
      const path = 'a129/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a129/b')).assertEqual(true);
      expect(model.isSafePath('a129/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath129 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2510
     * @tc.name    JsPath130
     * @tc.desc    Path mode 4 valid false segments 0 seed 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath130', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a130/b')).assertEqual(true);
      expect(model.isSafePath('a130/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath130 done');
    });
}

function PathSafetyPart027() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2511
     * @tc.name    JsPath131
     * @tc.desc    Path mode 5 valid false segments 1 seed 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath131', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a131/b')).assertEqual(true);
      expect(model.isSafePath('a131/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath131 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2512
     * @tc.name    JsPath132
     * @tc.desc    Path mode 0 valid true segments 3 seed 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath132', 0, async function () {
      await yieldThread();
      const path = 'a132/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a132/b')).assertEqual(true);
      expect(model.isSafePath('a132/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath132 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2513
     * @tc.name    JsPath133
     * @tc.desc    Path mode 1 valid false segments 3 seed 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath133', 0, async function () {
      await yieldThread();
      const path = 'a133//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a133/b')).assertEqual(true);
      expect(model.isSafePath('a133/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath133 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2514
     * @tc.name    JsPath134
     * @tc.desc    Path mode 2 valid false segments 3 seed 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath134', 0, async function () {
      await yieldThread();
      const path = 'a134/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a134/b')).assertEqual(true);
      expect(model.isSafePath('a134/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath134 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2515
     * @tc.name    JsPath135
     * @tc.desc    Path mode 3 valid false segments 2 seed 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath135', 0, async function () {
      await yieldThread();
      const path = 'a135/b c';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a135/b')).assertEqual(true);
      expect(model.isSafePath('a135/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath135 done');
    });
}

function PathSafetyPart028() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2516
     * @tc.name    JsPath136
     * @tc.desc    Path mode 4 valid false segments 0 seed 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath136', 0, async function () {
      await yieldThread();
      const path = '';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a136/b')).assertEqual(true);
      expect(model.isSafePath('a136/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath136 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2517
     * @tc.name    JsPath137
     * @tc.desc    Path mode 5 valid false segments 1 seed 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath137', 0, async function () {
      await yieldThread();
      const path = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a137/b')).assertEqual(true);
      expect(model.isSafePath('a137/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath137 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2518
     * @tc.name    JsPath138
     * @tc.desc    Path mode 0 valid true segments 3 seed 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath138', 0, async function () {
      await yieldThread();
      const path = 'a138/b/c';
      expect(model.isSafePath(path)).assertEqual(true);
      expect(model.isSafePath('a138/b')).assertEqual(true);
      expect(model.isSafePath('a138/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath138 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2519
     * @tc.name    JsPath139
     * @tc.desc    Path mode 1 valid false segments 3 seed 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath139', 0, async function () {
      await yieldThread();
      const path = 'a139//b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a139/b')).assertEqual(true);
      expect(model.isSafePath('a139/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath139 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2520
     * @tc.name    JsPath140
     * @tc.desc    Path mode 2 valid false segments 3 seed 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPath140', 0, async function () {
      await yieldThread();
      const path = 'a140/../b';
      expect(model.isSafePath(path)).assertEqual(false);
      expect(model.isSafePath('a140/b')).assertEqual(true);
      expect(model.isSafePath('a140/..')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPath140 done');
    });
}

function PathSafetyGroup001() {
  PathSafetyPart001();
  PathSafetyPart002();
  PathSafetyPart003();
  PathSafetyPart004();
  PathSafetyPart005();
  PathSafetyPart006();
  PathSafetyPart007();
  PathSafetyPart008();
  PathSafetyPart009();
  PathSafetyPart010();
  PathSafetyPart011();
  PathSafetyPart012();
  PathSafetyPart013();
  PathSafetyPart014();
  PathSafetyPart015();
  PathSafetyPart016();
  PathSafetyPart017();
  PathSafetyPart018();
  PathSafetyPart019();
  PathSafetyPart020();
  PathSafetyPart021();
  PathSafetyPart022();
  PathSafetyPart023();
  PathSafetyPart024();
  PathSafetyPart025();
  PathSafetyPart026();
  PathSafetyPart027();
  PathSafetyPart028();
}

export default function pathSafetySuite() {
  describe('PathSafetySuite', function () {
    PathSafetyGroup001();
  });
}
