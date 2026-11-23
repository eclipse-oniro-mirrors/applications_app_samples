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
import { it, expect } from '@ohos/hypium';
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

function BreakpointStateRestorePart050() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0927
     * @tc.name    JsState087
     * @tc.desc    Restore state and history cycle with 6 pushes seed 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState087', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1009, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1049;
      expect(state.width).assertEqual(1049);
      expect(snapshot.width).assertEqual(1009);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState087 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0928
     * @tc.name    JsState088
     * @tc.desc    Restore state and history cycle with 7 pushes seed 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState088', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1016, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1056;
      expect(state.width).assertEqual(1056);
      expect(snapshot.width).assertEqual(1016);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState088 done');
    });
}

function BreakpointStateRestorePart051() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0929
     * @tc.name    JsState089
     * @tc.desc    Restore state and history cycle with 8 pushes seed 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState089', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1023, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1063;
      expect(state.width).assertEqual(1063);
      expect(snapshot.width).assertEqual(1023);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState089 done');
    });
}

function BreakpointStateRestorePart052() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0930
     * @tc.name    JsState090
     * @tc.desc    Restore state and history cycle with 9 pushes seed 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState090', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1030, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1070;
      expect(state.width).assertEqual(1070);
      expect(snapshot.width).assertEqual(1030);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState090 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0931
     * @tc.name    JsState091
     * @tc.desc    Restore state and history cycle with 3 pushes seed 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState091', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1037, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1077;
      expect(state.width).assertEqual(1077);
      expect(snapshot.width).assertEqual(1037);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(3);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState091 done');
    });
}

function BreakpointStateRestorePart053() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0932
     * @tc.name    JsState092
     * @tc.desc    Restore state and history cycle with 4 pushes seed 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState092', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1044, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1084;
      expect(state.width).assertEqual(1084);
      expect(snapshot.width).assertEqual(1044);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(4);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState092 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0933
     * @tc.name    JsState093
     * @tc.desc    Restore state and history cycle with 5 pushes seed 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState093', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1051, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1091;
      expect(state.width).assertEqual(1091);
      expect(snapshot.width).assertEqual(1051);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp4');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState093 done');
    });
}

function BreakpointStateRestorePart054() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0934
     * @tc.name    JsState094
     * @tc.desc    Restore state and history cycle with 6 pushes seed 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState094', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1058, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1098;
      expect(state.width).assertEqual(1098);
      expect(snapshot.width).assertEqual(1058);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState094 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0935
     * @tc.name    JsState095
     * @tc.desc    Restore state and history cycle with 7 pushes seed 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState095', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1065, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1105;
      expect(state.width).assertEqual(1105);
      expect(snapshot.width).assertEqual(1065);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState095 done');
    });
}

function BreakpointStateRestorePart055() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0936
     * @tc.name    JsState096
     * @tc.desc    Restore state and history cycle with 8 pushes seed 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState096', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1072, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1112;
      expect(state.width).assertEqual(1112);
      expect(snapshot.width).assertEqual(1072);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState096 done');
    });
}

function BreakpointStateRestorePart056() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0937
     * @tc.name    JsState097
     * @tc.desc    Restore state and history cycle with 9 pushes seed 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState097', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1079, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1119;
      expect(state.width).assertEqual(1119);
      expect(snapshot.width).assertEqual(1079);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState097 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0938
     * @tc.name    JsState098
     * @tc.desc    Restore state and history cycle with 3 pushes seed 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState098', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1086, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1126;
      expect(state.width).assertEqual(1126);
      expect(snapshot.width).assertEqual(1086);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(3);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState098 done');
    });
}

function BreakpointStateRestorePart057() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0939
     * @tc.name    JsState099
     * @tc.desc    Restore state and history cycle with 4 pushes seed 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState099', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1093, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1133;
      expect(state.width).assertEqual(1133);
      expect(snapshot.width).assertEqual(1093);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(4);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState099 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0940
     * @tc.name    JsState100
     * @tc.desc    Restore state and history cycle with 5 pushes seed 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState100', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1100, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1140;
      expect(state.width).assertEqual(1140);
      expect(snapshot.width).assertEqual(1100);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp4');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState100 done');
    });
}

function BreakpointStateRestorePart058() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0941
     * @tc.name    JsState101
     * @tc.desc    Restore state and history cycle with 6 pushes seed 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState101', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1107, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1147;
      expect(state.width).assertEqual(1147);
      expect(snapshot.width).assertEqual(1107);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState101 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0942
     * @tc.name    JsState102
     * @tc.desc    Restore state and history cycle with 7 pushes seed 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState102', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1114, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1154;
      expect(state.width).assertEqual(1154);
      expect(snapshot.width).assertEqual(1114);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState102 done');
    });
}

