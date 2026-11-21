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
import { CardEventFeature } from '../../../main/ets/feature/CardEventFeature';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomCommonEvent]';

export default function cardEventVolume02Test(): void {
  describe('CardEventVolume02Test', () => {

    /**
     * @tc.name   testCardEventVolume020001
     * @tc.number SUB_CCE_CARDV_02_0001
     * @tc.desc   data=「 InApp」 bundle=「InApp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020001 begin');
      const result: number = CardEventFeature.resolveToastAction(' InApp', 'InApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020001 end');
    })

    /**
     * @tc.name   testCardEventVolume020002
     * @tc.number SUB_CCE_CARDV_02_0002
     * @tc.desc   data=「 OutApp」 bundle=「OutApp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020002 begin');
      const result: number = CardEventFeature.resolveToastAction(' OutApp', 'OutApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020002 end');
    })

    /**
     * @tc.name   testCardEventVolume020003
     * @tc.number SUB_CCE_CARDV_02_0003
     * @tc.desc   data=「InApp」 bundle=「 InApp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020003 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', ' InApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020003 end');
    })

    /**
     * @tc.name   testCardEventVolume020004
     * @tc.number SUB_CCE_CARDV_02_0004
     * @tc.desc   data=「OutApp」 bundle=「 OutApp」 subscribed=true 时提示动作为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020004 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', ' OutApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020004 end');
    })

    /**
     * @tc.name   testCardEventVolume020005
     * @tc.number SUB_CCE_CARDV_02_0005
     * @tc.desc   data=「In App」 bundle=「InApp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020005 begin');
      const result: number = CardEventFeature.resolveToastAction('In App', 'InApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020005 end');
    })

    /**
     * @tc.name   testCardEventVolume020006
     * @tc.number SUB_CCE_CARDV_02_0006
     * @tc.desc   data=「Out App」 bundle=「OutApp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020006 begin');
      const result: number = CardEventFeature.resolveToastAction('Out App', 'OutApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020006 end');
    })

    /**
     * @tc.name   testCardEventVolume020007
     * @tc.number SUB_CCE_CARDV_02_0007
     * @tc.desc   data=「InApp」 bundle=「In App」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020007 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'In App', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020007 end');
    })

    /**
     * @tc.name   testCardEventVolume020008
     * @tc.number SUB_CCE_CARDV_02_0008
     * @tc.desc   data=「OutApp」 bundle=「Out App」 subscribed=true 时提示动作为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020008 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', 'Out App', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020008 end');
    })

    /**
     * @tc.name   testCardEventVolume020009
     * @tc.number SUB_CCE_CARDV_02_0009
     * @tc.desc   data=「InAp」 bundle=「InAp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020009 begin');
      const result: number = CardEventFeature.resolveToastAction('InAp', 'InAp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020009 end');
    })

    /**
     * @tc.name   testCardEventVolume020010
     * @tc.number SUB_CCE_CARDV_02_0010
     * @tc.desc   data=「OutAp」 bundle=「OutAp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020010 begin');
      const result: number = CardEventFeature.resolveToastAction('OutAp', 'OutAp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020010 end');
    })

    /**
     * @tc.name   testCardEventVolume020011
     * @tc.number SUB_CCE_CARDV_02_0011
     * @tc.desc   data=「InAp」 bundle=「InApp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020011 begin');
      const result: number = CardEventFeature.resolveToastAction('InAp', 'InApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020011 end');
    })

    /**
     * @tc.name   testCardEventVolume020012
     * @tc.number SUB_CCE_CARDV_02_0012
     * @tc.desc   data=「InApp」 bundle=「InAp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020012 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'InAp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020012 end');
    })

    /**
     * @tc.name   testCardEventVolume020013
     * @tc.number SUB_CCE_CARDV_02_0013
     * @tc.desc   data=「OutAp」 bundle=「OutApp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020013 begin');
      const result: number = CardEventFeature.resolveToastAction('OutAp', 'OutApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020013 end');
    })

    /**
     * @tc.name   testCardEventVolume020014
     * @tc.number SUB_CCE_CARDV_02_0014
     * @tc.desc   data=「OutApp」 bundle=「OutAp」 subscribed=true 时提示动作为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020014 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', 'OutAp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020014 end');
    })

    /**
     * @tc.name   testCardEventVolume020015
     * @tc.number SUB_CCE_CARDV_02_0015
     * @tc.desc   data=「InApps」 bundle=「InApps」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020015 begin');
      const result: number = CardEventFeature.resolveToastAction('InApps', 'InApps', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020015 end');
    })

    /**
     * @tc.name   testCardEventVolume020016
     * @tc.number SUB_CCE_CARDV_02_0016
     * @tc.desc   data=「OutApps」 bundle=「OutApps」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020016 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApps', 'OutApps', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020016 end');
    })

    /**
     * @tc.name   testCardEventVolume020017
     * @tc.number SUB_CCE_CARDV_02_0017
     * @tc.desc   data=「InApp1」 bundle=「InApp1」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020017 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp1', 'InApp1', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020017 end');
    })

    /**
     * @tc.name   testCardEventVolume020018
     * @tc.number SUB_CCE_CARDV_02_0018
     * @tc.desc   data=「OutApp1」 bundle=「OutApp1」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020018 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp1', 'OutApp1', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020018 end');
    })

    /**
     * @tc.name   testCardEventVolume020019
     * @tc.number SUB_CCE_CARDV_02_0019
     * @tc.desc   data=「InApp1」 bundle=「InApp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020019 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp1', 'InApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020019 end');
    })

    /**
     * @tc.name   testCardEventVolume020020
     * @tc.number SUB_CCE_CARDV_02_0020
     * @tc.desc   data=「OutApp1」 bundle=「OutApp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020020 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp1', 'OutApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020020 end');
    })

    /**
     * @tc.name   testCardEventVolume020021
     * @tc.number SUB_CCE_CARDV_02_0021
     * @tc.desc   data=「ｉｎＡｐｐ」 bundle=「InApp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020021 begin');
      const result: number = CardEventFeature.resolveToastAction('ｉｎＡｐｐ', 'InApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020021 end');
    })

    /**
     * @tc.name   testCardEventVolume020022
     * @tc.number SUB_CCE_CARDV_02_0022
     * @tc.desc   data=「InApp」 bundle=「ｉｎＡｐｐ」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020022 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'ｉｎＡｐｐ', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020022 end');
    })

    /**
     * @tc.name   testCardEventVolume020023
     * @tc.number SUB_CCE_CARDV_02_0023
     * @tc.desc   data=「ｏｕｔＡｐｐ」 bundle=「OutApp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020023 begin');
      const result: number = CardEventFeature.resolveToastAction('ｏｕｔＡｐｐ', 'OutApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020023 end');
    })

    /**
     * @tc.name   testCardEventVolume020024
     * @tc.number SUB_CCE_CARDV_02_0024
     * @tc.desc   data=「OutApp」 bundle=「ｏｕｔＡｐｐ」 subscribed=true 时提示动作为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020024 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', 'ｏｕｔＡｐｐ', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020024 end');
    })

    /**
     * @tc.name   testCardEventVolume020025
     * @tc.number SUB_CCE_CARDV_02_0025
     * @tc.desc   data=「ＩｎＡｐｐ」 bundle=「ＩｎＡｐｐ」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020025 begin');
      const result: number = CardEventFeature.resolveToastAction('ＩｎＡｐｐ', 'ＩｎＡｐｐ', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020025 end');
    })

    /**
     * @tc.name   testCardEventVolume020026
     * @tc.number SUB_CCE_CARDV_02_0026
     * @tc.desc   data=「ＯＵＴＡＰＰ」 bundle=「ＯＵＴＡＰＰ」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020026 begin');
      const result: number = CardEventFeature.resolveToastAction('ＯＵＴＡＰＰ', 'ＯＵＴＡＰＰ', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020026 end');
    })

    /**
     * @tc.name   testCardEventVolume020027
     * @tc.number SUB_CCE_CARDV_02_0027
     * @tc.desc   data=「InAPP」 bundle=「InAPP」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020027 begin');
      const result: number = CardEventFeature.resolveToastAction('InAPP', 'InAPP', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020027 end');
    })

    /**
     * @tc.name   testCardEventVolume020028
     * @tc.number SUB_CCE_CARDV_02_0028
     * @tc.desc   data=「OUTAPP 」 bundle=「OUTAPP 」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020028 begin');
      const result: number = CardEventFeature.resolveToastAction('OUTAPP ', 'OUTAPP ', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020028 end');
    })

    /**
     * @tc.name   testCardEventVolume020029
     * @tc.number SUB_CCE_CARDV_02_0029
     * @tc.desc   data=「InAppInAppInApp」 bundle=「InAppInAppInApp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020029 begin');
      const result: number = CardEventFeature.resolveToastAction('InAppInAppInApp', 'InAppInAppInApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020029 end');
    })

    /**
     * @tc.name   testCardEventVolume020030
     * @tc.number SUB_CCE_CARDV_02_0030
     * @tc.desc   data=「OutAppOutAppOutApp」 bundle=「ZZZ」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020030 begin');
      const result: number = CardEventFeature.resolveToastAction('OutAppOutAppOutApp', 'ZZZ', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020030 end');
    })

    /**
     * @tc.name   testCardEventVolume020031
     * @tc.number SUB_CCE_CARDV_02_0031
     * @tc.desc   data=「InAppInAppInApp」 bundle=「InApp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020031 begin');
      const result: number = CardEventFeature.resolveToastAction('InAppInAppInApp', 'InApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020031 end');
    })

    /**
     * @tc.name   testCardEventVolume020032
     * @tc.number SUB_CCE_CARDV_02_0032
     * @tc.desc   data=「InApp」 bundle=「InAppInAppInApp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020032 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'InAppInAppInApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020032 end');
    })

    /**
     * @tc.name   testCardEventVolume020033
     * @tc.number SUB_CCE_CARDV_02_0033
     * @tc.desc   data=「InApp」 bundle=「InAPP」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020033 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'InAPP', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020033 end');
    })

    /**
     * @tc.name   testCardEventVolume020034
     * @tc.number SUB_CCE_CARDV_02_0034
     * @tc.desc   data=「OutApp」 bundle=「OutAPP」 subscribed=true 时提示动作为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020034 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', 'OutAPP', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020034 end');
    })

    /**
     * @tc.name   testCardEventVolume020035
     * @tc.number SUB_CCE_CARDV_02_0035
     * @tc.desc   data=「 InApp 」 bundle=「 InApp 」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020035 begin');
      const result: number = CardEventFeature.resolveToastAction(' InApp ', ' InApp ', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020035 end');
    })

    /**
     * @tc.name   testCardEventVolume020036
     * @tc.number SUB_CCE_CARDV_02_0036
     * @tc.desc   data=「OutApp」 bundle=「 OutApp 」 subscribed=true 时提示动作为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020036 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', ' OutApp ', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020036 end');
    })

    /**
     * @tc.name   testCardEventVolume020037
     * @tc.number SUB_CCE_CARDV_02_0037
     * @tc.desc   data=「inApp」 bundle=「InApp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020037 begin');
      const result: number = CardEventFeature.resolveToastAction('inApp', 'InApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020037 end');
    })

    /**
     * @tc.name   testCardEventVolume020038
     * @tc.number SUB_CCE_CARDV_02_0038
     * @tc.desc   data=「InApp」 bundle=「inApp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020038 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'inApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020038 end');
    })

    /**
     * @tc.name   testCardEventVolume020039
     * @tc.number SUB_CCE_CARDV_02_0039
     * @tc.desc   data=「outApp」 bundle=「OutApp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020039 begin');
      const result: number = CardEventFeature.resolveToastAction('outApp', 'OutApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020039 end');
    })

    /**
     * @tc.name   testCardEventVolume020040
     * @tc.number SUB_CCE_CARDV_02_0040
     * @tc.desc   data=「OutApp」 bundle=「outApp」 subscribed=true 时提示动作为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020040 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', 'outApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020040 end');
    })

    /**
     * @tc.name   testCardEventVolume020041
     * @tc.number SUB_CCE_CARDV_02_0041
     * @tc.desc   data=「InApp 」 bundle=「InApp」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020041 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp ', 'InApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020041 end');
    })

    /**
     * @tc.name   testCardEventVolume020042
     * @tc.number SUB_CCE_CARDV_02_0042
     * @tc.desc   data=「InApp」 bundle=「OutApp 」 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020042 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'OutApp ', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020042 end');
    })

    /**
     * @tc.name   testCardEventVolume020043
     * @tc.number SUB_CCE_CARDV_02_0043
     * @tc.desc   data=「 InApp」 bundle=「InApp」 subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020043 begin');
      const result: number = CardEventFeature.resolveToastAction(' InApp', 'InApp', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020043 end');
    })

    /**
     * @tc.name   testCardEventVolume020044
     * @tc.number SUB_CCE_CARDV_02_0044
     * @tc.desc   data=「InAppInAppInApp」 bundle=「InAppInAppInApp」 subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020044 begin');
      const result: number = CardEventFeature.resolveToastAction('InAppInAppInApp', 'InAppInAppInApp', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020044 end');
    })

    /**
     * @tc.name   testCardEventVolume020045
     * @tc.number SUB_CCE_CARDV_02_0045
     * @tc.desc   data=「ｉｎＡｐｐ」 bundle=「InApp」 subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020045 begin');
      const result: number = CardEventFeature.resolveToastAction('ｉｎＡｐｐ', 'InApp', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020045 end');
    })

    /**
     * @tc.name   testCardEventVolume020046
     * @tc.number SUB_CCE_CARDV_02_0046
     * @tc.desc   后缀漂移下 InAppX / OutAppX 均非精确相等，提示动作一律落到默认分支 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume020046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020046 begin');
      const driftIn: number = CardEventFeature.resolveToastAction('InAppX', 'InAppX', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(driftIn), String(0));
      expect(driftIn).assertEqual(0);
      const driftOut: number = CardEventFeature.resolveToastAction('OutAppX', 'OutAppY', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(driftOut), String(0));
      expect(driftOut).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(driftIn >= CardEventFeature.TOAST_NONE && driftOut <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(driftIn >= CardEventFeature.TOAST_NONE && driftOut <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume020046 end');
    })
  })
}
