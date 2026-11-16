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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import WifiDataSource from '../../../../src/main/ets/component/BasicDataSource';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function wlanDataSourceContractTest() {
  describe('WlanDataSourceContractTest', () => {

    /**
     * @tc.name   testWlanDataSourceEmpty0001
     * @tc.number SUB_WLAN_DATASOURCE_0001
     * @tc.desc   Create an empty Wi-Fi data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourceEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourceEmpty0001 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(0);');
      expect(source.totalCount()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0) === undefined).assertTrue();');
      expect(source.getData(0) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount() >= 0).assertTrue();');
      expect(source.totalCount() >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourceEmpty0001 end');
    })

    /**
     * @tc.name   testWlanDataSourceReload0002
     * @tc.number SUB_WLAN_DATASOURCE_0002
     * @tc.desc   Reload an empty data source without listeners.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourceReload0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourceReload0002 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      source.notifyDataReload();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(0);');
      expect(source.totalCount()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1) === undefined).assertTrue();');
      expect(source.getData(1) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourceReload0002 end');
    })

    /**
     * @tc.name   testWlanDataSourceAdd0003
     * @tc.number SUB_WLAN_DATASOURCE_0003
     * @tc.desc   Notify an add operation on an empty data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourceAdd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourceAdd0003 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      source.notifyDataAdd(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(0);');
      expect(source.totalCount()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(-1) === undefined).assertTrue();');
      expect(source.getData(-1) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourceAdd0003 end');
    })

    /**
     * @tc.name   testWlanDataSourceChange0004
     * @tc.number SUB_WLAN_DATASOURCE_0004
     * @tc.desc   Notify a change operation on an empty data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourceChange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourceChange0004 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      source.notifyDataChange(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(0);');
      expect(source.totalCount()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0) === undefined).assertTrue();');
      expect(source.getData(0) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourceChange0004 end');
    })

    /**
     * @tc.name   testWlanDataSourceDelete0005
     * @tc.number SUB_WLAN_DATASOURCE_0005
     * @tc.desc   Notify a delete operation on an empty data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourceDelete0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourceDelete0005 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      source.notifyDataDelete(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(0);');
      expect(source.totalCount()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0) === undefined).assertTrue();');
      expect(source.getData(0) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourceDelete0005 end');
    })

    /**
     * @tc.name   testWlanDataSourceMove0006
     * @tc.number SUB_WLAN_DATASOURCE_0006
     * @tc.desc   Notify a move operation on an empty data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourceMove0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourceMove0006 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      source.notifyDataMove(0, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(0);');
      expect(source.totalCount()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(2) === undefined).assertTrue();');
      expect(source.getData(2) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourceMove0006 end');
    })
  })
}
