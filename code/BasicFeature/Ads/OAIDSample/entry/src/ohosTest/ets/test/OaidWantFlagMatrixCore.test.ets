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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Want, wantConstant } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_OAID]';

export default function oaidWantFlagMatrixCoreTest(): void {
  describe('OaidWantFlagMatrixCoreTest', () => {
    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0001
     * @tc.name      oaidWantFlagMatrix0001
     * @tc.desc      Want(flags=FLAG_AUTH_READ_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0001 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0001 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0002
     * @tc.name      oaidWantFlagMatrix0002
     * @tc.desc      Want(flags=FLAG_AUTH_READ_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0002 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0002 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0003
     * @tc.name      oaidWantFlagMatrix0003
     * @tc.desc      Want(flags=FLAG_AUTH_READ_URI_PERMISSION, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0003 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home',
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0003 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0004
     * @tc.name      oaidWantFlagMatrix0004
     * @tc.desc      Want(flags=FLAG_AUTH_READ_URI_PERMISSION, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0004 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION;
      const wantEntities: Array<string> = [
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0004 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0005
     * @tc.name      oaidWantFlagMatrix0005
     * @tc.desc      Want(flags=FLAG_AUTH_WRITE_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0005 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0005 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0006
     * @tc.name      oaidWantFlagMatrix0006
     * @tc.desc      Want(flags=FLAG_AUTH_WRITE_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0006 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0006 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0007
     * @tc.name      oaidWantFlagMatrix0007
     * @tc.desc      Want(flags=FLAG_AUTH_WRITE_URI_PERMISSION, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0007 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home',
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0007 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0008
     * @tc.name      oaidWantFlagMatrix0008
     * @tc.desc      Want(flags=FLAG_AUTH_WRITE_URI_PERMISSION, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0008 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0008 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0009
     * @tc.name      oaidWantFlagMatrix0009
     * @tc.desc      Want(flags=FLAG_AUTH_PERSISTABLE_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0009 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0009 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0010
     * @tc.name      oaidWantFlagMatrix0010
     * @tc.desc      Want(flags=FLAG_AUTH_PERSISTABLE_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0010 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0010 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0011
     * @tc.name      oaidWantFlagMatrix0011
     * @tc.desc      Want(flags=FLAG_AUTH_PERSISTABLE_URI_PERMISSION, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0011 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home',
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0011 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0012
     * @tc.name      oaidWantFlagMatrix0012
     * @tc.desc      Want(flags=FLAG_AUTH_PERSISTABLE_URI_PERMISSION, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0012 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION;
      const wantEntities: Array<string> = [
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0012 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0013
     * @tc.name      oaidWantFlagMatrix0013
     * @tc.desc      Want(flags=READ|WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0013 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION | wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0013 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0014
     * @tc.name      oaidWantFlagMatrix0014
     * @tc.desc      Want(flags=READ|WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0014 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION | wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0014 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0015
     * @tc.name      oaidWantFlagMatrix0015
     * @tc.desc      Want(flags=READ|WRITE, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0015 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION | wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home',
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0015 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0016
     * @tc.name      oaidWantFlagMatrix0016
     * @tc.desc      Want(flags=READ|WRITE, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0016 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION | wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0016 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0017
     * @tc.name      oaidWantFlagMatrix0017
     * @tc.desc      Want(flags=FLAG_AUTH_READ_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0017 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0017 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0018
     * @tc.name      oaidWantFlagMatrix0018
     * @tc.desc      Want(flags=FLAG_AUTH_READ_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0018 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0018 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0019
     * @tc.name      oaidWantFlagMatrix0019
     * @tc.desc      Want(flags=FLAG_AUTH_READ_URI_PERMISSION, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0019 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home',
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0019 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0020
     * @tc.name      oaidWantFlagMatrix0020
     * @tc.desc      Want(flags=FLAG_AUTH_READ_URI_PERMISSION, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0020 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION;
      const wantEntities: Array<string> = [
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0020 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0021
     * @tc.name      oaidWantFlagMatrix0021
     * @tc.desc      Want(flags=FLAG_AUTH_WRITE_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0021 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0021 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0022
     * @tc.name      oaidWantFlagMatrix0022
     * @tc.desc      Want(flags=FLAG_AUTH_WRITE_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0022 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0022 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0023
     * @tc.name      oaidWantFlagMatrix0023
     * @tc.desc      Want(flags=FLAG_AUTH_WRITE_URI_PERMISSION, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0023 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home',
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0023 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0024
     * @tc.name      oaidWantFlagMatrix0024
     * @tc.desc      Want(flags=FLAG_AUTH_WRITE_URI_PERMISSION, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0024 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0024 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0025
     * @tc.name      oaidWantFlagMatrix0025
     * @tc.desc      Want(flags=FLAG_AUTH_PERSISTABLE_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0025 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0025 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0026
     * @tc.name      oaidWantFlagMatrix0026
     * @tc.desc      Want(flags=FLAG_AUTH_PERSISTABLE_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0026 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0026 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0027
     * @tc.name      oaidWantFlagMatrix0027
     * @tc.desc      Want(flags=FLAG_AUTH_PERSISTABLE_URI_PERMISSION, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0027 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home',
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0027 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0028
     * @tc.name      oaidWantFlagMatrix0028
     * @tc.desc      Want(flags=FLAG_AUTH_PERSISTABLE_URI_PERMISSION, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0028 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION;
      const wantEntities: Array<string> = [
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0028 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0029
     * @tc.name      oaidWantFlagMatrix0029
     * @tc.desc      Want(flags=READ|WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0029 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION | wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0029 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0030
     * @tc.name      oaidWantFlagMatrix0030
     * @tc.desc      Want(flags=READ|WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0030 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION | wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0030 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0031
     * @tc.name      oaidWantFlagMatrix0031
     * @tc.desc      Want(flags=READ|WRITE, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0031 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION | wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home',
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0031 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0032
     * @tc.name      oaidWantFlagMatrix0032
     * @tc.desc      Want(flags=READ|WRITE, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0032 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION | wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0032 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0033
     * @tc.name      oaidWantFlagMatrix0033
     * @tc.desc      Want(flags=FLAG_AUTH_READ_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0033 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0033 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0034
     * @tc.name      oaidWantFlagMatrix0034
     * @tc.desc      Want(flags=FLAG_AUTH_READ_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0034 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0034 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0035
     * @tc.name      oaidWantFlagMatrix0035
     * @tc.desc      Want(flags=FLAG_AUTH_READ_URI_PERMISSION, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0035 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home',
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0035 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0036
     * @tc.name      oaidWantFlagMatrix0036
     * @tc.desc      Want(flags=FLAG_AUTH_READ_URI_PERMISSION, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0036 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION;
      const wantEntities: Array<string> = [
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0036 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0037
     * @tc.name      oaidWantFlagMatrix0037
     * @tc.desc      Want(flags=FLAG_AUTH_WRITE_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0037 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0037 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0038
     * @tc.name      oaidWantFlagMatrix0038
     * @tc.desc      Want(flags=FLAG_AUTH_WRITE_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0038 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0038 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0039
     * @tc.name      oaidWantFlagMatrix0039
     * @tc.desc      Want(flags=FLAG_AUTH_WRITE_URI_PERMISSION, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0039 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home',
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0039 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0040
     * @tc.name      oaidWantFlagMatrix0040
     * @tc.desc      Want(flags=FLAG_AUTH_WRITE_URI_PERMISSION, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0040 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const wantEntities: Array<string> = [
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0040 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0041
     * @tc.name      oaidWantFlagMatrix0041
     * @tc.desc      Want(flags=FLAG_AUTH_PERSISTABLE_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0041 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0041 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0042
     * @tc.name      oaidWantFlagMatrix0042
     * @tc.desc      Want(flags=FLAG_AUTH_PERSISTABLE_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0042 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0042 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0043
     * @tc.name      oaidWantFlagMatrix0043
     * @tc.desc      Want(flags=FLAG_AUTH_PERSISTABLE_URI_PERMISSION, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0043 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
      const wantAbility: string = 'EntryAbility';
      const wantFlags: number =
        wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION;
      const wantEntities: Array<string> = [
        'entity.system.home',
        'entity.system.browsable'
      ];
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        flags: wantFlags,
        entities: wantEntities
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual5: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0043 end');
    })
  })
}
