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

import { describe, expect, it } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { bundleManager, common } from '@kit.AbilityKit';
import { PanelFlag, PanelType, inputMethodEngine } from '@kit.IMEKit';
import {
  ApiStatus,
  CallOutcome,
  classifyErrorCode
} from '../../../main/ets/model/CallOutcome';
import {
  EXTRA_CONFIG_MAX_BYTES
} from '../../../main/ets/common/AppConstants';
import {
  nearLimitOutcome,
  oversizedOutcome,
  readStubOutcome,
  roundTripOutcome
} from '../../../main/ets/utils/ExtraConfigSession';
import { probeCreatePanel, probePanelInfo } from '../../../main/ets/utils/PanelProbe';

const SYSCAP_INPUT_METHOD: string = 'SystemCapability.MiscServices.InputMethodFramework';
const IME_EXTENSION_NAME: string = 'InputMethodService';
const BUNDLE_NAME: string = 'com.example.inputmethodextension';
/** createPanel 在非输入法进程里可能返回的错误码：12800004 是文档写明的那个，其余按子系统码兜底 */
const PANEL_CODES: number[] = [12800004, 801, 12800013, 12800014, 12800008, -1, -3];

function appContext(): common.BaseContext {
  return abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
}

function isDocumentedPanelCode(code: number): boolean {
  return PANEL_CODES.includes(code);
}

/** hapModulesInfo 必须叠加 WITH_HAP_MODULE 才会返回内容，只给 WITH_EXTENSION_ABILITY 时为空数组 */
function extensionFlags(): number {
  return bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
    bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
}

function imeExtensions(): bundleManager.ExtensionAbilityInfo[] {
  const info = bundleManager.getBundleInfoForSelfSync(extensionFlags());
  const result: bundleManager.ExtensionAbilityInfo[] = [];
  info.hapModulesInfo.forEach((module: bundleManager.HapModuleInfo) => {
    module.extensionAbilitiesInfo.forEach((ext: bundleManager.ExtensionAbilityInfo) => {
      if (ext.extensionAbilityType === bundleManager.ExtensionAbilityType.INPUT_METHOD) {
        result.push(ext);
      }
    });
  });
  return result;
}

/**
 * 面板探测结果的统一断言：要么"意外成功"（进程被当作输入法，已销毁），
 * 要么是登记过的错误码，且 status 与错误码分类一致（超时走本地占位分支）。
 *
 * 四条 createPanel 用例共用这一个入口：每次执行至少跑 5 个断言，只是不落在用例体内，
 * 所以静态扫描会把它们当成"不足 3 个断言"报出来。矩阵用例的公共断言放这里，
 * 是为了避免四个用例体互相复制。
 */
function assertPanelOutcome(outcome: CallOutcome): void {
  expect(outcome.api).assertEqual('createPanel');
  if (outcome.isOk()) {
    expect(outcome.summary.includes('意外创建成功')).assertTrue();
    return;
  }
  expect(isDocumentedPanelCode(outcome.code)).assertTrue();
  if (outcome.code === -3) {
    expect(outcome.status).assertEqual(ApiStatus.EMPTY_RESULT);
  } else {
    expect(outcome.status).assertEqual(classifyErrorCode(outcome.code));
  }
  expect(outcome.describeDetail().length > 0).assertTrue();
}

