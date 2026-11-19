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
const TAG: string = '[Sample_BundleManagement]';

export default function sampleWantFlagMatrixCoreTest(): void {
  describe('SampleWantFlagMatrixCoreTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0001
     * @tc.name      sampleWantFlagMatrix0001
     * @tc.desc      Want(flags=READ, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0001 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0001 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0002
     * @tc.name      sampleWantFlagMatrix0002
     * @tc.desc      Want(flags=READ, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0002 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0002 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0003
     * @tc.name      sampleWantFlagMatrix0003
     * @tc.desc      Want(flags=READ, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0003 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0003 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0004
     * @tc.name      sampleWantFlagMatrix0004
     * @tc.desc      Want(flags=READ, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0004 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0004 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0005
     * @tc.name      sampleWantFlagMatrix0005
     * @tc.desc      Want(flags=WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0005 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0005 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0006
     * @tc.name      sampleWantFlagMatrix0006
     * @tc.desc      Want(flags=WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0006 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0006 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0007
     * @tc.name      sampleWantFlagMatrix0007
     * @tc.desc      Want(flags=WRITE, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0007 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0007 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0008
     * @tc.name      sampleWantFlagMatrix0008
     * @tc.desc      Want(flags=WRITE, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0008 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0008 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0009
     * @tc.name      sampleWantFlagMatrix0009
     * @tc.desc      Want(flags=PERSIST, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0009 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0009 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0010
     * @tc.name      sampleWantFlagMatrix0010
     * @tc.desc      Want(flags=PERSIST, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0010 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0010 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0011
     * @tc.name      sampleWantFlagMatrix0011
     * @tc.desc      Want(flags=PERSIST, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0011 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0011 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0012
     * @tc.name      sampleWantFlagMatrix0012
     * @tc.desc      Want(flags=PERSIST, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0012 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0012 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0013
     * @tc.name      sampleWantFlagMatrix0013
     * @tc.desc      Want(flags=READ|WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0013 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0013 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0014
     * @tc.name      sampleWantFlagMatrix0014
     * @tc.desc      Want(flags=READ|WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0014 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0014 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0015
     * @tc.name      sampleWantFlagMatrix0015
     * @tc.desc      Want(flags=READ|WRITE, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0015 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0015 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0016
     * @tc.name      sampleWantFlagMatrix0016
     * @tc.desc      Want(flags=READ|WRITE, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0016 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0016 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0017
     * @tc.name      sampleWantFlagMatrix0017
     * @tc.desc      Want(flags=READ, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0017 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0017 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0018
     * @tc.name      sampleWantFlagMatrix0018
     * @tc.desc      Want(flags=READ, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0018 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0018 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0019
     * @tc.name      sampleWantFlagMatrix0019
     * @tc.desc      Want(flags=READ, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0019 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0019 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0020
     * @tc.name      sampleWantFlagMatrix0020
     * @tc.desc      Want(flags=READ, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0020 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0020 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0021
     * @tc.name      sampleWantFlagMatrix0021
     * @tc.desc      Want(flags=WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0021 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0021 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0022
     * @tc.name      sampleWantFlagMatrix0022
     * @tc.desc      Want(flags=WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0022 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0022 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0023
     * @tc.name      sampleWantFlagMatrix0023
     * @tc.desc      Want(flags=WRITE, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0023 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0023 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0024
     * @tc.name      sampleWantFlagMatrix0024
     * @tc.desc      Want(flags=WRITE, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0024 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0024 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0025
     * @tc.name      sampleWantFlagMatrix0025
     * @tc.desc      Want(flags=PERSIST, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0025 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0025 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0026
     * @tc.name      sampleWantFlagMatrix0026
     * @tc.desc      Want(flags=PERSIST, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0026 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0026 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0027
     * @tc.name      sampleWantFlagMatrix0027
     * @tc.desc      Want(flags=PERSIST, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0027 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0027 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0028
     * @tc.name      sampleWantFlagMatrix0028
     * @tc.desc      Want(flags=PERSIST, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0028 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0028 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0029
     * @tc.name      sampleWantFlagMatrix0029
     * @tc.desc      Want(flags=READ|WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0029 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0029 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0030
     * @tc.name      sampleWantFlagMatrix0030
     * @tc.desc      Want(flags=READ|WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0030 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0030 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0031
     * @tc.name      sampleWantFlagMatrix0031
     * @tc.desc      Want(flags=READ|WRITE, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0031 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0031 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0032
     * @tc.name      sampleWantFlagMatrix0032
     * @tc.desc      Want(flags=READ|WRITE, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0032 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0032 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0033
     * @tc.name      sampleWantFlagMatrix0033
     * @tc.desc      Want(flags=READ, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0033 begin');
      const wantBundle: string = 'com.samples.bundle.query';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0033 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0034
     * @tc.name      sampleWantFlagMatrix0034
     * @tc.desc      Want(flags=READ, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0034 begin');
      const wantBundle: string = 'com.samples.bundle.query';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0034 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0035
     * @tc.name      sampleWantFlagMatrix0035
     * @tc.desc      Want(flags=READ, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0035 begin');
      const wantBundle: string = 'com.samples.bundle.query';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0035 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0036
     * @tc.name      sampleWantFlagMatrix0036
     * @tc.desc      Want(flags=READ, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0036 begin');
      const wantBundle: string = 'com.samples.bundle.query';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0036 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0037
     * @tc.name      sampleWantFlagMatrix0037
     * @tc.desc      Want(flags=WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0037 begin');
      const wantBundle: string = 'com.samples.bundle.query';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0037 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0038
     * @tc.name      sampleWantFlagMatrix0038
     * @tc.desc      Want(flags=WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0038 begin');
      const wantBundle: string = 'com.samples.bundle.query';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0038 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0039
     * @tc.name      sampleWantFlagMatrix0039
     * @tc.desc      Want(flags=WRITE, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0039 begin');
      const wantBundle: string = 'com.samples.bundle.query';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0039 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0040
     * @tc.name      sampleWantFlagMatrix0040
     * @tc.desc      Want(flags=WRITE, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0040 begin');
      const wantBundle: string = 'com.samples.bundle.query';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0040 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0041
     * @tc.name      sampleWantFlagMatrix0041
     * @tc.desc      Want(flags=PERSIST, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0041 begin');
      const wantBundle: string = 'com.samples.bundle.query';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0041 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0042
     * @tc.name      sampleWantFlagMatrix0042
     * @tc.desc      Want(flags=PERSIST, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0042 begin');
      const wantBundle: string = 'com.samples.bundle.query';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0042 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0043
     * @tc.name      sampleWantFlagMatrix0043
     * @tc.desc      Want(flags=PERSIST, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0043 begin');
      const wantBundle: string = 'com.samples.bundle.query';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(2);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable|entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0043 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0044
     * @tc.name      sampleWantFlagMatrix0044
     * @tc.desc      Want(flags=PERSIST, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0044 begin');
      const wantBundle: string = 'com.samples.bundle.query';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(0);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0044 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0045
     * @tc.name      sampleWantFlagMatrix0045
     * @tc.desc      Want(flags=READ|WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0045 begin');
      const wantBundle: string = 'com.samples.bundle.query';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0045 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_FLAG_0046
     * @tc.name      sampleWantFlagMatrix0046
     * @tc.desc      Want(flags=READ|WRITE, entities=1) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0046 begin');
      const wantBundle: string = 'com.samples.bundle.query';
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
      const flagsRead: number = want.flags ?? 0;
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 flagsRead=${flagsRead}`);
      expect(flagsRead).assertEqual(wantFlags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 entitiesRead.length=${entitiesRead.length}`);
      expect(entitiesRead.length).assertEqual(1);
      const actual4: string = entitiesRead.slice().sort().join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('entity.system.browsable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0046 end');
    })
  })
}
