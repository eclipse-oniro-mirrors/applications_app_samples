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
import {
  describe,
  it,
  expect,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  TestType,
  Size,
  Level
} from '@ohos/hypium';
import EntryAbility from '../../../main/ets/entryability/EntryAbility';
import EntryBackupAbility from '../../../main/ets/entrybackupability/EntryBackupAbility';
import MetadataLogger from '../../../main/ets/model/MetadataLogger';
import { BundleVersion } from '@kit.CoreFileKit';
import { MockKit } from '@ohos/hamock';

export default function abilityTest(): void {
  describe('abilityTest', (): void => {
    let mockKit: MockKit = new MockKit();
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      const yieldDelayMs: number = 30;
      await new Promise<void>((resolve): void => {
        setTimeout((): void => {
          resolve();
        }, yieldDelayMs);
      });
      mockKit = new MockKit();
    });
    afterEach((): void => {
      mockKit.clear(MetadataLogger);
      mockKit.clearAll();
    });
    afterAll((): void => {});
    /**
     * @tc.number SUB_METADATA_BINDING_ABILITY_0100
     * @tc.name entryAbilityLifecycle001
     * @tc.desc Verify EntryAbility.onDestroy emits the exact lifecycle log once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('entryAbilityLifecycle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      mockKit.mockFunc(MetadataLogger, MetadataLogger.info);
      const ability = new EntryAbility();
      ability.onDestroy();
      mockKit.verify('info', [0x0000, 'testTag', '%{public}s', 'Ability onDestroy']).once();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ABILITY_0200
     * @tc.name entryAbilityLifecycle002
     * @tc.desc Verify EntryAbility.onWindowStageDestroy emits the exact lifecycle log once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('entryAbilityLifecycle002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      mockKit.mockFunc(MetadataLogger, MetadataLogger.info);
      const ability = new EntryAbility();
      ability.onWindowStageDestroy();
      mockKit.verify('info', [0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy']).once();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ABILITY_0300
     * @tc.name entryAbilityLifecycle003
     * @tc.desc Verify EntryAbility.onForeground emits the exact lifecycle log once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('entryAbilityLifecycle003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      mockKit.mockFunc(MetadataLogger, MetadataLogger.info);
      const ability = new EntryAbility();
      ability.onForeground();
      mockKit.verify('info', [0x0000, 'testTag', '%{public}s', 'Ability onForeground']).once();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_ABILITY_0400
     * @tc.name entryAbilityLifecycle004
     * @tc.desc Verify EntryAbility.onBackground emits the exact lifecycle log once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('entryAbilityLifecycle004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      mockKit.mockFunc(MetadataLogger, MetadataLogger.info);
      const ability = new EntryAbility();
      ability.onBackground();
      mockKit.verify('info', [0x0000, 'testTag', '%{public}s', 'Ability onBackground']).once();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_BACKUP_0100
     * @tc.name backupLifecycle001
     * @tc.desc Verify EntryBackupAbility.onBackup resolves after the expected log
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('backupLifecycle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      mockKit.mockFunc(MetadataLogger, MetadataLogger.info);
      const ability = new EntryBackupAbility();
      await ability.onBackup();
      mockKit.verify('info', [0x0000, 'testTag', 'onBackup ok']).once();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_BACKUP_0200
     * @tc.name backupLifecycle002
     * @tc.desc Verify EntryBackupAbility.onRestore logs the supplied version without mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('backupLifecycle002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      mockKit.mockFunc(MetadataLogger, MetadataLogger.info);
      const version: BundleVersion = { name: '1.0.0', code: 1000000 };
      const originalVersion: string = JSON.stringify(version);
      const ability = new EntryBackupAbility();
      await ability.onRestore(version);
      const actualVersion: string = JSON.stringify(version);
      expect(actualVersion).assertEqual(originalVersion);
      mockKit.verify('info', [0x0000, 'testTag', 'onRestore ok %{public}s', originalVersion]).once();
    });

  });
}
