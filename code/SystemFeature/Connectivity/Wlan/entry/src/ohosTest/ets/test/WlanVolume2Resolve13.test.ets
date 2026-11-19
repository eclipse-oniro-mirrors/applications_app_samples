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

export default function wlanVolume2Resolve13Test() {
  describe('WlanVolume2Resolve13Test', () => {

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve13_0001
     * @tc.number SUB_WLAN_VOL2_13_0001
     * @tc.desc   Verify model.resolveIP(1600192000) equals \'16:00:192:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve13_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0001 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600192000)), String('16:00:192:000'));
      expect(model.resolveIP(1600192000)).assertEqual('16:00:192:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600192000).split(':').length), String(4));
      expect(model.resolveIP(1600192000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600192000).length), String(13));
      expect(model.resolveIP(1600192000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve13_0002
     * @tc.number SUB_WLAN_VOL2_13_0002
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve13_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0002 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600193000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('193'));
      expect(result.split(':')[2]).assertEqual('193');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve13_0003
     * @tc.number SUB_WLAN_VOL2_13_0003
     * @tc.desc   Verify model.resolveIP(1600194000) equals \'16:00:194:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve13_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0003 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600194000)), String('16:00:194:000'));
      expect(model.resolveIP(1600194000)).assertEqual('16:00:194:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600194000).split(':').length), String(4));
      expect(model.resolveIP(1600194000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600194000).length), String(13));
      expect(model.resolveIP(1600194000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve13_0004
     * @tc.number SUB_WLAN_VOL2_13_0004
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve13_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0004 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600195000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('195'));
      expect(result.split(':')[2]).assertEqual('195');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve13_0005
     * @tc.number SUB_WLAN_VOL2_13_0005
     * @tc.desc   Verify model.resolveIP(1600196000) equals \'16:00:196:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve13_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0005 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600196000)), String('16:00:196:000'));
      expect(model.resolveIP(1600196000)).assertEqual('16:00:196:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600196000).split(':').length), String(4));
      expect(model.resolveIP(1600196000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600196000).length), String(13));
      expect(model.resolveIP(1600196000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve13_0006
     * @tc.number SUB_WLAN_VOL2_13_0006
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve13_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0006 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600197000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('197'));
      expect(result.split(':')[2]).assertEqual('197');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0006 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve13_0007
     * @tc.number SUB_WLAN_VOL2_13_0007
     * @tc.desc   Verify model.resolveIP(1600198000) equals \'16:00:198:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve13_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0007 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600198000)), String('16:00:198:000'));
      expect(model.resolveIP(1600198000)).assertEqual('16:00:198:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600198000).split(':').length), String(4));
      expect(model.resolveIP(1600198000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600198000).length), String(13));
      expect(model.resolveIP(1600198000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0007 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve13_0008
     * @tc.number SUB_WLAN_VOL2_13_0008
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve13_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0008 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600199000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('199'));
      expect(result.split(':')[2]).assertEqual('199');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0008 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve13_0009
     * @tc.number SUB_WLAN_VOL2_13_0009
     * @tc.desc   Verify model.resolveIP(1600200000) equals \'16:00:200:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve13_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0009 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600200000)), String('16:00:200:000'));
      expect(model.resolveIP(1600200000)).assertEqual('16:00:200:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600200000).split(':').length), String(4));
      expect(model.resolveIP(1600200000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600200000).length), String(13));
      expect(model.resolveIP(1600200000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0009 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve13_0010
     * @tc.number SUB_WLAN_VOL2_13_0010
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve13_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0010 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600201000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('201'));
      expect(result.split(':')[2]).assertEqual('201');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0010 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve13_0011
     * @tc.number SUB_WLAN_VOL2_13_0011
     * @tc.desc   Verify model.resolveIP(1600202000) equals \'16:00:202:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve13_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0011 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600202000)), String('16:00:202:000'));
      expect(model.resolveIP(1600202000)).assertEqual('16:00:202:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600202000).split(':').length), String(4));
      expect(model.resolveIP(1600202000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600202000).length), String(13));
      expect(model.resolveIP(1600202000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0011 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve13_0012
     * @tc.number SUB_WLAN_VOL2_13_0012
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve13_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0012 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600203000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('203'));
      expect(result.split(':')[2]).assertEqual('203');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0012 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve13_0013
     * @tc.number SUB_WLAN_VOL2_13_0013
     * @tc.desc   Verify model.resolveIP(1600204000) equals \'16:00:204:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve13_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0013 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600204000)), String('16:00:204:000'));
      expect(model.resolveIP(1600204000)).assertEqual('16:00:204:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600204000).split(':').length), String(4));
      expect(model.resolveIP(1600204000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600204000).length), String(13));
      expect(model.resolveIP(1600204000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0013 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve13_0014
     * @tc.number SUB_WLAN_VOL2_13_0014
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve13_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0014 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600205000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('205'));
      expect(result.split(':')[2]).assertEqual('205');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0014 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve13_0015
     * @tc.number SUB_WLAN_VOL2_13_0015
     * @tc.desc   Verify model.resolveIP(1600206000) equals \'16:00:206:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve13_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0015 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600206000)), String('16:00:206:000'));
      expect(model.resolveIP(1600206000)).assertEqual('16:00:206:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600206000).split(':').length), String(4));
      expect(model.resolveIP(1600206000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600206000).length), String(13));
      expect(model.resolveIP(1600206000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0015 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_Volume2Resolve13_0016
     * @tc.number SUB_WLAN_VOL2_13_0016
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_Volume2Resolve13_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0016 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600207000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('207'));
      expect(result.split(':')[2]).assertEqual('207');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_Volume2Resolve13_0016 end');
    })
  })
}