function BreakpointStateRestorePart059() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0943
     * @tc.name    JsState103
     * @tc.desc    Restore state and history cycle with 8 pushes seed 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState103', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1121, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1161;
      expect(state.width).assertEqual(1161);
      expect(snapshot.width).assertEqual(1121);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState103 done');
    });
}

function BreakpointStateRestorePart060() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0944
     * @tc.name    JsState104
     * @tc.desc    Restore state and history cycle with 9 pushes seed 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState104', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1128, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1168;
      expect(state.width).assertEqual(1168);
      expect(snapshot.width).assertEqual(1128);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState104 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0945
     * @tc.name    JsState105
     * @tc.desc    Restore state and history cycle with 3 pushes seed 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState105', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1135, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1175;
      expect(state.width).assertEqual(1175);
      expect(snapshot.width).assertEqual(1135);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(3);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState105 done');
    });
}

function BreakpointStateRestorePart061() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0946
     * @tc.name    JsState106
     * @tc.desc    Restore state and history cycle with 4 pushes seed 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState106', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1142, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1182;
      expect(state.width).assertEqual(1182);
      expect(snapshot.width).assertEqual(1142);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(4);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState106 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0947
     * @tc.name    JsState107
     * @tc.desc    Restore state and history cycle with 5 pushes seed 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState107', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1149, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1189;
      expect(state.width).assertEqual(1189);
      expect(snapshot.width).assertEqual(1149);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp4');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState107 done');
    });
}

function BreakpointStateRestorePart062() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0948
     * @tc.name    JsState108
     * @tc.desc    Restore state and history cycle with 6 pushes seed 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState108', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1156, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1196;
      expect(state.width).assertEqual(1196);
      expect(snapshot.width).assertEqual(1156);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState108 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0949
     * @tc.name    JsState109
     * @tc.desc    Restore state and history cycle with 7 pushes seed 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState109', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1163, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1203;
      expect(state.width).assertEqual(1203);
      expect(snapshot.width).assertEqual(1163);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState109 done');
    });
}

function BreakpointStateRestorePart063() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0950
     * @tc.name    JsState110
     * @tc.desc    Restore state and history cycle with 8 pushes seed 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState110', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1170, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1210;
      expect(state.width).assertEqual(1210);
      expect(snapshot.width).assertEqual(1170);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState110 done');
    });
}

function BreakpointStateRestorePart064() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0951
     * @tc.name    JsState111
     * @tc.desc    Restore state and history cycle with 9 pushes seed 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState111', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1177, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1217;
      expect(state.width).assertEqual(1217);
      expect(snapshot.width).assertEqual(1177);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState111 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0952
     * @tc.name    JsState112
     * @tc.desc    Restore state and history cycle with 3 pushes seed 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState112', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1184, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1224;
      expect(state.width).assertEqual(1224);
      expect(snapshot.width).assertEqual(1184);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(3);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState112 done');
    });
}

function BreakpointStateRestorePart065() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0953
     * @tc.name    JsState113
     * @tc.desc    Restore state and history cycle with 4 pushes seed 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState113', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1191, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1231;
      expect(state.width).assertEqual(1231);
      expect(snapshot.width).assertEqual(1191);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(4);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState113 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0954
     * @tc.name    JsState114
     * @tc.desc    Restore state and history cycle with 5 pushes seed 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState114', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1198, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1238;
      expect(state.width).assertEqual(1238);
      expect(snapshot.width).assertEqual(1198);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp4');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState114 done');
    });
}

function BreakpointStateRestorePart066() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0955
     * @tc.name    JsState115
     * @tc.desc    Restore state and history cycle with 6 pushes seed 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState115', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1205, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1245;
      expect(state.width).assertEqual(1245);
      expect(snapshot.width).assertEqual(1205);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState115 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0956
     * @tc.name    JsState116
     * @tc.desc    Restore state and history cycle with 7 pushes seed 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState116', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1212, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1252;
      expect(state.width).assertEqual(1252);
      expect(snapshot.width).assertEqual(1212);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState116 done');
    });
}

function BreakpointStateRestorePart067() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0957
     * @tc.name    JsState117
     * @tc.desc    Restore state and history cycle with 8 pushes seed 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState117', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1219, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1259;
      expect(state.width).assertEqual(1259);
      expect(snapshot.width).assertEqual(1219);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState117 done');
    });
}

