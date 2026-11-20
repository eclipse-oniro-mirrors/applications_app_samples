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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { resourceManager } from '@kit.LocalizationKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  OverlayController,
  OverlayAction,
  OverlayState
} from '../../../../main/ets/service/OverlayController';
import { TestContextHolder } from '../utils/TestContextHolder';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';
const APP_MODULE: string = 'entry';
/** Directory shape the hsp path is built from on device. */
const BUNDLE_CODE_DIR: string = '/data/storage/el1/bundle';
/** Actions that only toggle the overlay module. */
const SWITCH_ACTION_COUNT: number = 2;
/** Every message key the page may show. */
const MESSAGE_KEYS: string[] = [
  'unEnableSuccess',
  'unEnableFailed',
  'enableSuccess',
  'enableFailed',
  'test_string'
];

function appManager(): resourceManager.ResourceManager {
  return TestContextHolder.resourceManagerOf(APP_MODULE);
}

/** Real resource text of a message key, empty string when it cannot be read. */
async function messageOf(key: string): Promise<string> {
  try {
    return await appManager().getStringByName(key);
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, 'message %{public}s failed, code: %{public}d',
      key, (error as BusinessError).code);
    return '';
  }
}

/** Number of occurrences of a character, used to spot double separators. */
function countChar(text: string, target: string): number {
  let count: number = 0;
  for (let index: number = 0; index < text.length; index++) {
    if (text.charAt(index) === target) {
      count++;
    }
  }
  return count;
}

/**
 * Drives the overlay rules against the message keys that really exist in the
 * module resources and against multi step state sequences instead of single
 * transitions.
 */
