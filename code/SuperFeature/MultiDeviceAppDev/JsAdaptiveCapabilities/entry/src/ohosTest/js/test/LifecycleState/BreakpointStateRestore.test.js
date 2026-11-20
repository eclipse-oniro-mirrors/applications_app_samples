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

function BreakpointStateRestorePart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0841
     * @tc.name    JsState001
     * @tc.desc    Restore state and history cycle with 4 pushes seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState001', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 407, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 447;
      expect(state.width).assertEqual(447);
      expect(snapshot.width).assertEqual(407);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(4);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0842
     * @tc.name    JsState002
     * @tc.desc    Restore state and history cycle with 5 pushes seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState002', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 414, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 454;
      expect(state.width).assertEqual(454);
      expect(snapshot.width).assertEqual(414);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp4');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState002 done');
    });
}

function BreakpointStateRestorePart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0843
     * @tc.name    JsState003
     * @tc.desc    Restore state and history cycle with 6 pushes seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState003', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 421, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 461;
      expect(state.width).assertEqual(461);
      expect(snapshot.width).assertEqual(421);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp0');
      expect(history[0]).assertEqual('bp1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState003 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0844
     * @tc.name    JsState004
     * @tc.desc    Restore state and history cycle with 7 pushes seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState004', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 428, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 468;
      expect(state.width).assertEqual(468);
      expect(snapshot.width).assertEqual(428);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp1');
      expect(history[0]).assertEqual('bp2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState004 done');
    });
}

function BreakpointStateRestorePart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0845
     * @tc.name    JsState005
     * @tc.desc    Restore state and history cycle with 8 pushes seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState005', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 435, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 475;
      expect(state.width).assertEqual(475);
      expect(snapshot.width).assertEqual(435);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState005 done');
    });
}

function BreakpointStateRestorePart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0846
     * @tc.name    JsState006
     * @tc.desc    Restore state and history cycle with 9 pushes seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState006', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 442, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 482;
      expect(state.width).assertEqual(482);
      expect(snapshot.width).assertEqual(442);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState006 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0847
     * @tc.name    JsState007
     * @tc.desc    Restore state and history cycle with 3 pushes seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState007', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 449, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 489;
      expect(state.width).assertEqual(489);
      expect(snapshot.width).assertEqual(449);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(3);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState007 done');
    });
}

function BreakpointStateRestorePart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0848
     * @tc.name    JsState008
     * @tc.desc    Restore state and history cycle with 4 pushes seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState008', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 456, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 496;
      expect(state.width).assertEqual(496);
      expect(snapshot.width).assertEqual(456);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(4);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState008 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0849
     * @tc.name    JsState009
     * @tc.desc    Restore state and history cycle with 5 pushes seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState009', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 463, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 503;
      expect(state.width).assertEqual(503);
      expect(snapshot.width).assertEqual(463);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp4');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState009 done');
    });
}

function BreakpointStateRestorePart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0850
     * @tc.name    JsState010
     * @tc.desc    Restore state and history cycle with 6 pushes seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState010', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 470, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 510;
      expect(state.width).assertEqual(510);
      expect(snapshot.width).assertEqual(470);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp0');
      expect(history[0]).assertEqual('bp1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState010 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0851
     * @tc.name    JsState011
     * @tc.desc    Restore state and history cycle with 7 pushes seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState011', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 477, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 517;
      expect(state.width).assertEqual(517);
      expect(snapshot.width).assertEqual(477);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp1');
      expect(history[0]).assertEqual('bp2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState011 done');
    });
}

function BreakpointStateRestorePart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0852
     * @tc.name    JsState012
     * @tc.desc    Restore state and history cycle with 8 pushes seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState012', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 484, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 524;
      expect(state.width).assertEqual(524);
      expect(snapshot.width).assertEqual(484);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState012 done');
    });
}

function BreakpointStateRestorePart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0853
     * @tc.name    JsState013
     * @tc.desc    Restore state and history cycle with 9 pushes seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState013', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 491, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 531;
      expect(state.width).assertEqual(531);
      expect(snapshot.width).assertEqual(491);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0854
     * @tc.name    JsState014
     * @tc.desc    Restore state and history cycle with 3 pushes seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState014', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 498, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 538;
      expect(state.width).assertEqual(538);
      expect(snapshot.width).assertEqual(498);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(3);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState014 done');
    });
}

