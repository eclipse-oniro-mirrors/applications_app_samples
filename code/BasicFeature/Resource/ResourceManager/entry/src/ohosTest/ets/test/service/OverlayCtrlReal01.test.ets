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

export default function overlayCtrlReal01Test() {
  describe('OverlayCtrlReal01Test', () => {

    /**
     * @tc.name   testOverlayCtrlReal0001
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0001
     * @tc.desc   去使能成功的文案键必须与资源文件中的键名一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0001 begin');
      const key: string = OverlayController.messageKeyOf(OverlayAction.DISABLE, true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=unEnableSuccess', key);
      expect(key).assertEqual('unEnableSuccess');
      expect(key.endsWith('Success')).assertTrue();
      expect(key === OverlayController.messageKeyOf('disable', true)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0001 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0002
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0002
     * @tc.desc   去使能失败与成功的文案键必须不同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0002 begin');
      const failed: string = OverlayController.messageKeyOf(OverlayAction.DISABLE, false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=unEnableFailed', failed);
      expect(failed).assertEqual('unEnableFailed');
      expect(failed.endsWith('Failed')).assertTrue();
      expect(failed === OverlayController.messageKeyOf(OverlayAction.DISABLE, true)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0002 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0003
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0003
     * @tc.desc   使能成功的文案键独立于去使能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0003 begin');
      const key: string = OverlayController.messageKeyOf(OverlayAction.ENABLE, true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=enableSuccess', key);
      expect(key).assertEqual('enableSuccess');
      expect(key === OverlayController.messageKeyOf(OverlayAction.DISABLE, true)).assertFalse();
      expect(key.startsWith('enable')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0003 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0004
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0004
     * @tc.desc   使能失败的文案键独立于成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0004 begin');
      const key: string = OverlayController.messageKeyOf(OverlayAction.ENABLE, false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=enableFailed', key);
      expect(key).assertEqual('enableFailed');
      expect(key.startsWith('enable')).assertTrue();
      expect(key.endsWith('Failed')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0004 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0005
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0005
     * @tc.desc   资源增删共用同一条文案，且与成功与否无关
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0005 begin');
      const added: string = OverlayController.messageKeyOf(OverlayAction.ADD_RESOURCE, true);
      const removed: string = OverlayController.messageKeyOf(OverlayAction.REMOVE_RESOURCE, false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s expected=test_string', added, removed);
      expect(added).assertEqual('test_string');
      expect(removed).assertEqual('test_string');
      expect(added).assertEqual(removed);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0005 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0006
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0006
     * @tc.desc   未知动作不给文案键，避免页面显示空引用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0006 begin');
      const unknown: string = OverlayController.messageKeyOf('reload', true);
      const empty: string = OverlayController.messageKeyOf('', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s][%{public}s] expected=[]', unknown, empty);
      expect(unknown).assertEqual('');
      expect(empty).assertEqual('');
      expect(unknown.length + empty.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0006 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0007
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0007
     * @tc.desc   动作名必须逐字符匹配，大小写不同不算已知动作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0007 begin');
      const exact: string = OverlayController.parseAction('enable');
      const upper: string = OverlayController.parseAction('Enable');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/[%{public}s]', exact, upper);
      expect(exact).assertEqual('enable');
      expect(upper).assertEqual(OverlayController.UNKNOWN_ACTION);
      expect(OverlayController.parseAction('enable')).assertEqual(OverlayAction.ENABLE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0007 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0008
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0008
     * @tc.desc   四个真实动作都能被 parseAction 接受
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0008 begin');
      const list: string[] = OverlayController.actionList();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual list length=%{public}d', list.length);
      expect(list.length).assertEqual(4);
      expect(OverlayController.parseAction(list[0])).assertEqual(OverlayAction.DISABLE);
      expect(OverlayController.parseAction(list[3])).assertEqual(OverlayAction.REMOVE_RESOURCE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0008 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0009
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0009
     * @tc.desc   actionList 必须与按钮顺序一致，且是独立副本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0009 begin');
      const first: string[] = OverlayController.actionList();
      const second: string[] = OverlayController.actionList();
      expect(first[1]).assertEqual('enable');
      expect(first[2]).assertEqual('addResource');
      expect(JSON.stringify(first)).assertEqual(JSON.stringify(second));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0009 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0010
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0010
     * @tc.desc   只有使能与去使能属于开关类动作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0010 begin');
      const enable: boolean = OverlayController.isSwitchAction(OverlayAction.ENABLE);
      const disable: boolean = OverlayController.isSwitchAction(OverlayAction.DISABLE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s', String(enable), String(disable));
      expect(enable).assertTrue();
      expect(disable).assertTrue();
      expect(OverlayController.isSwitchAction(OverlayAction.ADD_RESOURCE)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0010 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0011
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0011
     * @tc.desc   资源增删不属于开关类动作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0011 begin');
      const add: boolean = OverlayController.isSwitchAction(OverlayAction.ADD_RESOURCE);
      const remove: boolean = OverlayController.isSwitchAction(OverlayAction.REMOVE_RESOURCE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s', String(add), String(remove));
      expect(add).assertFalse();
      expect(remove).assertFalse();
      expect(add === remove).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0011 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0012
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0012
     * @tc.desc   加载与移除运行时资源分别落到两个可观测状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0012 begin');
      const loaded: string = OverlayController.nextStateOf(OverlayState.INITIAL, OverlayAction.ADD_RESOURCE, true);
      const removed: string =
        OverlayController.nextStateOf(OverlayState.RUNTIME_LOADED, OverlayAction.REMOVE_RESOURCE, true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s', loaded, removed);
      expect(loaded).assertEqual(OverlayState.RUNTIME_LOADED);
      expect(removed).assertEqual(OverlayState.RUNTIME_REMOVED);
      expect(loaded === removed).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0012 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0013
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0013
     * @tc.desc   使能与去使能在任意起点都收敛到同一个目标状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0013 begin');
      const fromLoaded: string = OverlayController.nextStateOf(OverlayState.RUNTIME_LOADED, OverlayAction.ENABLE, true);
      const fromRemoved: string = OverlayController.nextStateOf(OverlayState.RUNTIME_REMOVED, OverlayAction.ENABLE,
        true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s', fromLoaded, fromRemoved);
      expect(fromLoaded).assertEqual(OverlayState.ENABLED);
      expect(fromRemoved).assertEqual(OverlayState.ENABLED);
      expect(fromLoaded).assertEqual(fromRemoved);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0013 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0014
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0014
     * @tc.desc   失败动作在任何起点都必须保持原状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0014 begin');
      const keptEnabled: string =
        OverlayController.nextStateOf(OverlayState.ENABLED, OverlayAction.DISABLE, false);
      const keptLoaded: string =
        OverlayController.nextStateOf(OverlayState.RUNTIME_LOADED, OverlayAction.REMOVE_RESOURCE, false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s', keptEnabled, keptLoaded);
      expect(keptEnabled).assertEqual(OverlayState.ENABLED);
      expect(keptLoaded).assertEqual(OverlayState.RUNTIME_LOADED);
      expect(keptEnabled === keptLoaded).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0014 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0015
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0015
     * @tc.desc   isKnownState 只接受五个可观测状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0015 begin');
      expect(OverlayController.isKnownState(OverlayState.INITIAL)).assertTrue();
      expect(OverlayController.isKnownState(OverlayState.RUNTIME_REMOVED)).assertTrue();
      expect(OverlayController.isKnownState('broken')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0015 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0016
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0016
     * @tc.desc   状态常量取值必须与页面可读文案一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0016 begin');
      expect(OverlayState.INITIAL).assertEqual('initial');
      expect(OverlayState.ENABLED).assertEqual('enabled');
      expect(OverlayState.RUNTIME_LOADED).assertEqual('runtimeLoaded');
      expect(OverlayAction.ADD_RESOURCE).assertEqual('addResource');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0016 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0017
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0017
     * @tc.desc   hsp 文件名与模块名常量必须与工程配置一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0017 begin');
      expect(OverlayController.OVERLAY_MODULE_NAME).assertEqual('libraryOverlay');
      expect(OverlayController.RUNTIME_HSP_NAME).assertEqual('libraryRuntimeOverlay-default-signed.hsp');
      expect(OverlayController.RUNTIME_HSP_NAME.endsWith('.hsp')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0017 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0018
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0018
     * @tc.desc   路径拼装结果必须建立在合法目录之上，非法目录不产生路径
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0018 begin');
      const valid: boolean = OverlayController.isValidCodeDir('/data/app/el1/bundle');
      const path: string = OverlayController.buildHspPath('/data/app/el1/bundle');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual valid=%{public}s path=%{public}s', String(valid), path);
      expect(valid).assertTrue();
      expect(path.startsWith('/data/app/el1/bundle/')).assertTrue();
      expect(path.length).assertEqual('/data/app/el1/bundle/'.length + OverlayController.RUNTIME_HSP_NAME.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0018 end');
    })

    /**
     * @tc.name   testOverlayCtrlReal0019
     * @tc.number SUB_RESMGR_OVERLAY_REAL_0019
     * @tc.desc   非法目录与非法动作分别返回空路径与空字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayCtrlReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0019 begin');
      expect(OverlayController.buildHspPath('')).assertEqual(OverlayController.INVALID_PATH);
      expect(OverlayController.buildHspPath('relative/dir')).assertEqual('');
      expect(OverlayController.parseAction('nope')).assertEqual(OverlayController.UNKNOWN_ACTION);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayCtrlReal0019 end');
    })
  })
}
