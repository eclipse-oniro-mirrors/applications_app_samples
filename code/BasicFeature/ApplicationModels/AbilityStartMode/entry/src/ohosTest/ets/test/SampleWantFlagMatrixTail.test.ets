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
const TAG: string = '[Sample_StartMode]';

export default function sampleWantFlagMatrixTailTest(): void {
  describe('SampleWantFlagMatrixTailTest', () => {
    /**
     * @tc.number    SUB_START_MODE_WANT_FLAG_0047
     * @tc.name      sampleWantFlagMatrix0047
     * @tc.desc      Want(flags=READ|WRITE, entities=2) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0047 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0047 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_FLAG_0048
     * @tc.name      sampleWantFlagMatrix0048
     * @tc.desc      Want(flags=READ|WRITE, entities=0) 字段可读且取值与写入一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantFlagMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0048 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantFlagMatrix0048 end');
    })
  })
}