function BreakpointStateRestorePart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0855
     * @tc.name    JsState015
     * @tc.desc    Restore state and history cycle with 4 pushes seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState015', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 505, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 545;
      expect(state.width).assertEqual(545);
      expect(snapshot.width).assertEqual(505);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(4);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState015 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0856
     * @tc.name    JsState016
     * @tc.desc    Restore state and history cycle with 5 pushes seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState016', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 512, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 552;
      expect(state.width).assertEqual(552);
      expect(snapshot.width).assertEqual(512);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp4');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState016 done');
    });
}

function BreakpointStateRestorePart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0857
     * @tc.name    JsState017
     * @tc.desc    Restore state and history cycle with 6 pushes seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState017', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 519, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 559;
      expect(state.width).assertEqual(559);
      expect(snapshot.width).assertEqual(519);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp0');
      expect(history[0]).assertEqual('bp1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0858
     * @tc.name    JsState018
     * @tc.desc    Restore state and history cycle with 7 pushes seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState018', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 526, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 566;
      expect(state.width).assertEqual(566);
      expect(snapshot.width).assertEqual(526);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp1');
      expect(history[0]).assertEqual('bp2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState018 done');
    });
}

function BreakpointStateRestorePart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0859
     * @tc.name    JsState019
     * @tc.desc    Restore state and history cycle with 8 pushes seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState019', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 533, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 573;
      expect(state.width).assertEqual(573);
      expect(snapshot.width).assertEqual(533);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState019 done');
    });
}

function BreakpointStateRestorePart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0860
     * @tc.name    JsState020
     * @tc.desc    Restore state and history cycle with 9 pushes seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState020', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 540, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 580;
      expect(state.width).assertEqual(580);
      expect(snapshot.width).assertEqual(540);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState020 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0861
     * @tc.name    JsState021
     * @tc.desc    Restore state and history cycle with 3 pushes seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState021', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 547, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 587;
      expect(state.width).assertEqual(587);
      expect(snapshot.width).assertEqual(547);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(3);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState021 done');
    });
}

function BreakpointStateRestorePart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0862
     * @tc.name    JsState022
     * @tc.desc    Restore state and history cycle with 4 pushes seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState022', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 554, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 594;
      expect(state.width).assertEqual(594);
      expect(snapshot.width).assertEqual(554);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(4);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState022 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0863
     * @tc.name    JsState023
     * @tc.desc    Restore state and history cycle with 5 pushes seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState023', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 561, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 601;
      expect(state.width).assertEqual(601);
      expect(snapshot.width).assertEqual(561);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp4');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState023 done');
    });
}

function BreakpointStateRestorePart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0864
     * @tc.name    JsState024
     * @tc.desc    Restore state and history cycle with 6 pushes seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState024', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 568, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 608;
      expect(state.width).assertEqual(608);
      expect(snapshot.width).assertEqual(568);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp0');
      expect(history[0]).assertEqual('bp1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState024 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0865
     * @tc.name    JsState025
     * @tc.desc    Restore state and history cycle with 7 pushes seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState025', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 575, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 615;
      expect(state.width).assertEqual(615);
      expect(snapshot.width).assertEqual(575);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp1');
      expect(history[0]).assertEqual('bp2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState025 done');
    });
}

function BreakpointStateRestorePart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0866
     * @tc.name    JsState026
     * @tc.desc    Restore state and history cycle with 8 pushes seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState026', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 582, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 622;
      expect(state.width).assertEqual(622);
      expect(snapshot.width).assertEqual(582);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState026 done');
    });
}

function BreakpointStateRestorePart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0867
     * @tc.name    JsState027
     * @tc.desc    Restore state and history cycle with 9 pushes seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState027', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 589, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 629;
      expect(state.width).assertEqual(629);
      expect(snapshot.width).assertEqual(589);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState027 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0868
     * @tc.name    JsState028
     * @tc.desc    Restore state and history cycle with 3 pushes seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState028', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 596, columns: 2 };
      const snapshot = model.copyState(state);
      state.width = 636;
      expect(state.width).assertEqual(636);
      expect(snapshot.width).assertEqual(596);
      expect(snapshot.columns).assertEqual(2);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(3);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState028 done');
    });
}

