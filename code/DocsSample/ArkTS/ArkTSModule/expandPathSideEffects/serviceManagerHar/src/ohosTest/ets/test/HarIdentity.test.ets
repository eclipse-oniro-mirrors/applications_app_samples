/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { serviceManager as viaBarrel } from '../../../../Index';
import { serviceManager as viaBarrelAgain } from '../../../../Index';
import { serviceManager as servicePath } from '../../../main/ets/ServiceManager';
import { serviceManager as servicePathAgain } from '../../../main/ets/ServiceManager';
import { serviceManager as opPath } from '../../../main/ets/OpServiceManager';
import { serviceManager as opPathAgain } from '../../../main/ets/OpServiceManager';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandPathSideEffects_Har]';
const BARREL_AT_LOAD: boolean = viaBarrel.inited;
const SERVICE_AT_LOAD: boolean = servicePath.inited;
const OP_AT_LOAD: boolean = opPath.inited;

export default function harIdentityTest(): void {
  describe('HarIdentityTest', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_ID_0100
     * @tc.name      testAllSourcesInitialized0001
     * @tc.desc      With the entry imported, barrel, ServiceManager path and OpServiceManager are all initialized
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAllSourcesInitialized0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAllSourcesInitialized0001 begin');
      hilog.info(DOMAIN, TAG, '%{public}s',
        'barrel=' + String(BARREL_AT_LOAD) + ', service=' + String(SERVICE_AT_LOAD) + ', op=' + String(OP_AT_LOAD));
      expect(BARREL_AT_LOAD).assertTrue();
      expect(SERVICE_AT_LOAD).assertTrue();
      expect(OP_AT_LOAD).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAllSourcesInitialized0001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_ID_0200
     * @tc.name      testBarrelAndServiceSameInstance0002
     * @tc.desc      The entry re-export and the direct ServiceManager path resolve to one instance
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBarrelAndServiceSameInstance0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelAndServiceSameInstance0002 begin');
      expect(viaBarrel === servicePath).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelAndServiceSameInstance0002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_ID_0300
     * @tc.name      testBarrelAndOpDistinct0003
     * @tc.desc      The entry instance and the OpServiceManager instance are different objects
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBarrelAndOpDistinct0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelAndOpDistinct0003 begin');
      expect(viaBarrel === opPath).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelAndOpDistinct0003 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_ID_0400
     * @tc.name      testServiceAndOpDistinct0004
     * @tc.desc      The two declared ServiceManager classes produce distinct singleton instances
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testServiceAndOpDistinct0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testServiceAndOpDistinct0004 begin');
      expect(servicePath === opPath).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testServiceAndOpDistinct0004 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_ID_0500
     * @tc.name      testBarrelAliasesSame0005
     * @tc.desc      Importing the entry twice returns the same cached instance
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBarrelAliasesSame0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelAliasesSame0005 begin');
      expect(viaBarrel === viaBarrelAgain).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBarrelAliasesSame0005 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_ID_0600
     * @tc.name      testServiceAliasesSame0006
     * @tc.desc      Importing the ServiceManager path twice returns the same cached instance
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testServiceAliasesSame0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testServiceAliasesSame0006 begin');
      expect(servicePath === servicePathAgain).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testServiceAliasesSame0006 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_ID_0700
     * @tc.name      testOpAliasesSame0007
     * @tc.desc      Importing the OpServiceManager path twice returns the same cached instance
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testOpAliasesSame0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpAliasesSame0007 begin');
      expect(opPath === opPathAgain).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpAliasesSame0007 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_ID_0800
     * @tc.name      testSameModuleMethodIdentity0008
     * @tc.desc      The barrel and the ServiceManager path share the very same method references
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testSameModuleMethodIdentity0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSameModuleMethodIdentity0008 begin');
      expect(viaBarrel.init === servicePath.init).assertTrue();
      expect(viaBarrel.print === servicePath.print).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSameModuleMethodIdentity0008 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_HAR_ID_0900
     * @tc.name      testDifferentModuleMethodDistinct0009
     * @tc.desc      The barrel instance and the OpServiceManager instance have different method references
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDifferentModuleMethodDistinct0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDifferentModuleMethodDistinct0009 begin');
      expect(viaBarrel.init === opPath.init).assertFalse();
      expect(viaBarrel.print === opPath.print).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDifferentModuleMethodDistinct0009 end');
    })

  })
}