export default function overlayCtrlReal03Test() {
  describe('OverlayCtrlReal03Test', () => {
    beforeAll(async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'OverlayCtrlReal03Test begin');
    });

    /**
     * @tc.name   testOverlayReal3001
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0001
     * @tc.desc   使能成功返回的文案键在真实资源中存在且非空
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3001 begin');
      const key: string = OverlayController.messageKeyOf(OverlayAction.ENABLE, true);
      const text: string = await messageOf(key);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'key=%{public}s text=[%{public}s]', key, text);
      expect(key).assertEqual('enableSuccess');
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(text.trim());
    });

    /**
     * @tc.name   testOverlayReal3002
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0002
     * @tc.desc   使能失败返回的文案键在真实资源中存在且非空
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3002 begin');
      const key: string = OverlayController.messageKeyOf(OverlayAction.ENABLE, false);
      const text: string = await messageOf(key);
      expect(key).assertEqual('enableFailed');
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(text.trim());
    });

    /**
     * @tc.name   testOverlayReal3003
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0003
     * @tc.desc   去使能成功返回的文案键在真实资源中存在且非空
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3003 begin');
      const key: string = OverlayController.messageKeyOf(OverlayAction.DISABLE, true);
      const text: string = await messageOf(key);
      expect(key).assertEqual('unEnableSuccess');
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(text.trim());
    });

    /**
     * @tc.name   testOverlayReal3004
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0004
     * @tc.desc   去使能失败返回的文案键在真实资源中存在且非空
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3004 begin');
      const key: string = OverlayController.messageKeyOf(OverlayAction.DISABLE, false);
      const text: string = await messageOf(key);
      expect(key).assertEqual('unEnableFailed');
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(text.trim());
    });

    /**
     * @tc.name   testOverlayReal3005
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0005
     * @tc.desc   资源增删共用的文案键在真实资源中存在，且两个动作返回同一个键
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3005 begin');
      const addKey: string = OverlayController.messageKeyOf(OverlayAction.ADD_RESOURCE, true);
      const removeKey: string = OverlayController.messageKeyOf(OverlayAction.REMOVE_RESOURCE, false);
      const text: string = await messageOf(addKey);
      expect(addKey).assertEqual('test_string');
      expect(removeKey).assertEqual(addKey);
      expect(text.length > 0).assertTrue();
    });

    /**
     * @tc.name   testOverlayReal3006
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0006
     * @tc.desc   五个文案键对应的真实文本两两不同
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3006 begin');
      let distinct: number = 0;
      for (let left: number = 0; left < MESSAGE_KEYS.length; left++) {
        const leftText: string = await messageOf(MESSAGE_KEYS[left]);
        let unique: boolean = leftText.length > 0;
        for (let right: number = 0; right < MESSAGE_KEYS.length; right++) {
          if (left !== right && (await messageOf(MESSAGE_KEYS[right])) === leftText) {
            unique = false;
          }
        }
        if (unique) {
          distinct++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'distinct message texts=%{public}d', distinct);
      expect(distinct).assertEqual(MESSAGE_KEYS.length);
      expect(distinct > 0).assertTrue();
      expect(MESSAGE_KEYS.length).assertEqual(5);
    });

    /**
     * @tc.name   testOverlayReal3007
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0007
     * @tc.desc   使能与去使能的成功文案不同，失败文案也不同
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3007 begin');
      const enableOk: string = await messageOf('enableSuccess');
      const enableFail: string = await messageOf('enableFailed');
      const disableOk: string = await messageOf('unEnableSuccess');
      const disableFail: string = await messageOf('unEnableFailed');
      expect(enableOk === disableOk).assertFalse();
      expect(enableFail === disableFail).assertFalse();
      expect(enableOk === enableFail).assertFalse();
    });

    /**
     * @tc.name   testOverlayReal3008
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0008
     * @tc.desc   从初始状态出发，使能成功后进入已使能状态
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3008 begin');
      const next: string = OverlayController.nextStateOf(OverlayState.INITIAL, OverlayAction.ENABLE, true);
      expect(next).assertEqual(OverlayState.ENABLED);
      expect(OverlayController.isKnownState(next)).assertTrue();
      expect(next === OverlayState.INITIAL).assertFalse();
    });

    /**
     * @tc.name   testOverlayReal3009
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0009
     * @tc.desc   已使能后去使能成功，链式进入去使能状态
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3009 begin');
      const enabled: string =
        OverlayController.nextStateOf(OverlayState.INITIAL, OverlayAction.ENABLE, true);
      const disabled: string = OverlayController.nextStateOf(enabled, OverlayAction.DISABLE, true);
      expect(disabled).assertEqual(OverlayState.DISABLED);
      expect(disabled === enabled).assertFalse();
      expect(OverlayController.isKnownState(disabled)).assertTrue();
    });

    /**
     * @tc.name   testOverlayReal3010
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0010
     * @tc.desc   去使能状态再次使能成功，状态回到已使能
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3010 begin');
      const back: string = OverlayController.nextStateOf(OverlayState.DISABLED, OverlayAction.ENABLE, true);
      const again: string = OverlayController.nextStateOf(back, OverlayAction.DISABLE, true);
      expect(back).assertEqual(OverlayState.ENABLED);
      expect(again).assertEqual(OverlayState.DISABLED);
      expect(back === again).assertFalse();
    });

    /**
     * @tc.name   testOverlayReal3011
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0011
     * @tc.desc   已使能状态重复使能成功仍是已使能，不会产生新状态
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3011 begin');
      const once: string = OverlayController.nextStateOf(OverlayState.ENABLED, OverlayAction.ENABLE, true);
      const twice: string = OverlayController.nextStateOf(once, OverlayAction.ENABLE, true);
      expect(once).assertEqual(OverlayState.ENABLED);
      expect(twice).assertEqual(once);
      expect(OverlayController.isSwitchAction(OverlayAction.ENABLE)).assertTrue();
    });

    /**
     * @tc.name   testOverlayReal3012
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0012
     * @tc.desc   初始状态加载运行时资源成功后进入已加载状态
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3012 begin');
      const loaded: string =
        OverlayController.nextStateOf(OverlayState.INITIAL, OverlayAction.ADD_RESOURCE, true);
      expect(loaded).assertEqual(OverlayState.RUNTIME_LOADED);
      expect(OverlayController.isKnownState(loaded)).assertTrue();
      expect(OverlayController.isSwitchAction(OverlayAction.ADD_RESOURCE)).assertFalse();
    });

    /**
     * @tc.name   testOverlayReal3013
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0013
     * @tc.desc   已加载状态移除运行时资源成功后进入已移除状态
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3013 begin');
      const loaded: string =
        OverlayController.nextStateOf(OverlayState.INITIAL, OverlayAction.ADD_RESOURCE, true);
      const removed: string =
        OverlayController.nextStateOf(loaded, OverlayAction.REMOVE_RESOURCE, true);
      expect(removed).assertEqual(OverlayState.RUNTIME_REMOVED);
      expect(removed === loaded).assertFalse();
      expect(OverlayController.isKnownState(removed)).assertTrue();
    });

    /**
     * @tc.name   testOverlayReal3014
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0014
     * @tc.desc   已移除状态重新加载成功后回到已加载状态
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3014 begin');
      const reloaded: string =
        OverlayController.nextStateOf(OverlayState.RUNTIME_REMOVED, OverlayAction.ADD_RESOURCE, true);
      expect(reloaded).assertEqual(OverlayState.RUNTIME_LOADED);
      expect(OverlayController.isKnownState(reloaded)).assertTrue();
      expect(reloaded === OverlayState.RUNTIME_REMOVED).assertFalse();
    });

    /**
     * @tc.name   testOverlayReal3015
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0015
     * @tc.desc   去使能状态下加载运行时资源不受开关状态限制，直接进入已加载
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3015 begin');
      const loaded: string =
        OverlayController.nextStateOf(OverlayState.DISABLED, OverlayAction.ADD_RESOURCE, true);
      expect(loaded).assertEqual(OverlayState.RUNTIME_LOADED);
      expect(loaded === OverlayState.DISABLED).assertFalse();
      expect(OverlayController.isKnownState(loaded)).assertTrue();
    });

    /**
     * @tc.name   testOverlayReal3016
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0016
     * @tc.desc   已使能状态下移除运行时资源直接进入已移除，不经过去使能
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3016 begin');
      const removed: string =
        OverlayController.nextStateOf(OverlayState.ENABLED, OverlayAction.REMOVE_RESOURCE, true);
      expect(removed).assertEqual(OverlayState.RUNTIME_REMOVED);
      expect(removed === OverlayState.ENABLED).assertFalse();
      expect(OverlayController.isSwitchAction(OverlayAction.REMOVE_RESOURCE)).assertFalse();
    });

    /**
     * @tc.name   testOverlayReal3017
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0017
     * @tc.desc   已使能状态下取消失败，状态原样保持为已使能
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3017 begin');
      const kept: string = OverlayController.nextStateOf(OverlayState.ENABLED, OverlayAction.DISABLE, false);
      expect(kept).assertEqual(OverlayState.ENABLED);
      expect(kept === OverlayState.DISABLED).assertFalse();
      expect(OverlayController.isKnownState(kept)).assertTrue();
    });

    /**
     * @tc.name   testOverlayReal3018
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0018
     * @tc.desc   已加载状态下加载失败，状态保持为已加载
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3018 begin');
      const kept: string =
        OverlayController.nextStateOf(OverlayState.RUNTIME_LOADED, OverlayAction.ADD_RESOURCE, false);
      expect(kept).assertEqual(OverlayState.RUNTIME_LOADED);
      expect(kept === OverlayState.RUNTIME_REMOVED).assertFalse();
      expect(OverlayController.isKnownState(kept)).assertTrue();
    });

    /**
     * @tc.name   testOverlayReal3019
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0019
     * @tc.desc   未知起点上使能成功后收敛到已使能状态
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3019 begin');
      const next: string = OverlayController.nextStateOf('unknown-state', OverlayAction.ENABLE, true);
      expect(next).assertEqual(OverlayState.ENABLED);
      expect(OverlayController.isKnownState(next)).assertTrue();
      expect(next === 'unknown-state').assertFalse();
    });

    /**
     * @tc.name   testOverlayReal3020
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0020
     * @tc.desc   未知起点上动作失败时回落到初始状态而不是保留未知值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3020 begin');
      const kept: string = OverlayController.nextStateOf('unknown-state', OverlayAction.DISABLE, false);
      expect(kept).assertEqual(OverlayState.INITIAL);
      expect(OverlayController.isKnownState(kept)).assertTrue();
      expect(kept === 'unknown-state').assertFalse();
    });

    /**
     * @tc.name   testOverlayReal3021
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0021
     * @tc.desc   用设备包目录拼出的 hsp 路径以 hsp 文件名结尾且只含单层分隔
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3021 begin');
      const path: string = OverlayController.buildHspPath(BUNDLE_CODE_DIR);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'hsp path=[%{public}s]', path);
      expect(path.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertTrue();
      expect(path.indexOf(BUNDLE_CODE_DIR)).assertEqual(0);
      expect(path.length).assertEqual(
        BUNDLE_CODE_DIR.length + 1 + OverlayController.RUNTIME_HSP_NAME.length);
      expect(countChar(path, '/')).assertEqual(countChar(BUNDLE_CODE_DIR, '/') + 1);
      expect(path.indexOf('//') === -1).assertTrue();
    });

    /**
     * @tc.name   testOverlayReal3022
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0022
     * @tc.desc   能力自身的文件目录是合法编码目录，能拼出非空 hsp 路径
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3022 begin');
      const context: common.UIAbilityContext | null = TestContextHolder.get();
      let filesDir: string = '';
      if (context !== null) {
        filesDir = context.filesDir;
      }
      const valid: boolean = OverlayController.isValidCodeDir(filesDir);
      const path: string = OverlayController.buildHspPath(filesDir);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'filesDir=[%{public}s] valid=%{public}s', filesDir, valid ? 'yes' : 'no');
      expect(filesDir.length > 0).assertTrue();
      expect(valid).assertTrue();
      expect(path.endsWith(OverlayController.RUNTIME_HSP_NAME)).assertTrue();
      expect(path.length > OverlayController.RUNTIME_HSP_NAME.length).assertTrue();
    });

    /**
     * @tc.name   testOverlayReal3023
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0023
     * @tc.desc   空动作名解析为未知动作且不推进状态，合法动作名解析后仍能推进
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3023 begin');
      const unknown: string = OverlayController.parseAction('');
      const kept: string = OverlayController.nextStateOf(OverlayState.ENABLED, unknown, true);
      const parsed: string = OverlayController.parseAction(`${OverlayAction.ENABLE}`);
      const moved: string = OverlayController.nextStateOf(OverlayState.DISABLED, parsed, true);
      expect(unknown).assertEqual(OverlayController.UNKNOWN_ACTION);
      expect(kept).assertEqual(OverlayState.ENABLED);
      expect(parsed).assertEqual(OverlayAction.ENABLE);
      expect(moved).assertEqual(OverlayState.ENABLED);
    });

    /**
     * @tc.name   testOverlayReal3024
     * @tc.number SUB_RESMGR_OVERLAY_REAL3_0024
     * @tc.desc   四个动作在成功与失败两种结果下的文案键都能在真实资源中读到
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testOverlayReal3024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayReal3024 begin');
      const actions: string[] = OverlayController.actionList();
      let readable: number = 0;
      for (let index: number = 0; index < actions.length; index++) {
        const okKey: string = OverlayController.messageKeyOf(actions[index], true);
        const failKey: string = OverlayController.messageKeyOf(actions[index], false);
        if ((await messageOf(okKey)).length > 0 && (await messageOf(failKey)).length > 0) {
          readable++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actions with readable keys=%{public}d/%{public}d',
        readable, actions.length);
      expect(readable).assertEqual(actions.length);
      expect(actions.length).assertEqual(4);
      expect(OverlayController.isSwitchAction(actions[0]) && OverlayController.isSwitchAction(actions[1]))
        .assertTrue();
      expect(OverlayController.isSwitchAction(actions[2]) || OverlayController.isSwitchAction(actions[3]))
        .assertFalse();
    });
  });
}