function BreakpointStateRestorePart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0869
     * @tc.name    JsState029
     * @tc.desc    Restore state and history cycle with 4 pushes seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState029', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 603, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 643;
      expect(state.width).assertEqual(643);
      expect(snapshot.width).assertEqual(603);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(4);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0870
     * @tc.name    JsState030
     * @tc.desc    Restore state and history cycle with 5 pushes seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState030', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 610, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 650;
      expect(state.width).assertEqual(650);
      expect(snapshot.width).assertEqual(610);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp4');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState030 done');
    });
}

function BreakpointStateRestorePart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0871
     * @tc.name    JsState031
     * @tc.desc    Restore state and history cycle with 6 pushes seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState031', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 617, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 657;
      expect(state.width).assertEqual(657);
      expect(snapshot.width).assertEqual(617);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp0');
      expect(history[0]).assertEqual('bp1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0872
     * @tc.name    JsState032
     * @tc.desc    Restore state and history cycle with 7 pushes seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState032', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 624, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 664;
      expect(state.width).assertEqual(664);
      expect(snapshot.width).assertEqual(624);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp1');
      expect(history[0]).assertEqual('bp2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState032 done');
    });
}

function BreakpointStateRestorePart019() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0873
     * @tc.name    JsState033
     * @tc.desc    Restore state and history cycle with 8 pushes seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState033', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 631, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 671;
      expect(state.width).assertEqual(671);
      expect(snapshot.width).assertEqual(631);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState033 done');
    });
}

function BreakpointStateRestorePart020() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0874
     * @tc.name    JsState034
     * @tc.desc    Restore state and history cycle with 9 pushes seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState034', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 638, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 678;
      expect(state.width).assertEqual(678);
      expect(snapshot.width).assertEqual(638);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState034 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0875
     * @tc.name    JsState035
     * @tc.desc    Restore state and history cycle with 3 pushes seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState035', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 645, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 685;
      expect(state.width).assertEqual(685);
      expect(snapshot.width).assertEqual(645);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(3);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState035 done');
    });
}

function BreakpointStateRestorePart021() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0876
     * @tc.name    JsState036
     * @tc.desc    Restore state and history cycle with 4 pushes seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState036', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 652, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 692;
      expect(state.width).assertEqual(692);
      expect(snapshot.width).assertEqual(652);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(4);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState036 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0877
     * @tc.name    JsState037
     * @tc.desc    Restore state and history cycle with 5 pushes seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState037', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 659, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 699;
      expect(state.width).assertEqual(699);
      expect(snapshot.width).assertEqual(659);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp4');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState037 done');
    });
}

function BreakpointStateRestorePart022() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0878
     * @tc.name    JsState038
     * @tc.desc    Restore state and history cycle with 6 pushes seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState038', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 666, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 706;
      expect(state.width).assertEqual(706);
      expect(snapshot.width).assertEqual(666);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp0');
      expect(history[0]).assertEqual('bp1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState038 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0879
     * @tc.name    JsState039
     * @tc.desc    Restore state and history cycle with 7 pushes seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState039', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 673, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 713;
      expect(state.width).assertEqual(713);
      expect(snapshot.width).assertEqual(673);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp1');
      expect(history[0]).assertEqual('bp2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState039 done');
    });
}

function BreakpointStateRestorePart023() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0880
     * @tc.name    JsState040
     * @tc.desc    Restore state and history cycle with 8 pushes seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState040', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 680, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 720;
      expect(state.width).assertEqual(720);
      expect(snapshot.width).assertEqual(680);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState040 done');
    });
}

function BreakpointStateRestorePart024() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0881
     * @tc.name    JsState041
     * @tc.desc    Restore state and history cycle with 9 pushes seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState041', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 687, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 727;
      expect(state.width).assertEqual(727);
      expect(snapshot.width).assertEqual(687);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0882
     * @tc.name    JsState042
     * @tc.desc    Restore state and history cycle with 3 pushes seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState042', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 694, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 734;
      expect(state.width).assertEqual(734);
      expect(snapshot.width).assertEqual(694);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(3);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState042 done');
    });
}

