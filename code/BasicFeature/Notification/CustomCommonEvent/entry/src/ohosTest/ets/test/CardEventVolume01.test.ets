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

export default function cardEventVolume01Test(): void {
  describe('CardEventVolume01Test', () => {

    /**
     * @tc.name   testCardEventVolume010001
     * @tc.number SUB_CCE_CARDV_01_0001
     * @tc.desc   data=InApp bundle=InApp subscribed=true 时提示动作为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010001 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'InApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010001 end');
    })

    /**
     * @tc.name   testCardEventVolume010002
     * @tc.number SUB_CCE_CARDV_01_0002
     * @tc.desc   data=InApp bundle=InApp subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010002 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'InApp', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010002 end');
    })

    /**
     * @tc.name   testCardEventVolume010003
     * @tc.number SUB_CCE_CARDV_01_0003
     * @tc.desc   data=InApp bundle=OutApp subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010003 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'OutApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010003 end');
    })

    /**
     * @tc.name   testCardEventVolume010004
     * @tc.number SUB_CCE_CARDV_01_0004
     * @tc.desc   data=InApp bundle=OutApp subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010004 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'OutApp', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010004 end');
    })

    /**
     * @tc.name   testCardEventVolume010005
     * @tc.number SUB_CCE_CARDV_01_0005
     * @tc.desc   data=InApp bundle=空串 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010005 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', '', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010005 end');
    })

    /**
     * @tc.name   testCardEventVolume010006
     * @tc.number SUB_CCE_CARDV_01_0006
     * @tc.desc   data=InApp bundle=空串 subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010006 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', '', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010006 end');
    })

    /**
     * @tc.name   testCardEventVolume010007
     * @tc.number SUB_CCE_CARDV_01_0007
     * @tc.desc   data=OutApp bundle=InApp subscribed=true 时提示动作为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010007 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', 'InApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010007 end');
    })

    /**
     * @tc.name   testCardEventVolume010008
     * @tc.number SUB_CCE_CARDV_01_0008
     * @tc.desc   data=OutApp bundle=InApp subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010008 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', 'InApp', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010008 end');
    })

    /**
     * @tc.name   testCardEventVolume010009
     * @tc.number SUB_CCE_CARDV_01_0009
     * @tc.desc   data=OutApp bundle=OutApp subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010009 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', 'OutApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010009 end');
    })

    /**
     * @tc.name   testCardEventVolume010010
     * @tc.number SUB_CCE_CARDV_01_0010
     * @tc.desc   data=OutApp bundle=OutApp subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010010 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', 'OutApp', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010010 end');
    })

    /**
     * @tc.name   testCardEventVolume010011
     * @tc.number SUB_CCE_CARDV_01_0011
     * @tc.desc   data=OutApp bundle=空串 subscribed=true 时提示动作为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010011 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', '', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010011 end');
    })

    /**
     * @tc.name   testCardEventVolume010012
     * @tc.number SUB_CCE_CARDV_01_0012
     * @tc.desc   data=OutApp bundle=空串 subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010012 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', '', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010012 end');
    })

    /**
     * @tc.name   testCardEventVolume010013
     * @tc.number SUB_CCE_CARDV_01_0013
     * @tc.desc   data=空串 bundle=InApp subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010013 begin');
      const result: number = CardEventFeature.resolveToastAction('', 'InApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010013 end');
    })

    /**
     * @tc.name   testCardEventVolume010014
     * @tc.number SUB_CCE_CARDV_01_0014
     * @tc.desc   data=空串 bundle=InApp subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010014 begin');
      const result: number = CardEventFeature.resolveToastAction('', 'InApp', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010014 end');
    })

    /**
     * @tc.name   testCardEventVolume010015
     * @tc.number SUB_CCE_CARDV_01_0015
     * @tc.desc   data=空串 bundle=OutApp subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010015 begin');
      const result: number = CardEventFeature.resolveToastAction('', 'OutApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010015 end');
    })

    /**
     * @tc.name   testCardEventVolume010016
     * @tc.number SUB_CCE_CARDV_01_0016
     * @tc.desc   data=空串 bundle=OutApp subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010016 begin');
      const result: number = CardEventFeature.resolveToastAction('', 'OutApp', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010016 end');
    })

    /**
     * @tc.name   testCardEventVolume010017
     * @tc.number SUB_CCE_CARDV_01_0017
     * @tc.desc   data=空串 bundle=空串 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010017 begin');
      const result: number = CardEventFeature.resolveToastAction('', '', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010017 end');
    })

    /**
     * @tc.name   testCardEventVolume010018
     * @tc.number SUB_CCE_CARDV_01_0018
     * @tc.desc   data=空串 bundle=空串 subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010018 begin');
      const result: number = CardEventFeature.resolveToastAction('', '', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010018 end');
    })

    /**
     * @tc.name   testCardEventVolume010019
     * @tc.number SUB_CCE_CARDV_01_0019
     * @tc.desc   data=InApp bundle=inapp subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010019 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'inapp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010019 end');
    })

    /**
     * @tc.name   testCardEventVolume010020
     * @tc.number SUB_CCE_CARDV_01_0020
     * @tc.desc   data=InApp bundle=inapp subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010020 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'inapp', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010020 end');
    })

    /**
     * @tc.name   testCardEventVolume010021
     * @tc.number SUB_CCE_CARDV_01_0021
     * @tc.desc   data=OutApp bundle=outapp subscribed=true 时提示动作为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010021 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', 'outapp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010021 end');
    })

    /**
     * @tc.name   testCardEventVolume010022
     * @tc.number SUB_CCE_CARDV_01_0022
     * @tc.desc   data=OutApp bundle=outapp subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010022 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', 'outapp', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010022 end');
    })

    /**
     * @tc.name   testCardEventVolume010023
     * @tc.number SUB_CCE_CARDV_01_0023
     * @tc.desc   data=inapp bundle=InApp subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010023 begin');
      const result: number = CardEventFeature.resolveToastAction('inapp', 'InApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010023 end');
    })

    /**
     * @tc.name   testCardEventVolume010024
     * @tc.number SUB_CCE_CARDV_01_0024
     * @tc.desc   data=inapp bundle=InApp subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010024 begin');
      const result: number = CardEventFeature.resolveToastAction('inapp', 'InApp', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010024 end');
    })

    /**
     * @tc.name   testCardEventVolume010025
     * @tc.number SUB_CCE_CARDV_01_0025
     * @tc.desc   data=OutApp  bundle=OutApp subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010025 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp ', 'OutApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010025 end');
    })

    /**
     * @tc.name   testCardEventVolume010026
     * @tc.number SUB_CCE_CARDV_01_0026
     * @tc.desc   data=OutApp  bundle=OutApp subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010026 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp ', 'OutApp', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010026 end');
    })

    /**
     * @tc.name   testCardEventVolume010027
     * @tc.number SUB_CCE_CARDV_01_0027
     * @tc.desc   data=InApp bundle=InApp  subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010027 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'InApp ', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010027 end');
    })

    /**
     * @tc.name   testCardEventVolume010028
     * @tc.number SUB_CCE_CARDV_01_0028
     * @tc.desc   data=InApp bundle=InApp  subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010028 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'InApp ', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010028 end');
    })

    /**
     * @tc.name   testCardEventVolume010029
     * @tc.number SUB_CCE_CARDV_01_0029
     * @tc.desc   data=InAppInApp bundle=InApp subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010029 begin');
      const result: number = CardEventFeature.resolveToastAction('InAppInApp', 'InApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010029 end');
    })

    /**
     * @tc.name   testCardEventVolume010030
     * @tc.number SUB_CCE_CARDV_01_0030
     * @tc.desc   data=InAppInApp bundle=InApp subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010030 begin');
      const result: number = CardEventFeature.resolveToastAction('InAppInApp', 'InApp', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010030 end');
    })

    /**
     * @tc.name   testCardEventVolume010031
     * @tc.number SUB_CCE_CARDV_01_0031
     * @tc.desc   data=OutApp bundle=InApp  subscribed=true 时提示动作为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010031 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', 'InApp ', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010031 end');
    })

    /**
     * @tc.name   testCardEventVolume010032
     * @tc.number SUB_CCE_CARDV_01_0032
     * @tc.desc   data=OutApp bundle=InApp  subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010032 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', 'InApp ', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010032 end');
    })

    /**
     * @tc.name   testCardEventVolume010033
     * @tc.number SUB_CCE_CARDV_01_0033
     * @tc.desc   data=InApp bundle=InAppInApp subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010033 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'InAppInApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010033 end');
    })

    /**
     * @tc.name   testCardEventVolume010034
     * @tc.number SUB_CCE_CARDV_01_0034
     * @tc.desc   data=InApp bundle=InAppInApp subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010034 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'InAppInApp', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010034 end');
    })

    /**
     * @tc.name   testCardEventVolume010035
     * @tc.number SUB_CCE_CARDV_01_0035
     * @tc.desc   data=OutApp bundle=OutAppOutApp subscribed=true 时提示动作为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010035 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', 'OutAppOutApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010035 end');
    })

    /**
     * @tc.name   testCardEventVolume010036
     * @tc.number SUB_CCE_CARDV_01_0036
     * @tc.desc   data=OutApp bundle=OutAppOutApp subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010036 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', 'OutAppOutApp', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010036 end');
    })

    /**
     * @tc.name   testCardEventVolume010037
     * @tc.number SUB_CCE_CARDV_01_0037
     * @tc.desc   data=空串 bundle=inapp subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010037 begin');
      const result: number = CardEventFeature.resolveToastAction('', 'inapp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010037 end');
    })

    /**
     * @tc.name   testCardEventVolume010038
     * @tc.number SUB_CCE_CARDV_01_0038
     * @tc.desc   data=空串 bundle=inapp subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010038 begin');
      const result: number = CardEventFeature.resolveToastAction('', 'inapp', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010038 end');
    })

    /**
     * @tc.name   testCardEventVolume010039
     * @tc.number SUB_CCE_CARDV_01_0039
     * @tc.desc   data=inapp bundle=空串 subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010039 begin');
      const result: number = CardEventFeature.resolveToastAction('inapp', '', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010039 end');
    })

    /**
     * @tc.name   testCardEventVolume010040
     * @tc.number SUB_CCE_CARDV_01_0040
     * @tc.desc   data=inapp bundle=空串 subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010040 begin');
      const result: number = CardEventFeature.resolveToastAction('inapp', '', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010040 end');
    })

    /**
     * @tc.name   testCardEventVolume010041
     * @tc.number SUB_CCE_CARDV_01_0041
     * @tc.desc   data=outapp bundle=OutApp subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010041 begin');
      const result: number = CardEventFeature.resolveToastAction('outapp', 'OutApp', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010041 end');
    })

    /**
     * @tc.name   testCardEventVolume010042
     * @tc.number SUB_CCE_CARDV_01_0042
     * @tc.desc   data=outapp bundle=OutApp subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010042 begin');
      const result: number = CardEventFeature.resolveToastAction('outapp', 'OutApp', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010042 end');
    })

    /**
     * @tc.name   testCardEventVolume010043
     * @tc.number SUB_CCE_CARDV_01_0043
     * @tc.desc   data=InApp bundle=INAPP subscribed=true 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010043 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'INAPP', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010043 end');
    })

    /**
     * @tc.name   testCardEventVolume010044
     * @tc.number SUB_CCE_CARDV_01_0044
     * @tc.desc   data=InApp bundle=INAPP subscribed=false 时提示动作为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010044 begin');
      const result: number = CardEventFeature.resolveToastAction('InApp', 'INAPP', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010044 end');
    })

    /**
     * @tc.name   testCardEventVolume010045
     * @tc.number SUB_CCE_CARDV_01_0045
     * @tc.desc   data=OutApp bundle=OUTAPP subscribed=true 时提示动作为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010045 begin');
      const result: number = CardEventFeature.resolveToastAction('OutApp', 'OUTAPP', true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= CardEventFeature.TOAST_NONE));
      expect(result >= CardEventFeature.TOAST_NONE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE));
      expect(result <= CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010045 end');
    })

    /**
     * @tc.name   testCardEventVolume010046
     * @tc.number SUB_CCE_CARDV_01_0046
     * @tc.desc   超长拼接 data 非精确匹配返回 0，bundle 超长失配仍返回 1，未订阅恒 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardEventVolume010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010046 begin');
      const longData: string = 'OutAppWithVeryLongSuffixPadding';
      const longBundle: string = 'OutAppWithVeryLongSuffixOther';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(CardEventFeature.resolveToastAction(longData, 'OutApp', true)), String(0));
      expect(CardEventFeature.resolveToastAction(longData, 'OutApp', true)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(CardEventFeature.resolveToastAction('OutApp', longBundle, true)), String(1));
      expect(CardEventFeature.resolveToastAction('OutApp', longBundle, true)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(CardEventFeature.resolveToastAction('OutApp', longBundle, false)), String(0));
      expect(CardEventFeature.resolveToastAction('OutApp', longBundle, false)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCardEventVolume010046 end');
    })
  })
}
