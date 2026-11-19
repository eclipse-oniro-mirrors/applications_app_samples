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

export default function wlanVolume2Resolve25Test() {
  describe('WlanVolume2Resolve25Test', () => {

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve25_0001
     * @tc.number SUB_WLAN_VOL2_25_0001
     * @tc.desc   Verify model.resolveIP(1600384000) equals \'16:00:384:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve25_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0001 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600384000)), String('16:00:384:000'));
      expect(model.resolveIP(1600384000)).assertEqual('16:00:384:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600384000).split(':').length), String(4));
      expect(model.resolveIP(1600384000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600384000).length), String(13));
      expect(model.resolveIP(1600384000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve25_0002
     * @tc.number SUB_WLAN_VOL2_25_0002
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve25_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0002 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600385000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('385'));
      expect(result.split(':')[2]).assertEqual('385');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve25_0003
     * @tc.number SUB_WLAN_VOL2_25_0003
     * @tc.desc   Verify model.resolveIP(1600386000) equals \'16:00:386:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve25_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0003 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600386000)), String('16:00:386:000'));
      expect(model.resolveIP(1600386000)).assertEqual('16:00:386:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600386000).split(':').length), String(4));
      expect(model.resolveIP(1600386000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600386000).length), String(13));
      expect(model.resolveIP(1600386000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve25_0004
     * @tc.number SUB_WLAN_VOL2_25_0004
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve25_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0004 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600387000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('387'));
      expect(result.split(':')[2]).assertEqual('387');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve25_0005
     * @tc.number SUB_WLAN_VOL2_25_0005
     * @tc.desc   Verify model.resolveIP(1600388000) equals \'16:00:388:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve25_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0005 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600388000)), String('16:00:388:000'));
      expect(model.resolveIP(1600388000)).assertEqual('16:00:388:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600388000).split(':').length), String(4));
      expect(model.resolveIP(1600388000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600388000).length), String(13));
      expect(model.resolveIP(1600388000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve25_0006
     * @tc.number SUB_WLAN_VOL2_25_0006
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve25_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0006 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600389000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('389'));
      expect(result.split(':')[2]).assertEqual('389');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0006 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve25_0007
     * @tc.number SUB_WLAN_VOL2_25_0007
     * @tc.desc   Verify model.resolveIP(1600390000) equals \'16:00:390:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve25_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0007 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600390000)), String('16:00:390:000'));
      expect(model.resolveIP(1600390000)).assertEqual('16:00:390:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600390000).split(':').length), String(4));
      expect(model.resolveIP(1600390000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600390000).length), String(13));
      expect(model.resolveIP(1600390000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0007 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve25_0008
     * @tc.number SUB_WLAN_VOL2_25_0008
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve25_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0008 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600391000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('391'));
      expect(result.split(':')[2]).assertEqual('391');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0008 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve25_0009
     * @tc.number SUB_WLAN_VOL2_25_0009
     * @tc.desc   Verify model.resolveIP(1600392000) equals \'16:00:392:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve25_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0009 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600392000)), String('16:00:392:000'));
      expect(model.resolveIP(1600392000)).assertEqual('16:00:392:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600392000).split(':').length), String(4));
      expect(model.resolveIP(1600392000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600392000).length), String(13));
      expect(model.resolveIP(1600392000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0009 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve25_0010
     * @tc.number SUB_WLAN_VOL2_25_0010
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve25_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0010 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600393000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('393'));
      expect(result.split(':')[2]).assertEqual('393');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0010 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve25_0011
     * @tc.number SUB_WLAN_VOL2_25_0011
     * @tc.desc   Verify model.resolveIP(1600394000) equals \'16:00:394:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve25_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0011 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600394000)), String('16:00:394:000'));
      expect(model.resolveIP(1600394000)).assertEqual('16:00:394:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600394000).split(':').length), String(4));
      expect(model.resolveIP(1600394000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600394000).length), String(13));
      expect(model.resolveIP(1600394000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0011 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve25_0012
     * @tc.number SUB_WLAN_VOL2_25_0012
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve25_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0012 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600395000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('395'));
      expect(result.split(':')[2]).assertEqual('395');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0012 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve25_0013
     * @tc.number SUB_WLAN_VOL2_25_0013
     * @tc.desc   Verify model.resolveIP(1600396000) equals \'16:00:396:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve25_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0013 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600396000)), String('16:00:396:000'));
      expect(model.resolveIP(1600396000)).assertEqual('16:00:396:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600396000).split(':').length), String(4));
      expect(model.resolveIP(1600396000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600396000).length), String(13));
      expect(model.resolveIP(1600396000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0013 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve25_0014
     * @tc.number SUB_WLAN_VOL2_25_0014
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve25_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0014 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600397000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('397'));
      expect(result.split(':')[2]).assertEqual('397');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0014 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve25_0015
     * @tc.number SUB_WLAN_VOL2_25_0015
     * @tc.desc   Verify model.resolveIP(1600398000) equals \'16:00:398:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve25_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0015 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600398000)), String('16:00:398:000'));
      expect(model.resolveIP(1600398000)).assertEqual('16:00:398:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600398000).split(':').length), String(4));
      expect(model.resolveIP(1600398000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600398000).length), String(13));
      expect(model.resolveIP(1600398000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0015 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve25_0016
     * @tc.number SUB_WLAN_VOL2_25_0016
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve25_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0016 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600399000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('399'));
      expect(result.split(':')[2]).assertEqual('399');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve25_0016 end');
    })
  })
}
