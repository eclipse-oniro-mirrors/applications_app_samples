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
import launchFeature from '../../../main/ets/feature/LaunchFeature';
import { arr } from './helper/VolumeSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomCommonEvent]';

export default function launchTrimVolume03Test(): void {
  describe('LaunchTrimVolume03Test', () => {

    /**
     * @tc.name   testLaunchTrimVolume030001
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0001
     * @tc.desc   记录数=41 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030001 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(41));
      expect(records.length).assertEqual(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030001 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030002
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0002
     * @tc.desc   记录数=42 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030002 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(42));
      expect(records.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030002 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030003
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0003
     * @tc.desc   记录数=43 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030003 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(43));
      expect(records.length).assertEqual(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030003 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030004
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0004
     * @tc.desc   记录数=44 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030004 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(44));
      expect(records.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030004 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030005
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0005
     * @tc.desc   记录数=45 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030005 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(45));
      expect(records.length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030005 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030006
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0006
     * @tc.desc   记录数=46 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030006 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(46));
      expect(records.length).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030006 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030007
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0007
     * @tc.desc   记录数=47 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030007 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(47));
      expect(records.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030007 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030008
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0008
     * @tc.desc   记录数=48 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030008 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(48));
      expect(records.length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030008 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030009
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0009
     * @tc.desc   记录数=49 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030009 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(49));
      expect(records.length).assertEqual(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030009 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030010
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0010
     * @tc.desc   记录数=51 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030010 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(51));
      expect(records.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030010 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030011
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0011
     * @tc.desc   记录数=52 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030011 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(52));
      expect(records.length).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030011 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030012
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0012
     * @tc.desc   记录数=53 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030012 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(53));
      expect(records.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030012 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030013
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0013
     * @tc.desc   记录数=54 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030013 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(54));
      expect(records.length).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030013 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030014
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0014
     * @tc.desc   记录数=55 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030014 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(55));
      expect(records.length).assertEqual(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030014 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030015
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0015
     * @tc.desc   记录数=56 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030015 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(56));
      expect(records.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030015 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030016
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0016
     * @tc.desc   记录数=57 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030016 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(57));
      expect(records.length).assertEqual(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030016 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030017
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0017
     * @tc.desc   记录数=58 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030017 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(58));
      expect(records.length).assertEqual(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030017 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030018
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0018
     * @tc.desc   记录数=59 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030018 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58|v59');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(59));
      expect(records.length).assertEqual(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030018 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030019
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0019
     * @tc.desc   记录数=61 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030019 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58|v59|v60|v61');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(61));
      expect(records.length).assertEqual(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030019 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030020
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0020
     * @tc.desc   记录数=62 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030020 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58|v59|v60|v61|v62');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(62));
      expect(records.length).assertEqual(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030020 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030021
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0021
     * @tc.desc   记录数=63 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030021 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58|v59|v60|v61|v62|v63');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(63));
      expect(records.length).assertEqual(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030021 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030022
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0022
     * @tc.desc   记录数=64 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030022 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58|v59|v60|v61|v62|v63|v64');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(64));
      expect(records.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030022 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030023
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0023
     * @tc.desc   记录数=65 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030023 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58|v59|v60|v61|v62|v63|v64|v65');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(65));
      expect(records.length).assertEqual(65);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030023 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030024
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0024
     * @tc.desc   记录数=66 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030024 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58|v59|v60|v61|v62|v63|v64|v65|v66');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(66));
      expect(records.length).assertEqual(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030024 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030025
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0025
     * @tc.desc   记录数=67 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030025 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58|v59|v60|v61|v62|v63|v64|v65|v66|v67');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(67));
      expect(records.length).assertEqual(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030025 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030026
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0026
     * @tc.desc   记录数=68 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030026 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58|v59|v60|v61|v62|v63|v64|v65|v66|v67|v68');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(68));
      expect(records.length).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030026 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030027
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0027
     * @tc.desc   记录数=69 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030027 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58|v59|v60|v61|v62|v63|v64|v65|v66|v67|v68|v69');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(69));
      expect(records.length).assertEqual(69);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030027 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030028
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0028
     * @tc.desc   记录数=71 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030028 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58|v59|v60|v61|v62|v63|v64|v65|v66|v67|v68|v69|v70|v71');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(71));
      expect(records.length).assertEqual(71);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030028 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030029
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0029
     * @tc.desc   记录数=72 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030029 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58|v59|v60|v61|v62|v63|v64|v65|v66|v67|v68|v69|v70|v71|v72');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(72));
      expect(records.length).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030029 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030030
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0030
     * @tc.desc   记录数=73 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030030 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58|v59|v60|v61|v62|v63|v64|v65|v66|v67|v68|v69|v70|v71|v72|v73');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(73));
      expect(records.length).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030030 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030031
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0031
     * @tc.desc   记录数=74 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030031 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58|v59|v60|v61|v62|v63|v64|v65|v66|v67|v68|v69|v70|v71|v72|v73|v74');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(74));
      expect(records.length).assertEqual(74);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030031 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030032
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0032
     * @tc.desc   记录数=75 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030032 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58|v59|v60|v61|v62|v63|v64|v65|v66|v67|v68|v69|v70|v71|v72|v73|v74|v75');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(75));
      expect(records.length).assertEqual(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030032 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030033
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0033
     * @tc.desc   记录数=76 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030033 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58|v59|v60|v61|v62|v63|v64|v65|v66|v67|v68|v69|v70|v71|v72|v73|v74|v75|v76');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(76));
      expect(records.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030033 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030034
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0034
     * @tc.desc   记录数=77 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030034 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58|v59|v60|v61|v62|v63|v64|v65|v66|v67|v68|v69|v70|v71|v72|v73|v74|v75|v76|v77');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(77));
      expect(records.length).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030034 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030035
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0035
     * @tc.desc   记录数=78 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030035 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45|v46|v47|v48|v49|v50|v51|v52|v53|v54|v55|v56|v57|v58|v59|v60|v61|v62|v63|v64|v65|v66|v67|v68|v69|v70|v71|v72|v73|v74|v75|v76|v77|v78');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(78));
      expect(records.length).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030035 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030036
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0036
     * @tc.desc   记录数=45 且第 11 条为「第11条中文值」时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030036 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|第11条中文值|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["第11条中文值"]'));
      expect(JSON.stringify(result)).assertEqual('["第11条中文值"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(45));
      expect(records.length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030036 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030037
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0037
     * @tc.desc   记录数=45 且第 11 条为「 v11 」时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030037 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10| v11 |v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[" v11 "]'));
      expect(JSON.stringify(result)).assertEqual('[" v11 "]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(45));
      expect(records.length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030037 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030038
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0038
     * @tc.desc   记录数=45 且第 11 条为「v11v11v11v11v11v11v11v11v11v11」时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030038 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v11v11v11v11v11v11v11v11v11v11|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v11v11v11v11v11v11v11v11v11v11"]'));
      expect(JSON.stringify(result)).assertEqual('["v11v11v11v11v11v11v11v11v11v11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(45));
      expect(records.length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030038 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030039
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0039
     * @tc.desc   记录数=45 且第 11 条为「v-1」时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030039 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|v-1|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v-1"]'));
      expect(JSON.stringify(result)).assertEqual('["v-1"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(45));
      expect(records.length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030039 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030040
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0040
     * @tc.desc   记录数=45 且第 11 条为「0」时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030040 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10|0|v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["0"]'));
      expect(JSON.stringify(result)).assertEqual('["0"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(45));
      expect(records.length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030040 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030041
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0041
     * @tc.desc   记录数=45 且第 11 条为「空串」时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030041 begin');
      const records: Array<string> = arr('v01|v02|v03|v04|v05|v06|v07|v08|v09|v10||v12|v13|v14|v15|v16|v17|v18|v19|v20|v21|v22|v23|v24|v25|v26|v27|v28|v29|v30|v31|v32|v33|v34|v35|v36|v37|v38|v39|v40|v41|v42|v43|v44|v45');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[""]'));
      expect(JSON.stringify(result)).assertEqual('[""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(45));
      expect(records.length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030041 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume030042
     * @tc.number SUB_CCE_LAUNCHTRIM_03_0042
     * @tc.desc   第 11 条为 120 字符超长值时裁剪原样返回，记录长度 42 不影响裁剪位置
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume030042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030042 begin');
      const records: Array<string> = arr('w01|w02|w03|w04|w05|w06|w07|w08|w09|w10|LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL|w12|w13|w14|w15|w16|w17|w18|w19|w20|w21|w22|w23|w24|w25|w26|w27|w28|w29|w30|w31|w32|w33|w34|w35|w36|w37|w38|w39|w40|w41|w42');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', JSON.stringify(result), '["LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"]');
      expect(JSON.stringify(result)).assertEqual('["LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(42));
      expect(records.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume030042 end');
    })
  })
}