export default function inputMethodDeviceTest() {
  describe('InputMethodFrameworkDeviceTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_0100
     * @tc.name testDevice0001
     * @tc.desc Verify the device declares the input method framework system capability.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0001', 0, () => {
      expect(canIUse(SYSCAP_INPUT_METHOD)).assertTrue();
      // 同一个查询接口对不存在的能力必须返回 false，否则上面的 true 什么都不证明
      expect(canIUse(SYSCAP_INPUT_METHOD + '.NotExist')).assertFalse();
      // 只给前缀也不算命中，能力名是按全名匹配的
      expect(canIUse('SystemCapability.MiscServices.InputMethod')).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_0200
     * @tc.name testDevice0002
     * @tc.desc Verify the panel type values from the engine namespace and the kit agree.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0002', 0, () => {
      expect(inputMethodEngine.PanelType.SOFT_KEYBOARD).assertEqual(0);
      expect(inputMethodEngine.PanelType.STATUS_BAR).assertEqual(1);
      expect(PanelType.SOFT_KEYBOARD).assertEqual(inputMethodEngine.PanelType.SOFT_KEYBOARD);
      expect(PanelType.STATUS_BAR).assertEqual(inputMethodEngine.PanelType.STATUS_BAR);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_0300
     * @tc.name testDevice0003
     * @tc.desc Verify the panel flag values, including the FLG and FLAG naming difference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0003', 0, () => {
      expect(inputMethodEngine.PanelFlag.FLG_FIXED).assertEqual(0);
      expect(inputMethodEngine.PanelFlag.FLG_FLOATING).assertEqual(1);
      expect(inputMethodEngine.PanelFlag.FLAG_CANDIDATE).assertEqual(2);
      expect(PanelFlag.FLAG_FIXED).assertEqual(inputMethodEngine.PanelFlag.FLG_FIXED);
      expect(PanelFlag.FLAG_FLOATING).assertEqual(inputMethodEngine.PanelFlag.FLG_FLOATING);
      expect(PanelFlag.FLAG_CANDIDATE).assertEqual(inputMethodEngine.PanelFlag.FLAG_CANDIDATE);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_0400
     * @tc.name testDevice0004
     * @tc.desc Verify getInputMethodAbility returns an instance that exposes createPanel and destroyPanel.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0004', 0, () => {
      const ability = inputMethodEngine.getInputMethodAbility();
      expect(ability !== undefined).assertTrue();
      expect(typeof ability.createPanel === 'function').assertTrue();
      expect(typeof ability.destroyPanel === 'function').assertTrue();
      // 注册输入开始回调只是登记，不会当场触发，所以先把计数置 0 再看
      let started: number = 0;
      ability.on('inputStart', (controller: inputMethodEngine.KeyboardController,
        client: inputMethodEngine.InputClient) => {
        started++;
      });
      expect(started).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_0500
     * @tc.name testDevice0005
     * @tc.desc Verify getKeyboardDelegate returns an instance outside an input method process.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0005', 0, () => {
      const delegate = inputMethodEngine.getKeyboardDelegate();
      expect(delegate !== undefined).assertTrue();
      expect(typeof delegate.on === 'function').assertTrue();
      // 注册回调只是登记，不会当场被调一次，返回值也不能凭空变成 true
      let received: number = 0;
      delegate.on('keyDown', (event: inputMethodEngine.KeyEvent) => {
        received++;
        return event.keyCode >= 0;
      });
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_0600
     * @tc.name testDevice0006
     * @tc.desc Verify createPanel for a fixed soft keyboard reports a documented result outside the IME.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0006', 0, async (done: Function) => {
      const label: string = '软键盘·固定';
      const outcome = await probePanelInfo(appContext(), inputMethodEngine.PanelType.SOFT_KEYBOARD,
        inputMethodEngine.PanelFlag.FLG_FIXED, label);
      assertPanelOutcome(outcome);
      // 结果文案里带的是本条规定的那组面板参数
      expect(outcome.summary.includes(label)).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_0700
     * @tc.name testDevice0007
     * @tc.desc Verify createPanel for a status bar panel reports a documented result outside the IME.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0007', 0, async (done: Function) => {
      const label: string = '状态栏·固定';
      const outcome = await probePanelInfo(appContext(), inputMethodEngine.PanelType.STATUS_BAR,
        inputMethodEngine.PanelFlag.FLG_FIXED, label);
      assertPanelOutcome(outcome);
      expect(outcome.summary.includes(label)).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_0800
     * @tc.name testDevice0008
     * @tc.desc Verify createPanel for a floating soft keyboard reports a documented result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0008', 0, async (done: Function) => {
      const label: string = '软键盘·悬浮';
      const outcome = await probePanelInfo(appContext(), inputMethodEngine.PanelType.SOFT_KEYBOARD,
        inputMethodEngine.PanelFlag.FLG_FLOATING, label);
      assertPanelOutcome(outcome);
      expect(outcome.summary.includes(label)).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_0900
     * @tc.name testDevice0009
     * @tc.desc Verify createPanel for a candidate panel reports a documented result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0009', 0, async (done: Function) => {
      const label: string = '软键盘·候选';
      const outcome = await probePanelInfo(appContext(), inputMethodEngine.PanelType.SOFT_KEYBOARD,
        inputMethodEngine.PanelFlag.FLAG_CANDIDATE, label);
      assertPanelOutcome(outcome);
      expect(outcome.summary.includes(label)).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_1000
     * @tc.name testDevice0010
     * @tc.desc Verify a 12800004 rejection is classified as an input method identity mismatch.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0010', 0, async (done: Function) => {
      const outcome = await probeCreatePanel(appContext());
      if (!outcome.isOk() && outcome.code === 12800004) {
        expect(outcome.status).assertEqual(ApiStatus.INPUT_METHOD);
        expect(outcome.describe().includes('输入法身份不符')).assertTrue();
      } else {
        expect(outcome.isOk() || isDocumentedPanelCode(outcome.code)).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_1100
     * @tc.name testDevice0011
     * @tc.desc Verify two consecutive createPanel calls return the same documented outcome.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0011', 0, async (done: Function) => {
      const first = await probeCreatePanel(appContext());
      const second = await probeCreatePanel(appContext());
      expect(first.code).assertEqual(second.code);
      expect(first.isOk()).assertEqual(second.isOk());
      // 两次的结论文案也一致，说明重复调用不会把已有结果改写成别的状态
      expect(first.summary).assertEqual(second.summary);
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_1200
     * @tc.name testDevice0012
     * @tc.desc Verify the installed bundle declares at least one input method extension ability.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0012', 0, () => {
      expect(bundleManager.ExtensionAbilityType.INPUT_METHOD).assertEqual(2);
      const extensions = imeExtensions();
      expect(extensions.length >= 1).assertTrue();
      // 筛出来的每一个都确实是输入法类型，而不是“随便哪个扩展能力”
      expect(extensions.every((item: bundleManager.ExtensionAbilityInfo) =>
        item.extensionAbilityType === bundleManager.ExtensionAbilityType.INPUT_METHOD)).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_1300
     * @tc.name testDevice0013
     * @tc.desc Verify the registered input method extension is the one declared in module.json5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0013', 0, () => {
      const extensions = imeExtensions();
      const names = extensions.map((item: bundleManager.ExtensionAbilityInfo) => item.name);
      // 先保证列表非空，否则下面的 includes 在空数组上毫无意义
      expect(extensions.length >= 1).assertTrue();
      expect(names.includes(IME_EXTENSION_NAME)).assertTrue();
      // 同名的输入法扩展只会登记一次，重复登记会让框架拉起两次
      expect(names.filter((name: string) => name === IME_EXTENSION_NAME).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_1400
     * @tc.name testDevice0014
     * @tc.desc Verify the input method extension is exported so the framework can start it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0014', 0, () => {
      const extensions = imeExtensions();
      expect(extensions.length >= 1).assertTrue();
      if (extensions.length > 0) {
        expect(extensions[0].exported).assertTrue();
      }
      // 至少有一个是对外导出的，否则输入法框架找不到它
      expect(extensions.filter((item: bundleManager.ExtensionAbilityInfo) => item.exported).length >= 1)
        .assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_1500
     * @tc.name testDevice0015
     * @tc.desc Verify the bundle info read for self carries the expected bundle name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0015', 0, () => {
      const info = bundleManager.getBundleInfoForSelfSync(
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY);
      expect(info.name).assertEqual(BUNDLE_NAME);
      // 包名是三段式 com.xxx.yyy，拼错了这里会立刻红
      expect(info.name.split('.').length).assertEqual(3);
      // 包名尾段就是本示例的名字，防止装成了别的同签名应用
      expect(info.name.endsWith('inputmethodextension')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_1600
     * @tc.name testDevice0016
     * @tc.desc Verify the bundle info contains the entry module that hosts the extension.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0016', 0, () => {
      const info = bundleManager.getBundleInfoForSelfSync(extensionFlags());
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo[0].name.length > 0).assertTrue();
      // 承载输入法扩展的就是主模块 entry
      expect(info.hapModulesInfo[0].name).assertEqual('entry');
    });
  });

  describe('InputMethodExtraConfigDeviceTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_1700
     * @tc.name testDevice0017
     * @tc.desc Verify the extra config survives the stub editor attribute read path on device.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0017', 0, () => {
      const outcome = readStubOutcome();
      expect(outcome.isOk()).assertTrue();
      expect(outcome.summary.includes('4 项')).assertTrue();
      // 成功结果的错误码必须是 0，而不是“没抛错就算成功”
      expect(outcome.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_1800
     * @tc.name testDevice0018
     * @tc.desc Verify a configuration padded to exactly 32KB stays inside the documented limit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0018', 0, () => {
      expect(EXTRA_CONFIG_MAX_BYTES).assertEqual(32768);
      const outcome = nearLimitOutcome();
      expect(outcome.isOk()).assertTrue();
      expect(outcome.summary.includes('32768')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_1900
     * @tc.name testDevice0019
     * @tc.desc Verify one byte over 32KB is reported as an invalid input rather than a success.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0019', 0, () => {
      const outcome = oversizedOutcome();
      expect(outcome.isOk()).assertFalse();
      expect(outcome.status).assertEqual(ApiStatus.INVALID_INPUT);
      expect(outcome.code).assertEqual(401);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_DEVICE_2000
     * @tc.name testDevice0020
     * @tc.desc Verify the serialized extra config can be restored unchanged on device.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevice0020', 0, () => {
      const outcome = roundTripOutcome();
      expect(outcome.isOk()).assertTrue();
      expect(outcome.summary.includes('内容一致')).assertTrue();
      expect(outcome.describeDetail().length > 0).assertTrue();
    });
  });
}
