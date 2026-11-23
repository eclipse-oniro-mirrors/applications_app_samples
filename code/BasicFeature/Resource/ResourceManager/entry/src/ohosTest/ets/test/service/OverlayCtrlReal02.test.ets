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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  OverlayAction,
  OverlayState,
  OverlayController
} from '../../../../main/ets/service/OverlayController';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';
const ALL_STATES: string[] = [
  OverlayState.INITIAL,
  OverlayState.ENABLED,
  OverlayState.DISABLED,
  OverlayState.RUNTIME_LOADED,
  OverlayState.RUNTIME_REMOVED
];

export default function overlayCtrlReal02Test() {
  describe('OverlayCtrlReal02Test', () => {

    /**
     * @tc.name   testOverlayCtrlReal0201
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0201
     * @tc.desc   合法目录拼出的 hsp 路径以包名结尾且只含一个连接斜杠
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0201 begin');
      const path: string = OverlayController.buildHspPath('/data/storage/el1/bundle');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected endsWith=%{public}s', path,
        OverlayController.RUNTIME_HSP_NAME);
      expect(path.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertTrue();
      expect(path.startsWith('/data/storage/el1/bundle/')).assertTrue();
      expect(path.indexOf('//')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0201 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0202
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0202
     * @tc.desc   路径长度等于目录长度加分隔符再加 hsp 文件名长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0202 begin');
      const codeDir: string = '/data/app/el1/bundle/public';
      const path: string = OverlayController.buildHspPath(codeDir);
      const expected: number = codeDir.length + 1 + OverlayController.RUNTIME_HSP_NAME.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', path.length, expected);
      expect(path.length).assertEqual(expected);
      expect(path.length > codeDir.length).assertTrue();
      expect(path.substring(codeDir.length, codeDir.length + 1)).assertEqual('/');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0202 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0203
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0203
     * @tc.desc   空目录与相对目录都不是合法编码目录
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0203 begin');
      const empty: boolean = OverlayController.isValidCodeDir('');
      const relative: boolean = OverlayController.isValidCodeDir('data/storage');
      const dot: boolean = OverlayController.isValidCodeDir('./bundle');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s/%{public}s', String(empty), String(relative),
        String(dot));
      expect(empty).assertFalse();
      expect(relative).assertFalse();
      expect(dot).assertFalse();
      expect(OverlayController.buildHspPath('data/storage')).assertEqual(OverlayController.INVALID_PATH);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0203 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0204
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0204
     * @tc.desc   带尾斜杠的目录与根目录都被拒绝，避免拼出双斜杠
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0204 begin');
      const trailing: boolean = OverlayController.isValidCodeDir('/data/bundle/');
      const root: boolean = OverlayController.isValidCodeDir('/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s', String(trailing), String(root));
      expect(trailing).assertFalse();
      expect(root).assertFalse();
      expect(OverlayController.buildHspPath('/data/bundle/')).assertEqual(OverlayController.INVALID_PATH);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0204 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0205
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0205
     * @tc.desc   合法目录的反面：非斜杠开头一律不合法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0205 begin');
      let rejected: number = 0;
      const candidates: string[] = ['', 'data', 'data/bundle', './bundle', 'C:/bundle'];
      for (let index: number = 0; index < candidates.length; index++) {
        if (!OverlayController.isValidCodeDir(candidates[index])) {
          rejected++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', rejected, candidates.length);
      expect(rejected).assertEqual(5);
      expect(rejected).assertEqual(candidates.length);
      expect(OverlayController.isValidCodeDir('/data/bundle')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0205 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0206
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0206
     * @tc.desc   非法目录拼接统一返回空串，调用方无需再判空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0206 begin');
      const fromEmpty: string = OverlayController.buildHspPath('');
      const fromRelative: string = OverlayController.buildHspPath('bundle');
      const invalid: string = OverlayController.INVALID_PATH;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s][%{public}s] expected=[%{public}s]', fromEmpty,
        fromRelative, invalid);
      expect(fromEmpty).assertEqual(invalid);
      expect(fromRelative).assertEqual(invalid);
      expect(fromEmpty.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0206 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0207
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0207
     * @tc.desc   使能成功把任意已知状态收敛到 enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0207 begin');
      let converged: number = 0;
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        if (OverlayController.nextStateOf(ALL_STATES[index], OverlayAction.ENABLE, true) === OverlayState.ENABLED) {
          converged++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', converged, ALL_STATES.length);
      expect(converged).assertEqual(5);
      expect(converged).assertEqual(ALL_STATES.length);
      expect(OverlayController.nextStateOf(OverlayState.DISABLED, OverlayAction.ENABLE, true))
        .assertEqual(OverlayState.ENABLED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0207 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0208
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0208
     * @tc.desc   动作失败时状态原样保留，五个状态都不被推进
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0208 begin');
      let kept: number = 0;
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        if (OverlayController.nextStateOf(ALL_STATES[index], OverlayAction.DISABLE, false) === ALL_STATES[index]) {
          kept++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=5', kept);
      expect(kept).assertEqual(ALL_STATES.length);
      expect(kept).assertEqual(5);
      expect(OverlayController.nextStateOf(OverlayState.RUNTIME_LOADED, OverlayAction.ADD_RESOURCE, false))
        .assertEqual(OverlayState.RUNTIME_LOADED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0208 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0209
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0209
     * @tc.desc   未知当前状态按 initial 处理，成功与失败的结果都以此为准
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0209 begin');
      const failed: string = OverlayController.nextStateOf('reloading', OverlayAction.ENABLE, false);
      const unknownAction: string = OverlayController.nextStateOf('reloading', 'reload', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s expected=%{public}s', failed, unknownAction,
        OverlayState.INITIAL);
      expect(failed).assertEqual(OverlayState.INITIAL);
      expect(unknownAction).assertEqual(OverlayState.INITIAL);
      expect(OverlayController.isKnownState(OverlayState.INITIAL)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0209 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0210
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0210
     * @tc.desc   未知动作即使成功也不改变已建立的状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0210 begin');
      const fromEnabled: string = OverlayController.nextStateOf(OverlayState.ENABLED, 'restart', true);
      const fromLoaded: string = OverlayController.nextStateOf(OverlayState.RUNTIME_LOADED, '', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s expected=%{public}s/%{public}s', fromEnabled,
        fromLoaded, OverlayState.ENABLED, OverlayState.RUNTIME_LOADED);
      expect(fromEnabled).assertEqual(OverlayState.ENABLED);
      expect(fromLoaded).assertEqual(OverlayState.RUNTIME_LOADED);
      expect(fromEnabled === fromLoaded).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0210 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0211
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0211
     * @tc.desc   资源增删不再依赖开关状态，可从任意状态直接跃迁
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0211 begin');
      const loaded: string = OverlayController.nextStateOf(OverlayState.DISABLED, OverlayAction.ADD_RESOURCE, true);
      const removed: string = OverlayController.nextStateOf(OverlayState.ENABLED, OverlayAction.REMOVE_RESOURCE, true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s expected=%{public}s/%{public}s', loaded, removed,
        OverlayState.RUNTIME_LOADED, OverlayState.RUNTIME_REMOVED);
      expect(loaded).assertEqual(OverlayState.RUNTIME_LOADED);
      expect(removed).assertEqual(OverlayState.RUNTIME_REMOVED);
      expect(OverlayController.isKnownState(loaded)).assertTrue();
      expect(OverlayController.isKnownState(removed)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0211 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0212
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0212
     * @tc.desc   开关类动作的成功文案以 Success 结尾，失败文案以 Failed 结尾
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0212 begin');
      const enableOk: string = OverlayController.messageKeyOf(OverlayAction.ENABLE, true);
      const enableBad: string = OverlayController.messageKeyOf(OverlayAction.ENABLE, false);
      const disableOk: string = OverlayController.messageKeyOf(OverlayAction.DISABLE, true);
      const disableBad: string = OverlayController.messageKeyOf(OverlayAction.DISABLE, false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s/%{public}s/%{public}s', enableOk, enableBad,
        disableOk, disableBad);
      expect(enableOk.endsWith('Success')).assertTrue();
      expect(disableOk.endsWith('Success')).assertTrue();
      expect(enableBad.endsWith('Failed')).assertTrue();
      expect(disableBad.endsWith('Failed')).assertTrue();
      expect(enableOk === enableBad).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0212 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0213
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0213
     * @tc.desc   四个动作都有非空文案键，未知动作没有
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0213 begin');
      const actions: string[] = OverlayController.actionList();
      let covered: number = 0;
      for (let index: number = 0; index < actions.length; index++) {
        if (OverlayController.messageKeyOf(actions[index], true).length > 0) {
          covered++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', covered, actions.length);
      expect(covered).assertEqual(4);
      expect(covered).assertEqual(actions.length);
      expect(OverlayController.messageKeyOf('reload', true)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0213 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0214
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0214
     * @tc.desc   parseAction 对注册动作全部返回自身，对变体全部返回未知
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0214 begin');
      const actions: string[] = OverlayController.actionList();
      let exact: number = 0;
      for (let index: number = 0; index < actions.length; index++) {
        if (OverlayController.parseAction(actions[index]) === actions[index]) {
          exact++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=4', exact);
      expect(exact).assertEqual(4);
      expect(OverlayController.parseAction(' Enable')).assertEqual(OverlayController.UNKNOWN_ACTION);
      expect(OverlayController.parseAction('enable ')).assertEqual(OverlayController.UNKNOWN_ACTION);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0214 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0215
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0215
     * @tc.desc   isKnownState 只承认五个可观测状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0215 begin');
      let known: number = 0;
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        if (OverlayController.isKnownState(ALL_STATES[index])) {
          known++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=5', known);
      expect(known).assertEqual(5);
      expect(OverlayController.isKnownState('')).assertFalse();
      expect(OverlayController.isKnownState(OverlayController.UNKNOWN_ACTION)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0215 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0216
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0216
     * @tc.desc   开关动作的文案键不是资源增删共用键，两类动作互不混淆
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0216 begin');
      const shared: string = OverlayController.messageKeyOf(OverlayAction.ADD_RESOURCE, true);
      const enableKey: string = OverlayController.messageKeyOf(OverlayAction.ENABLE, true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s expected=test_string', shared, enableKey);
      expect(shared).assertEqual('test_string');
      expect(shared === enableKey).assertFalse();
      expect(OverlayController.isSwitchAction(OverlayAction.ENABLE)).assertTrue();
      expect(OverlayController.isSwitchAction(OverlayAction.ADD_RESOURCE)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0216 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0217
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0217
     * @tc.desc   运行时 hsp 包名与覆盖模块名是两个独立的常量
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0217 begin');
      const moduleName: string = OverlayController.OVERLAY_MODULE_NAME;
      const hspName: string = OverlayController.RUNTIME_HSP_NAME;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s', moduleName, hspName);
      expect(moduleName).assertEqual('libraryOverlay');
      expect(hspName.endsWith('.hsp')).assertTrue();
      expect(hspName.startsWith('libraryRuntimeOverlay')).assertTrue();
      expect(moduleName === hspName).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0217 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0218
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0218
     * @tc.desc   动作列表两次获取内容一致，元素顺序与按钮顺序对应
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0218 begin');
      const first: string[] = OverlayController.actionList();
      const second: string[] = OverlayController.actionList();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', JSON.stringify(first),
        JSON.stringify(second));
      expect(JSON.stringify(first)).assertEqual(JSON.stringify(second));
      expect(first[0]).assertEqual(OverlayAction.DISABLE);
      expect(first[1]).assertEqual(OverlayAction.ENABLE);
      expect(first[2]).assertEqual(OverlayAction.ADD_RESOURCE);
      expect(first[3]).assertEqual(OverlayAction.REMOVE_RESOURCE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0218 end');
    })
  })
}