function BreakpointStateRestorePart068() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0958
     * @tc.name    JsState118
     * @tc.desc    Restore state and history cycle with 9 pushes seed 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState118', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1226, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1266;
      expect(state.width).assertEqual(1266);
      expect(snapshot.width).assertEqual(1226);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState118 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0959
     * @tc.name    JsState119
     * @tc.desc    Restore state and history cycle with 3 pushes seed 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState119', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1233, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1273;
      expect(state.width).assertEqual(1273);
      expect(snapshot.width).assertEqual(1233);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(3);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState119 done');
    });
}

function BreakpointStateRestorePart069() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0960
     * @tc.name    JsState120
     * @tc.desc    Restore state and history cycle with 4 pushes seed 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState120', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1240, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1280;
      expect(state.width).assertEqual(1280);
      expect(snapshot.width).assertEqual(1240);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(4);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState120 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0961
     * @tc.name    JsState121
     * @tc.desc    Restore state and history cycle with 5 pushes seed 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState121', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1247, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1287;
      expect(state.width).assertEqual(1287);
      expect(snapshot.width).assertEqual(1247);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp4');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState121 done');
    });
}

function BreakpointStateRestorePart070() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0962
     * @tc.name    JsState122
     * @tc.desc    Restore state and history cycle with 6 pushes seed 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState122', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1254, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1294;
      expect(state.width).assertEqual(1294);
      expect(snapshot.width).assertEqual(1254);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState122 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0963
     * @tc.name    JsState123
     * @tc.desc    Restore state and history cycle with 7 pushes seed 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState123', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1261, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1301;
      expect(state.width).assertEqual(1301);
      expect(snapshot.width).assertEqual(1261);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState123 done');
    });
}

function BreakpointStateRestorePart071() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0964
     * @tc.name    JsState124
     * @tc.desc    Restore state and history cycle with 8 pushes seed 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState124', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1268, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1308;
      expect(state.width).assertEqual(1308);
      expect(snapshot.width).assertEqual(1268);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState124 done');
    });
}

function BreakpointStateRestorePart072() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0965
     * @tc.name    JsState125
     * @tc.desc    Restore state and history cycle with 9 pushes seed 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState125', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1275, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1315;
      expect(state.width).assertEqual(1315);
      expect(snapshot.width).assertEqual(1275);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState125 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0966
     * @tc.name    JsState126
     * @tc.desc    Restore state and history cycle with 3 pushes seed 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState126', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1282, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1322;
      expect(state.width).assertEqual(1322);
      expect(snapshot.width).assertEqual(1282);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(3);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState126 done');
    });
}

function BreakpointStateRestorePart073() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0967
     * @tc.name    JsState127
     * @tc.desc    Restore state and history cycle with 4 pushes seed 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState127', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1289, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1329;
      expect(state.width).assertEqual(1329);
      expect(snapshot.width).assertEqual(1289);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(4);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState127 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0968
     * @tc.name    JsState128
     * @tc.desc    Restore state and history cycle with 5 pushes seed 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState128', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1296, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1336;
      expect(state.width).assertEqual(1336);
      expect(snapshot.width).assertEqual(1296);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp4');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState128 done');
    });
}

function BreakpointStateRestorePart074() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0969
     * @tc.name    JsState129
     * @tc.desc    Restore state and history cycle with 6 pushes seed 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState129', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1303, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1343;
      expect(state.width).assertEqual(1343);
      expect(snapshot.width).assertEqual(1303);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState129 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0970
     * @tc.name    JsState130
     * @tc.desc    Restore state and history cycle with 7 pushes seed 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState130', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1310, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1350;
      expect(state.width).assertEqual(1350);
      expect(snapshot.width).assertEqual(1310);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState130 done');
    });
}

function BreakpointStateRestorePart075() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0971
     * @tc.name    JsState131
     * @tc.desc    Restore state and history cycle with 8 pushes seed 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState131', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1317, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1357;
      expect(state.width).assertEqual(1357);
      expect(snapshot.width).assertEqual(1317);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState131 done');
    });
}

function BreakpointStateRestorePart076() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0972
     * @tc.name    JsState132
     * @tc.desc    Restore state and history cycle with 9 pushes seed 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState132', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1324, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1364;
      expect(state.width).assertEqual(1364);
      expect(snapshot.width).assertEqual(1324);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState132 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0973
     * @tc.name    JsState133
     * @tc.desc    Restore state and history cycle with 3 pushes seed 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState133', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1331, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1371;
      expect(state.width).assertEqual(1371);
      expect(snapshot.width).assertEqual(1331);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(3);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState133 done');
    });
}