function BreakpointStateRestorePart025() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0883
     * @tc.name    JsState043
     * @tc.desc    Restore state and history cycle with 4 pushes seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState043', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 701, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 741;
      expect(state.width).assertEqual(741);
      expect(snapshot.width).assertEqual(701);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(4);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0884
     * @tc.name    JsState044
     * @tc.desc    Restore state and history cycle with 5 pushes seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState044', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 708, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 748;
      expect(state.width).assertEqual(748);
      expect(snapshot.width).assertEqual(708);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp4');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState044 done');
    });
}

function BreakpointStateRestorePart026() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0885
     * @tc.name    JsState045
     * @tc.desc    Restore state and history cycle with 6 pushes seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState045', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 715, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 755;
      expect(state.width).assertEqual(755);
      expect(snapshot.width).assertEqual(715);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp0');
      expect(history[0]).assertEqual('bp1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState045 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0886
     * @tc.name    JsState046
     * @tc.desc    Restore state and history cycle with 7 pushes seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState046', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 722, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 762;
      expect(state.width).assertEqual(762);
      expect(snapshot.width).assertEqual(722);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp1');
      expect(history[0]).assertEqual('bp2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState046 done');
    });
}

function BreakpointStateRestorePart027() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0887
     * @tc.name    JsState047
     * @tc.desc    Restore state and history cycle with 8 pushes seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState047', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 729, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 769;
      expect(state.width).assertEqual(769);
      expect(snapshot.width).assertEqual(729);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState047 done');
    });
}

function BreakpointStateRestorePart028() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0888
     * @tc.name    JsState048
     * @tc.desc    Restore state and history cycle with 9 pushes seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState048', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 736, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 776;
      expect(state.width).assertEqual(776);
      expect(snapshot.width).assertEqual(736);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState048 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0889
     * @tc.name    JsState049
     * @tc.desc    Restore state and history cycle with 3 pushes seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState049', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 743, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 783;
      expect(state.width).assertEqual(783);
      expect(snapshot.width).assertEqual(743);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(3);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState049 done');
    });
}

function BreakpointStateRestorePart029() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0890
     * @tc.name    JsState050
     * @tc.desc    Restore state and history cycle with 4 pushes seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState050', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 750, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 790;
      expect(state.width).assertEqual(790);
      expect(snapshot.width).assertEqual(750);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(4);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState050 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0891
     * @tc.name    JsState051
     * @tc.desc    Restore state and history cycle with 5 pushes seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState051', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 757, columns: 3 };
      const snapshot = model.copyState(state);
      state.width = 797;
      expect(state.width).assertEqual(797);
      expect(snapshot.width).assertEqual(757);
      expect(snapshot.columns).assertEqual(3);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp4');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState051 done');
    });
}

export default function breakpointStateRestoreSuite() {
  describe('BreakpointStateRestoreSuite', function () {
    BreakpointStateRestorePart001();
    BreakpointStateRestorePart002();
    BreakpointStateRestorePart003();
    BreakpointStateRestorePart004();
    BreakpointStateRestorePart005();
    BreakpointStateRestorePart006();
    BreakpointStateRestorePart007();
    BreakpointStateRestorePart008();
    BreakpointStateRestorePart009();
    BreakpointStateRestorePart010();
    BreakpointStateRestorePart011();
    BreakpointStateRestorePart012();
    BreakpointStateRestorePart013();
    BreakpointStateRestorePart014();
    BreakpointStateRestorePart015();
    BreakpointStateRestorePart016();
    BreakpointStateRestorePart017();
    BreakpointStateRestorePart018();
    BreakpointStateRestorePart019();
    BreakpointStateRestorePart020();
    BreakpointStateRestorePart021();
    BreakpointStateRestorePart022();
    BreakpointStateRestorePart023();
    BreakpointStateRestorePart024();
    BreakpointStateRestorePart025();
    BreakpointStateRestorePart026();
    BreakpointStateRestorePart027();
    BreakpointStateRestorePart028();
    BreakpointStateRestorePart029();
  });
}
