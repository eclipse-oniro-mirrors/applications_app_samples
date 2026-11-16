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
import { WifiModel } from '../../../../src/main/ets/model/WifiModel';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function wlanVolume2Resolve12Test() {
  describe('WlanVolume2Resolve12Test', () => {

    /**
     * @tc.name   testWlanVol2120001
     * @tc.number SUB_WLAN_VOL2_12_0001
     * @tc.desc   Verify model.resolveIP(1600176000) equals \'16:00:176:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2120001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120001 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600176000)), String('16:00:176:000'));
      expect(model.resolveIP(1600176000)).assertEqual('16:00:176:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600176000).split(':').length), String(4));
      expect(model.resolveIP(1600176000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600176000).length), String(13));
      expect(model.resolveIP(1600176000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120001 end');
    })

    /**
     * @tc.name   testWlanVol2120002
     * @tc.number SUB_WLAN_VOL2_12_0002
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2120002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120002 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600177000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('177'));
      expect(result.split(':')[2]).assertEqual('177');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120002 end');
    })

    /**
     * @tc.name   testWlanVol2120003
     * @tc.number SUB_WLAN_VOL2_12_0003
     * @tc.desc   Verify model.resolveIP(1600178000) equals \'16:00:178:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2120003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120003 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600178000)), String('16:00:178:000'));
      expect(model.resolveIP(1600178000)).assertEqual('16:00:178:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600178000).split(':').length), String(4));
      expect(model.resolveIP(1600178000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600178000).length), String(13));
      expect(model.resolveIP(1600178000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120003 end');
    })

    /**
     * @tc.name   testWlanVol2120004
     * @tc.number SUB_WLAN_VOL2_12_0004
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2120004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120004 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600179000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('179'));
      expect(result.split(':')[2]).assertEqual('179');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120004 end');
    })

    /**
     * @tc.name   testWlanVol2120005
     * @tc.number SUB_WLAN_VOL2_12_0005
     * @tc.desc   Verify model.resolveIP(1600180000) equals \'16:00:180:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2120005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120005 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600180000)), String('16:00:180:000'));
      expect(model.resolveIP(1600180000)).assertEqual('16:00:180:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600180000).split(':').length), String(4));
      expect(model.resolveIP(1600180000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600180000).length), String(13));
      expect(model.resolveIP(1600180000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120005 end');
    })

    /**
     * @tc.name   testWlanVol2120006
     * @tc.number SUB_WLAN_VOL2_12_0006
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2120006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120006 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600181000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('181'));
      expect(result.split(':')[2]).assertEqual('181');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120006 end');
    })

    /**
     * @tc.name   testWlanVol2120007
     * @tc.number SUB_WLAN_VOL2_12_0007
     * @tc.desc   Verify model.resolveIP(1600182000) equals \'16:00:182:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2120007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120007 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600182000)), String('16:00:182:000'));
      expect(model.resolveIP(1600182000)).assertEqual('16:00:182:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600182000).split(':').length), String(4));
      expect(model.resolveIP(1600182000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600182000).length), String(13));
      expect(model.resolveIP(1600182000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120007 end');
    })

    /**
     * @tc.name   testWlanVol2120008
     * @tc.number SUB_WLAN_VOL2_12_0008
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2120008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120008 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600183000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('183'));
      expect(result.split(':')[2]).assertEqual('183');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120008 end');
    })

    /**
     * @tc.name   testWlanVol2120009
     * @tc.number SUB_WLAN_VOL2_12_0009
     * @tc.desc   Verify model.resolveIP(1600184000) equals \'16:00:184:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2120009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120009 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600184000)), String('16:00:184:000'));
      expect(model.resolveIP(1600184000)).assertEqual('16:00:184:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600184000).split(':').length), String(4));
      expect(model.resolveIP(1600184000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600184000).length), String(13));
      expect(model.resolveIP(1600184000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120009 end');
    })

    /**
     * @tc.name   testWlanVol2120010
     * @tc.number SUB_WLAN_VOL2_12_0010
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2120010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120010 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600185000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('185'));
      expect(result.split(':')[2]).assertEqual('185');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120010 end');
    })

    /**
     * @tc.name   testWlanVol2120011
     * @tc.number SUB_WLAN_VOL2_12_0011
     * @tc.desc   Verify model.resolveIP(1600186000) equals \'16:00:186:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2120011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120011 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600186000)), String('16:00:186:000'));
      expect(model.resolveIP(1600186000)).assertEqual('16:00:186:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600186000).split(':').length), String(4));
      expect(model.resolveIP(1600186000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600186000).length), String(13));
      expect(model.resolveIP(1600186000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120011 end');
    })

    /**
     * @tc.name   testWlanVol2120012
     * @tc.number SUB_WLAN_VOL2_12_0012
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2120012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120012 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600187000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('187'));
      expect(result.split(':')[2]).assertEqual('187');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120012 end');
    })

    /**
     * @tc.name   testWlanVol2120013
     * @tc.number SUB_WLAN_VOL2_12_0013
     * @tc.desc   Verify model.resolveIP(1600188000) equals \'16:00:188:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2120013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120013 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600188000)), String('16:00:188:000'));
      expect(model.resolveIP(1600188000)).assertEqual('16:00:188:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600188000).split(':').length), String(4));
      expect(model.resolveIP(1600188000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600188000).length), String(13));
      expect(model.resolveIP(1600188000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120013 end');
    })

    /**
     * @tc.name   testWlanVol2120014
     * @tc.number SUB_WLAN_VOL2_12_0014
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2120014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120014 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600189000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('189'));
      expect(result.split(':')[2]).assertEqual('189');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120014 end');
    })

    /**
     * @tc.name   testWlanVol2120015
     * @tc.number SUB_WLAN_VOL2_12_0015
     * @tc.desc   Verify model.resolveIP(1600190000) equals \'16:00:190:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2120015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120015 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600190000)), String('16:00:190:000'));
      expect(model.resolveIP(1600190000)).assertEqual('16:00:190:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600190000).split(':').length), String(4));
      expect(model.resolveIP(1600190000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600190000).length), String(13));
      expect(model.resolveIP(1600190000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120015 end');
    })

    /**
     * @tc.name   testWlanVol2120016
     * @tc.number SUB_WLAN_VOL2_12_0016
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2120016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120016 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600191000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('191'));
      expect(result.split(':')[2]).assertEqual('191');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2120016 end');
    })
  })
}