function BreakpointStateRestorePart077() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0974
     * @tc.name    JsState134
     * @tc.desc    Restore state and history cycle with 4 pushes seed 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState134', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1338, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1378;
      expect(state.width).assertEqual(1378);
      expect(snapshot.width).assertEqual(1338);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      expect(history.length).assertEqual(4);
      expect(history[history.length - 1]).assertEqual('bp3');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState134 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0975
     * @tc.name    JsState135
     * @tc.desc    Restore state and history cycle with 5 pushes seed 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState135', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1345, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1385;
      expect(state.width).assertEqual(1385);
      expect(snapshot.width).assertEqual(1345);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      model.historyPush(history, 'bp3', 5);
      model.historyPush(history, 'bp4', 5);
      expect(history.length).assertEqual(5);
      expect(history[history.length - 1]).assertEqual('bp4');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState135 done');
    });
}

function BreakpointStateRestorePart078() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0976
     * @tc.name    JsState136
     * @tc.desc    Restore state and history cycle with 6 pushes seed 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState136', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1352, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1392;
      expect(state.width).assertEqual(1392);
      expect(snapshot.width).assertEqual(1352);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState136 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0977
     * @tc.name    JsState137
     * @tc.desc    Restore state and history cycle with 7 pushes seed 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState137', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1359, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1399;
      expect(state.width).assertEqual(1399);
      expect(snapshot.width).assertEqual(1359);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState137 done');
    });
}

function BreakpointStateRestorePart079() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0978
     * @tc.name    JsState138
     * @tc.desc    Restore state and history cycle with 8 pushes seed 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState138', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1366, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1406;
      expect(state.width).assertEqual(1406);
      expect(snapshot.width).assertEqual(1366);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState138 done');
    });
}

function BreakpointStateRestorePart080() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0979
     * @tc.name    JsState139
     * @tc.desc    Restore state and history cycle with 9 pushes seed 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState139', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1373, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1413;
      expect(state.width).assertEqual(1413);
      expect(snapshot.width).assertEqual(1373);
      expect(snapshot.columns).assertEqual(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState139 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0980
     * @tc.name    JsState140
     * @tc.desc    Restore state and history cycle with 3 pushes seed 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsState140', 0, async function () {
      await yieldThread();
      const state = { bp: 'md', width: 1380, columns: 4 };
      const snapshot = model.copyState(state);
      state.width = 1420;
      expect(state.width).assertEqual(1420);
      expect(snapshot.width).assertEqual(1380);
      expect(snapshot.columns).assertEqual(4);
      const history = [];
      model.historyPush(history, 'bp0', 5);
      model.historyPush(history, 'bp1', 5);
      model.historyPush(history, 'bp2', 5);
      expect(history.length).assertEqual(3);
      expect(history[history.length - 1]).assertEqual('bp2');
      expect(history[0]).assertEqual('bp0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsState140 done');
    });
}

function BreakpointStateRestoreGroup003() {
  BreakpointStateRestorePart050();
  BreakpointStateRestorePart051();
  BreakpointStateRestorePart052();
  BreakpointStateRestorePart053();
  BreakpointStateRestorePart054();
  BreakpointStateRestorePart055();
  BreakpointStateRestorePart056();
  BreakpointStateRestorePart057();
  BreakpointStateRestorePart058();
  BreakpointStateRestorePart059();
  BreakpointStateRestorePart060();
  BreakpointStateRestorePart061();
  BreakpointStateRestorePart062();
  BreakpointStateRestorePart063();
  BreakpointStateRestorePart064();
  BreakpointStateRestorePart065();
  BreakpointStateRestorePart066();
  BreakpointStateRestorePart067();
  BreakpointStateRestorePart068();
  BreakpointStateRestorePart069();
  BreakpointStateRestorePart070();
  BreakpointStateRestorePart071();
  BreakpointStateRestorePart072();
  BreakpointStateRestorePart073();
  BreakpointStateRestorePart074();
  BreakpointStateRestorePart075();
  BreakpointStateRestorePart076();
  BreakpointStateRestorePart077();
  BreakpointStateRestorePart078();
  BreakpointStateRestorePart079();
  BreakpointStateRestorePart080();
}

export function registerBreakpointStateRestoreExtra2() {
  BreakpointStateRestoreGroup003();
}
