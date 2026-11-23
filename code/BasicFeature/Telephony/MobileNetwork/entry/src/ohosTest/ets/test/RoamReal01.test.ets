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

// RoamReal01 套件：覆盖合法槽位档 {0,1}（设备状态依赖，无法进常量表）与边界非法输入。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { NetworkMobile } from '../../../../src/main/ets/model/NetworkMobile';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MobileNetwork_RoamReal01]';

export default function roamReal01Test() {
  describe('RoamReal01Test', () => {

    /**
     * @tc.number SUB_MOBILENETWORK_ROAM_0058
     * @tc.name testRoam0058
     * @tc.desc slotId=-1 紧邻合法域 {0,1} 下界之外，映射为 false
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRoam0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0058 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const roam: boolean = await sut.isCellularDataRoamingEnabled(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(roam));
      expect(roam).assertEqual(false);
      expect(typeof roam).assertEqual('boolean');
      expect(roam === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0058 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_ROAM_0059
     * @tc.name testRoam0059
     * @tc.desc 合法槽位 0 无论设备状态如何都返回布尔值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRoam0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0059 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const roam: boolean = await sut.isCellularDataRoamingEnabled(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(roam));
      expect(typeof roam).assertEqual('boolean');
      expect(roam === true || roam === false).assertTrue();
      expect(String(roam) === 'true' || String(roam) === 'false').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0059 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_ROAM_0060
     * @tc.name testRoam0060
     * @tc.desc 合法槽位 1 两次查询结果一致且为布尔值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRoam0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0060 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const r1: boolean = await sut.isCellularDataRoamingEnabled(1);
      const r2: boolean = await sut.isCellularDataRoamingEnabled(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'r1=%{public}s r2=%{public}s', String(r1), String(r2));
      expect(typeof r1).assertEqual('boolean');
      expect(r1 === r2).assertTrue();
      expect(r2 === true || r2 === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0060 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_ROAM_0061
     * @tc.name testRoam0061
     * @tc.desc INT32_MIN 槽位输入映射为 false 且字符串化一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRoam0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0061 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const roam: boolean = await sut.isCellularDataRoamingEnabled(-2147483648);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(roam));
      expect(roam).assertEqual(false);
      expect(typeof roam).assertEqual('boolean');
      expect(String(roam)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0061 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_ROAM_0062
     * @tc.name testRoam0062
     * @tc.desc INT32_MAX 槽位输入映射为 false 且数值化投影为 0
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRoam0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0062 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const roam: boolean = await sut.isCellularDataRoamingEnabled(2147483647);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(roam));
      expect(roam).assertEqual(false);
      expect(Number(roam)).assertEqual(0);
      expect(typeof roam).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0062 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_ROAM_0063
     * @tc.name testRoam0063
     * @tc.desc 合法槽位 0 连续两次查询一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRoam0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0063 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const r1: boolean = await sut.isCellularDataRoamingEnabled(0);
      const r2: boolean = await sut.isCellularDataRoamingEnabled(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'r1=%{public}s r2=%{public}s', String(r1), String(r2));
      expect(r1 === r2).assertTrue();
      expect(typeof r1).assertEqual('boolean');
      expect(typeof r2).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0063 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_ROAM_0064
     * @tc.name testRoam0064
     * @tc.desc 非法槽位 -1 连续三次查询结果两两一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRoam0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0064 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const r1: boolean = await sut.isCellularDataRoamingEnabled(-1);
      const r2: boolean = await sut.isCellularDataRoamingEnabled(-1);
      const r3: boolean = await sut.isCellularDataRoamingEnabled(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'r1=%{public}s r2=%{public}s r3=%{public}s', String(r1), String(r2), String(r3));
      expect(r1 === r2).assertTrue();
      expect(r2 === r3).assertTrue();
      expect(r1 === r3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0064 end');
    })
  })
}
