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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIAbility } from '@kit.AbilityKit';
import { BackupExtensionAbility } from '@kit.CoreFileKit';
import EntryAbility from '../../../main/ets/entryability/EntryAbility';
import EntryBackupAbility from '../../../main/ets/entrybackupability/EntryBackupAbility';

const DOMAIN: number = 0xF812;
const TAG: string = 'AbilityClassContractCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function abilityClassContractCoreTest(): void {
  describe('AbilityClassContractCoreTest', () => {
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ABLC_0501
     * @tc.name      testAbilityClass0501
     * @tc.desc      Verify the entry ability class can be instantiated headless.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityClass0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAbilityClass0501 begin');
      const ability: EntryAbility = new EntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ability !== null=${ability !== null}`);
      expect(ability !== null).assertTrue();
      log('testAbilityClass0501 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ABLC_0502
     * @tc.name      testAbilityClass0502
     * @tc.desc      Verify the entry ability inherits from UIAbility.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityClass0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAbilityClass0502 begin');
      const ability: EntryAbility = new EntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ability instanceof UIAbility=${ability instanceof UIAbility}`);
      expect(ability instanceof UIAbility).assertTrue();
      log('testAbilityClass0502 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ABLC_0503
     * @tc.name      testAbilityClass0503
     * @tc.desc      Verify onCreate is a callable lifecycle member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityClass0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAbilityClass0503 begin');
      const ability: EntryAbility = new EntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof ability.onCreate=${typeof ability.onCreate}`);
      expect(typeof ability.onCreate).assertEqual('function');
      log('testAbilityClass0503 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ABLC_0504
     * @tc.name      testAbilityClass0504
     * @tc.desc      Verify onDestroy is a callable lifecycle member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityClass0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAbilityClass0504 begin');
      const ability: EntryAbility = new EntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof ability.onDestroy=${typeof ability.onDestroy}`);
      expect(typeof ability.onDestroy).assertEqual('function');
      log('testAbilityClass0504 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ABLC_0505
     * @tc.name      testAbilityClass0505
     * @tc.desc      Verify onWindowStageCreate is a callable lifecycle member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityClass0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAbilityClass0505 begin');
      const ability: EntryAbility = new EntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof ability.onWindowStageCreate}`);
      expect(typeof ability.onWindowStageCreate).assertEqual('function');
      log('testAbilityClass0505 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ABLC_0506
     * @tc.name      testAbilityClass0506
     * @tc.desc      Verify onWindowStageDestroy is a callable lifecycle member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityClass0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAbilityClass0506 begin');
      const ability: EntryAbility = new EntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof ability.onWindowStageDestroy}`);
      expect(typeof ability.onWindowStageDestroy).assertEqual('function');
      log('testAbilityClass0506 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ABLC_0507
     * @tc.name      testAbilityClass0507
     * @tc.desc      Verify onForeground is a callable lifecycle member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityClass0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAbilityClass0507 begin');
      const ability: EntryAbility = new EntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof ability.onForeground=${typeof ability.onForeground}`);
      expect(typeof ability.onForeground).assertEqual('function');
      log('testAbilityClass0507 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ABLC_0508
     * @tc.name      testAbilityClass0508
     * @tc.desc      Verify onBackground is a callable lifecycle member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityClass0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAbilityClass0508 begin');
      const ability: EntryAbility = new EntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof ability.onBackground=${typeof ability.onBackground}`);
      expect(typeof ability.onBackground).assertEqual('function');
      log('testAbilityClass0508 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ABLC_0509
     * @tc.name      testAbilityClass0509
     * @tc.desc      Verify the backup ability class can be instantiated headless.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityClass0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAbilityClass0509 begin');
      const backupAbility: EntryBackupAbility = new EntryBackupAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue backupAbility !== null=${backupAbility !== null}`);
      expect(backupAbility !== null).assertTrue();
      log('testAbilityClass0509 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ABLC_0510
     * @tc.name      testAbilityClass0510
     * @tc.desc      Verify the backup ability inherits from BackupExtensionAbility.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityClass0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAbilityClass0510 begin');
      const backupAbility: EntryBackupAbility = new EntryBackupAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${backupAbility instanceof BackupExtensionAbility}`);
      expect(backupAbility instanceof BackupExtensionAbility).assertTrue();
      log('testAbilityClass0510 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ABLC_0511
     * @tc.name      testAbilityClass0511
     * @tc.desc      Verify onBackup is a callable extension member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityClass0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAbilityClass0511 begin');
      const backupAbility: EntryBackupAbility = new EntryBackupAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof backupAbility.onBackup}, expected='function'`);
      expect(typeof backupAbility.onBackup).assertEqual('function');
      log('testAbilityClass0511 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ABLC_0512
     * @tc.name      testAbilityClass0512
     * @tc.desc      Verify onRestore is a callable extension member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityClass0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAbilityClass0512 begin');
      const backupAbility: EntryBackupAbility = new EntryBackupAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof backupAbility.onRestore}`);
      expect(typeof backupAbility.onRestore).assertEqual('function');
      log('testAbilityClass0512 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ABLC_0513
     * @tc.name      testAbilityClass0513
     * @tc.desc      Verify two entry ability instantiations yield distinct objects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityClass0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAbilityClass0513 begin');
      const first: EntryAbility = new EntryAbility();
      const second: EntryAbility = new EntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse first === second=${first === second}`);
      expect(first === second).assertFalse();
      log('testAbilityClass0513 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ABLC_0514
     * @tc.name      testAbilityClass0514
     * @tc.desc      Verify repeated backup ability instantiation stays stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityClass0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAbilityClass0514 begin');
      const first: EntryBackupAbility = new EntryBackupAbility();
      const second: EntryBackupAbility = new EntryBackupAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first !== null=${first !== null}`);
      expect(first !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue second !== null=${second !== null}`);
      expect(second !== null).assertTrue();
      log('testAbilityClass0514 end');
    })
  })
}
