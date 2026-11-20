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

import { afterAll, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { bundleManager, OpenLinkOptions, UIAbility, Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  closeOpenLinkAbility,
  dismissNoMatchDialog,
  LinkObservation,
  observeOpenLink,
  observeStart
} from './LinkHelper';
import {
  ENTRY_ABILITY,
  getAbilityName,
  getDelegator,
  getTopAbility,
  launchAbility,
  sleep,
  startAndCapture,
  StartResult,
  waitForTopAbility
} from './TestHelper';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_UniversalLink_Lifecycle]';
const BUNDLE: string = 'com.example.universallink';
const OPEN_LINK: string = 'OpenLinkAbility';

/** 显式拉起 OpenLinkAbility 并等它到栈顶，返回栈顶实例；单实例被复用时再等一会儿让 lastRequestWant 更新。 */
async function startOpenLink(uri: string): Promise<UIAbility | undefined> {
  await sleep(600);
  const want: Want = { bundleName: BUNDLE, abilityName: OPEN_LINK, uri: uri };
  const result: StartResult = await startAndCapture(want);
  if (result.code !== 0) {
    return undefined;
  }
  const top: UIAbility | undefined = await waitForTopAbility(OPEN_LINK, 4000);
  await sleep(1200);
  return top;
}

/** 结束某个 OpenLinkAbility 实例，并等它离开栈顶。 */
async function finish(ability: UIAbility | undefined): Promise<void> {
  if (ability !== undefined) {
    await ability.context.terminateSelf();
  }
  const deadline: number = Date.now() + 3000;
  while (getAbilityName(await getTopAbility()) === OPEN_LINK && Date.now() < deadline) {
    await sleep(200);
  }
  await sleep(500);
}

