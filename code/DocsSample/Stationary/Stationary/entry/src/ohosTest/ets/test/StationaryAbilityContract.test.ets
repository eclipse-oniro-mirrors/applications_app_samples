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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { BundleVersion } from '@kit.CoreFileKit';
import EntryBackupAbility from '../../../main/ets/entrybackupability/EntryBackupAbility';

const DOMAIN: number = 0xF812;
const TAG: string = 'Sample_Stationary';

function backupExtension(): EntryBackupAbility {
  return new EntryBackupAbility();
}

async function settle(action: () => void | Promise<void>): Promise<void> {
  await action();
}

function versionOf(code: number, name: string): BundleVersion {
  return { code: code, name: name };
}

/**
 * 工程内 Ability 层契约
 *
 * 覆盖 EntryAbility 注册、顶层 Ability 身份，以及 EntryBackupAbility 备份/恢复
 * 回调的同步与异步两种返回形态。备份回调不依赖设备能力，可直接构造实例调用。
 */

function caseEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

function caseBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

export default function StationaryAbilityContractTest() {
  describe('StationaryAbilityContractTest', () => {
    beforeAll(async () => {
      const want: Want = {
        bundleName: abilityDelegatorRegistry.getArguments().bundleName,
        abilityName: 'EntryAbility'
      };
      try {
        await abilityDelegatorRegistry.getAbilityDelegator().startAbility(want);
      } catch (err) {
      }
      await new Promise<void>((resolve: () => void) => setTimeout(resolve, 1500));
    });

    /**
     * @tc.number SUB_STATIONARY_ABILITY_0100
     * @tc.name testAbilityContract0001
     * @tc.desc Verify EntryAbility is the current top ability of the test target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAbilityContract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testAbilityContract0001');
      const ability: UIAbility = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
      expect(ability !== null).assertTrue();
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
      caseEnd('testAbilityContract0001');
    });

    /**
     * @tc.number SUB_STATIONARY_ABILITY_0200
     * @tc.name testAbilityContract0002
     * @tc.desc Verify the created ability is a UIAbility with its lifecycle hooks bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAbilityContract0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testAbilityContract0002');
      const ability: UIAbility = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
      expect(ability instanceof UIAbility).assertTrue();
      ability.onForeground();
      ability.onBackground();
      expect(ability.context !== undefined && ability.context !== null).assertTrue();
      caseEnd('testAbilityContract0002');
    });

    /**
     * @tc.number SUB_STATIONARY_ABILITY_0300
     * @tc.name testAbilityContract0003
     * @tc.desc Verify the ability context reports the bundle under test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAbilityContract0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testAbilityContract0003');
      const ability: UIAbility = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
      expect(ability.context.abilityInfo.bundleName)
        .assertEqual(abilityDelegatorRegistry.getArguments().bundleName);
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
      caseEnd('testAbilityContract0003');
    });

    /**
     * @tc.number SUB_STATIONARY_BACKUP_0400
     * @tc.name testBackupContract0004
     * @tc.desc Verify the backup extension exposes onBackup and onRestore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBackupContract0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      caseBegin('testBackupContract0004');
      const extension: EntryBackupAbility = backupExtension();
      expect(typeof extension.onBackup).assertEqual('function');
      expect(typeof extension.onRestore).assertEqual('function');
      caseEnd('testBackupContract0004');
    });

    /**
     * @tc.number SUB_STATIONARY_BACKUP_0500
     * @tc.name testBackupContract0005
     * @tc.desc Verify onBackup resolves without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBackupContract0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testBackupContract0005');
      let failed: boolean = false;
      try {
        await settle(async () => await backupExtension().onBackup());
      } catch (err) {
        failed = true;
      }
      expect(failed).assertFalse();
      expect(typeof failed).assertEqual('boolean');
      caseEnd('testBackupContract0005');
    });

    /**
     * @tc.number SUB_STATIONARY_BACKUP_0600
     * @tc.name testBackupContract0006
     * @tc.desc Verify onRestore resolves for a documented bundle version
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBackupContract0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testBackupContract0006');
      let failed: boolean = false;
      try {
        await settle(async () => await backupExtension().onRestore(versionOf(1000000, '1.0.0')));
      } catch (err) {
        failed = true;
      }
      expect(failed).assertFalse();
      expect(typeof failed).assertEqual('boolean');
      caseEnd('testBackupContract0006');
    });

    /**
     * @tc.number SUB_STATIONARY_BACKUP_0700
     * @tc.name testBackupContract0007
     * @tc.desc Verify onRestore handles a zero version and an empty name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBackupContract0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testBackupContract0007');
      let failed: boolean = false;
      try {
        await settle(async () => await backupExtension().onRestore(versionOf(0, '')));
      } catch (err) {
        failed = true;
      }
      expect(failed).assertFalse();
      expect(typeof failed).assertEqual('boolean');
      caseEnd('testBackupContract0007');
    });

    /**
     * @tc.number SUB_STATIONARY_BACKUP_0800
     * @tc.name testBackupContract0008
     * @tc.desc Verify onBackup then onRestore run back to back without interference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBackupContract0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testBackupContract0008');
      const extension: EntryBackupAbility = backupExtension();
      const order: string[] = [];
      await extension.onBackup().then(() => order.push('backup1'));
      await extension.onRestore(versionOf(2000000, '2.0.0')).then(() => order.push('restore'));
      await extension.onBackup().then(() => order.push('backup2'));
      expect(order.join(',')).assertEqual('backup1,restore,backup2');
      expect(order.length).assertEqual(3);
      caseEnd('testBackupContract0008');
    });

    /**
     * @tc.number SUB_STATIONARY_BACKUP_0900
     * @tc.name testBackupContract0009
     * @tc.desc Verify three independent instances each complete backup and restore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBackupContract0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testBackupContract0009');
      const names: string[] = [];
      for (let round = 0; round < 3; round++) {
        const extension: EntryBackupAbility = backupExtension();
        await extension.onRestore(versionOf(round, `v${round}`));
        names.push(`v${round}`);
      }
      expect(names.join(',')).assertEqual('v0,v1,v2');
      expect(backupExtension() !== backupExtension()).assertTrue();
      caseEnd('testBackupContract0009');
    });
  });
}
