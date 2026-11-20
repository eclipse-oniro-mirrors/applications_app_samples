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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Want, wantConstant } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_OAID]';

export default function oaidWantFlagMatrixTailTest(): void {
  describe('OaidWantFlagMatrixTailTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0044
     * @tc.name      oaidWantFlagMatrix0044
     * @tc.desc      Want(flags=FLAG_AUTH_PERSISTABLE_URI_PERMISSION, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0044 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0044 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0045
     * @tc.name      oaidWantFlagMatrix0045
     * @tc.desc      Want(flags=READ|WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0045 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0045 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0046
     * @tc.name      oaidWantFlagMatrix0046
     * @tc.desc      Want(flags=READ|WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0046 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0046 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0047
     * @tc.name      oaidWantFlagMatrix0047
     * @tc.desc      Want(flags=READ|WRITE, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0047 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0047 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0048
     * @tc.name      oaidWantFlagMatrix0048
     * @tc.desc      Want(flags=READ|WRITE, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0048 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0048 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0049
     * @tc.name      oaidWantFlagMatrix0049
     * @tc.desc      Want(flags=FLAG_AUTH_READ_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0049 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0049 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0050
     * @tc.name      oaidWantFlagMatrix0050
     * @tc.desc      Want(flags=FLAG_AUTH_READ_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0050 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0050 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0051
     * @tc.name      oaidWantFlagMatrix0051
     * @tc.desc      Want(flags=FLAG_AUTH_READ_URI_PERMISSION, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0051 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0051 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0052
     * @tc.name      oaidWantFlagMatrix0052
     * @tc.desc      Want(flags=FLAG_AUTH_READ_URI_PERMISSION, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0052 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0052 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0053
     * @tc.name      oaidWantFlagMatrix0053
     * @tc.desc      Want(flags=FLAG_AUTH_WRITE_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0053 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0053 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0054
     * @tc.name      oaidWantFlagMatrix0054
     * @tc.desc      Want(flags=FLAG_AUTH_WRITE_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0054 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0054 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0055
     * @tc.name      oaidWantFlagMatrix0055
     * @tc.desc      Want(flags=FLAG_AUTH_WRITE_URI_PERMISSION, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0055 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0055 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0056
     * @tc.name      oaidWantFlagMatrix0056
     * @tc.desc      Want(flags=FLAG_AUTH_WRITE_URI_PERMISSION, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0056 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0056 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0057
     * @tc.name      oaidWantFlagMatrix0057
     * @tc.desc      Want(flags=FLAG_AUTH_PERSISTABLE_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0057 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0057 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0058
     * @tc.name      oaidWantFlagMatrix0058
     * @tc.desc      Want(flags=FLAG_AUTH_PERSISTABLE_URI_PERMISSION, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0058 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0058 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0059
     * @tc.name      oaidWantFlagMatrix0059
     * @tc.desc      Want(flags=FLAG_AUTH_PERSISTABLE_URI_PERMISSION, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0059 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0059 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0060
     * @tc.name      oaidWantFlagMatrix0060
     * @tc.desc      Want(flags=FLAG_AUTH_PERSISTABLE_URI_PERMISSION, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0060 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0060 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0061
     * @tc.name      oaidWantFlagMatrix0061
     * @tc.desc      Want(flags=READ|WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0061 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0061 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0062
     * @tc.name      oaidWantFlagMatrix0062
     * @tc.desc      Want(flags=READ|WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0062 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0062 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0063
     * @tc.name      oaidWantFlagMatrix0063
     * @tc.desc      Want(flags=READ|WRITE, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0063 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0063 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_FLAG_0064
     * @tc.name      oaidWantFlagMatrix0064
     * @tc.desc      Want(flags=READ|WRITE, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantFlagMatrix0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0064 begin');
      const wantBundle: string = 'com.samples.oaid.debug';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantFlagMatrix0064 end');
    })
  })
}