export default function abilityLifecycleTest(): void {
  describe('UniversalLinkAbilityLifecycleTest', () => {
    beforeAll(async (done: Function) => {
      await dismissNoMatchDialog(500);
      await closeOpenLinkAbility();
      await launchAbility(ENTRY_ABILITY);
      done();
    })

    afterAll(async (done: Function) => {
      await dismissNoMatchDialog(500);
      await closeOpenLinkAbility();
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_LIFECYCLE_0001
     * @tc.name      testAbilityLifecycle0001
     * @tc.desc      同应用内按包名加 Ability 名显式拉起未 exported 的 OpenLinkAbility 成功，uri 与 action 为空
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0001 begin');
      const want: Want = { bundleName: BUNDLE, abilityName: OPEN_LINK };
      const observation: LinkObservation = await observeStart(want);
      expect(observation.code).assertEqual(0);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      expect(observation.uri).assertEqual('');
      expect(observation.action).assertEqual('');
      expect(observation.parameters['isDelegatorCall']).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0001 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_LIFECYCLE_0002
     * @tc.name      testAbilityLifecycle0002
     * @tc.desc      显式拉起 OpenLinkAbility 时携带的任意 uri 不经过 skill 匹配，原样送达
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0002 begin');
      const want: Want = { bundleName: BUNDLE, abilityName: OPEN_LINK, uri: 'https://example.com/explicit' };
      const observation: LinkObservation = await observeStart(want);
      expect(observation.code).assertEqual(0);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      expect(observation.uri).assertEqual('https://example.com/explicit');
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0002 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_LIFECYCLE_0003
     * @tc.name      testAbilityLifecycle0003
     * @tc.desc      显式拉起时同时指定 entry 模块名，OpenLinkAbility 正常拉起并收到 action
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0003 begin');
      const want: Want = {
        bundleName: BUNDLE,
        moduleName: 'entry',
        abilityName: OPEN_LINK,
        action: 'ohos.want.action.sendData'
      };
      const observation: LinkObservation = await observeStart(want);
      expect(observation.code).assertEqual(0);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      expect(observation.action).assertEqual('ohos.want.action.sendData');
      expect(observation.parameters['moduleName']).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0003 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_LIFECYCLE_0004
     * @tc.name      testAbilityLifecycle0004
     * @tc.desc      用 startAbility 显式拉起备份扩展 EntryBackupAbility 失败，返回 16000002 且不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0004 begin');
      const want: Want = { bundleName: BUNDLE, abilityName: 'EntryBackupAbility' };
      const observation: LinkObservation = await observeStart(want);
      expect(observation.code).assertEqual(16000002);
      expect(observation.dialogShown).assertFalse();
      expect(observation.topName === 'OpenLinkAbility').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0004 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_LIFECYCLE_0005
     * @tc.name      testAbilityLifecycle0005
     * @tc.desc      显式拉起本应用里不存在的 Ability，返回 16000001 且不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0005 begin');
      const want: Want = { bundleName: BUNDLE, abilityName: 'NotExistAbility' };
      const observation: LinkObservation = await observeStart(want);
      expect(observation.code).assertEqual(16000001);
      expect(observation.dialogShown).assertFalse();
      expect(observation.topName === 'OpenLinkAbility').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0005 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_LIFECYCLE_0006
     * @tc.name      testAbilityLifecycle0006
     * @tc.desc      显式拉起未安装应用的 Ability，返回 16000001 且不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0006 begin');
      const want: Want = { bundleName: 'com.example.notinstalled', abilityName: 'EntryAbility' };
      const observation: LinkObservation = await observeStart(want);
      expect(observation.code).assertEqual(16000001);
      expect(observation.dialogShown).assertFalse();
      expect(observation.topName === 'OpenLinkAbility').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0006 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_LIFECYCLE_0007
     * @tc.name      testAbilityLifecycle0007
     * @tc.desc      显式拉起时把 OpenLinkAbility 的模块名写成 entry_test，找不到 Ability 返回 16000001
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0007 begin');
      const want: Want = { bundleName: BUNDLE, moduleName: 'entry_test', abilityName: OPEN_LINK };
      const observation: LinkObservation = await observeStart(want);
      expect(observation.code).assertEqual(16000001);
      expect(observation.dialogShown).assertFalse();
      expect(observation.topName === 'OpenLinkAbility').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0007 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_LIFECYCLE_0008
     * @tc.name      testAbilityLifecycle0008
     * @tc.desc      OpenLinkAbility 是单实例：第二次拉起复用同一实例，launchWant 保持首次请求，lastRequestWant 为新请求
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0008 begin');
      const first: UIAbility | undefined = await startOpenLink('http://docs.openharmony.cn/first');
      const second: UIAbility | undefined = await startOpenLink('http://docs.openharmony.cn/second');
      expect(getAbilityName(first)).assertEqual('OpenLinkAbility');
      expect(first === second).assertTrue();
      expect(second?.launchWant.uri).assertEqual('http://docs.openharmony.cn/first');
      expect(second?.lastRequestWant.uri).assertEqual('http://docs.openharmony.cn/second');
      await finish(second);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0008 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_LIFECYCLE_0009
     * @tc.name      testAbilityLifecycle0009
     * @tc.desc      OpenLinkAbility 被 terminateSelf 后再拉起会创建新实例，launchWant 为最新请求
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0009 begin');
      const before: UIAbility | undefined = await startOpenLink('http://docs.openharmony.cn/before');
      await finish(before);
      const after: UIAbility | undefined = await startOpenLink('http://docs.openharmony.cn/after');
      expect(getAbilityName(before)).assertEqual('OpenLinkAbility');
      expect(getAbilityName(after)).assertEqual('OpenLinkAbility');
      expect(before === after).assertFalse();
      expect(after?.launchWant.uri).assertEqual('http://docs.openharmony.cn/after');
      await finish(after);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0009 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_LIFECYCLE_0010
     * @tc.name      testAbilityLifecycle0010
     * @tc.desc      OpenLinkAbility 的 context 记录的 Ability 信息与 entry 模块信息和 module.json5 一致
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0010 begin');
      const ability: UIAbility | undefined = await startOpenLink('http://docs.openharmony.cn');
      expect(ability === undefined).assertFalse();
      if (ability !== undefined) {
        expect(ability.context.abilityInfo.name).assertEqual('OpenLinkAbility');
        expect(ability.context.abilityInfo.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
        expect(ability.context.abilityInfo.exported).assertFalse();
        expect(ability.context.currentHapModuleInfo.name).assertEqual('entry');
        expect(ability.context.applicationInfo.name).assertEqual('com.example.universallink');
      }
      await finish(ability);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0010 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_LIFECYCLE_0011
     * @tc.name      testAbilityLifecycle0011
     * @tc.desc      OpenLinkAbility 的 context 能读到页面标题字符串，系统语言为中文时取 zh_CN 资源
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0011 begin');
      const ability: UIAbility | undefined = await startOpenLink('http://docs.openharmony.cn');
      expect(ability === undefined).assertFalse();
      if (ability !== undefined) {
        const title: string = ability.context.resourceManager.getStringByNameSync('OpenLinkTitle');
        expect(title).assertEqual('UniversalLink方式拉起Ability成功');
        expect(ability.context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual('label');
        expect(ability.context.config.language).assertEqual('zh-Hans-CN');
      }
      await finish(ability);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0011 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_LIFECYCLE_0012
     * @tc.name      testAbilityLifecycle0012
     * @tc.desc      首页 EntryAbility 由测试框架显式拉起，launchWant 带包名、Ability 名、模块名与 isDelegatorCall
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0012 begin');
      const entry: UIAbility | undefined = await launchAbility(ENTRY_ABILITY);
      expect(entry === undefined).assertFalse();
      if (entry !== undefined) {
        expect(entry.launchWant.bundleName).assertEqual('com.example.universallink');
        expect(entry.launchWant.abilityName).assertEqual('EntryAbility');
        expect(entry.launchWant.moduleName).assertEqual('entry');
        expect(entry.launchWant.uri).assertEqual('');
        expect(entry.launchWant.parameters?.['isDelegatorCall']).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0012 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_LIFECYCLE_0013
     * @tc.name      testAbilityLifecycle0013
     * @tc.desc      首页 EntryAbility 的 context 记录的 Ability 与模块信息，主 Ability 为 EntryAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0013 begin');
      const entry: UIAbility | undefined = await launchAbility(ENTRY_ABILITY);
      expect(entry === undefined).assertFalse();
      if (entry !== undefined) {
        expect(entry.context.abilityInfo.name).assertEqual('EntryAbility');
        expect(entry.context.abilityInfo.exported).assertTrue();
        expect(entry.context.currentHapModuleInfo.name).assertEqual('entry');
        expect(entry.context.currentHapModuleInfo.mainElementName).assertEqual('EntryAbility');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0013 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_LIFECYCLE_0014
     * @tc.name      testAbilityLifecycle0014
     * @tc.desc      openLink 拉起的 OpenLinkAbility 收到调用方包名、Ability 名与目标模块名
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0014 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkObservation = await observeOpenLink('http://docs.openharmony.cn', options);
      expect(observation.code).assertEqual(0);
      expect(observation.parameters['ohos.aafwk.param.callerBundleName']).assertEqual('com.example.universallink');
      expect(observation.parameters['ohos.aafwk.param.callerAbilityName']).assertEqual('EntryAbility');
      expect(observation.parameters['moduleName']).assertEqual('entry');
      expect(observation.parameters['isDelegatorCall'] === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0014 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_LIFECYCLE_0015
     * @tc.name      testAbilityLifecycle0015
     * @tc.desc      OpenLinkAbility 在前台时处于 FOREGROUND，首页 EntryAbility 退到 BACKGROUND
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0015 begin');
      const delegator: abilityDelegatorRegistry.AbilityDelegator = getDelegator();
      const foreground: number = abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND;
      const background: number = abilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND;
      const entry: UIAbility | undefined = await launchAbility(ENTRY_ABILITY);
      expect(entry === undefined).assertFalse();
      if (entry !== undefined) {
        expect(delegator.getAbilityState(entry)).assertEqual(foreground);
        const ability: UIAbility | undefined = await startOpenLink('http://docs.openharmony.cn/state');
        expect(getAbilityName(ability)).assertEqual('OpenLinkAbility');
        if (ability !== undefined) {
          expect(delegator.getAbilityState(ability)).assertEqual(foreground);
        }
        await sleep(500);
        expect(delegator.getAbilityState(entry)).assertEqual(background);
        await finish(ability);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0015 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_LIFECYCLE_0016
     * @tc.name      testAbilityLifecycle0016
     * @tc.desc      新建 OpenLinkAbility 时依次回调 onAbilityCreate、onWindowStageCreate、onAbilityForeground
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0016 begin');
      const events: string[] = [];
      const monitor: abilityDelegatorRegistry.AbilityMonitor = {
        abilityName: OPEN_LINK,
        moduleName: 'entry',
        onAbilityCreate: () => {
          events.push('create');
        },
        onWindowStageCreate: () => {
          events.push('windowStageCreate');
        },
        onAbilityForeground: () => {
          events.push('foreground');
        }
      };
      getDelegator().addAbilityMonitorSync(monitor);
      const ability: UIAbility | undefined = await startOpenLink('http://docs.openharmony.cn/monitor');
      await sleep(500);
      getDelegator().removeAbilityMonitorSync(monitor);
      expect(getAbilityName(ability)).assertEqual('OpenLinkAbility');
      expect(events.join(',')).assertEqual('create,windowStageCreate,foreground');
      expect(events.length).assertEqual(3);
      await finish(ability);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0016 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_LIFECYCLE_0017
     * @tc.name      testAbilityLifecycle0017
     * @tc.desc      terminateSelf 结束 OpenLinkAbility 时依次回调 onAbilityBackground、onWindowStageDestroy、onAbilityDestroy
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0017 begin');
      const ability: UIAbility | undefined = await startOpenLink('http://docs.openharmony.cn/destroy');
      const events: string[] = [];
      const monitor: abilityDelegatorRegistry.AbilityMonitor = {
        abilityName: OPEN_LINK,
        moduleName: 'entry',
        onAbilityBackground: () => {
          events.push('background');
        },
        onWindowStageDestroy: () => {
          events.push('windowStageDestroy');
        },
        onAbilityDestroy: () => {
          events.push('destroy');
        }
      };
      getDelegator().addAbilityMonitorSync(monitor);
      await finish(ability);
      await sleep(500);
      getDelegator().removeAbilityMonitorSync(monitor);
      expect(getAbilityName(ability)).assertEqual('OpenLinkAbility');
      expect(events.join(',')).assertEqual('background,windowStageDestroy,destroy');
      expect(getAbilityName(await getTopAbility()) === 'OpenLinkAbility').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0017 end');
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_LIFECYCLE_0018
     * @tc.name      testAbilityLifecycle0018
     * @tc.desc      单实例复用时不再回调 onAbilityCreate 与 onWindowStageCreate，新请求写进 lastRequestWant
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0018 begin');
      const first: UIAbility | undefined = await startOpenLink('http://docs.openharmony.cn/reuse1');
      const events: string[] = [];
      const monitor: abilityDelegatorRegistry.AbilityMonitor = {
        abilityName: OPEN_LINK,
        moduleName: 'entry',
        onAbilityCreate: () => {
          events.push('create');
        },
        onWindowStageCreate: () => {
          events.push('windowStageCreate');
        }
      };
      getDelegator().addAbilityMonitorSync(monitor);
      const second: UIAbility | undefined = await startOpenLink('http://docs.openharmony.cn/reuse2');
      await sleep(500);
      getDelegator().removeAbilityMonitorSync(monitor);
      expect(first === second).assertTrue();
      expect(events.length).assertEqual(0);
      expect(second?.lastRequestWant.uri).assertEqual('http://docs.openharmony.cn/reuse2');
      await finish(second);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilityLifecycle0018 end');
      done();
    })
  })
}
